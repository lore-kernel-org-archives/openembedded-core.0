Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F353E7717B
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 23:42:36 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.25875.1733442153460433911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 15:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Xn5ZTohB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20241205234230fe01ae6f8845a64bee-cnmj23@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20241205234230fe01ae6f8845a64bee
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Dec 2024 00:42:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=LGYGsHDu5XkcVo06asncV0FJVy+4SItzrN0cVIIizO8=;
 b=Xn5ZTohB+5nlgqxmKA3AN84g1Qc+pbq/UIlCtn3qs+8+xWH6KhOs1R6ZSHnxiRikJB/8E/
 BfvCDRDGeBNooQyrQAsZw2MqN8qTM135JPEBZqjTag72Ec6ft/320Rf5zbeUx1e/n/Ph06Ea
 bCQAjusnyf+3E4yh2bamI5WcWsTSJ97VjvvPnD8JKUvVJA7vbic8gtMhxthAmRBlLqhWqvar
 wtbbY8uNSKnuninAhmiez/wj/Z8fucMwvKBz0H9buFEKTf6UDhUF69tNe5SaMSXHTu0jlvCl
 fH2aaM0ASy3UW/kpqCOVABpDYeHvcmjJmaAsyVCehpi6o8o6oZtQeR9g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][styhead][PATCH 7/7] rust: ignore CVE-2024-43402
Date: Fri,  6 Dec 2024 00:41:44 +0100
Message-Id: <20241205234144.7933-8-peter.marko@siemens.com>
In-Reply-To: <20241205234144.7933-1-peter.marko@siemens.com>
References: <20241205234144.7933-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 23:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208398

From: Peter Marko <peter.marko@siemens.com>

This CVE was created because fix for CVE-2024-24576 was incomplete.
Ignore the new CVE in the same way as the old one.

See https://nvd.nist.gov/vuln/detail/CVE-2024-43402

(From OE-Core rev: 6ed9968bf3e35aca316227ee23294c683f77055d)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/rust/rust-source.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index becaf2b8ac..929a4a9b0c 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -18,3 +18,4 @@ UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-metho
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
 
 CVE_STATUS[CVE-2024-24576] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2024-43402] = "not-applicable-platform: Issue only applies on Windows"
-- 
2.30.2


