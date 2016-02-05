Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id B49A076806
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 20:52:57 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id g62so63826504wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 12:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=K3SLAovSV0ZiQh9tjPM7w0UjNHWG0dv0VlzpWjbMA9w=;
	b=upK52VIJjuprNNEO1laz7J6Jv+X1uHT0mZtlsjmbdjfdUmqRCw3VGtk4MCe8abPgjo
	mxzoNrvKLfWIxrBi8sWN2v/2e4zlwYfVOy4hTIwF1RnzRvLOE9G3wHH/+7jbEpYgyavv
	QRsZhd57NQto/JWloCn2PYo1SqT8alPKqR09kA7HyaV4iKJQIKsVaD4YRrbL2n+jITLK
	jT4SEFrlkuTGoKgMclLSHD6sL30aHv//CcwcxwRoYkrslb9Pq5FV+j+9feJcXJxjnRZO
	/M5EjN3Zx6d9g+U407yD1CaXVRF6NRG2LZzOFGG4l+oxRGWY1uUwmmem/f0MgR3yxdVw
	SyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=K3SLAovSV0ZiQh9tjPM7w0UjNHWG0dv0VlzpWjbMA9w=;
	b=da7UnYJaAS8Pq61qjsjfzENUQ86LO2hfdkeFD8cmvsJLfsRhRZDNsz2JXSwYCyCfgr
	qRWC4LyJc+7uG/IIbOduT5fpinRv9RLrcY9FdG3juKKcir+8c90vlO2n3y3+IFWunLmk
	e9De1GFafsoCE51gAS+4QvK6DRknOxFt0MYsWRgaMzftg3Hp1DUeNdjfAmHD8ou2f7Z4
	Ml/JhWH6MMlcXdmQEA91GFyQT8FO3cIuzHGNwM4MeaXFc/q02fYDQyEjqVyDGVu2tpTQ
	VcMUDfaIuo2wnQnjQkBE8zK0vkd9eM1+Wz67TqCXM6T5dTRlHzXTT3Mv0Y6v4h423H0C
	Qaiw==
X-Gm-Message-State: AG10YOSVRfDp5neBXchB+plOIQW3jpwR8LzOLFXsbY9C7XnQUzNr3LmKrTTkNzAOuXNF7Uip
X-Received: by 10.194.22.132 with SMTP id d4mr16174388wjf.174.1454705577890;
	Fri, 05 Feb 2016 12:52:57 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	js8sm17412085wjc.37.2016.02.05.12.52.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 12:52:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 20:52:54 +0000
Message-Id: <1454705574-22614-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] gtk-theme-torturer: remove from oe-core
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
X-List-Received-Date: Fri, 05 Feb 2016 20:52:58 -0000

This recipe is very old, unmaintained, not used at all in OE-Core, and not
useful in a world that has moved to GTK+ 3 (even if Sato is slow at catching
up).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-yocto/conf/distro/include/maintainers.inc     |  1 -
 meta/conf/distro/include/distro_alias.inc          |  1 -
 .../gtk-theme-torturer/gtk-theme-torturer_git.bb   | 24 ----------------------
 3 files changed, 26 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb

diff --git a/meta-yocto/conf/distro/include/maintainers.inc b/meta-yocto/conf/distro/include/maintainers.inc
index 09320ab..1b587a0 100644
--- a/meta-yocto/conf/distro/include/maintainers.inc
+++ b/meta-yocto/conf/distro/include/maintainers.inc
@@ -227,7 +227,6 @@ RECIPE_MAINTAINER_pn-gtk-doc-stub = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
 RECIPE_MAINTAINER_pn-gtk-engines = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
 RECIPE_MAINTAINER_pn-gtk-icon-utils-native = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
 RECIPE_MAINTAINER_pn-gtk-sato-engine = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
-RECIPE_MAINTAINER_pn-gtk-theme-torturer = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
 RECIPE_MAINTAINER_pn-guile = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-guilt-native = "Bruce Ashfield <bruce.ashfield@windriver.com>"
 RECIPE_MAINTAINER_pn-gummiboot = "Alexander Kanavin <alexander.kanavin@intel.com>"
diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 0a213ba..c2ad07e 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -138,7 +138,6 @@ DISTRO_PN_ALIAS_pn-gtk+3 = "Ubuntu=gtk+3.0 Debian=gtk+3.0 Fedora=gtk3"
 DISTRO_PN_ALIAS_pn-gtk-doc-stub = "Fedora=gtk-doc Ubuntu=gtk-doc"
 DISTRO_PN_ALIAS_pn-gtk-engines = "Fedora=gtk2-engines OpenSuSE=gtk2-engines Ubuntu=gtk2-engines Mandriva=gtk-engines2 Debian=gtk2-engines"
 DISTRO_PN_ALIAS_pn-gtk-sato-engine = "OpenedHand"
-DISTRO_PN_ALIAS_pn-gtk-theme-torturer = "OSPDT upstream=http://wiki.laptop.org/go/GTK_for_OLPC"
 DISTRO_PN_ALIAS_pn-gtk-icon-utils-native = "OSPDT"
 DISTRO_PN_ALIAS_pn-gummiboot = "Debian=gummiboot Fedora=gummiboot"
 DISTRO_PN_ALIAS_pn-hello-mod = "OE-Core"
diff --git a/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb b/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
deleted file mode 100644
index b67806d..0000000
--- a/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "GTK+ Theme benchmark program"
-DEPENDS = "gtk+"
-HOMEPAGE = "http://wiki.laptop.org/go/GTK_for_OLPC"
-SECTION = "devel"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://appwindow.c;endline=13;md5=8c09920de460c7ea1f64ee56986aabd9"
-
-SRCREV = "99962ae39bb5aadb31929b25c58e1a053f9c9545"
-PV = "0.0.0+git${SRCPV}"
-
-SRC_URI = "git://dev.laptop.org/projects/soc-gtk/"
-S = "${WORKDIR}/git/gtk-theme-torturer"
-
-CFLAGS += "-Wl,-rpath-link,${STAGING_LIBDIR}"
-
-inherit distro_features_check
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 torturer ${D}${bindir}
-}
-
-
-- 
2.7.0


