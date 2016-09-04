Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id B65997735A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Sep 2016 16:28:38 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3sRymN0WPSz3hjXM;
	Sun,  4 Sep 2016 18:21:40 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3sRymN0GdTzvkGP;
	Sun,  4 Sep 2016 18:21:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id LjajGyjT9faZ; Sun,  4 Sep 2016 18:21:37 +0200 (CEST)
X-Auth-Info: ol3xZX8BWfUpocJ853/RMkO7TfF5wqabp0GF/N5S3RA=
Received: from chi.lan (unknown [195.140.253.167])
	by mail.mnet-online.de (Postfix) with ESMTPA;
	Sun,  4 Sep 2016 18:21:37 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Sep 2016 18:21:30 +0200
Message-Id: <20160904162130.13313-2-marex@denx.de>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160904162130.13313-1-marex@denx.de>
References: <20160904162130.13313-1-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 2/2] u-boot: Update to 2016.07 release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Sep 2016 16:28:39 -0000

Upgrade U-Boot to the latest version.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                           | 6 +++---
 .../{u-boot-fw-utils_2016.03.bb => u-boot-fw-utils_2016.07.bb}      | 0
 .../u-boot/{u-boot-mkimage_2016.03.bb => u-boot-mkimage_2016.07.bb} | 0
 meta/recipes-bsp/u-boot/{u-boot_2016.03.bb => u-boot_2016.07.bb}    | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2016.03.bb => u-boot-fw-utils_2016.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2016.03.bb => u-boot-mkimage_2016.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2016.03.bb => u-boot_2016.07.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 403e316..76d566b 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -4,12 +4,12 @@ SECTION = "bootloaders"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 
-# This revision corresponds to the tag "v2016.03"
+# This revision corresponds to the tag "v2016.07"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
+SRCREV = "19ce924ff914f315dc2fdf79f357825c513aed6e"
 
-PV = "v2016.03+git${SRCPV}"
+PV = "v2016.07+git${SRCPV}"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2016.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot_2016.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2016.03.bb
rename to meta/recipes-bsp/u-boot/u-boot_2016.07.bb
-- 
2.9.3


