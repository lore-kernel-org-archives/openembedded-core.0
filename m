Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB51FF885D
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 12:03:32 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17131.1777205005642733433
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 05:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=RdpR8Fy4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202604261203219e3325df0b00020751-qw_d1t@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202604261203219e3325df0b00020751
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 14:03:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=HaPiDGDjuS6UY8hHCTWGlRa5N47bO8aB7jvaQNYKlqs=;
 b=RdpR8Fy4SUwekZWUN+xTen3ETNZBCgN6cPJps4FQmKl0dVXv1ZhIC8xBLGbpfMsJNrBqDr
 8NTq1YaaQeCQ14Po0GNamj8KHzcu1YsQzpvO+8f14/wwGpCEuEO6l8RgIEGjJkVkpYjXPKmg
 NsRVkfvvpWQ/ctxCYySwJJusoL5tzb6Ztyv6ANINiOBRU/l9jQmXC9PO/oZUhHBscHhPJx57
 DivsivCGXVyNynIuy8bJuJr6d1QXkJaj2aCysZJps4SvRiLHFBsofkpmNIwiEqHiVafz9tEl
 3MHgKTV0G3ix9tY9iz1rZgGvk8v90pGvMcZrn9xeqL7NjQbBmjOECvQQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/8] harfbuzz: set status for CVE-2024-56732
Date: Sun, 26 Apr 2026 14:02:46 +0200
Message-ID: <20260426120253.825060-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 12:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235952

From: Peter Marko <peter.marko@siemens.com>

This CVE does not have cpe in NVD DB.
In cvelistV5 it shows "version": ">= 8.5.0, <= 10.0.1" which is not
parseable with our tooling.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
index 12bebc4bee..6ce275acb5 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
@@ -50,3 +50,5 @@ FILES:${PN}-icu-dev = "${libdir}/libharfbuzz-icu.so \
 FILES:${PN}-subset = "${libdir}/libharfbuzz-subset.so.*"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2024-56732] = "fixed-version: affected versions are >= 8.5.0, <= 10.0.1"

