Return-Path: <prvs=2614bf904=alistair.francis@wdc.com>
X-Greylist: delayed 425 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 31 Dec 2019 16:08:57 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id C49877FC05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 16:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1577808539; x=1609344539;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=LJ+M7xFJdw6A81NSR5KZcJisV+9TtwlaeoC+zTC7DDQ=;
	b=d7hOl5PtmWHGpPAlQxGDzsGQQFuPX8ZkbUMur08XFtjAYpI5zwHv8HdS
	REeBC4XdE/5p2fuk7NS12pMq++Y91715Pe6zJN/ttph9FCxuJHPxohnsH
	sVLgfZZWN2aEHOhIxRDZIlZGZ69a3yBdgRc5HcquNMRo45/Un5VrIb+5t
	FMHtsNsg4lMRpUd4d28OafUgxB8UKymjIFqr49qKknJKIeefxKYwmc6hV
	n32cUissUPNowO/vFADDfNeXU7POqUOxRN0GEjlaLli2E+1d0nVNHy2SD
	hXrwyKLLn4fCIBZiv+4A9DLKilahq7oOruAcnmO/1wG9QeeGr+MtjbwqU A==;
IronPort-SDR: sWPOvjgWgWkANtac5iMVJmfNIfYUnJ3MeOyb4jQVfQlqKTJ0UfKChjOaQJcuVhVRugqgeM2lax
	pthU4SW+WKCTRGpBr8ZCR7xMB737/AtrNKn/8fgBgcblBnofplBnR8Rd0WdlLrI+rW8qp8f1pu
	6AbiUoyaoiEIXbIvZUsbehA56LNmMcMmGRBPKGuToV4YZPMUbLcnEWB11ltT8L836ZMBVv+D8t
	qoTOaH/dTjPXNzsV/7IfUy40jcdYw45+H0iGIqQfvWdHOF87eEZMfILh9gv/Yme2+dox0qBKdn
	mBk=
X-IronPort-AV: E=Sophos;i="5.69,379,1571673600"; d="scan'208";a="234240399"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 01 Jan 2020 00:01:52 +0800
IronPort-SDR: rYSa7eUrTUfeSC4iwjD11sktM9UIxUfVxoum9eZwY51v5wp9YQE9UfRatEFqlIQBNcp6xxE14G
	9T8ED4uuAdilR1hhqkwKZEU/3+OdfP1R7fK2DJcNCrRvmbiG+X6M79tlTM2U7yCiwXonhSimrY
	UGF7O52wOf0CJVX1KJjLY+CU+tXIvdPOxMqXKiMtgrk6PYdxIE+qJd9uuWFfztMIrWXz8tKdNl
	SuqL4VLg+3I/nW67AXmukAQE5xiiL0+uXVIVwIHZy1Fda6aqyKfff+LVRervNUSk++N/gzog25
	cPtNNjo/6e0xzYYHITGamfFl
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	31 Dec 2019 07:55:53 -0800
IronPort-SDR: hIJu3NeC3l5w5L1xUOyePEHp3llxwVZAgE9v+3vqW555SGLcLRTmQv39f/jGAD5i2AK36QajlQ
	S0YJ3KPQ3PICe8yFEt1uaC/xiT/XOgD8+DF1IhkHt4ABhY0RJ7rSpXlRqMwwAIUzHdgAmzRrJj
	JupI8faw7GlRVHM8PpsEvkymbfptpRVvzA3FZTvF6TfpCx3D8608MpnfzLTn0jD8gc/c+MWIyH
	/Pnh0+DNF6QgLJ7syu9DFIAcDzklfVncx/AfWIZRvJuJWznlZCRIGGsJSkXctYFI3Qir9e5+co
	I90=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.158.235])
	by uls-op-cesaip02.wdc.com with ESMTP; 31 Dec 2019 08:01:52 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Dec 2019 07:55:40 -0800
Message-Id: <20191231155540.31434-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: sateesh0457@gmail.com
Subject: [PATCH v2] u-boot: Update to v2020.01-rc5
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
X-List-Received-Date: Tue, 31 Dec 2019 16:08:58 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...nclude-env.h-Ensure-ulong-is-defined.patch |  6 +-
 ...fix-ulong-definition-on-musl-targets.patch | 83 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  4 +-
 .../u-boot/u-boot-fw-utils_2020.01.bb         |  4 +-
 4 files changed, 91 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0002-include-fix-ulong-definition-on-musl-targets.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defined.patch b/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defined.patch
index b9118164df..4d623c1f34 100644
--- a/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defined.patch
+++ b/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defined.patch
@@ -1,4 +1,4 @@
-From 0565a080d153d5baaaacfeb5045a832e126f4f9e Mon Sep 17 00:00:00 2001
+From 718170ff3a5e677db7212a86b129dacb28b1cac2 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@wdc.com>
 Date: Mon, 14 Oct 2019 17:37:30 -0700
 Subject: [PATCH] include/env.h: Ensure ulong is defined
@@ -14,7 +14,7 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/include/env.h b/include/env.h
-index b72239f6a5..5ca49a3456 100644
+index d6c2d751d6..6cf5053431 100644
 --- a/include/env.h
 +++ b/include/env.h
 @@ -13,6 +13,8 @@
@@ -27,5 +27,5 @@ index b72239f6a5..5ca49a3456 100644
  
  /* Value for environment validity */
 -- 
-2.23.0
+2.24.1
 
diff --git a/meta/recipes-bsp/u-boot/files/0002-include-fix-ulong-definition-on-musl-targets.patch b/meta/recipes-bsp/u-boot/files/0002-include-fix-ulong-definition-on-musl-targets.patch
new file mode 100644
index 0000000000..0d965813b0
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0002-include-fix-ulong-definition-on-musl-targets.patch
@@ -0,0 +1,83 @@
+From dccfea2e95cd3f26d1295e02d41012d014827dd9 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyfox@gentoo.org>
+Date: Mon, 16 Dec 2019 23:36:40 +0000
+Subject: [PATCH 2/2] include: fix 'ulong' definition on musl targets
+
+The build failure was originally reported on arm64-musl
+target at https://bugs.gentoo.org/703132. Here is the amd64-musl
+variant:
+
+```
+$ LANG=C make CROSS_COMPILE=x86_64-gentoo-linux-musl- tools-only_defconfig -j$(nproc)
+$ LANG=C make CROSS_COMPILE=x86_64-gentoo-linux-musl- tools-all            -j$(nproc)
+...
+In file included from tools/env/../../env/flags.c:7,
+                 from tools/env/env_flags.c:1:
+include/env.h:159:1: error: unknown type name 'ulong'; did you mean 'long'?
+  159 | ulong env_get_ulong(const char *name, int base, ulong default_val);
+      | ^~~~~
+      | long
+```
+
+Note: 'ulong' is not defined there.
+
+On glibc 'ulong' comes from <sys/types.h>:
+
+```c
+/* Old compatibility names for C types.  */
+typedef unsigned long int ulong;
+```
+
+On musl it comes from <sys/types.h> as well but from under different guards:
+
+```c
+typedef unsigned long u_long, ulong;
+```
+
+The change inlines 'ulong' define similar to 'uint' define.
+
+Upstream-Status: Pending
+Bug: https://bugs.gentoo.org/703132
+Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
+Message-Id: <20191216233640.518168-1-slyfox@gentoo.org>
+---
+ include/compiler.h   | 2 +-
+ include/u-boot/crc.h | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/include/compiler.h b/include/compiler.h
+index 29507f9840..90372f239c 100644
+--- a/include/compiler.h
++++ b/include/compiler.h
+@@ -46,7 +46,6 @@
+ # include <byteswap.h>
+ #elif defined(__MACH__) || defined(__FreeBSD__)
+ # include <machine/endian.h>
+-typedef unsigned long ulong;
+ #endif
+ #ifdef __FreeBSD__
+ # include <sys/endian.h> /* htole32 and friends */
+@@ -66,6 +65,7 @@ typedef uint8_t __u8;
+ typedef uint16_t __u16;
+ typedef uint32_t __u32;
+ typedef unsigned int uint;
++typedef unsigned long ulong;
+ 
+ #define uswap_16(x) \
+ 	((((x) & 0xff00) >> 8) | \
+diff --git a/include/u-boot/crc.h b/include/u-boot/crc.h
+index 1086d2168c..b96b50d98b 100644
+--- a/include/u-boot/crc.h
++++ b/include/u-boot/crc.h
+@@ -8,6 +8,8 @@
+ #ifndef _UBOOT_CRC_H
+ #define _UBOOT_CRC_H
+ 
++#include <compiler.h> /* unit definition */
++
+ /**
+  * crc8() - Calculate and return CRC-8 of the data
+  *
+-- 
+2.24.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index a0f9c41469..4799948bb1 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -11,11 +11,11 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
 PE = "1"
 
 # Drop this line when updating to 2020.01 final
-PV = "2020.01~rc3"
+PV = "2020.01~rc5"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "d4a31e8ee5592072d8d5208b3e950cba2d89b6bd"
+SRCREV = "ef7c2af65966a57c98d3c47e6c2fe1ce2103b7f6"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
           "
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb
index 7de91ffbd7..5d9b300ae2 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb
@@ -3,7 +3,9 @@ require u-boot-common.inc
 SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
 DEPENDS += "mtd-utils"
 
-SRC_URI += "file://0001-include-env.h-Ensure-ulong-is-defined.patch"
+SRC_URI += "file://0001-include-env.h-Ensure-ulong-is-defined.patch \
+            file://0002-include-fix-ulong-definition-on-musl-targets.patch \
+	    "
 
 INSANE_SKIP_${PN} = "already-stripped"
 EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" V=1'
-- 
2.24.1


