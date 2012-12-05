Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TgIro-0003SP-Ij
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 18:34:41 +0100
Received: from mail-ee0-f69.google.com ([74.125.83.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 05 Dec 2012 09:20:12 -0800
Received: by mail-ee0-f69.google.com with SMTP id d41so4979349eek.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 09:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=wbVQ9tpDV7S4ul09/u+O+zZ6S+zPyc44kFQL62U6B+c=;
	b=Ds2czHMuFtUUM24X1vcQBjMSTO1coDI+37n4SDnBhbPf4pxb9ss1JmCWIqY52mPC6O
	yQ6PFMgK1ue54iQ91tOcf0P2ypRDuxEAufnLDwvMd2ltapenGY11tYmT4qSr7wxGyffn
	IDLtMJM/BE1mauVqzWpkmtj4YqXNNA8uGb7KZ1JRGtyz+dzGZluAT4PXpJS7SrjNWB8h
	YMRrMIjzxdVAS3UMaNFDlpXDsq9yWzFy5JpPEtJw8FAxVh6Snh6W7zW+ORLASm7OgNx0
	uLp/6dV4ORaMVZl+fOBuobmUfbeHd1Zw4qn61WNgNLoSo2xV77UZbcF308Ldb2FHod4e
	NEFA==
Received: by 10.216.217.205 with SMTP id i55mr7027223wep.90.1354728006638;
	Wed, 05 Dec 2012 09:20:06 -0800 (PST)
Received: by 10.216.217.205 with SMTP id i55mr7027220wep.90.1354728006527;
	Wed, 05 Dec 2012 09:20:06 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id b1sm7260209wix.11.2012.12.05.09.20.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 09:20:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 17:18:26 +0000
Message-Id: <1354727906-16779-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1354727906-16779-1-git-send-email-ross.burton@intel.com>
References: <1354727906-16779-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn8J6bgzVDQ/iMNLrqviECe5cXmdjsA4Ao1U/M5PsOGqRa7/unkba647Y1ASP9kMvEADYAMKSDmJVJ0nAK1I4tOmWXCQXQUZaM1xDx+P2KOYA8Q9fq7d1FOpKyh4U7QkpHaWaXCbe9uT9hDlu2my3tUO+WOyCjlSCXfy5WJbH1Cn2KZeETqE1IIYlrH3swHAdFgFtkv
Subject: [PATCH 2/2] mesa: upgrade to 8.0.5
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
X-List-Received-Date: Wed, 05 Dec 2012 17:34:41 -0000

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



