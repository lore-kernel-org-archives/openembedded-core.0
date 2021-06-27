Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web08.5551.1624803243425588358
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uKLHVQBd;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id f13so5358565qtb.6
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 07:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nP334bAvduKog1lv78OhI1rsNiix7emiJMeLCLXBKmw=;
        b=uKLHVQBdqCcKxugzT9BB8a/lvEg2VHjPjHgAtOi/uWIKKnQg8vvj92MmJHEPem9vEk
         Dr7x5eUPnBMBCIs9Q6YF3332+DJxlLZ66hLMeFnDGI1TfBtuXdmCMbWufY9GVf5U+b2D
         kIPLQvAXlI1hSMbM6/oJUfKJQAzLfpXCJCBYuJCkuP2hYtPRhlEp06aNWz/dI4VjWcHV
         gu6/6D7klTYoWRdVlDuC37/oLywzoor+RF8f1tNh8vriOgzf3uJIp/913jRi1EuthbQq
         TcmxXm6at8jO4BgtqFCUxEEYPQnn/Wg49sztBexDWSKidZbpt5BqooDwnETqptg5rUzZ
         82Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nP334bAvduKog1lv78OhI1rsNiix7emiJMeLCLXBKmw=;
        b=p/+btyT6h/GZeAfyKvljII4KtqlAs0exhbKvA3TJnc9yBRf7UkcQRuIME9E4/lgHAy
         yc+g7uX4fwDkc+JhAPZ+E0JjJQsh0dobfrcza/D4DNx8RnwtOCu4Y9D1CgBuyEehmkLW
         zelFxmc+0sf2rX43AUzgmjn1W1656g6YXHHcwusT6BnjUbSbEUoXo1QliImOt9NkHiaG
         B+YMB24iv99xy7dm8XsYEMevUm7LliOmTpJX0Cqw/BN7VLJ0GV6ntkwywew1zG/+B27x
         WSL7hVOnAGG2P2YDN3qVsAwNQU7Uw2xiy3Ztqogku9yzz1fR8uiirE9dKxIvFNIB9gqO
         tIjQ==
X-Gm-Message-State: AOAM531pltpwBLkdiqJfLANDC7pKmXNKw7myi5HNaSLMLbKf5KqObL55
	bPD/LFQGE7nL0TUHERnaMyZ/Y2we9YUeJ+5u
X-Google-Smtp-Source: ABdhPJwuW0+AZq/xC/o0dm0d1OEpwQUZlkNnYmOyql+fa4ViMbHIbva+o72Y3/p650bldoZrcyOuRw==
X-Received: by 2002:a05:622a:104b:: with SMTP id f11mr15229079qte.240.1624803242605;
        Sun, 27 Jun 2021 07:14:02 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j8sm5496142qti.20.2021.06.27.07.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 07:14:02 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/5.10: features/nft_tables: refresh config options
Date: Sun, 27 Jun 2021 10:13:56 -0400
Message-Id: <979ecd4ffc45ce48c40b7982253a36e6c76be140.1624803046.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1624803046.git.bruce.ashfield@gmail.com>
References: <cover.1624803046.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The nft tables feature had become out of sync with current config
options. Refreshing the support with the following commits:

Integrating the following commit(s) to linux-yocto/.:

    da478fab290 nft: add CONFIG_NFT_SOCKET
    54e2d36b291 nft: add CONFIG_NFT_TUNNEL
    6fefc38049a nft: add CONFIG_NFT_CONNLIMIT
    cb0b5fc7ed5 nft: enable NF_TABLES_NETDEV
    d36b304d614 nft: drop rbtree
    0a70fa87ee0 nft: merge chain nat types
    c226e82038a nft: merge route type to core
    79968ab78bb nft: masq options merged
    8a0bff8cc5f nft: _set is now built-ins
    5952a26c4f7 nft: consolidate _set options
    0941f794363 nf: META is now builtin
    2fcc2c1b552 nf: EXTHDR is part of core, drop config
    e909f08155d nf: ARP is bool, set to y
    3bc18ee0615 nf: make nf_tables =y
    b90241a5403 nf: set CONFIG_NF_TABLES_IPV6, since dependencies are =y
    32ae602ab4d nf: set CONFIG_NF_TABLES_IPV4, since dependencies are =y
    2a9be72daea nf: make inet_tables =y

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 877e8d2946..b52e06d35e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6186341e981ad4fd3941c7c9af509923bbe2a2a5"
-SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
+SRCREV_machine ?= "74f60bcd7323d243e0f3d3db34021ae624afb61a"
+SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index b44deb6f32..e6ee6e52db 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "9c63dda7dd5834bf731747d6ae03ae13d48e20e3"
-SRCREV_machine ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
+SRCREV_machine_qemuarm ?= "20eb193a68fbdaa56ed9a49b97aef6a0eb9fbdea"
+SRCREV_machine ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index f99782c1be..1e5a3df5f9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2fc3409cf8c2a6d684929576fd409949060a0bd9"
-SRCREV_machine_qemuarm64 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_machine_qemumips ?= "5cec6d1ab35feb99f023b233871cafa29e3c3682"
-SRCREV_machine_qemuppc ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_machine_qemuriscv64 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_machine_qemuriscv32 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_machine_qemux86 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_machine_qemux86-64 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_machine_qemumips64 ?= "769a7118662a2256e20df60be9c9727f9c5878b0"
-SRCREV_machine ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
+SRCREV_machine_qemuarm ?= "efa48180fd02b074a2c9e18958fc9b7e4c9f1c00"
+SRCREV_machine_qemuarm64 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_machine_qemumips ?= "aa324c158a84601d99949b7cfa5c376b9691cddc"
+SRCREV_machine_qemuppc ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_machine_qemuriscv64 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_machine_qemuriscv32 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_machine_qemux86 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_machine_qemux86-64 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_machine_qemumips64 ?= "7bc9a08bf3b92db4fdb0225fdd23836c8f5c037f"
+SRCREV_machine ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

