Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.4621.1588672340175419099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 02:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ub971gXd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id y24so1588689wma.4
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=idGAfi5bvNI/3DvQZtPmCWlIgPNr0JiEDRvAR3XFZ5w=;
        b=Ub971gXdTAXv5IqgyFwC0PJNiVHAzm4+fc1FD1OcKFrZDQ/SeWybsm7WCCYm8g2bIa
         MlXKb8I9qmZq0DMRavO1nYb7dmgrd1LfunLeu9ljLvc+Mi0sivzd6MES0NHh72/wdowS
         hrvjhCQDcnErEXAtr7bDyZ2JZjBev3wkDzwlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=idGAfi5bvNI/3DvQZtPmCWlIgPNr0JiEDRvAR3XFZ5w=;
        b=DhH29vAj0nFHnEgT4bXL3GyhGYAVhbUZU0I33rZs/IUsAuB5TtiTqyyDHRmPxJwAJr
         HYbIm2h5DYd2TLhicVAMDgiVXiGbZcm2K0vLkE8QC6jPvu7I/c3g1vwAoMzpoGx++oIx
         aFTGmqVSM1D9h2KTSXikHz0z7a7Us9uSxvka3ourYB43nbHmkp/JJKbR2iPtiB5127Ng
         gm2LwdjbSgrP3RcoUFK0Xq72v0OY1o8KvP6Xl/8BjvNQGcZAxKEcfCn1uOr5ZV4fMhxl
         tJDAXa7GeP5rVOKn22F3lNIfyfSLa4Xhv7Vt35L0NaHTddxEg995Te2HTCPh95JXbh4I
         dWXw==
X-Gm-Message-State: AGi0Pub9HRTXl46aU95b17JZLP7C9u7mSFwwxduFBeCoCGgGHONnF0No
	aBblZJN57f5Igs+bAeSCk3w+q7wJVVE=
X-Google-Smtp-Source: APiQypIMEdV2zIhmLytiKFJa9SGAgxu4UnuKqE4ebFGx7kg0WoLWQwrILYto+E33Q90wuyekHZVpmQ==
X-Received: by 2002:a1c:1c8:: with SMTP id 191mr2413194wmb.37.1588672337905;
        Tue, 05 May 2020 02:52:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 89sm2437150wrj.37.2020.05.05.02.52.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 02:52:17 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipes: Remove remaining INC_PR variables
Date: Tue,  5 May 2020 10:52:16 +0100
Message-Id: <20200505095216.3661871-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most of these were unused, remaining in the inc files long after the
PR values were removed from the recipes.

The only two which did anything wre in xorg-font and for those,
bump PR by hand and remove the INC_PR to clean up all references.

This kind of change is much better handled by PRServ now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/connman/connman.inc            | 2 --
 meta/recipes-graphics/xorg-app/xorg-app-common.inc       | 2 --
 meta/recipes-graphics/xorg-driver/xorg-driver-common.inc | 1 -
 meta/recipes-graphics/xorg-font/encodings_1.0.5.bb       | 2 +-
 meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb      | 2 +-
 meta/recipes-graphics/xorg-font/xorg-font-common.inc     | 2 --
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc      | 1 -
 meta/recipes-kernel/linux/linux-yocto.inc                | 2 --
 8 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index b60178cefc9..d2ae0967ebc 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -17,8 +17,6 @@ inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
 DEPENDS  = "dbus glib-2.0 ppp"
 
-INC_PR = "r20"
-
 EXTRA_OECONF += "\
     ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
     ac_cv_path_PPPD=${sbindir}/pppd \
diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
index 101b3dfffd3..cb8cf4f5fa9 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -8,8 +8,6 @@ DEPENDS = "util-macros-native virtual/libx11"
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-INC_PR = "r8"
-
 SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
 
 inherit autotools pkgconfig features_check
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index e30f0447249..493b90a298c 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -5,7 +5,6 @@ SECTION = "x11/drivers"
 LICENSE = "MIT-X"
 
 PE = "2"
-INC_PR = "r21"
 
 DEPENDS = "virtual/xserver xorgproto util-macros"
 
diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
index a39609b5daf..4d61aed1836 100644
--- a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
@@ -7,7 +7,7 @@ require xorg-font-common.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9da93f2daf2d5572faa2bfaf0dbd9e76"
 PE = "1"
-PR = "${INC_PR}.1"
+PR = "r3"
 
 DEPENDS = "mkfontscale-native mkfontdir-native font-util-native"
 RDEPENDS_${PN} = ""
diff --git a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb b/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
index 15e101596ae..c5990a9e445 100644
--- a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
+++ b/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
@@ -18,7 +18,7 @@ RDEPENDS_${PN}_class-native = "font-util-native"
 inherit allarch
 
 PE = "1"
-PR = "${INC_PR}.3"
+PR = "r3"
 
 SRC_URI[md5sum] = "6d25f64796fef34b53b439c2e9efa562"
 SRC_URI[sha256sum] = "8b453b2aae1cfa8090009ca037037b8c5e333550651d5a158b7264ce1d472c9a"
diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
index f18c8aefc21..7ca5c76a660 100644
--- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
+++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
@@ -8,8 +8,6 @@ DEPENDS = " encodings font-alias font-util-native"
 RDEPENDS_${PN} = "encodings font-util font-alias"
 
 XORG_PN = "${BPN}"
-INC_PR = "r2"
-
 
 SRC_URI = "${XORG_MIRROR}/individual/font/${XORG_PN}-${PV}.tar.bz2"
 S = "${WORKDIR}/${XORG_PN}-${PV}"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index b4f0760176e..b3e03744c0e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -13,7 +13,6 @@ PROVIDES = "virtual/xserver-xf86"
 PROVIDES += "virtual/xserver"
 
 PE = "2"
-INC_PR = "r8"
 
 XORG_PN = "xorg-server"
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 91df9c1cd52..f560dec5899 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM ?= "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-INC_PR = "r4"
-
 # Skip processing of this recipe if it is not explicitly specified as the
 # PREFERRED_PROVIDER for virtual/kernel. This avoids network access required
 # by the use of AUTOREV SRCREVs, which are the default for this recipe.
-- 
2.25.1

