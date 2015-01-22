Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id DBE8B72D12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 16:39:46 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id bs8so41445518wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 08:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=pF8WdppMO5phEzlEb3+mQI5ucJGv4hmqkJQlTHMi9Ns=;
	b=pHNH82b1Tcgyuclji4zcfq6QqUS6cTECsGaYpaEdLg/EWVuBeqy1pogBvVWLTvHjNQ
	o0IqCvfR9/Emz6GqPz2h3FwO+ntQLCVVFny9/6a9bhMZBAvdMqm/VXCZyQImvBSF32EZ
	aDtZ6jLRiw35O31+6V2dwOOm7Tm8CMFFlSx7ZEv1545CP1XWn5yQqBm0Q1Wtg4PjH/NI
	TaF08t1WpM7JyworPjKMqsn+8OzEk+SaF6Wf/NtZc5UD4Y4E7lC4WJz8XO9z5gG5pK+g
	30R26nIKRuN7CbF2UirD2gFdBG5o8lFhjI6yB32+Aj8yrU4BAJtYLkBCsbHANaoKuY0z
	zxNQ==
X-Received: by 10.194.203.234 with SMTP id kt10mr4962366wjc.88.1421944786733; 
	Thu, 22 Jan 2015 08:39:46 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p6sm4609409wjf.39.2015.01.22.08.39.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jan 2015 08:39:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jan 2015 17:39:45 +0100
Message-Id: <1437fcbf79c5e431329e981d1deb68de74176beb.1421944678.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1421944678.git.Martin.Jansa@gmail.com>
References: <cover.1421944678.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1421944678.git.Martin.Jansa@gmail.com>
References: <cover.1421944678.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 3/4] xorg-driver: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Thu, 22 Jan 2015 16:39:48 -0000

* it's not complete, but recipes depending on virtual/libx11 are easiest
  to spot, I've long list of PNBLACKLIST for all recipes which cannot
  be built in distro without x11 in DISTRO_FEATURES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb  | 4 ++++
 meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb | 4 ++++
 meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb       | 4 ++++
 meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb     | 4 ++++
 meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb     | 4 ++++
 meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb  | 4 ++++
 6 files changed, 24 insertions(+)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
index cd8fd63..de6a4d8 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
@@ -11,6 +11,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
 DEPENDS += "virtual/libx11 drm libpciaccess pixman"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI += "file://disable-dri2-tests.patch \
             file://compat-api-Map-changes-of-DamageUnregister-API-in-1..patch \
            "
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
index 26b68b4..20c2587 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
@@ -18,6 +18,10 @@ SRC_URI[sha256sum] = "00b781eea055582820a123c47b62411bdf6aabf4f03dc0568faec55faf
 
 DEPENDS += "virtual/libx11 drm libpciaccess pixman"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 PACKAGECONFIG ??= "sna udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri1 dri2', '', d)}"
 
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
index 454d0a1..3c92ae0 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
@@ -24,6 +24,10 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
 DEPENDS += "virtual/libx11 libdrm xf86driproto"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRCREV = "ae0394e687f1a77e966cf72f895da91840dffb8f"
 PR = "${INC_PR}.3"
 PV = "0.4.2+gitr${SRCPV}"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
index 4ad2538..eefc6e1 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
@@ -9,6 +9,10 @@ LICENSE = "MIT-X & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=63e2cbac53863f60e2f43343fb34367f"
 DEPENDS += "virtual/libx11"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRCREV = "28c006c94e57ea71df11ec4fff79d7ffcfc4860f"
 PR = "${INC_PR}.7"
 PV = "0.1.1+gitr${SRCPV}"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb
index 4052f70..cd17068 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb
@@ -13,6 +13,10 @@ PR = "${INC_PR}.0"
 
 DEPENDS += "virtual/libx11 randrproto libpciaccess"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
 RRECOMMENDS_${PN} += "xserver-xorg-module-libint10"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb
index 24041b5..619d9fe 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb
@@ -11,6 +11,10 @@ DEPENDS += "virtual/libx11 xineramaproto videoproto libpciaccess"
 SRC_URI += "file://0001-configure-fix-build-without-xatracker.patch \
             file://0002-add-option-for-vmwgfx.patch"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI[md5sum] = "91d1d7d33181766714405ab013d31244"
 SRC_URI[sha256sum] = "c8ba3d2cead3620dba2cbf5defb7f1759b2b96f4fe209f4bf6976832b6763c54"
 
-- 
2.2.1


