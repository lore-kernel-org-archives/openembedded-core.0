Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148F2CFB424
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 14:41:36 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.32195.1728225682601993923
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Oct 2024 07:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=CBv0q4Tn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20241006144118c5c83d5979aca3b1f5-vqcllz@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20241006144118c5c83d5979aca3b1f5
        for <openembedded-core@lists.openembedded.org>;
        Sun, 06 Oct 2024 16:41:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=4DGKDF4YTt85pzLj2lyVrjptHMiYoAH9IzhWDBxbDXQ=;
 b=CBv0q4TneI/Lvy3G5GkfGTIkGu97tSIUwIO2SAsgYaIFtrwOZ/QJRJDixw5Uy4fw3w6Qh8
 lWQLDRmFkJuT80Mq2oPWsZV0NVFCoQHhWwjdl9pBiEniScRYd8qB5rLGFGs3Wpv2QgSv3wrP
 ZMBLROQAHxBuC4ZxcOhqotTtX0zae2bpnfGYpSHfuzAarFAD/QWBHzLpX7fGF/zMLBGsUn/+
 JUMRgImzHkekr90vHrsaleUFzmv8MmuV8rN6XjHG2GJjlH6VjG+x3jMsp7PQE9whCo5D+w2B
 MT38B4c1LiwEOVtDbgpgVeddhcv3UZycsHSPavUuzK10YB/Y4PnS90UQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] rust: ignore CVE-2024-43402
Date: Sun,  6 Oct 2024 16:40:31 +0200
Message-Id: <20241006144031.1330578-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Oct 2024 14:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205246

From: Peter Marko <peter.marko@siemens.com>

This CVE was created because fix for CVE-2024-24576 was incomplete.
Ignore the new CVE in the same way as the old one.

See https://nvd.nist.gov/vuln/detail/CVE-2024-43402

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/rust/rust-source.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index b14221b6cb..8a8e48b8ca 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -22,3 +22,4 @@ UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-metho
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
 
 CVE_STATUS[CVE-2024-24576] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2024-43402] = "not-applicable-platform: Issue only applies on Windows"
-- 
2.30.2


