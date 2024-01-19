Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A846C47DD9
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 21:14:36 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.5988.1705698873959393391
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 13:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LdSfDaU9;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6818aa08a33so8916936d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705698873; x=1706303673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjDXpTlTtiQeKjZxnghHHrEVUcdZPAyeQjCMFLa0GvY=;
        b=LdSfDaU9k4++hbiHVW3dt+l4Vn4J/nXkrc8hG9lIYsjXQ0CkwBqgX7z3roKAl7ZQlN
         UgSsMyH9FFBSB27Cw23czr6v+gHCZLYjg7ueidQiTWkiGZFJ88xZ1sr6LZ4x8tE/+RfV
         7uri3S1tC5G2P/Fee+IPxyoA0HBJJzXENLE4rHWI9SNCBST2XdrrauOvIgOJ/l/JJWRm
         sA5UXxy/VqCNzDos14MC18BHpoMYE/yxFbESsNbJbKy1flfnnp8vlFIjheokwOo8xuR2
         MsQ7Ct/H3JlRsgprWIvziYoZ6jd7Lhw4VVv+Qs7XGDT80tnznkshE804I++yGK3i1Fup
         U02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705698873; x=1706303673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjDXpTlTtiQeKjZxnghHHrEVUcdZPAyeQjCMFLa0GvY=;
        b=CfbwwUh1knHQOznfQzsroPhmp16mXQNAlFHJIi2ruIZM66DvAzo5Q+imqo/6v+9akg
         8pn+tZv4XZTafzhXoZNJzOad0zYbwI/uA2FIgRP1iI8RKNBYGao/B75DeXMN/MsdqUg7
         rl+IlUSXOmNmMG9ztfx3Dt29K9aOdHTv1E1WUvuxJqxxcSm/B6tGAKWo0dDf4L0Yuexx
         U83k+9JLVjWtNdgLS0aDY/5dl/1vUaL4m23xk/JYbdeCT86w3DgGq05CGDEm4juAzv81
         y+CoNJ3J3ZAuznzUf2Crw8pA6yialfPIZzIg8fE1tsxoFk7RUrVgUcE3mX1LRCP/gnIx
         N74w==
X-Gm-Message-State: AOJu0Yx7Uk4H4xifG5DKZdJgOC+enp4oE0IkQaFJkEmSuGQibG19qaiE
	zbRdxyYB9r3pkhhBnSPWVlLdHQCV0tcJMENArcZtUGMaZnU0WfddWBacwckS4C8=
X-Google-Smtp-Source: AGHT+IGSULtGNfRGTflqzYLa2FhHO0793g07CRGp1UF+nAjlSBylxle2v1pkt7V74GSHmHQCap5RsA==
X-Received: by 2002:a05:6214:2582:b0:682:c9b9:7164 with SMTP id fq2-20020a056214258200b00682c9b97164mr790487qvb.35.1705698872889;
        Fri, 19 Jan 2024 13:14:32 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id mk13-20020a056214580d00b0068178f50102sm33552qvb.25.2024.01.19.13.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 13:14:32 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/11] linux-yocto/6.1: update to v6.1.73
Date: Fri, 19 Jan 2024 16:14:18 -0500
Message-Id: <d6a9d68abde532a417d3347d01c86977480f5827.1705698717.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705698717.git.bruce.ashfield@gmail.com>
References: <cover.1705698717.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 21:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194076

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.1 to the latest korg -stable release that comprises
the following commits:

    fec3b1451d5f Linux 6.1.73
    f9ee31dc7fcd cifs: fix flushing folio regression for 6.1 backport
    0f22c8a6efe6 ipv6: remove max_size check inline with ipv4
    b2c545c39877 Revert "nfsd: separate nfsd_last_thread() from nfsd_put()"
    db5f2f4db8b7 Revert "nfsd: call nfsd_last_thread() before final nfsd_put()"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 857197b211..06c07b70c8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6d67557b912380b57b6081da7ac106e9c003f4d1"
-SRCREV_meta ?= "74fa91143e9076e0d1d5ff0cca93987b3330bf27"
+SRCREV_machine ?= "6fd0860ac9846438f226257ab515bcd612fdc379"
+SRCREV_meta ?= "40dede8a165ea5894f172fede6baa0dd94d23fec"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.72"
+LINUX_VERSION ?= "6.1.73"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 55f78404b1..e391074f8b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.72"
+LINUX_VERSION ?= "6.1.73"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_meta ?= "74fa91143e9076e0d1d5ff0cca93987b3330bf27"
+SRCREV_machine ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_meta ?= "40dede8a165ea5894f172fede6baa0dd94d23fec"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index a75efe66de..f520954646 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4b6d6ef48b0d11dfdcdc9ae25e1c83be9396a116"
-SRCREV_machine:qemuarm64 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_machine:qemuloongarch64 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_machine:qemumips ?= "8a0e36da16bca1553532936c198c43362be35a82"
-SRCREV_machine:qemuppc ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_machine:qemuriscv64 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_machine:qemuriscv32 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_machine:qemux86 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_machine:qemux86-64 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_machine:qemumips64 ?= "3407157586b654c9932356124429ee9dc9f56f18"
-SRCREV_machine ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_meta ?= "74fa91143e9076e0d1d5ff0cca93987b3330bf27"
+SRCREV_machine:qemuarm ?= "45e6b64447b888e94af6fa8529cf976bf8116624"
+SRCREV_machine:qemuarm64 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_machine:qemuloongarch64 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_machine:qemumips ?= "90ea25826ce7ef511d0d93ae33c3888f3b583bf3"
+SRCREV_machine:qemuppc ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_machine:qemuriscv64 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_machine:qemuriscv32 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_machine:qemux86 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_machine:qemux86-64 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_machine:qemumips64 ?= "59248cf67c17a987f898d9d0c81292cb5fcda858"
+SRCREV_machine ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_meta ?= "40dede8a165ea5894f172fede6baa0dd94d23fec"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "7c58bfa711cb556ef1edc48e7dfa6d84e5fb8912"
+SRCREV_machine:class-devupstream ?= "fec3b1451d5febbc9e04250f879c10f8952e6bed"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.72"
+LINUX_VERSION ?= "6.1.73"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


