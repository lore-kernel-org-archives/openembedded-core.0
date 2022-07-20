Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B9CCCA489
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:15 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.51614.1658306698678729601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JzCSvxP/;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id ss3so31736568ejc.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=slzQIZh0W/RGzywOuFgzL8f1v9Rk8YUYmgSZQIpo8uc=;
        b=JzCSvxP/gTn5gos0nNE2whKN6ZhjKQfpZ4TauDr2kwS/V0LZo/m3iuRWsr/M55fN76
         Ogr3QIdr0QDEd2gLUKbiZuQrI7Gxp4h96stdUz2Oul6mK+OVtcs0ydFNa05DwqrnM25N
         3BCR8ecNXp8krpRwO6uK8VfcB1uvVOSy35R30VbKUanRPC5AzmTXQrFZfuRZntWfNONE
         Oj7uCre+/628Hi7s4g9m5EwI75j3AjmCYn7hBw1c2WkLZZJLjf6cg+nhz53Km9Pe+bDS
         KdxIlvE/UVjEtyI2VFCzfXYJ0pYdsDzmzHdiW4QKHvmHeQEberQbODaUux2XzqWP5/PX
         XRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=slzQIZh0W/RGzywOuFgzL8f1v9Rk8YUYmgSZQIpo8uc=;
        b=sDKgW4kLX+GWYHrAcTqYnnMokagFQD8ymb3Mz59WBlgb36244OSIg4NL/JAC9jKyP0
         +qqdzF3SeyoUyOKiA8S4swtrwRKRlnWse3i9BmDOVmmjlmA4TC/OxQN5dwYFg/Gejsfz
         4Vms2GX9En3t8LF40hX17N6xRqZwW0e7OTLQshbObA4Tk2MuvqchSQ6Gy8+lodVFA1r1
         jql73XvOSnNrk26yBwEPRVkomkcsqoi+ANHFRXk6BFKpEphCavirDvvkfDaxry3NFayw
         QMPIC/Lt8In1de6CGTRBXnN5hD6MLYv+ZhWCm4BIIU5snXoyNsEPyeomZg3ZJrKPdmG1
         CKvQ==
X-Gm-Message-State: AJIora+OZUQJrXTuH/1B9UYhr4HYNuWamGGoe0vOEuXci6im2LIurXrU
	lfgmBXVxT7yW9SV1ps1A+VBKPnrBe04=
X-Google-Smtp-Source: 
 AGRyM1tICZ9P8TCcBsoqTaJOFYDSNpGb3eolnmYY7M/MYb6BOW6xpZ3uOsgqkTwzVPsMAcmjKgcd4Q==
X-Received: by 2002:a17:907:75f2:b0:72b:564c:465e with SMTP id
 jz18-20020a17090775f200b0072b564c465emr33115079ejc.689.1658306707597;
        Wed, 20 Jul 2022 01:45:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/51] u-boot: update 2022.04 -> 2022.07
Date: Wed, 20 Jul 2022 10:44:09 +0200
Message-Id: <20220720084442.2940187-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168311

Native python and native swig are new requirements for scripts/dtc

License-Update: added bzip2 licensed headers:
https://source.denx.de/u-boot/u-boot/-/commit/fba0882bcdfd919727ee9ee8523ef3156daab507
(overall license still gpl2)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                    | 4 ++--
 meta/recipes-bsp/u-boot/u-boot-tools.inc                     | 5 ++++-
 .../{u-boot-tools_2022.04.bb => u-boot-tools_2022.07.bb}     | 1 +
 .../u-boot/{u-boot_2022.04.bb => u-boot_2022.07.bb}          | 0
 4 files changed, 7 insertions(+), 3 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2022.04.bb => u-boot-tools_2022.07.bb} (98%)
 rename meta/recipes-bsp/u-boot/{u-boot_2022.04.bb => u-boot_2022.07.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 8fc33608d0..d7fd3c7227 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -7,12 +7,12 @@ SECTION = "bootloaders"
 DEPENDS += "flex-native bison-native"
 
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
 PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "e4b6ebd3de982ae7185dbf689a030e73fd06e0d2"
+SRCREV = "e092e3250270a1016c877da7bdd9384f14b1321e"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/u-boot/u-boot-tools.inc
index a8d7fab46d..0bdbce725a 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
@@ -1,5 +1,8 @@
 SUMMARY = "U-Boot bootloader tools"
-DEPENDS += "gnutls openssl util-linux"
+DEPENDS += "gnutls openssl util-linux swig-native"
+
+inherit python3native
+export STAGING_INCDIR="${STAGING_INCDIR_NATIVE}"
 
 PROVIDES = "${MLPREFIX}u-boot-mkimage ${MLPREFIX}u-boot-mkenvimage"
 PROVIDES:class-native = "u-boot-mkimage-native u-boot-mkenvimage-native"
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2022.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2022.07.bb
similarity index 98%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2022.04.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2022.07.bb
index 7eaf721ca8..ef386f76e6 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2022.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2022.07.bb
@@ -1,2 +1,3 @@
 require u-boot-common.inc
 require u-boot-tools.inc
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.04.bb b/meta/recipes-bsp/u-boot/u-boot_2022.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2022.04.bb
rename to meta/recipes-bsp/u-boot/u-boot_2022.07.bb
-- 
2.30.2


