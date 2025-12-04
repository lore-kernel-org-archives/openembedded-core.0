Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBEBD1CDD5
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 04:30:42 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35235.1764822633273346377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 20:30:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mAE0ilaF;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b23b6d9f11so46402985a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 20:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764822632; x=1765427432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNL2l5SWRbUSd1qoiep901RVNKeQZRIT5DXSEuIYtt0=;
        b=mAE0ilaFODUNS6ZkwJ6KCAO+xkkiAsIyd2j1D+WfgLh6DI9aFUeEXvvwRKMxiAIE6Y
         2WBktapqEhEz6KmV4o4WCbpq6yu3mkf4gYqvw2WRH8hD6a3qeQi1Y1ucmOoarYxEzAjT
         RvGH5F7dbcvRufwbufU4clhmt1DKIb465ADM00Htan5df3e7eXtvW9Q0YTf5bkUA9+pe
         puZP5suNpf99H3qLpTGMh7a+LDwKzmjQIpWT44FLSaoA4YqFp90TsSv8ygmQH8SSTfd0
         47yy/vHFVawVDfwbu9H2Y8EN1H+cHU03F5H6Aoj568nrp6o/Je1VCOZlVJp+9NowV+lU
         I5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764822632; x=1765427432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RNL2l5SWRbUSd1qoiep901RVNKeQZRIT5DXSEuIYtt0=;
        b=AvmOpZYQAvIjH3f7Ezhk/NR0SdvkgzEGQiHb26bt+E08DFjCYYBcSFkCuw41G11e1M
         1tv5zIkQr//QW0KZVBHfte6ybkwMqNUWE6eveE9cTmSC1Y+CazBT5Qq3PlKaaAaJTh1M
         W55mmu37tjEIVEzGgvf6Is/n6mHDWar1ciSW7fTprJ9I2tveiThVc7kUo5thE0OrkIoy
         jsUPyOrIvOlWn5EvAnr6O2DwLCdlPsElxpSQtg7ROkmFoXpqLHa7SfxILihUXBkOoD/4
         oipEQJ+ptjqrgFweaf/v0cX+bLlJ46hiERvDX2Zlg8Cz7lnRCx34Bbslms4FmOB+8RVp
         OWpQ==
X-Gm-Message-State: AOJu0Yw2WLO1K5bGO73Q/1Ul69QPsx3iQLqTC6ZktC1E2Ti4RvySFtJH
	3bVWZY7NsB+d5J+RJOFWAJqIovtreKETc4/bX9HwH99lcCvjNlSNyWtxIBhYfcLJCN8=
X-Gm-Gg: ASbGncuM5qeCorJroriCwIPnglVWFoNXDW8rkdFC+5ZRTJp+2v2WNknoTsp5aTV70H2
	atpTngpM+UCP3i3VszPJ3JcwiEGpQxfy5thYJDnXE2wSeZ3Fia0nOUOGtGHHJLojAmUkdZ0CrjT
	e609e8x871dzEiwFEM4S6FM6dKOFOi1eMjP6wIeYAytpvdkbC6aMaYngTGveVcP7Y/h2aj20Y4X
	8elCPAaaw2dWYS+l0Q+S4owBGBgwfkyopQvwl5MxToE3VsNV6UVUNesLM85ZaaFzoQif14KJYkI
	b0ybSIMlwr1YwTROlffZw1eA429mrnpRG61acpy+x1UUrT44NCGCHrgoXV4iLwB7WhFnHPe/3ho
	Jn75PfpSxUHWFri+bxNj8bfZXJFXAYefNErVY+t6iZ26AoZ6RpCKsnFF+6ifa8RhrR401e330my
	6vh66shMPkdGBQ6yu4TJsS7uIJo1rclSCT2pGp75gY/qYGEGUZkzOb/35kuDiVPOaD8kdsupjsB
	05OFTOi01QVHOM=
X-Google-Smtp-Source: AGHT+IEN7VlKPzbR3HX7RluXuoBgDDyXQJrd2PVR60aT8T0rLTeRsRF7JGJPw1YP2jBmVPG2CpwFIA==
X-Received: by 2002:a05:620a:28c8:b0:8b1:f1e4:a3d2 with SMTP id af79cd13be357-8b5e535eed6mr683455085a.24.1764822631868;
        Wed, 03 Dec 2025 20:30:31 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f3347asm3191476d6.6.2025.12.03.20.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:30:30 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/16] linux-yocto/6.17: fix -tiny kernel boot
Date: Wed,  3 Dec 2025 23:30:13 -0500
Message-Id: <4fe98489bf6f6df3827cc523e126e7e7c7ab8c5d.1764822465.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1764822465.git.bruce.ashfield@gmail.com>
References: <cover.1764822465.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227252

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.17:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: rdinit: fix boot warning caused by warning supression
    Date: Sun, 2 Nov 2025 23:34:04 -0500

    The commit: 3b2f001e6a236 [boot: only emit rdinit warning on initramfs
    boot] was causing boot failures on configurations that use initramfs
    as it incorrectly changed the boot flow while silencing the warning
    for machines not using an initramfs.

    With this, we get the warning silenced and working initramfs boots.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.17.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.17.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.17.bb | 20 +++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
index 864ab29fcb4..883fbbea0ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a481087a5bd14195ca2f74527b3454ecf210a7ac"
-SRCREV_meta ?= "b4e4cfd96ab92d6bdf9d4498dde977aa66ee0702"
+SRCREV_machine ?= "e91a8eb1303c8fcf52e24099fb6246c538b8441a"
+SRCREV_meta ?= "17d3a09a9c0fbee9066660a8af341235f919343f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
index 2a0a651fd21..7a8888d8e52 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
-SRCREV_meta ?= "b4e4cfd96ab92d6bdf9d4498dde977aa66ee0702"
+SRCREV_machine ?= "3951620137e1a21f5038c157fb5c32ab188eecf8"
+SRCREV_meta ?= "17d3a09a9c0fbee9066660a8af341235f919343f"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
index 5d10a17e70d..ed517bce7f8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86-64 ?= "v6.17/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.17/standard/base"
 KBRANCH:qemumips64 ?= "v6.17/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "565a0d8d4266f4357e9fea437ad72699aed95606"
-SRCREV_machine:qemuarm64 ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
-SRCREV_machine:qemuloongarch64 ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
+SRCREV_machine:qemuarm ?= "11f0c9e4250581afe8f245db37694466c020bf93"
+SRCREV_machine:qemuarm64 ?= "6233877162eb4d3f8c44d86cdb35089752ec93c3"
+SRCREV_machine:qemuloongarch64 ?= "6233877162eb4d3f8c44d86cdb35089752ec93c3"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
-SRCREV_machine:qemuriscv64 ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
-SRCREV_machine:qemuriscv32 ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
-SRCREV_machine:qemux86 ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
-SRCREV_machine:qemux86-64 ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
+SRCREV_machine:qemuppc ?= "6233877162eb4d3f8c44d86cdb35089752ec93c3"
+SRCREV_machine:qemuriscv64 ?= "6233877162eb4d3f8c44d86cdb35089752ec93c3"
+SRCREV_machine:qemuriscv32 ?= "6233877162eb4d3f8c44d86cdb35089752ec93c3"
+SRCREV_machine:qemux86 ?= "6233877162eb4d3f8c44d86cdb35089752ec93c3"
+SRCREV_machine:qemux86-64 ?= "6233877162eb4d3f8c44d86cdb35089752ec93c3"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
-SRCREV_meta ?= "b4e4cfd96ab92d6bdf9d4498dde977aa66ee0702"
+SRCREV_machine ?= "6233877162eb4d3f8c44d86cdb35089752ec93c3"
+SRCREV_meta ?= "17d3a09a9c0fbee9066660a8af341235f919343f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


