Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 538F777FE8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 13:42:09 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t3so4862194wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Mar 2018 05:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=HoUtWn+2NmbH76INhUmJAteGOKyS8wn60Qy+CpmuV24=;
	b=xGBk1D5T8fppOaaT5ldQ7LI2frTd6hgifaTASmU1rnIZMCIx+rCDWq3Y2SC+M0i9R1
	jzLehRANsUKBMM6p3Jxbf6a1U3NurAJVqQDtCpqoITjuu8KHj740kD6l/kUl91HPobHT
	0MqHwpbcVhXCJN8VLAjqsnxB8yKBTjyLM3Gto9Ix73pfOgHAOjEgfpZtiyNkXhCSe3oY
	n7M7Evp7hPo0yFsJ/1znvRapi/XC6hT/4KDEC5NOvNGbs4uwPnc+CFzoP6r+hIm5LS+n
	NrDbE6rnsdpb5zehEWjVulbozmHQvFOqc11P1eTgVqqRn4hk7B35AIvsoUv1qkz4N8tK
	WkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HoUtWn+2NmbH76INhUmJAteGOKyS8wn60Qy+CpmuV24=;
	b=moLNx9fYN53R6afL/TnIIdEw2UOvXP76AOBfM3NcvA36u+aSH3SaJ6LMcfddHDxXOd
	6x3wRe3W5eca3oplqDbe00q44iYDYU3diMyHXyeLtBkeuc66cp9hLqJm00qf6MA7k7uQ
	exkJVWBoLxYPzC7hanm/WnYtFNFkmJXUzy2OPexSKCJMQ/T3nM4LyNPZbWlYS4HBhdtC
	6Lp6RpnadKSGwNkLa4/PfdKsNVYOHWtCN4Pr8Ohi+KuWuwhbWifNvPZHUsVROjMlW3ao
	BrhS0RIt9f3y7OhbTXFvZEJvZOVf/O5jXIoEVQ67a0T214Ipxvxq14nTIsHS1BylI58A
	tevw==
X-Gm-Message-State: AElRT7EbVbNA/f+l7AR3ZOdsF4Z3RH5wP+cN0lZG0FwW+mloYOVpZh+/
	aChffocSp1kJo491ihQdLDXFKfYf
X-Google-Smtp-Source: AG47ELvyoB2QSzAE1ZUeLWjAZxRpO9uH5MCDeHBq9CXVII0owepqPPlPp8jKhcQZkaAnrhbEnTgAFA==
X-Received: by 10.28.195.133 with SMTP id t127mr14239449wmf.156.1520430130530; 
	Wed, 07 Mar 2018 05:42:10 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n12sm10188292wmc.35.2018.03.07.05.42.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Mar 2018 05:42:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2018 13:42:07 +0000
Message-Id: <20180307134207.24700-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libfm: fix dependencies
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
X-List-Received-Date: Wed, 07 Mar 2018 13:42:10 -0000

libfm uses glib-gettextize so explicitly depend on glib-2.0-native.

Instead of depending on gettext-native, inherit gettext.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libfm/libfm-extra_1.2.5.bb | 4 ++--
 meta/recipes-support/libfm/libfm_1.2.5.bb       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libfm/libfm-extra_1.2.5.bb b/meta/recipes-support/libfm/libfm-extra_1.2.5.bb
index 0134572f1f8..c0fd83ef344 100644
--- a/meta/recipes-support/libfm/libfm-extra_1.2.5.bb
+++ b/meta/recipes-support/libfm/libfm-extra_1.2.5.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://src/fm-extra.h;beginline=8;endline=21;md5=ef1f84da64b3c01cca447212f7ef6007"
 
 SECTION = "x11/libs"
-DEPENDS = "glib-2.0 intltool-native gettext-native"
+DEPENDS = "glib-2.0-native glib-2.0 intltool-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
            file://0001-nls.m4-Take-it-from-gettext-0.15.patch \
@@ -18,6 +18,6 @@ S = "${WORKDIR}/libfm-${PV}"
 
 EXTRA_OECONF = "--with-extra-only --with-gtk=no"
 
-inherit autotools pkgconfig gtk-doc
+inherit autotools pkgconfig gtk-doc gettext
 
 do_configure[dirs] =+ "${S}/m4"
diff --git a/meta/recipes-support/libfm/libfm_1.2.5.bb b/meta/recipes-support/libfm/libfm_1.2.5.bb
index c1deea68531..596408353fa 100644
--- a/meta/recipes-support/libfm/libfm_1.2.5.bb
+++ b/meta/recipes-support/libfm/libfm_1.2.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4641e94ec96f98fabc56ff9cc48be14b \
 
 
 SECTION = "x11/libs"
-DEPENDS = "glib-2.0 pango gtk+3 menu-cache intltool-native libexif libfm-extra gettext-native"
+DEPENDS = "glib-2.0 glib-2.0-native pango gtk+3 menu-cache intltool-native libexif libfm-extra"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
            file://0001-Correctly-check-the-stamp-file-that-indicates-if-we-.patch \
@@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
 SRC_URI[md5sum] = "a1ba9ae5e920f38b647dd511edd6c807"
 SRC_URI[sha256sum] = "c706bb1020cf5f2d6f5a9226f692ce1985947134dcf2bde64278bd0420779b5a"
 
-inherit autotools pkgconfig gtk-doc distro_features_check
+inherit autotools pkgconfig gtk-doc gettext distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 EXTRA_OECONF = "--with-gtk=3"
-- 
2.11.0


