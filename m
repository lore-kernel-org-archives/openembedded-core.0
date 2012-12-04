Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TfsBp-0007u4-4s
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 14:05:39 +0100
Received: from mail-lb0-f197.google.com ([209.85.217.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 04 Dec 2012 04:51:01 -0800
Received: by mail-lb0-f197.google.com with SMTP id go10so3218682lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2012 04:50:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=wbVQ9tpDV7S4ul09/u+O+zZ6S+zPyc44kFQL62U6B+c=;
	b=NBD5HV4SnGyhbA9VKON1NSOCtLv1WqYjk64569DHebSuwIordPyz+Cj00cZFU3x1E8
	IhC1hcOrPhRUFTDPd+ruFsPGqFoFkeRsQshUNKcLQa9FdfEvnY4rbOyxyrHdTPIJyUuO
	VKClxxl+Ik3sbyMqLOPFpYqSMQ4rMJVsMfiTvVsCtziRYSkrvTw+pyThZoceJy8/XzZ1
	yNG56+rEqyARmqR3VQ810PJre1wIfHE4RMkd8lfF7z5BbcGiwQhw1eM9dFf2x3RtQ/fU
	/oIHwp0lflghHP5JC9uC5LDL1bWDFiwPM7gTefEZXSPUviXkV6+xbRUHmSQuvugGclQs
	cSHg==
Received: by 10.180.86.7 with SMTP id l7mr4238579wiz.5.1354625459063;
	Tue, 04 Dec 2012 04:50:59 -0800 (PST)
Received: by 10.180.86.7 with SMTP id l7mr4238553wiz.5.1354625458755;
	Tue, 04 Dec 2012 04:50:58 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cf6sm1735006wib.3.2012.12.04.04.50.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 04:50:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 12:49:22 +0000
Message-Id: <1354625362-15886-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmscC0AKp+Za3IMhIfqyZNXUCU4ZFpBiX6Qy0FdtYp1nmQ4k6yIPZxZEN/h8U84roy3K8Ucr2YKboLn7Qq7D/KKZBVyw31GA5Bt/zgdSvOGj25hfSWKXpGYrbzpGgMCK53AeJqf4s7sbQo7MJWErBB64ixdFPVukAEElHgvMpO5qeZO375c9k5AGblSq1u1n+7pdE1d
Subject: [PATCH] mesa: upgrade to 8.0.5
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
X-List-Received-Date: Tue, 04 Dec 2012 13:06:06 -0000

Licence checksum change, use an upstream source file instead of a generated
file: we were previously checksumming the Bison license.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-graphics/mesa/mesa-dri_8.0.4.bbappend  |    3 ---
 .../recipes-graphics/mesa/mesa-dri_8.0.5.bbappend  |    3 +++
 meta/recipes-graphics/mesa/mesa-8.0.4.inc          |   18 ----------------
 meta/recipes-graphics/mesa/mesa-8.0.5.inc          |   18 ++++++++++++++++
 .../mesa/mesa-dri-glsl-native_8.0.4.bb             |   22 --------------------
 .../mesa/mesa-dri-glsl-native_8.0.5.bb             |   22 ++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb       |    4 ----
 meta/recipes-graphics/mesa/mesa-dri_8.0.5.bb       |    4 ++++
 8 files changed, 47 insertions(+), 47 deletions(-)
 delete mode 100644 meta-yocto-bsp/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
 create mode 100644 meta-yocto-bsp/recipes-graphics/mesa/mesa-dri_8.0.5.bbappend
 delete mode 100644 meta/recipes-graphics/mesa/mesa-8.0.4.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-8.0.5.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.5.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri_8.0.5.bb

diff --git a/meta-yocto-bsp/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend b/meta-yocto-bsp/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
deleted file mode 100644
index 7e8e773..0000000
--- a/meta-yocto-bsp/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-# Atom PCs have DRI support so use mesa-dri by default
-DEFAULT_PREFERENCE_atom-pc = "2"
-
diff --git a/meta-yocto-bsp/recipes-graphics/mesa/mesa-dri_8.0.5.bbappend b/meta-yocto-bsp/recipes-graphics/mesa/mesa-dri_8.0.5.bbappend
new file mode 100644
index 0000000..7e8e773
--- /dev/null
+++ b/meta-yocto-bsp/recipes-graphics/mesa/mesa-dri_8.0.5.bbappend
@@ -0,0 +1,3 @@
+# Atom PCs have DRI support so use mesa-dri by default
+DEFAULT_PREFERENCE_atom-pc = "2"
+
diff --git a/meta/recipes-graphics/mesa/mesa-8.0.4.inc b/meta/recipes-graphics/mesa/mesa-8.0.4.inc
deleted file mode 100644
index c6307dc..0000000
--- a/meta/recipes-graphics/mesa/mesa-8.0.4.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-DEPENDS += "mesa-dri-glsl-native"
-
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \ 
-           file://0001-Compile-with-uclibc.patch \
-           file://0002-cross-compile.patch \
-           file://0003-fix-for-x32.patch \
-           "
-SRC_URI += "${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://0004-gross-hack-to-prevent-from-install-libgl.patch', d)}"
-
-S = "${WORKDIR}/Mesa-${PV}"
-
-SRC_URI[md5sum] = "d546f988adfdf986cff45b1efa2d8a46"
-SRC_URI[sha256sum] = "02ed19f4f5f6535dda03a9932a81438aa78ea723ebba1f39a3d49a70a4e1d07e"
-
-do_configure_prepend() {
-  # We need builtin_compiler built for buildhost arch instead of target (is provided by mesa-dri-glsl-native)"
-  sed -i "s#\./builtin_compiler#${STAGING_BINDIR_NATIVE}/glsl/builtin_compiler#g" ${S}/src/glsl/Makefile
-}
diff --git a/meta/recipes-graphics/mesa/mesa-8.0.5.inc b/meta/recipes-graphics/mesa/mesa-8.0.5.inc
new file mode 100644
index 0000000..b39b011
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-8.0.5.inc
@@ -0,0 +1,18 @@
+DEPENDS += "mesa-dri-glsl-native"
+
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
+           file://0001-Compile-with-uclibc.patch \
+           file://0002-cross-compile.patch \
+           file://0003-fix-for-x32.patch \
+           "
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://0004-gross-hack-to-prevent-from-install-libgl.patch', d)}"
+
+S = "${WORKDIR}/Mesa-${PV}"
+
+SRC_URI[md5sum] = "01305591073a76b65267f69f27d635a3"
+SRC_URI[sha256sum] = "511b8da34f8e69ed24caf422964fb7ae747f3b1d8093f6b8aa2602164a475a5e"
+
+do_configure_prepend() {
+  # We need builtin_compiler built for buildhost arch instead of target (is provided by mesa-dri-glsl-native)"
+  sed -i "s#\./builtin_compiler#${STAGING_BINDIR_NATIVE}/glsl/builtin_compiler#g" ${S}/src/glsl/Makefile
+}
diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb
deleted file mode 100644
index d551598..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require mesa-dri-glsl-native.inc
-
-LIC_FILES_CHKSUM = "file://glsl_parser.cpp;beginline=3;endline=33;md5=d078f1cddc2fc355719c090482254bd9"
-
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
-SRC_URI[md5sum] = "d546f988adfdf986cff45b1efa2d8a46"
-SRC_URI[sha256sum] = "02ed19f4f5f6535dda03a9932a81438aa78ea723ebba1f39a3d49a70a4e1d07e"
-
-S = "${WORKDIR}/Mesa-${PV}/src/glsl/"
-
-inherit native
-
-# use default config for native build
-do_configure_prepend() {
-	ln -sf ${S}/../../configs/default ${S}/../../configs/current
-}
-
-do_install() {
-	install -d ${D}/${bindir}/glsl
-	install -m 755 ${S}/builtin_compiler ${D}/${bindir}/glsl/builtin_compiler
-	install -m 755 ${S}/glsl_compiler ${D}/${bindir}/glsl/glsl_compiler
-}
diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.5.bb b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.5.bb
new file mode 100644
index 0000000..842d492
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.5.bb
@@ -0,0 +1,22 @@
+require mesa-dri-glsl-native.inc
+
+LIC_FILES_CHKSUM = "file://glsl_parser.yy;beginline=2;endline=23;md5=a12a9c0208ee64a07ce314dfed4c81eb"
+
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
+SRC_URI[md5sum] = "01305591073a76b65267f69f27d635a3"
+SRC_URI[sha256sum] = "511b8da34f8e69ed24caf422964fb7ae747f3b1d8093f6b8aa2602164a475a5e"
+
+S = "${WORKDIR}/Mesa-${PV}/src/glsl/"
+
+inherit native
+
+# use default config for native build
+do_configure_prepend() {
+	ln -sf ${S}/../../configs/default ${S}/../../configs/current
+}
+
+do_install() {
+	install -d ${D}/${bindir}/glsl
+	install -m 755 ${S}/builtin_compiler ${D}/${bindir}/glsl/builtin_compiler
+	install -m 755 ${S}/glsl_compiler ${D}/${bindir}/glsl/glsl_compiler
+}
diff --git a/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb b/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
deleted file mode 100644
index a5a592d..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require mesa-common.inc
-require mesa-${PV}.inc
-require mesa-dri.inc
-PR = "${INC_PR}.4"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_8.0.5.bb b/meta/recipes-graphics/mesa/mesa-dri_8.0.5.bb
new file mode 100644
index 0000000..26b56e4
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-dri_8.0.5.bb
@@ -0,0 +1,4 @@
+require mesa-common.inc
+require mesa-${PV}.inc
+require mesa-dri.inc
+PR = "${INC_PR}.0"
-- 
1.7.10



