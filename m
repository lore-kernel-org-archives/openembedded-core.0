Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054A0CCD19E
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:14:45 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.4619.1760584478971934981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=grwLg4bd;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-88f79ae58d9so38348885a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584477; x=1761189277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHGBRzsUe0jWKURJUP3oETRk3rzdxuySAh2qgj2Wp38=;
        b=grwLg4bdbcQ82yQQQgjXnt7EeOqNv3EP96tf4BZ1UAaJgzGccBWmxgCalOa2Qj0Lxx
         4Yz+TPQzFTmEDcwFoRU2Xr463ZVBEjU7yNhLvwyYp7Bf6h8hwoJoq1UD+pZU9krVZM8b
         ttPW01mSru7Zm2p6X2ug97Kq3jE6yYMdgiNc6t9j2caJUf1NFUXZZCbAzu3XpLh/qlV8
         rjIChi1fksrAMIfxKa5l9CqIv+tnrmvxD71uiVuI7eE1U3FSeRkcNRUPalaNnFkOhot+
         PypU4Ojb6FgzA3cDhvaQR4FaO/fNNOfcrRwknIMmBWv9gkUaDNxd9AZUs5gOoWVvuWnp
         vUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584477; x=1761189277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHGBRzsUe0jWKURJUP3oETRk3rzdxuySAh2qgj2Wp38=;
        b=qU6AoQI9X/vZS1YkU71O44nVU90njwxW5RG1+9lMZ3Zdalk7t0m2dxHX1szMY5jZAE
         TFczwvenQkVdMGCrq+ZHQHdCU+s68AScjjPL3lRQMugeqPgiGsk79CsuwgjhXNzVqXeH
         F8arV+siRqKXPh7LLGd6K10yvguuNPzJ5+0xZZWMCcCDjFkOGOousHb72jxR89WReVHp
         PErYxE7Pkb9CrhkUeIBOesmCzAZnuu/yvdDdwBEaKVqnP/fogRS1Wo7BnqYwl34tbZnz
         VL3B5QlSDRRTwSXPWE7pNnTWTW2Y/RNWuDtlTiMyZ+H7W6emo4xDBTBq6MleuaG3m/eG
         Z0nw==
X-Gm-Message-State: AOJu0YzsFlwW8xBW6HIPDRhr+W/H4XFYaz0KX1bTH6vP/Rz0RCbjV9MX
	y6SismZVeTjpLo6DyO6IinAc0uP4faT83n+TDA+rf8CLMo/AbxfnzqzRlOWI+2h4bVw=
X-Gm-Gg: ASbGnctqcXuXaQWOKDE9Gt5hHTT6jpRr7gSTFWdX7MxGz3HuzLW6wbN4vQIgSTtbkdL
	ZbOLy0pxwv+xxKGI5BwQO1Mw76Wl79xVisEH/MCSnSyRU6roMUV8yozossGYMHWWjBjKtcv/Sfa
	zeX/V4OXfPyc8n9NYGpnQ/eiWnn4NH0FXFXoq5Wv8t82QvPN+XW+nVRX2edHTkWya13zVvXb8Lw
	+H8d0ckxb2X1XAxs7bRYy5qNoYXs2oLydceWpVXFz61QzgHg/iS4+jwdIjczt2687FrDW7OT1yt
	33zD949jrzPvsN250OBOO+R5+OgE/vPeqxuz4aEC+IKaw12nqPzWyIrGJ1P7/LENCUMkrGqCjOS
	Gn8AsN/pR2WREHOJRVE2bwp9gXboXPvtSx7nAkP85iV6z4xAm/ixRPLCb/xR+qiP+RD9fHyFZSv
	AYA5O/hi1eNOHualwMKq9oO7hiE0PohyLznq7unruBiOzcOjIl7m09b4Cr5NX7RGn/FuW6OXfw1
	NdD
X-Google-Smtp-Source: AGHT+IHeWZ9Q0sqt8bCdCMR3HCFq1KRElXpnrW9H5ZkuqjOkRo9j+gy0GsA+naDe18HDH/IgjByPvA==
X-Received: by 2002:a05:620a:1a83:b0:861:5b8c:3c14 with SMTP id af79cd13be357-883535590b2mr3698998085a.46.1760584477073;
        Wed, 15 Oct 2025 20:14:37 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f37f45149sm109327085a.32.2025.10.15.20.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:14:36 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [OE-core][scarthgap 11/12] linux-yocto/6.6: update to v6.6.110
Date: Wed, 15 Oct 2025 23:14:20 -0400
Message-Id: <20251016031421.3207596-11-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251016031421.3207596-1-bruce.ashfield@gmail.com>
References: <20251016031421.3207596-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224937

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    e617101e5626 Linux 6.6.110
    70e1e5fe9f7e ASoC: qcom: audioreach: fix potential null pointer dereference
    f617d515d66c media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENTITY_ID
    71da40648741 media: rc: fix races with imon_disconnect()
    bb10a9ddc8d6 media: b2c2: Fix use-after-free causing by irq_check_work in flexcop_pci_remove
    f03aa5e39da7 scsi: target: target_core_configfs: Add length check to avoid buffer overflow
    e28d05370969 gcc-plugins: Remove TODO_verify_il for GCC >= 16
    5d646a763232 crypto: sha256 - fix crash at kexec

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index c701c29ae1..7652e03569 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3162ade8ac9717b63836229e42b2a9ab9f58201e"
-SRCREV_meta ?= "aef3b17fc578bf09fc3b27e4eb45a7ce7a1b39d8"
+SRCREV_machine ?= "07bc1b79b450a91fa9ed645a4c6c77332f6c7fd3"
+SRCREV_meta ?= "46ee47b6ee7ce2b3cef51844d7a7e82c6c2daf5d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.109"
+LINUX_VERSION ?= "6.6.110"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 1f9d249a3b..33eafc2f6d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.109"
+LINUX_VERSION ?= "6.6.110"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b481c2fca6f1528d9bfe55daffb89d380e941335"
-SRCREV_meta ?= "aef3b17fc578bf09fc3b27e4eb45a7ce7a1b39d8"
+SRCREV_machine ?= "0381ada6e1fee2c488a718f82ed83f0435a950c2"
+SRCREV_meta ?= "46ee47b6ee7ce2b3cef51844d7a7e82c6c2daf5d"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 1660e065f3..c75094dc59 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d51aeddc46e2565930c596b0dd68b510c4ae56b9"
-SRCREV_machine:qemuarm64 ?= "b551efd543db7dff08c01c87822fa9c02c03c9eb"
-SRCREV_machine:qemuloongarch64 ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
-SRCREV_machine:qemumips ?= "7c4a971ad6360845687a90f1d07e22f4f1b8c3c9"
-SRCREV_machine:qemuppc ?= "61f111b7d27c1153f299945a00cf263f4e289706"
-SRCREV_machine:qemuriscv64 ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
-SRCREV_machine:qemuriscv32 ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
-SRCREV_machine:qemux86 ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
-SRCREV_machine:qemux86-64 ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
-SRCREV_machine:qemumips64 ?= "2cbe3d7e9f728945185446f19b06aa785ec0d2ff"
-SRCREV_machine ?= "b6cb3303de9f505773ec65defd0437d2d13d270f"
-SRCREV_meta ?= "aef3b17fc578bf09fc3b27e4eb45a7ce7a1b39d8"
+SRCREV_machine:qemuarm ?= "2a0fa5ba202ff49a42a8f1c5e36ed1a2d7dc9b91"
+SRCREV_machine:qemuarm64 ?= "0974351ebdd700bc59eb25d7144e96c34cc28751"
+SRCREV_machine:qemuloongarch64 ?= "272bf113897632849f52e9dfc1bb990daa566375"
+SRCREV_machine:qemumips ?= "4b003154faca105c81dcfaebfe4e753b378eddde"
+SRCREV_machine:qemuppc ?= "b1416ec0248422122027ab9cee287d7c86e5cf77"
+SRCREV_machine:qemuriscv64 ?= "272bf113897632849f52e9dfc1bb990daa566375"
+SRCREV_machine:qemuriscv32 ?= "272bf113897632849f52e9dfc1bb990daa566375"
+SRCREV_machine:qemux86 ?= "272bf113897632849f52e9dfc1bb990daa566375"
+SRCREV_machine:qemux86-64 ?= "272bf113897632849f52e9dfc1bb990daa566375"
+SRCREV_machine:qemumips64 ?= "4b0c928fbc6df11ad63d99b006a8448597ccdd7d"
+SRCREV_machine ?= "272bf113897632849f52e9dfc1bb990daa566375"
+SRCREV_meta ?= "46ee47b6ee7ce2b3cef51844d7a7e82c6c2daf5d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "f34f16e5c63232cfd9bfeb722e0878e209caa9ce"
+SRCREV_machine:class-devupstream ?= "e617101e562654c7d59ed5cfcd30f610f1f64411"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.109"
+LINUX_VERSION ?= "6.6.110"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


