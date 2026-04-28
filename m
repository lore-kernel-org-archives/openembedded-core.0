Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BC9FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 16:54:34 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2208.1777395269566598378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 09:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=SAfzD+UM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026042816542617364d83430002070b-fzip5u@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026042816542617364d83430002070b
        for <openembedded-core@lists.openembedded.org>;
        Tue, 28 Apr 2026 18:54:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Nz7Ri1gUVXOufKnFJqQ7Bfa0VxsGzfUhas+D843DINQ=;
 b=SAfzD+UMOJxeCszN6AYE+MNYQMozAJkhqq8WGNCsluMxi/VHO7phFLRAb9Yj3iXuqjbp/2
 26TRCsYE27asn3oW+zJ49dJw8phK0SvGf9bkQYn1Z4gJHXNggpAXatBWWQhXq1M74tHNyOIf
 mEg9NKnxB8J33f0/c1jhOGjmomvD0w8t4u3/YdJyi8tN8yqemRp68Y+gBpzhsOvqv8QjYYqq
 YfsNpzTe8zaYmOYTKWHWSNxHZwMDfYkN0Wsm3PZRFsfNHor12wtOLNoLN0+wTiGde49JJiZl
 oztqogdx7BTZYu2kRp/J/snC62HDnP/SSSJFjSAyhiRLnXgs5bG2Nc9g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] sudo: set CVE_PRODUCT
Date: Tue, 28 Apr 2026 18:54:20 +0200
Message-ID: <20260428165420.200794-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 16:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236070

From: Peter Marko <peter.marko@siemens.com>

This change removes currently open CVE-2025-64170 and CVE-2025-64517
from reports which are for "trifectatech:sudo-rs".

It also removes following "patched" ones:
* CVE-2023-42456 (memorysafety:sudo)
* CVE-2025-46717 (trifectatech:sudo)
* CVE-2025-46718 (trifectatech:sudo)
All these are also for "sudo-rs".

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index d6ee881f8c..6be2a7c678 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -10,6 +10,8 @@ PAM_SRC_URI = "file://sudo.pam"
 
 SRC_URI[sha256sum] = "4a38a1ab3adb1199257edc2a7c4a2bd714665eb605b04368843b06dada2cfcfb"
 
+CVE_PRODUCT = "gratisoft:sudo sudo:sudo sudo_project:sudo todd_miller:sudo"
+
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
 

