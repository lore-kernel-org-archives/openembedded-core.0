Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 02F9875CC2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 16:05:48 +0000 (UTC)
Received: by qgbb65 with SMTP id b65so148551584qgb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 09:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=KQ+c7ddvAybu3n/HmuCEcIGZ2B8HWepbI6agdBCCDH0=;
	b=VVUq0O6Mn3O3/2HgogVdWMlhdq++IfFhuO3ThFQ+cMOAN7oO/uqKn7WdEWnVeaj7CB
	PYlYxw/kByrC7U5C/vcOPGogdN3zcyVNfbsdcYPn6YwskcFxfeZNJizWmNg0NcNFeZbX
	1A4bG6qkWez9zm0kY9RKF8JNwdgZkLN/cLPDGiedMjK60IcMYvtjnoPO9LiL4anl9QjT
	Cbmbmm17/+vx2sKfOar1bqm81z7BtJF61mHMDAPfaBFaRVc9Tr2Iqh8tlanHXB0ktw3h
	sGVMTE3MqSA5FtzWeGgy0u9XIfenVMch93Qs1NXA3BsH66wcLFSafz3GivZ+zJpQHBvU
	YYJg==
X-Received: by 10.140.132.139 with SMTP id 133mr53123740qhe.49.1445961947914; 
	Tue, 27 Oct 2015 09:05:47 -0700 (PDT)
Received: from localhost ([177.100.174.62]) by smtp.gmail.com with ESMTPSA id
	i139sm15248256qhc.30.2015.10.27.09.05.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Oct 2015 09:05:46 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 27 Oct 2015 14:05:42 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Oct 2015 14:05:40 -0200
Message-Id: <1445961940-12110-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] u-boot: Update to 2015.10 release
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
X-List-Received-Date: Tue, 27 Oct 2015 16:05:49 -0000

The U-Boot 2015.10 has been released at October 20th 2015. This also
removes the GCC workaround, for the inline behavior, as this version
properlu supports the GCC 5.2 as compiler.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../{u-boot-fw-utils_2015.07.bb => u-boot-fw-utils_2015.10.bb}    | 6 +++---
 .../{u-boot-mkimage_2015.07.bb => u-boot-mkimage_2015.10.bb}      | 6 +++---
 meta/recipes-bsp/u-boot/{u-boot_2015.07.bb => u-boot_2015.10.bb}  | 8 +++-----
 3 files changed, 9 insertions(+), 11 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2015.07.bb => u-boot-fw-utils_2015.10.bb} (91%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2015.07.bb => u-boot-mkimage_2015.10.bb} (84%)
 rename meta/recipes-bsp/u-boot/{u-boot_2015.07.bb => u-boot_2015.10.bb} (55%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.10.bb
similarity index 91%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.10.bb
index 0df7a05..93c06e1 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.10.bb
@@ -4,12 +4,12 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
 SECTION = "bootloader"
 DEPENDS = "mtd-utils"
 
-# This revision corresponds to the tag "v2015.07"
+# This revision corresponds to the tag "v2015.10"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "33711bdd4a4dce942fb5ae85a68899a8357bdd94"
+SRCREV = "5ec0003b19cbdf06ccd6941237cbc0d1c3468e2d"
 
-PV = "v2015.07+git${SRCPV}"
+PV = "v2015.10+git${SRCPV}"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.10.bb
similarity index 84%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2015.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2015.10.bb
index ba29bbb..301b6e2 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.10.bb
@@ -5,12 +5,12 @@ SECTION = "bootloader"
 
 DEPENDS = "openssl"
 
-# This revision corresponds to the tag "v2015.07"
+# This revision corresponds to the tag "v2015.10"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "33711bdd4a4dce942fb5ae85a68899a8357bdd94"
+SRCREV = "5ec0003b19cbdf06ccd6941237cbc0d1c3468e2d"
 
-PV = "v2015.07+git${SRCPV}"
+PV = "v2015.10+git${SRCPV}"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2015.07.bb b/meta/recipes-bsp/u-boot/u-boot_2015.10.bb
similarity index 55%
rename from meta/recipes-bsp/u-boot/u-boot_2015.07.bb
rename to meta/recipes-bsp/u-boot/u-boot_2015.10.bb
index 4746c33..e0fab95 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2015.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2015.10.bb
@@ -2,13 +2,11 @@ require u-boot.inc
 
 DEPENDS += "dtc-native"
 
-# This revision corresponds to the tag "v2015.07"
+# This revision corresponds to the tag "v2015.10"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "33711bdd4a4dce942fb5ae85a68899a8357bdd94"
+SRCREV = "5ec0003b19cbdf06ccd6941237cbc0d1c3468e2d"
 
 SRC_URI += "file://0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch"
 
-PV = "v2015.07+git${SRCPV}"
-
-EXTRA_OEMAKE_append = " KCFLAGS=-fgnu89-inline"
+PV = "v2015.10+git${SRCPV}"
-- 
2.6.2


