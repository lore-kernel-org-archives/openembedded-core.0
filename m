Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.4251.1612322661021110726
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 19:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Od3qkSi0;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id k193so22101958qke.6
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 19:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rZKarEJxsvnZeGCehAxIpkV7BOUX8OB/DB2WDTqOdDU=;
        b=Od3qkSi09lnPOw1SmGbd6mIzaYUFzb5ute5feOaAx0WIQ/h6meODfmpMYKFWUr9W5p
         kyoliE7gsizDFQcq6tnYWYXryG5PJ7H150knsCq9NUlqW0joiFDP3/kYXK0sEX88pcvQ
         of+zghq3vbHl0Xiyh9mVP4YvWJsTLPhP3OKVZLDL3yWFpnamk6XGRPUswb5SXJYPQfZ4
         GYJl54kfCBcK60ozJ2+y57l1ACYOXOOeVZTr2666fmBxiZT+RriWghcKq5ymMpLW9puq
         U0p0hBV7rigUBm8pEuN0I7TOWE0IMdU9q/EBweOLt/ogyrHZZjgk5toKvQFGOriIDZBk
         xOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rZKarEJxsvnZeGCehAxIpkV7BOUX8OB/DB2WDTqOdDU=;
        b=rwgcEE0MAUPsNePRfwW5kLcylOjl/ecCnOnu1bUA4EGQrKGILQ2rkJgQYay3mgN9DG
         S8bMBhwdzs3xJMLotAgjms4na7Qu5hj32E2eKRG7ahEMuWSUw1OON2KNMY+2d5ex9Q8a
         JC8IjGqb6phHxuszdW4XD9abbhcXsbGNrtLvvela9eBK3vZI2U3i3wW6dHrSI0xAW0i4
         CiLCCuTok4ioWirzaTpXdEUSNeni8owwNdn0dyqGfb3JCZY+513jgXReCgBX5HIrBvhv
         tRHt9bs/eDCYJgvspf7aQbkLOysGyjQmuqylIGwuOo1ZE5z5c82ziHgCQXGiMQUHHRS7
         fxkw==
X-Gm-Message-State: AOAM532HKfxIJJ4X5kEXXIjyGqA8I1Kp7tBOl2Uf4IGOMDfPsUoiRuNW
	K9facVKkzIm1kFja/wdMTXTQhfoN2JY6Hg==
X-Google-Smtp-Source: ABdhPJw8aJTOJpAT3XICrMG45LJsEbBZ7k6gLIuSeqmLNdDsMPryrioc4727U6FkgUr96gDGbOMFnw==
X-Received: by 2002:a05:620a:56b:: with SMTP id p11mr870625qkp.324.1612322660197;
        Tue, 02 Feb 2021 19:24:20 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id v12sm721821qkg.63.2021.02.02.19.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 19:24:19 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] linux-yocto/5.10: binutils 2.36 fixues
Date: Tue,  2 Feb 2021 22:24:06 -0500
Message-Id: <9da75cbd42a281f7c06bda22c3765966fe9a9ca3.1612322536.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1612322536.git.bruce.ashfield@gmail.com>
References: <cover.1612322536.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    cdca78778415 objtool: Fix seg fault with Clang non-section symbols
    d3287798bd88 x86/entry: Emit a symbol for register restoring thunk

With these, build issues with binutils 2.36 are resolved

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb               |  2 +-
 .../linux/linux-yocto-tiny_5.10.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb  | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 2c8cbeef87..1f1745c636 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d77b720057d0d014fcbf41746377fd3ce44f487b"
+SRCREV_machine ?= "1033d642fd93675a91beae3c594d1e1078191ece"
 SRCREV_meta ?= "5833ca701711d487c9094bd1efc671e8ef7d001e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 9fef2a8bdc..9c0ac98a94 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ca3786c50e12f8ef14c41ea956ff1dbd66297a55"
-SRCREV_machine ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
+SRCREV_machine_qemuarm ?= "acfa890cd51fe66cdcee10c0eb031a07da423a3c"
+SRCREV_machine ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
 SRCREV_meta ?= "5833ca701711d487c9094bd1efc671e8ef7d001e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 72d811b3d6..b56dadea69 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4fe9a8ec66463c630ae10795450e48198eea6bc6"
-SRCREV_machine_qemuarm64 ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
-SRCREV_machine_qemumips ?= "80096aba0f08a7501b16d923190b87cf3addea05"
-SRCREV_machine_qemuppc ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
-SRCREV_machine_qemuriscv64 ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
-SRCREV_machine_qemux86 ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
-SRCREV_machine_qemux86-64 ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
-SRCREV_machine_qemumips64 ?= "c8a4e780d5f2dc7ebfb01ab78601ef7e23fb4fe9"
-SRCREV_machine ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
+SRCREV_machine_qemuarm ?= "3ea1273f3112f558eb8176bfc67b8dd65a3b16ac"
+SRCREV_machine_qemuarm64 ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
+SRCREV_machine_qemumips ?= "9685593f232f431e8fc3a756d4fcb50ee3c6dea1"
+SRCREV_machine_qemuppc ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
+SRCREV_machine_qemuriscv64 ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
+SRCREV_machine_qemux86 ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
+SRCREV_machine_qemux86-64 ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
+SRCREV_machine_qemumips64 ?= "3bf957724edd501fbb634e271224b49aaf186bba"
+SRCREV_machine ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
 SRCREV_meta ?= "5833ca701711d487c9094bd1efc671e8ef7d001e"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
-- 
2.19.1

