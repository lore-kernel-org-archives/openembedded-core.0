Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 53B6978825
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 16:39:05 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id s206so14218752wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 09:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=hRvDwi2ILmz09EMfKRblJre+hpzWCrtZbmrxrQ5Tveg=;
	b=qrCWkapKchpF/T17ssCmasAmdJFOCgagKrxc/COROvy6BNi//Px7aQprNGf62nQ99j
	HVf/Mv0lYCmn67qIh8+61/xrbfKAW9lxIG2rvTuJrLuMOv3xW/YUfXzxP9gEH0Au4xEy
	HaBV29XfUdsaQ9Wrwz6PnIN8+ZdeyupNzYKvjEW5ingsxgmwkhzAvjXRNpup1zuraUfB
	ghjJ+pduX3V3ZhiqDtaCe5dURTNVdZdD3gY3kNa+iGpnX5/Aaybt7H3QgZTQdmfind0a
	UlXqy5XbQbmo91jc1YFsbqs9r0cNcNA5Ak92LswCk4/y6uMn3rP+u/cqK72NaR7VTT8R
	eewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hRvDwi2ILmz09EMfKRblJre+hpzWCrtZbmrxrQ5Tveg=;
	b=INY6hbCPsK/8O14yrqS0I30/fXk4Pdf53DlauCDB99oTtTaRuOkv55ZeuZ63JiI0Cc
	327ilDUCqyxYJdUSUhh097ZxT9cQUAGW2Biqr6XUd9QyZEuz7LpQoWmnDC02Ivn4Bz+D
	GHh+wXPALkquMhEz7GdImJgjlEn7RKdlkhccwvGhKaNUwZLNXZd7towyAXOgoaiDuXuS
	QE3GZ5YpgoMZoihfmGnjKcaRbLUsaNe6u8VSqptai7UaGIJKXkOiIc46nMeI/ZJpUmXy
	DXvo+SfFDpvLTkyt7ZMXDR3oRti3p2eQ6DyHytGm9KFkSrTKYczN5ShAkCSsup93YFv0
	racg==
X-Gm-Message-State: AElRT7FsVyqrKtelp1tAlSuxfabWfh49m4zJixMvrryjXpA0WvZ+Gwr7
	PCKwK6DzmJrf1wbSNtWYnKjWGSJg
X-Google-Smtp-Source: AG47ELtyXDrJbFU5USSBhY4hG0KWP9pNUji4cHN7aRQlaJBoE/sG1fXKttEPvo9frqXIipLhxLyBYg==
X-Received: by 10.28.88.15 with SMTP id m15mr6729318wmb.0.1520872746599;
	Mon, 12 Mar 2018 09:39:06 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r6sm11064341wrg.63.2018.03.12.09.39.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Mar 2018 09:39:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2018 16:38:57 +0000
Message-Id: <20180312163858.32353-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] meta: remove some EXCLUDE_FROM_WORLD assignments
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
X-List-Received-Date: Mon, 12 Mar 2018 16:39:06 -0000

Now that we have recipe-specific-sysroots we don't need to exclude recipes from
world builds because they conflict with other recipes, as they'll all be built
with their own sysroots.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc                  | 2 --
 meta/recipes-graphics/mesa/mesa.inc                          | 3 ---
 meta/recipes-graphics/xorg-lib/libx11.inc                    | 4 ----
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 6 ------
 4 files changed, 15 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a73d9568e58..ae2a833c0cb 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -136,8 +136,6 @@ SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'bluet
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME_${PN} = "bluetooth"
 
-EXCLUDE_FROM_WORLD = "1"
-
 do_compile_ptest() {
 	oe_runmake buildtests
 }
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 88ba0050d5e..23ae651f7d1 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -99,9 +99,6 @@ FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
 CFLAGS_append_armv5 = " -DMISSING_64BIT_ATOMICS"
 
-# Multiple virtual/gl providers being built breaks staging
-EXCLUDE_FROM_WORLD = "1"
-
 # Remove the mesa dependency on mesa-dev, as mesa is empty
 RDEPENDS_${PN}-dev = ""
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index b04eafbdf2f..4af40ab8a1c 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -35,7 +35,3 @@ PACKAGES =+ "${PN}-xcb"
 FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${datadir}/X11/Xcms.txt"
 FILES_${PN}-xcb += "${libdir}/libX11-xcb.so.*"
 FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
-
-# Multiple libx11 derivatives from from this file and are selected by virtual/libx11
-# A world build should only build the correct version, not all of them.
-EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 889878ddc00..d63701e5a05 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -24,9 +24,3 @@ do_configure() {
 	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
 	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
 }
-
-
-# There is no reason to build this on its own.
-#
-EXCLUDE_FROM_WORLD = "1"
-
-- 
2.11.0


