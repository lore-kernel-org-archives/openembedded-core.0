Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBBAC87FCF
	for <webhook@archiver.kernel.org>; Sun, 10 Aug 2025 08:19:47 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.22475.1754813979372216643
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 01:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=BvsNLPOj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20250810081933f592a748e8fb32b4f0-tbtw0t@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20250810081933f592a748e8fb32b4f0
        for <openembedded-core@lists.openembedded.org>;
        Sun, 10 Aug 2025 10:19:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=oc+tpNZ0lzDF1QPsALpYFEQ1dqAnL4JFr2b9XlswWZY=;
 b=BvsNLPOjER14JKd28TTFT5gZckLutORWncjXckkbA2MaEzrYub0dGg8pKYVnIpfJ3uAQSa
 9EMV0Ow38DoIHmwQUFlTVfiUazine03fNL9/r4thWtOrH+PgIhzkDssCeMdARxnavDBH1Lze
 Px7gWJETiHB4mAlUAmviBiWovVIppLTQKe/H2JWmUwMIZmnHlaVOjrj6vBsbI/FlqODZImor
 OI3vW6l6KVD9C3PBl/9K4gd6p1TQbSHN6+bwT+YMFsLkvm/SxHjCFuhUWj2FPseItRmdspI7
 mIUPvLF3efc8CWrOTSXE9L7QFq9KFkKiFb92OGoDz6zKZ3ngkUKZzJ3A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] go: ignore CVE-2025-0913
Date: Sun, 10 Aug 2025 10:18:46 +0200
Message-Id: <20250810081846.11677-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 08:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221694

From: Peter Marko <peter.marko@siemens.com>

This is problem on Windows platform only.

Per NVD report [1], CPE has "and" clause
Running on/with
 cpe:2.3:o:microsoft:windows:-:*:*:*:*:*:*:*

Also linked patch [2] changes Windows files only (and tests).

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-0913
[2] https://go-review.googlesource.com/c/go/+/672396

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index af09cb52cd..ea57b23c3e 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -19,3 +19,5 @@ SRC_URI += "\
     file://CVE-2025-4673.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
+
+CVE_STATUS[CVE-2025-0913] = "not-applicable-platform: Issue only applies on Windows"

