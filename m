Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.37290.1597028399303966300
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 19:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=i60JSce/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id g33so4104393pgb.4
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 19:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=uwVA1n2y5SyeG5c8Xf0qhuhEAlm4vbZfbOjKNvjK9OY=;
        b=i60JSce/jjcqWNVoSoPl0/o8misrgZUsTkaRixt7/Wk036ozSeCRRNk5zom58jR/3k
         KIpAm8mzYfSeTMdqOhWZ/wjGvhOtcmhpDzHQzRer8WrP+phW0VA6HZ/YKjnbkXIUOUv8
         /TCVtoZ1u95ohj8bJv0ocQLgH7zUKoam4e9ctJQWeo7+2qlum0F3gVEJtUk6RDk+oEhl
         dANudJM8zjtve6NVR+7Di79aTSgGfmPW0Hxr330vr58bv3QHPYlacS1g/1c525ev0y9a
         DFFESmbVH2Ni3AN+W3TUZuSJ9vgmfKKTAuP2lr5ZXUMJbNqzl/9M6oldYOtdYD/kRFJ8
         HcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=uwVA1n2y5SyeG5c8Xf0qhuhEAlm4vbZfbOjKNvjK9OY=;
        b=ku/gLESKzumOls6EgZVYI9sOTKkU/5/a7sR/8nJ75VO17yobuLPbg3aZuC+2IIMf+R
         yqk0xPfVQTTld4bh7cJTBGJ51fG9m6AJ6iGGWwm44UhLxvB8+9xp51lQzY/MTXV0b8nC
         +J1FC4FHduhS0f6iyfTO5/mXZjb+ryqvRinl8paO2ltbNGzgNRHXvdzYs4Txwp4DxaZh
         osAk6QwXStxLo8TA0wk0QJfxRkPYBjw2BPq/bE6DitajQt2IDsQRbIAjSInFLxyuODdX
         dIPQngKcT4aHgG/yCKnBsCJ9N6Bjw11YhGXtuHLvn96mDmxXbWI5hjiDUPhJ9FGKl/lj
         PQDg==
X-Gm-Message-State: AOAM530+JKBNK9pjvFZm1axN63MR6GOo4wW9hBeBLV7b2urMHFWN84Xc
	qGj5iuThECqvm1MHD6m9R87fB6TjffOfcQ==
X-Google-Smtp-Source: ABdhPJzfo4KeerVE/xz5iYU4xzAx8nytG2MJC62W64qNG+xFMZABdXWGZAuXq5jdN3qja9A8n+GMDA==
X-Received: by 2002:a63:b51a:: with SMTP id y26mr1367357pge.376.1597028398323;
        Sun, 09 Aug 2020 19:59:58 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.19.59.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 19:59:57 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/19] linux-yocto/5.4: fix perf build with binutils 2.35
Date: Sun,  9 Aug 2020 16:59:13 -1000
Message-Id: <baa5713a04a6715ddbb0be5e05f371266d943169.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597028036.git.steve@sakoman.com>
References: <cover.1597028036.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    1fe4ee7f680c libtraceevent: Fix build with binutils 2.35

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 69faa62d840330f573101245e0aa3fed17984b70)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.4.bb |  2 +-
 .../linux/linux-yocto-tiny_5.4.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 1bff5f45ec..c7e468671b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8f1dfb355fc1dbbba06c5dd7d94ddb313b56b88f"
+SRCREV_machine ?= "ffd6790852ee25869539fdcabc7b89fb11743c0a"
 SRCREV_meta ?= "021a303c35cbd79f67666a8d4c4487751f96cbce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index e126968373..62e413e902 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "1930155dd075918f317d00ce6b190306ebf3a794"
-SRCREV_machine ?= "ca698a8d9c4af186ffac417a3632351bac498971"
+SRCREV_machine_qemuarm ?= "a64c0668d850dcd447004c41347497a4ff814476"
+SRCREV_machine ?= "1fe4ee7f680c3f69f620d68a5d2f7341e8db693b"
 SRCREV_meta ?= "021a303c35cbd79f67666a8d4c4487751f96cbce"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 5489e917ea..d3fb451340 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "420ba5a7bfcd58536e7df52eb434d9ffbddbcbe5"
-SRCREV_machine_qemuarm64 ?= "ca698a8d9c4af186ffac417a3632351bac498971"
-SRCREV_machine_qemumips ?= "f621e48d6e00b26d51069eeae64f2bb479afcafc"
-SRCREV_machine_qemuppc ?= "ca698a8d9c4af186ffac417a3632351bac498971"
-SRCREV_machine_qemuriscv64 ?= "ca698a8d9c4af186ffac417a3632351bac498971"
-SRCREV_machine_qemux86 ?= "ca698a8d9c4af186ffac417a3632351bac498971"
-SRCREV_machine_qemux86-64 ?= "ca698a8d9c4af186ffac417a3632351bac498971"
-SRCREV_machine_qemumips64 ?= "4bf6fb25f1d73cae1486a4782bd52082ccc6715e"
-SRCREV_machine ?= "ca698a8d9c4af186ffac417a3632351bac498971"
+SRCREV_machine_qemuarm ?= "4b2316e7867e7ebc4c5354c7f5c0076dc57b9541"
+SRCREV_machine_qemuarm64 ?= "1fe4ee7f680c3f69f620d68a5d2f7341e8db693b"
+SRCREV_machine_qemumips ?= "1b740d5443ea367eae0b2ec71eb25964c10cebec"
+SRCREV_machine_qemuppc ?= "1fe4ee7f680c3f69f620d68a5d2f7341e8db693b"
+SRCREV_machine_qemuriscv64 ?= "1fe4ee7f680c3f69f620d68a5d2f7341e8db693b"
+SRCREV_machine_qemux86 ?= "1fe4ee7f680c3f69f620d68a5d2f7341e8db693b"
+SRCREV_machine_qemux86-64 ?= "1fe4ee7f680c3f69f620d68a5d2f7341e8db693b"
+SRCREV_machine_qemumips64 ?= "21a0d1ffcc340dcfe1e94afdc36870c6824b1112"
+SRCREV_machine ?= "1fe4ee7f680c3f69f620d68a5d2f7341e8db693b"
 SRCREV_meta ?= "021a303c35cbd79f67666a8d4c4487751f96cbce"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
-- 
2.17.1

