Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35065C5DF8C
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 19:04:10 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2245.1787425440654735589
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 12:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=diKlBmvn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260822190356bb5c115333000207b0-dv5c7w@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260822190356bb5c115333000207b0
        for <openembedded-core@lists.openembedded.org>;
        Sat, 22 Aug 2026 21:03:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=DbiAyfuGvJ0hNrf6Q3QreNRk4Cr8D8DKm88VN+n+fhs=;
 b=diKlBmvnBSNAZbBIN3ILlfWAZ/SxGyRtl7oBSGmvEPVEMxoNDkDXtKVE1ym5N1NUAzVDUF
 xK9r0tTmAJPvtNGlw2JEQfr9XSX6Am3Jw4jM4LU9HuF8D4sPvqK1ymTaMapl2pFJtYNQoPGy
 9Cri926MD9uKE4p3BNkxC0shxSkMbnqHXt17XrCINXxZXr0al/1phjCneqGh1zCGFE9efHXJ
 /2XicMAGNMHMCJ5y4unQQaquAtprUwxIb7ocqgKQmmEUe5o8MdZqwWJyXFHvkN38jtb7oZVS
 1w8Wr/4A4+rZ7G29QOT/BkJ8SC41fV6CUpBVE2t7gKH09YcAxSkweOuA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] systemd: upgrade 255.21 -> 255.22
Date: Sat, 22 Aug 2026 21:03:50 +0200
Message-ID: <20260822190350.3328678-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 19:04:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243999

From: Peter Marko <peter.marko@siemens.com>

Full changelog (36 commits):
* https://github.com/systemd/systemd-stable/compare/v255.4...v255.13

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...temd-boot-native_255.21.bb => systemd-boot-native_255.22.bb} | 0
 .../systemd/{systemd-boot_255.21.bb => systemd-boot_255.22.bb}  | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../systemd/{systemd_255.21.bb => systemd_255.22.bb}            | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_255.21.bb => systemd-boot-native_255.22.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_255.21.bb => systemd-boot_255.22.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_255.21.bb => systemd_255.22.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_255.21.bb b/meta/recipes-core/systemd/systemd-boot-native_255.22.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_255.21.bb
rename to meta/recipes-core/systemd/systemd-boot-native_255.22.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_255.21.bb b/meta/recipes-core/systemd/systemd-boot_255.22.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_255.21.bb
rename to meta/recipes-core/systemd/systemd-boot_255.22.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 28392b6b09d..42e51913da4 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "70500d37992a01d3275b1c414c3ed161d6f91f9e"
+SRCREV = "356c54394add8c6a1d52773852c23656590dc33b"
 SRCBRANCH = "v255-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-core/systemd/systemd_255.22.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_255.21.bb
rename to meta/recipes-core/systemd/systemd_255.22.bb

