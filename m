Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF6BEB64DD
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 03:20:37 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.31963.1688959235291819258
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 20:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HDLZwu9R;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-635eb3a1d93so32034306d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 20:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688959234; x=1691551234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9TETVKSbKsXn+Uo2niXsVHQHf/878mpt2AmExLPr/Y=;
        b=HDLZwu9RUoNno7KF69rGzOCM9xajSctoJ3k30oIfpg8C4RpD9LSs9yLUKQegabCosi
         py4FyhMracIvg2Js/zylqMvos/vhzwy5N64X00YhSo78J74Q3HXxzY+Y5Us+b2WvZ1JQ
         bUotVn0XcSzcbtkArGasnOuYlf9uNJEjC9ddqU55CBUJ15r3Ka+e/qS4KqeSxWybR4GT
         pXDa5UFN3ktRUBC6cJa2CJtBl73Xht82nOnS/ZWJ6oWYezT+S9Ytp8W1kdpBDsUiG8QD
         Gwom5E0DG48D+Vep8tHvkJlJUFU/3CfsmDzeN14XlNmHW60wtIxjMgExx7KJoPvPzIhy
         cIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688959234; x=1691551234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9TETVKSbKsXn+Uo2niXsVHQHf/878mpt2AmExLPr/Y=;
        b=MRZBTkw5Bwm270FRiXwxUnFDUogDSKuwDh1eZ1Zpj77XdWvPQ1qQgMlZ3jVIy4qD89
         LinTZaqq9/21vl0O9Xsy7U2FEHJQWVK27nLIbNg1/MmcnxHSZDj3h+tYrTBF6hI9Clqb
         7t92PJA9YvCYfjZIbyRn3XaDBk8OcCFaQCm7FJfqCPVrtqL1A0p8svtR8iN4CejjM0Hl
         llIuzpeOlOXfvSGaJIz8GgHjEB93IFi1cZeMt/t1OM3veQrlqSqRHl7A0+k/LRgtVG6q
         E0+czSl8DnWrFkcp0u4OdJLelDTPQRlLN7ewoLm6WA+f364924o5FzW1LFJmoC5ticey
         21uw==
X-Gm-Message-State: ABy/qLZXJksMABwO05Aa8fJo/oJM/JKMyr5PSNzjlCNpRbkl24sM3oR9
	9wW36EtdJgnbnyT/5WDhQmNQci27Cbw=
X-Google-Smtp-Source: APBJJlEBdUY1monzlJ/Ml+RJGx4NXexg4HlNETpl/AxNi8dI78i3ER8W0E9snSr/7ogGi/iFphzuvA==
X-Received: by 2002:a0c:a990:0:b0:626:80f:a05e with SMTP id a16-20020a0ca990000000b00626080fa05emr9855280qvb.26.1688959234286;
        Sun, 09 Jul 2023 20:20:34 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d15-20020a0cf0cf000000b00630228acc45sm5039863qvl.145.2023.07.09.20.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 20:20:33 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/15] linux-yocto/6.4: update to latest
Date: Sun,  9 Jul 2023 23:20:18 -0400
Message-Id: <24495af250d323b3f0b36e9d316acadbbfda9b77.1688958789.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688958788.git.bruce.ashfield@gmail.com>
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 03:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184049

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.4:

    9ede8913ad6c qemux86: add configuration symbol to select values

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.4.bb               |  4 +--
 .../linux/linux-yocto-tiny_6.4.bb             |  4 +--
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 26 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 2558c03a7f..524cd95ac3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "48cdae83316b7055b4e63f3434ea26b0c04d7c71"
-SRCREV_meta ?= "f15c15c0755e36ec185927dd83a8a569186836eb"
+SRCREV_machine ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
+SRCREV_meta ?= "7468cf421d9c83d16e44c281b123433d875ff0f9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 5c8008232b..9e2a3e68f9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_meta ?= "f15c15c0755e36ec185927dd83a8a569186836eb"
+SRCREV_machine ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
+SRCREV_meta ?= "7468cf421d9c83d16e44c281b123433d875ff0f9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index e3e6e54d64..dd68c640d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "fccbb53f81908991a69214e09ae0eea360410617"
-SRCREV_machine:qemuarm64 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_machine:qemuloongarch64 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_machine:qemumips ?= "8370d3d4823bcff9532dd6bb163359f75a5416cd"
-SRCREV_machine:qemuppc ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_machine:qemuriscv64 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_machine:qemuriscv32 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_machine:qemux86 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_machine:qemux86-64 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_machine:qemumips64 ?= "efe0a0701a1a8c5b6113d6a06b65857f8c84ac9f"
-SRCREV_machine ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_meta ?= "f15c15c0755e36ec185927dd83a8a569186836eb"
+SRCREV_machine:qemuarm ?= "402087b6abe0e50ec75d0b71b4c928ee0b858b72"
+SRCREV_machine:qemuarm64 ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
+SRCREV_machine:qemuloongarch64 ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
+SRCREV_machine:qemumips ?= "b83174914441d8780f080e73d473133e2c5b797c"
+SRCREV_machine:qemuppc ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
+SRCREV_machine:qemuriscv64 ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
+SRCREV_machine:qemuriscv32 ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
+SRCREV_machine:qemux86 ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
+SRCREV_machine:qemux86-64 ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
+SRCREV_machine:qemumips64 ?= "a08de9073de96586993c5d8c1f0ebcdc35874ebf"
+SRCREV_machine ?= "9ede8913ad6c0768bde9f277c419c8728af3ed5e"
+SRCREV_meta ?= "7468cf421d9c83d16e44c281b123433d875ff0f9"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "0f4ac6b4c5f00f45b7a429c8a5b028a598c6400c"
+SRCREV_machine:class-devupstream ?= "6995e2de6891c724bfeb2db33d7b87775f913ad1"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.4/base"
 
-- 
2.34.1


