Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id 11A077907E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:40 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id a20-v6so8468413edd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9O/dLOD728KFnT6DqdZIh1onV/MrYCM2IvOOsI+8Lcg=;
	b=EgqIQZ5bvGIQFXxr5O7v7pg6rUmFyIXgAuJTz3pEAhoGNaVF5GjBOm/ZlmtHLAkXRa
	EMdmjsn1Ej3DiPtZFq6gbVJk6DsoxA29fxsK5GCQCDjWaP6x4BxVWR+hihmqMfATKi7/
	QufcJFc+ymtrUxm0tesUjop+UfR6sQ4xdnWLBI8jz72HG2xxlzVjNatx4KmoXPYUEyug
	Dvx2rKLpPeprgoMy5H9I0B5JaHgYEotk1BJ1tz4hnynq4QvYRHIdC45xa+lm0yxsZXKv
	U8m+PoYjhqTBURGv7snKfBiwijXpCtOrd3xPKmJp2jSmw+DHSY2UtyrkkdYnKhdVTKA3
	0/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9O/dLOD728KFnT6DqdZIh1onV/MrYCM2IvOOsI+8Lcg=;
	b=qBaddXnbqz2C1dve6T+NVMtSe/ogonTK7/V0RXhA6r/xsduef9enlbesjpydoNtQj0
	0VC+CHcLd3kng4DpV5jhir0HPf32v9hAIVLNDkJWpi6JCdm3MCrJ0lEZjznaH5VwutOV
	ivs7k2l3x5RwOBXiEHslGXQEXlhOyhS6K8/dIQ0/lvwETfAJA5ce9DOJf9prDjneot7G
	tJPiYZbzxAGERVmkAjC8ZjBcXzD4Jf2voV6U6YfZKzbpvdVeKZQdsbv74RUsfaIw/O0r
	F3GoTVClrOOYEodJgQoTyO4wlRqJKErgvsVX1Qjyg3pIFZTXSPJbgrO7i1xhkduZlew+
	plbg==
X-Gm-Message-State: APzg51C6bEPEtSydqSW9Ifaijma1EBtMt5ML+PLg9bfB1XKFDhh7fIMm
	AM+BwLN1h0DAmveRw07F+XuhOdPPybQ=
X-Google-Smtp-Source: ANB0VdYJ/sF6oskuuBbexhx8X2+YVDeuLXO4FVYFBVOhKrN8upP1ydGHt/y0YMyAj1R9n5drtj/kyQ==
X-Received: by 2002:a50:b7db:: with SMTP id
	i27-v6mr2893424ede.284.1536229781145; 
	Thu, 06 Sep 2018 03:29:41 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:10 +0200
Message-Id: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 01/21] eee-acpi-scripts: remove the recipe
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:41 -0000

Asus EEEPc hardware is well obsolete, upstream repo is now gone.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/distro_alias.inc          |  1 -
 meta/conf/distro/include/maintainers.inc           |  1 -
 .../eee-acpi-scripts/eee-acpi-scripts_git.bb       | 39 --------------
 .../eee-acpi-scripts/files/policy-funcs            |  8 ---
 .../eee-acpi-scripts/files/powerbtn.patch          | 22 --------
 .../eee-acpi-scripts/files/remove-doc-check.patch  | 60 ----------------------
 6 files changed, 131 deletions(-)
 delete mode 100644 meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
 delete mode 100644 meta/recipes-bsp/eee-acpi-scripts/files/policy-funcs
 delete mode 100644 meta/recipes-bsp/eee-acpi-scripts/files/powerbtn.patch
 delete mode 100644 meta/recipes-bsp/eee-acpi-scripts/files/remove-doc-check.patch

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 793a1c2..7502542 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -80,7 +80,6 @@ DISTRO_PN_ALIAS_pn-docbook-xml-dtd4-native = "Ubuntu=docbook-xml Fedora=docbook-
 DISTRO_PN_ALIAS_pn-docbook-xsl-stylesheets = "Fedora=docbook-xsl-stylesheets Opensuse=docbook-xsl-stylesheets"
 DISTRO_PN_ALIAS_pn-dropbear = "Debian=dropbear Ubuntu=dropbear"
 DISTRO_PN_ALIAS_pn-dtc = "Fedora=dtc Ubuntu=dtc"
-DISTRO_PN_ALIAS_pn-eee-acpi-scripts = "Debian=eeepc-acpi-scripts Ubuntu=eeepc-acpi-scripts"
 DISTRO_PN_ALIAS_pn-eglinfo-fb = "OE-Core"
 DISTRO_PN_ALIAS_pn-eglinfo-x11 = "OE-Core"
 DISTRO_PN_ALIAS_pn-encodings = "Ubuntu=xfonts-encodings Mandriva=x11-font-encodings Debian=xfonts-encodings"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4ec3c20..2ecc3d6 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -142,7 +142,6 @@ RECIPE_MAINTAINER_pn-dtc = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-dwarfsrcfiles = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-e2fsprogs = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-ed = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-eee-acpi-scripts = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-eglinfo-fb = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-eglinfo-x11 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-elfutils = "Hongxu Jia <hongxu.jia@windriver.com>"
diff --git a/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb b/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
deleted file mode 100644
index c2a02aa..0000000
--- a/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "eeePC specific ACPI scripts"
-HOMEPAGE = "http://alioth.debian.org/projects/debian-eeepc/"
-SECTION = "base"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=77ef83ab5f4af938a93edb61f7b74f2c"
-
-SRCREV = "9d4cdedca25b396405f8587f9c4fbf8229e041c2"
-PV = "1.1.12+git${SRCPV}"
-
-SRC_URI = "git://git.debian.org/git/debian-eeepc/eeepc-acpi-scripts.git \
-	   file://remove-doc-check.patch \
-	   file://powerbtn.patch \
-	   file://policy-funcs "
-
-S = "${WORKDIR}/git"
-
-FILES_${PN} = "${datadir}/acpi-support/ \
-               ${datadir}/eeepc-acpi-scripts \
-               ${sysconfdir}/default/ \
-               ${sysconfdir}/acpi/"
-
-do_install () {
-	install -d ${D}${sysconfdir}/default/
-	install -d ${D}${sysconfdir}/acpi/actions/
-	install -d ${D}${sysconfdir}/acpi/events/
-	install -d ${D}${sysconfdir}/acpi/lib/udev/rules.d
-	install -d ${D}${datadir}/eeepc-acpi-scripts/
-	install -d ${D}${datadir}/acpi-support/
-	install -m 644 ${S}/events/* ${D}${sysconfdir}/acpi/events/
-	install -m 644 ${S}/lib/udev/rules.d/* ${D}${sysconfdir}/acpi/lib/udev/rules.d/
-	install ${S}/actions/* ${D}${sysconfdir}/acpi/actions/
-	install -m 0644 ${S}/acpilib/functions.sh ${D}${datadir}/eeepc-acpi-scripts/
-	install -m 0644 ${WORKDIR}/policy-funcs ${D}${datadir}/acpi-support/
-	install -m 0644 ${S}/debian/eeepc-acpi-scripts.default* ${D}${sysconfdir}/default/
-}
-
-RDEPENDS_${PN} = "pm-utils"
-
diff --git a/meta/recipes-bsp/eee-acpi-scripts/files/policy-funcs b/meta/recipes-bsp/eee-acpi-scripts/files/policy-funcs
deleted file mode 100644
index fd099df..0000000
--- a/meta/recipes-bsp/eee-acpi-scripts/files/policy-funcs
+++ /dev/null
@@ -1,8 +0,0 @@
-CheckPolicy() {
-	if pidof gnome-power-manager kpowersave > /dev/null ||
-	   (pidof dcopserver > /dev/null && test -x /usr/bin/dcop && /usr/bin/dcop kded kded loadedModules | grep -q klaptopdaemon) ; then
-		echo 0;
-	else
-		echo 1;
-	fi
-}
diff --git a/meta/recipes-bsp/eee-acpi-scripts/files/powerbtn.patch b/meta/recipes-bsp/eee-acpi-scripts/files/powerbtn.patch
deleted file mode 100644
index 403e556..0000000
--- a/meta/recipes-bsp/eee-acpi-scripts/files/powerbtn.patch
+++ /dev/null
@@ -1,22 +0,0 @@
----
- actions/power.sh |    3 +++
- events/powerbtn  |    2 ++
- 2 files changed, 5 insertions(+)
-
-Upstream-Status: Inappropriate [enable feature]
-
-Index: git/events/powerbtn
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/events/powerbtn	2008-10-08 17:43:35.000000000 +0200
-@@ -0,0 +1,2 @@
-+event=button/power PWRF
-+action=/etc/acpi/actions/power.sh
-Index: git/actions/power.sh
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/actions/power.sh	2008-10-08 17:45:26.000000000 +0200
-@@ -0,0 +1,3 @@
-+#!/bin/sh
-+
-+/sbin/shutdown -h now "Power button pressed"
diff --git a/meta/recipes-bsp/eee-acpi-scripts/files/remove-doc-check.patch b/meta/recipes-bsp/eee-acpi-scripts/files/remove-doc-check.patch
deleted file mode 100644
index efb3dca..0000000
--- a/meta/recipes-bsp/eee-acpi-scripts/files/remove-doc-check.patch
+++ /dev/null
@@ -1,60 +0,0 @@
----
- actions/hotkey.sh     |    3 ---
- actions/suspend.sh    |    3 ---
- actions/vga-toggle.sh |    3 ---
- actions/volume.sh     |    3 ---
- 4 files changed, 12 deletions(-)
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/eeepc-acpi-scripts/volume.sh
-===================================================================
---- git.orig/eeepc-acpi-scripts/volume.sh	2011-11-29 19:21:55.000000000 +0800
-+++ git/eeepc-acpi-scripts/volume.sh	2011-11-29 19:41:36.000000000 +0800
-@@ -3,12 +3,10 @@
- [ -d /sys/devices/platform/eeepc ] || [ -d /sys/devices/platform/eeepc-wmi ] || exit 0
- # Volume controls
- 
--# do nothing if package is removed
- PKG=eeepc-acpi-scripts
- PKG_DIR=/usr/share/acpi-support/$PKG
- FUNC_LIB=$PKG_DIR/lib/functions.sh
- DEFAULT=/etc/default/$PKG
--[ -e "$FUNC_LIB" ] || exit 0
- 
- . $FUNC_LIB
- . $PKG_DIR/lib/sound.sh
-Index: git/eeepc-acpi-scripts/hotkey.sh
-===================================================================
---- git.orig/eeepc-acpi-scripts/hotkey.sh	2011-11-29 19:21:55.000000000 +0800
-+++ git/eeepc-acpi-scripts/hotkey.sh	2011-11-29 19:39:51.000000000 +0800
-@@ -1,12 +1,10 @@
- #!/bin/sh
- 
- [ -d /sys/devices/platform/eeepc ] || [ -d /sys/devices/platform/eeepc-wmi ] || exit 0
--# do nothing if package is removed
- PKG=eeepc-acpi-scripts
- PKG_DIR=/usr/share/acpi-support/$PKG
- FUNC_LIB=$PKG_DIR/lib/functions.sh
- DEFAULT=/etc/default/$PKG
--[ -e "$FUNC_LIB" ] || exit 0
- 
- case $(runlevel) in
-     *0|*6)
-Index: git/eeepc-acpi-scripts/vga-toggle.sh
-===================================================================
---- git.orig/eeepc-acpi-scripts/vga-toggle.sh	2011-11-29 19:21:55.000000000 +0800
-+++ git/eeepc-acpi-scripts/vga-toggle.sh	2011-11-29 19:40:24.000000000 +0800
-@@ -1,12 +1,10 @@
- #!/bin/sh
- 
- [ -d /sys/devices/platform/eeepc ] || [ -d /sys/devices/platform/eeepc-wmi ] || exit 0
--# do nothing if package is removed
- PKG=eeepc-acpi-scripts
- PKG_DIR=/usr/share/acpi-support/$PKG
- FUNC_LIB=$PKG_DIR/lib/functions.sh
- DEFAULT=/etc/default/$PKG
--[ -e "$FUNC_LIB" ] || exit 0
- 
- if [ -e "$DEFAULT" ]; then . "$DEFAULT"; fi
- . $FUNC_LIB
-- 
2.7.4


