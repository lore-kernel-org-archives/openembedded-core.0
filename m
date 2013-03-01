Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UBKEn-0004sZ-2B
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 08:18:37 +0100
Received: by mail-pb0-f41.google.com with SMTP id um15so1582337pbc.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2013 23:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Us025GzAJoChk+PbEtZvZBOV1YCfNANluoLCWV+Es+4=;
	b=FABNCJyrlrBcT2NUG9tX87JL+83Apq+8d4OilpsiTNGR8rYVpBxcKhar/Xkh8Bh78j
	WJPIUZirNTogwOdV9yt1aR3f/hDkQXwOVkmHpQYqlZVh/rOCdUzzj/BAGL87b+MHYmot
	3w/q4lAjz1YbWR1AYllBNfpVuypUG26TorW/gvkz5cTIEPrnnVWxvI2ol0/ZZdVTwUEv
	ce+fPn7UAHxWyS/uPim5NCVWoGsvHhliY36CqXoxVEcUravVYRxGSG2wD8p3mh9EECtw
	XLgvvnGkxb7Iba4mjIbxWQQAeDL7vozyRChKQIKhut1sFbE+Mo7+W1mpfaRocNcsn7rc
	vddQ==
X-Received: by 10.68.130.35 with SMTP id ob3mr13199812pbb.92.1362121333265;
	Thu, 28 Feb 2013 23:02:13 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id xr3sm11052128pbc.46.2013.02.28.23.02.11
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 23:02:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2013 23:01:51 -0800
Message-Id: <1362121311-2387-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V2] qemu: Upgrade to 1.4.0 release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 07:18:38 -0000

Tested qemu on x86-64 target and qemu-native
no obvious problems seen in testing

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../qemu/files/fix-configure-checks.patch          |   10 +++++-----
 .../qemu/files/relocatable_sdk.patch               |   16 ++++++++--------
 meta/recipes-devtools/qemu/qemu.inc                |    2 +-
 meta/recipes-devtools/qemu/qemu_1.3.1.bb           |   10 ----------
 meta/recipes-devtools/qemu/qemu_1.4.0.bb           |    8 ++++++++
 5 files changed, 22 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu_1.3.1.bb
 create mode 100644 meta/recipes-devtools/qemu/qemu_1.4.0.bb

diff --git a/meta/recipes-devtools/qemu/files/fix-configure-checks.patch b/meta/recipes-devtools/qemu/files/fix-configure-checks.patch
index ef77c92..294c220 100644
--- a/meta/recipes-devtools/qemu/files/fix-configure-checks.patch
+++ b/meta/recipes-devtools/qemu/files/fix-configure-checks.patch
@@ -8,14 +8,14 @@ Patch from Paul Eggleton, Comments by RP 28/11/10
 
 Upstream-Status: Inappropriate [embedded specific]
 
-Index: qemu-1.2.0/configure
+Index: qemu-1.4.0/configure
 ===================================================================
---- qemu-1.2.0.orig/configure	2012-09-05 07:03:06.000000000 -0700
-+++ qemu-1.2.0/configure	2012-09-06 13:55:07.007793823 -0700
-@@ -281,6 +281,7 @@
+--- qemu-1.4.0.orig/configure	2013-02-15 15:05:35.000000000 -0800
++++ qemu-1.4.0/configure	2013-02-25 13:44:17.915273181 -0800
+@@ -286,6 +286,7 @@
  QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
  QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
- QEMU_INCLUDES="-I. -I\$(SRC_PATH) -I\$(SRC_PATH)/fpu"
+ QEMU_INCLUDES="-I. -I\$(SRC_PATH) -I\$(SRC_PATH)/include"
 +QEMU_CFLAGS="$QEMU_CFLAGS $CFLAGS"
  if test "$debug_info" = "yes"; then
      CFLAGS="-g $CFLAGS"
diff --git a/meta/recipes-devtools/qemu/files/relocatable_sdk.patch b/meta/recipes-devtools/qemu/files/relocatable_sdk.patch
index 0a01a8a..774a49c 100644
--- a/meta/recipes-devtools/qemu/files/relocatable_sdk.patch
+++ b/meta/recipes-devtools/qemu/files/relocatable_sdk.patch
@@ -6,11 +6,11 @@ the new path (4096 is the maximum path length in Linux).
 
 Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
 
-Index: qemu-1.2.0/i386.ld
+Index: qemu-1.4.0/ldscripts/i386.ld
 ===================================================================
---- qemu-1.2.0.orig/i386.ld
-+++ qemu-1.2.0/i386.ld
-@@ -8,7 +8,7 @@ SECTIONS
+--- qemu-1.4.0.orig/ldscripts/i386.ld	2013-02-15 15:05:35.000000000 -0800
++++ qemu-1.4.0/ldscripts/i386.ld	2013-02-28 22:55:36.138816418 -0800
+@@ -8,7 +8,7 @@
  {
    /* Read-only sections, merged into text segment: */
    . = 0x60000000 + SIZEOF_HEADERS;
@@ -19,11 +19,11 @@ Index: qemu-1.2.0/i386.ld
    .hash          : { *(.hash)		}
    .dynsym        : { *(.dynsym)		}
    .dynstr        : { *(.dynstr)		}
-Index: qemu-1.2.0/x86_64.ld
+Index: qemu-1.4.0/ldscripts/x86_64.ld
 ===================================================================
---- qemu-1.2.0.orig/x86_64.ld
-+++ qemu-1.2.0/x86_64.ld
-@@ -6,7 +6,7 @@ SECTIONS
+--- qemu-1.4.0.orig/ldscripts/x86_64.ld	2013-02-15 15:05:35.000000000 -0800
++++ qemu-1.4.0/ldscripts/x86_64.ld	2013-02-28 22:55:36.138816418 -0800
+@@ -6,7 +6,7 @@
  {
    /* Read-only sections, merged into text segment: */
    . = 0x60000000 + SIZEOF_HEADERS;
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6c44b31..2b60347 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -32,7 +32,7 @@ SRC_URI_append_class-nativesdk = "\
     file://relocatable_sdk.patch \
     "
 
-EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman --disable-smartcard"
+EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman"
 
 EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls \
 				--disable-curl \
diff --git a/meta/recipes-devtools/qemu/qemu_1.3.1.bb b/meta/recipes-devtools/qemu/qemu_1.3.1.bb
deleted file mode 100644
index c04b2be..0000000
--- a/meta/recipes-devtools/qemu/qemu_1.3.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require qemu.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
-                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
-
-SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
-SRC_URI[md5sum] = "5dbc6c22f47efca71dfaae0dd80dcf9e"
-SRC_URI[sha256sum] = "3772e7ef0c9b4178195edcf90e711f12ba123f465fcf09fb43b56bdacaca0eaf"
-
-PR = "r0"
diff --git a/meta/recipes-devtools/qemu/qemu_1.4.0.bb b/meta/recipes-devtools/qemu/qemu_1.4.0.bb
new file mode 100644
index 0000000..009cd78
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu_1.4.0.bb
@@ -0,0 +1,8 @@
+require qemu.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
+                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
+
+SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
+SRC_URI[md5sum] = "78f13b774814b6b7ebcaf4f9b9204318"
+SRC_URI[sha256sum] = "066297ed77408fb7588889c271a85cf3c259ad55c939315988e6062d7708eda8"
-- 
1.7.9.5



