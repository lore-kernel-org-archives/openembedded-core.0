Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UAbjC-0000Pa-TN
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 08:47:03 +0100
Received: by mail-pb0-f51.google.com with SMTP id un15so199859pbc.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 23:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=huzOQgKhZGp5G2v/bhw/zqoOPkqYAx8Batsc9vwyF/k=;
	b=WvzhwHlWWJYxF9bCBv5C93kgMrARpjLVl6VSVdlzXTq/X5gu1uGs5JxQZ4WODXi6eK
	n5PXNJK+oOBPX7XNCWqp9eU1PE29YV8Jcyhf374Uu91v4KnczTzRrk0Zs0HvqlyPCVTo
	vYpXDTEGg+nvTI9kIKkStNoG+a3meDgnPTHOCbPfnE3DZ5y626tFpaizbvEQLn/LqwF2
	NJx4xOhoOrRjuJHjVAh2+wulNOybVtmknprnfFMUzNWqpUgvx58KtfV4BubzPed2GWWz
	vCNidCCwkx4robCw6ETQM2e2nu2LEbxw7nKa6ujKufsBVxzAUW2pPVCEUnTFXKHyA1Qk
	wN0g==
X-Received: by 10.68.42.39 with SMTP id k7mr1860987pbl.138.1361950241870;
	Tue, 26 Feb 2013 23:30:41 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id wm3sm3753798pbc.4.2013.02.26.23.30.40
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 23:30:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2013 23:30:27 -0800
Message-Id: <1361950227-15560-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] qemu: Upgrade to 1.4.0 release
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
X-List-Received-Date: Wed, 27 Feb 2013 07:47:04 -0000

Tested qemu on x86-64 target and qemu-native
no obvious problems seen in testing

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../qemu/files/fix-configure-checks.patch          |   10 +++++-----
 meta/recipes-devtools/qemu/qemu.inc                |    2 +-
 .../qemu/{qemu_1.3.1.bb => qemu_1.4.0.bb}          |    6 ++----
 3 files changed, 8 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu_1.3.1.bb => qemu_1.4.0.bb} (62%)

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
diff --git a/meta/recipes-devtools/qemu/qemu_1.3.1.bb b/meta/recipes-devtools/qemu/qemu_1.4.0.bb
similarity index 62%
rename from meta/recipes-devtools/qemu/qemu_1.3.1.bb
rename to meta/recipes-devtools/qemu/qemu_1.4.0.bb
index c04b2be..009cd78 100644
--- a/meta/recipes-devtools/qemu/qemu_1.3.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.4.0.bb
@@ -4,7 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
-SRC_URI[md5sum] = "5dbc6c22f47efca71dfaae0dd80dcf9e"
-SRC_URI[sha256sum] = "3772e7ef0c9b4178195edcf90e711f12ba123f465fcf09fb43b56bdacaca0eaf"
-
-PR = "r0"
+SRC_URI[md5sum] = "78f13b774814b6b7ebcaf4f9b9204318"
+SRC_URI[sha256sum] = "066297ed77408fb7588889c271a85cf3c259ad55c939315988e6062d7708eda8"
-- 
1.7.9.5



