Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E161C48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 19:26:19 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.716.1709580371368258101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 11:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XHcKg7Zz;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: twoerner@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5a12661c8a2so400936eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 11:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709580369; x=1710185169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6yooC2A9aoaKm/vNnb0Dv/ol9rkj+8QCO9QBbNAQKFs=;
        b=XHcKg7Zz5I8y0FewHZPGsV5R5FEZCfFLRSN+mqjzQNaF6WtbCKOHmzVa2WCHPImqOs
         asA9r7i3wgT9sF+okqmx1SMhpMSm15h6BcQg/Jvxy41FBEdWwITnkLonAhm8jG0Q28rR
         oS1/9osZ+ttWUIf7G15qg0sS1EpI0Ekv4B1NSBLk6Z83ppJYPDtN2gc91cR+zhULTZ+U
         SLJOT9gg8/IhrN34snIhtTwrtROiPkoyvTjPbXN66rjtuRVmfizPRw/VWlu88KyOIRjM
         fzN1dLOCoR/OmAAl9icqektWUajGHuWblllEUudm8xu/wWF0stMFKV8vwKyJ4ygigGm5
         8UnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709580369; x=1710185169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6yooC2A9aoaKm/vNnb0Dv/ol9rkj+8QCO9QBbNAQKFs=;
        b=B0wQoP4MraQG3JBesuBd//XfwvCaxINWEO5Bu7Ba9cwOgc3Y+/OPjc56RnmpundwY+
         W+uk+AN0zBubpSLGFFO6GnjTRTsfykrL/rXvoFyzXqYS/x9Jlz5NhRikTqoZi74iYwTT
         RaULEdMwGvqOc/sfEmZ3on87CzLnYKmDmPUoJgHT9tfZrFHiCOaAgpJw6d3Y8RXKA6rJ
         yD4H/wc+N9Hes5GHhxQ/SEO0cAfb5O+ALS4s+kJml/qrzLPfjnGpw6C3UjP0SUCgxgoo
         yfc0ni4VuIw33U0DbWBizoj9I//qduISbT4ow2cuS9txjCAb9GWIoq1+HPpP/ZI9bF7M
         obsg==
X-Gm-Message-State: AOJu0Yx7tCMKTGClsHGRrWWZKKrBACI03TeQujp6Hatwj2JpTksO63/+
	2digId1mgZkaIDqCwDWseN02uN+kIjwPgAharEZyTxqxqbIJqZbiDlFeTPV3
X-Google-Smtp-Source: AGHT+IFDDBwXkOeXipXGKOnacfbehjT3F62sGRq1YkAczKcCZzssaJja9LZYKCKQkJq0mEuJg+rSTQ==
X-Received: by 2002:a05:6358:3a1a:b0:17b:5df3:98fa with SMTP id g26-20020a0563583a1a00b0017b5df398famr5758545rwe.19.1709580369364;
        Mon, 04 Mar 2024 11:26:09 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id jh19-20020a0562141fd300b0068fef023e6esm5414146qvb.88.2024.03.04.11.26.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 11:26:08 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bmaptool: now part of Yocto Project
Date: Mon,  4 Mar 2024 14:25:58 -0500
Message-ID: <20240304192558.27575-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.43.0.76.g1a87c842ece3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 19:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196617

The bmaptool (previously: bmap-tools, bmap-tool, bmaptool) has been moved
to be under the Yocto Project umbrella and is now hosted at:

	github.com/yoctoproject/bmaptool

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes-recipe/image_types.bbclass                   | 2 +-
 meta/classes-recipe/image_types_wic.bbclass               | 2 +-
 meta/conf/distro/include/maintainers.inc                  | 2 +-
 .../bmap-tools_git.bb => bmaptool/bmaptool_git.bb}        | 8 ++++----
 .../files/0001-BmapCopy.py-fix-error-message.patch        | 0
 ...0002-CLI.py-fix-block-device-udev-race-condition.patch | 0
 .../0003-BmapCopy.py-tweak-suggested-udev-rule.patch      | 0
 7 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-support/{bmap-tools/bmap-tools_git.bb => bmaptool/bmaptool_git.bb} (78%)
 rename meta/recipes-support/{bmap-tools => bmaptool}/files/0001-BmapCopy.py-fix-error-message.patch (100%)
 rename meta/recipes-support/{bmap-tools => bmaptool}/files/0002-CLI.py-fix-block-device-udev-race-condition.patch (100%)
 rename meta/recipes-support/{bmap-tools => bmaptool}/files/0003-BmapCopy.py-tweak-suggested-udev-rule.patch (100%)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 3733bdfc20c6..4ad13b43677a 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -363,7 +363,7 @@ CONVERSION_DEPENDS_zip = "zip-native"
 CONVERSION_DEPENDS_7zip = "p7zip-native"
 CONVERSION_DEPENDS_zst = "zstd-native"
 CONVERSION_DEPENDS_sum = "mtd-utils-native"
-CONVERSION_DEPENDS_bmap = "bmap-tools-native"
+CONVERSION_DEPENDS_bmap = "bmaptool-native"
 CONVERSION_DEPENDS_u-boot = "u-boot-tools-native"
 CONVERSION_DEPENDS_vmdk = "qemu-system-native"
 CONVERSION_DEPENDS_vdi = "qemu-system-native"
diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index ce7125f6f18f..cf3be909b30c 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -106,7 +106,7 @@ do_image_wic[recrdeptask] += "do_deploy"
 do_image_wic[deptask] += "do_image_complete"
 
 WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
-WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
+WKS_FILE_DEPENDS_DEFAULT += "bmaptool-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
 # Unified kernel images need objcopy
 WKS_FILE_DEPENDS_DEFAULT += "virtual/${TARGET_PREFIX}binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 7e17e9b71fa0..a3433f496cb4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -70,7 +70,7 @@ RECIPE_MAINTAINER:pn-bison = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-blktool = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-blktrace = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-bluez5 = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-bmap-tools = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-bmaptool = "Trevor Woerner <twoerner@gmail.com>"
 RECIPE_MAINTAINER:pn-boost = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-boost-build-native = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-bootchart2 = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-support/bmap-tools/bmap-tools_git.bb b/meta/recipes-support/bmaptool/bmaptool_git.bb
similarity index 78%
rename from meta/recipes-support/bmap-tools/bmap-tools_git.bb
rename to meta/recipes-support/bmaptool/bmaptool_git.bb
index ffb6ccfe99a5..87328af8c65b 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_git.bb
+++ b/meta/recipes-support/bmaptool/bmaptool_git.bb
@@ -1,16 +1,16 @@
 SUMMARY = "Tools to generate block map (AKA bmap) and flash images using bmap"
-DESCRIPTION = "Bmap-tools - tools to generate block map (AKA bmap) and flash images using \
-bmap. Bmaptool is a generic tool for creating the block map (bmap) for a file, \
+DESCRIPTION = "bmaptool - tools to generate block map (AKA bmap) and flash images using \
+bmap. bmaptool is a generic tool for creating the block map (bmap) for a file, \
 and copying files using the block map. The idea is that large file containing \
 unused blocks, like raw system image files, can be copied or flashed a lot \
 faster with bmaptool than with traditional tools like "dd" or "cp"."
-HOMEPAGE = "https://github.com/01org/bmap-tools"
+HOMEPAGE = "https://github.com/yoctoproject/bmaptool"
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
-SRC_URI = "git://github.com/intel/${BPN};branch=main;protocol=https \
+SRC_URI = "git://github.com/yoctoproject/${BPN};branch=main;protocol=https \
 	file://0001-BmapCopy.py-fix-error-message.patch \
 	file://0002-CLI.py-fix-block-device-udev-race-condition.patch \
 	file://0003-BmapCopy.py-tweak-suggested-udev-rule.patch \
diff --git a/meta/recipes-support/bmap-tools/files/0001-BmapCopy.py-fix-error-message.patch b/meta/recipes-support/bmaptool/files/0001-BmapCopy.py-fix-error-message.patch
similarity index 100%
rename from meta/recipes-support/bmap-tools/files/0001-BmapCopy.py-fix-error-message.patch
rename to meta/recipes-support/bmaptool/files/0001-BmapCopy.py-fix-error-message.patch
diff --git a/meta/recipes-support/bmap-tools/files/0002-CLI.py-fix-block-device-udev-race-condition.patch b/meta/recipes-support/bmaptool/files/0002-CLI.py-fix-block-device-udev-race-condition.patch
similarity index 100%
rename from meta/recipes-support/bmap-tools/files/0002-CLI.py-fix-block-device-udev-race-condition.patch
rename to meta/recipes-support/bmaptool/files/0002-CLI.py-fix-block-device-udev-race-condition.patch
diff --git a/meta/recipes-support/bmap-tools/files/0003-BmapCopy.py-tweak-suggested-udev-rule.patch b/meta/recipes-support/bmaptool/files/0003-BmapCopy.py-tweak-suggested-udev-rule.patch
similarity index 100%
rename from meta/recipes-support/bmap-tools/files/0003-BmapCopy.py-tweak-suggested-udev-rule.patch
rename to meta/recipes-support/bmaptool/files/0003-BmapCopy.py-tweak-suggested-udev-rule.patch
-- 
2.43.0.76.g1a87c842ece3


