Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4404.1793244333055917575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 20:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YmUY8YHG;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91bb5795792so18879086d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 20:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793244332; x=1793849132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lf9ARqYj9sGFTpfa6snRMLYH+zjbAkzUcr9IBqmGd3Y=;
        b=YmUY8YHGF8+96zpedJUgwr+Km2Q9fdQOft9L617AiRBP+ajO+cQ1tp+S2H9amCLhhI
         0ALqUZ8ajcGW9VARz1mMkKhW+L1osyJNiC2NPpSNQLWNWGYEsBXlkLOG3jtCF0RkFYcc
         htastu6KJoNw8rqeTfHnrIRQwt/6Dtnxw17RQ3p/3EREdDuVMWRabsJh8NkVdykcM4a6
         UcCPw+/JGHmXGvLd5QXHAjIciUq8SsTg85DBHYNwa8/0pjF7fXm3ZKL0Bap4twqAhJSa
         Ep6RhZbEnLOlIANWZHuLQBJDlJ4jU0SxOsoDnRl0aVb7ES6Pp7WLqy0fLh/EXxTjjAZh
         6fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244332; x=1793849132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lf9ARqYj9sGFTpfa6snRMLYH+zjbAkzUcr9IBqmGd3Y=;
        b=K4rfJEELucrP1Bkxg5LUtVCuhkQ77Ht68wDsQmscL3dJHplfVRFqw+XOgzt1BXmQ9U
         ZrPI6uPkCDJFINK9J/mH/nmoW0vJ9KFrA8RJArSD0xG2y2F2X6w/Ol0oUocDWTbK06CB
         QNszcnH8zdPASvIRVZy+S8BzHdlHXcvyztQaEkkGn3JvDLXinft2Y0V2l5b7be9fQUR9
         FX4hMEVxUeW+9iqZ3AxYwzdspPwUnx40tzx9VUnxyEpKFeAQPzo1ot14Px38dicIDng5
         1ic85/UDaM3P2ydZNGJvdbqlGs1MAd4pFLfxgD5j2x7Xkb8ioE2bwSfeX5pd+lvQCaT0
         ADUg==
X-Gm-Message-State: AFq9FYIvprkMPsELRDaKcER5++L/OTR8IkdhW9PxQAi5lO82CfMaNo9E
	sc6zEKu/do4q5K6AKeLaD8OmUgKyds3nbW+yk8lXQsraPxPaRxNZlun4cSjxJPmG
X-Gm-Gg: AYBFou20vERNYJaPIerzp0KEZEUuswIFOX5AnGWnN1PKmI/lDR9F14fVUHVPiXfuqFF
	71ZX6NWldBu1mTt15l7gBOrZ8gTHbl2qkfSLq9fMemNIgj2+QXnneJJ9SEkZjZoGIXAT8gtqe+4
	8vDAqGZyU3K6BYJR5HnyCsKxx2YlxjJlMlOowQ4imCgMhvn27Wo5AihA6UmzIph0wuaFCIbneXZ
	snp0NPye+kCwef5X+xj7Ikk4xT2BZeUukIkgbV2bwY98Oa/rCzRhwBJoFPdnxthlVRK9ATgsvas
	4ikrrzErhFiYlLIvZ2cehE2vPjKUXKrMuvgGX3G5sc9td+mClnPDsMiyq/6wMfgVvyOcD+PPew8
	XkWtGQclXu4KWu/VoQCzFzfwZFoEhUyMh45Uyda3n2os7VlE1ak4UdRDvB6gmlL7Ek/7OH6n0MX
	kZGQXQxwVwNo7EdV/Thfw0WWnY5Yl9T7L2kAphgl6t7ftJp5JDkMp9rdOdA8PQGEQ8FL+s2Fkbx
	CImPkKjv//kkDjQCmtrbSru3u+fIQg532zeWWdfccRiY3vDtyFf/pvY5qsCeuIkxMEtouU1RoHE
	hp9QWke5RESGh1XBznkFraToOt79TpjYzfPuDXsGeUtBPPIwcVv1B/Us1Ln5t3oWCg4venzLExr
	qym3NL3jStPzO/13NfQu0sMg1XCz3Lf9c+05BQXOY7GC1TjLmXSQ95pumDLli3wsQy3pdxpUYNf
	5+N+QX1KGfDgcjaSks3puaTpgtKeqpzZwqVm3vM2jY7bV3ug==
X-Received: by 2002:ad4:5aa6:0:b0:91b:8d97:123 with SMTP id 6a1803df08f44-91c7d201fe3mr69395286d6.47.1793244331818;
        Wed, 28 Oct 2026 20:25:31 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bda586sm147529056d6.8.2026.10.28.20.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:25:30 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 01/11] linux-yocto/6.18: aufs: refresh to upstream aufs6.18
Date: Wed, 28 Oct 2026 23:25:16 -0400
Message-ID: <20261029032527.3150782-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029032527.3150782-1-bruce.ashfield@gmail.com>
References: <20261029032527.3150782-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 03:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248858
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.18:

1/2 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: aufs: update to upstream aufs6.18 (latest)
    Date: Sat, 3 Oct 2026 22:06:19 -0400

    Refresh the in-tree aufs to the current upstream aufs-standalone aufs6.18
    snapshot (f8b3fda5). Brings in accumulated upstream aufs bugfixes plus the
    x86 CONFIG_PREEMPT_RT support, superseding the standalone backport posted
    to the linux-yocto list.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: fs/aufs: route the FUSE mnt-ns check back through is_current_mnt_ns
    Date: Sat, 3 Oct 2026 23:54:11 -0400

    The aufs6.18 refresh moved fs/aufs to the native upstream snapshot, whose
    vfsub.c calls our_mnt() directly. Upstream exports our_mnt() via its own
    standalone integration patch; our integration instead exports a small
    is_current_mnt_ns() wrapper. The refresh delta reverted that carried
    adaptation, leaving the aufs module with an unexported our_mnt() reference
    that fails to link whenever aufs is compiled.

    Restore the adaptation: route the CONFIG_AUFS_BR_FUSE mnt-ns check back
    through is_current_mnt_ns(). Unlike v7.x, 6.18 does not need the
    open-coded rename-lock helpers -- lock_rename()/unlock_rename() are still
    exported in the 6.18 kernel (the unexport landed upstream in v7.1), so the
    native vfsub.c rename-locking links as-is here.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.18.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 20 +++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 5db966af1e..ac97f340da 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,8 +15,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f892d97a3d660b9e7f4dc0618e0737f6e23906a7"
-SRCREV_meta ?= "366edfd67e22da481a7e6beb6386e1f7d19e71cf"
+SRCREV_machine ?= "64ebedd888ed53620df352f568a8b55c5620d169"
+SRCREV_meta ?= "b505aeae4f62715ec4801e292b32ad68593b3341"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index ef90b3db19..4cbcfc0084 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
-SRCREV_meta ?= "366edfd67e22da481a7e6beb6386e1f7d19e71cf"
+SRCREV_machine ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
+SRCREV_meta ?= "b505aeae4f62715ec4801e292b32ad68593b3341"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 8bf35579cd..95cae43557 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,18 +17,18 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "16672075f0d625c2a7186a00a0d47b34f8ac1e36"
-SRCREV_machine:qemuarm64 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
-SRCREV_machine:qemuloongarch64 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
+SRCREV_machine:qemuarm ?= "f271f5b5cce5f2c67c00ccb5b4bf60502d4ddc0b"
+SRCREV_machine:qemuarm64 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
+SRCREV_machine:qemuloongarch64 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
-SRCREV_machine:qemuriscv64 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
-SRCREV_machine:qemuriscv32 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
-SRCREV_machine:qemux86 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
-SRCREV_machine:qemux86-64 ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
+SRCREV_machine:qemuppc ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
+SRCREV_machine:qemuriscv64 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
+SRCREV_machine:qemuriscv32 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
+SRCREV_machine:qemux86 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
+SRCREV_machine:qemux86-64 ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "8372c22a7d24c8fa15b62e13c1b5524a94caf9dc"
-SRCREV_meta ?= "366edfd67e22da481a7e6beb6386e1f7d19e71cf"
+SRCREV_machine ?= "aa6a6669031c1e6a30eaa9d8abf4d25ce447acb9"
+SRCREV_meta ?= "b505aeae4f62715ec4801e292b32ad68593b3341"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0

