Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web11.9868.1596457833552382812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 05:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sJnIlOqk;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id r19so8691833qvw.11
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 05:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=74ISw6bhJ85uN4htX4RG6tmw/Pl+kVW+NvnlB/3Z9kA=;
        b=sJnIlOqkEhkwHNW8ijdiQLftimukQ2K4ObTUBO0/ycUFYyitljGDn5lV66V+lMg2Cn
         r201C+HiUAuhBjmOa73L+BJN/VGHAH22w/7kib4EI67QxUAkLIx41LtP2Lx6dtp7TAEE
         m0TsQPqgfkvcJ0v9xfDxxrS59VMqMQhdKTWOTIOhwfqVeLFjCNWneNruk77OXeYgAUVa
         HaIa4IpreLfIaNvPUknkT82VlCRfDG26N0poOSLPrkHp//mwU382ejeoEL4URp5ZBBYb
         xvmbUfwiRpopfcnXyptBkkSRCb0epa/fB18ydGk/sjDdYPtyEVdprKPy8AO9WvRvP+8Z
         nB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=74ISw6bhJ85uN4htX4RG6tmw/Pl+kVW+NvnlB/3Z9kA=;
        b=DLlk8pG5ykLinvFwHx0GwjsepQoanesUOASdUkzwOZ5z42IRrCpl3c1iDjFpXVPSCh
         bdScVWb3MryXixZuWdCldse7reAVYDcOcELM9meiuTYCNjh4UHsan2cwKJypEBmyiwcC
         bL1AZ4iiKTb5ciJGhzhjPi/Xc5tghiHdEF6hjdlUMOAYSLfVpC0tv0IjLy7l5cTC1rjn
         jc8MQOBn21FvhgCewXqyEDcR4ErzhaoUPKpb6uEfc5gaffAYlcxM1vvULR+3FlV1xevI
         ofbHNHu3pY6QVkeWY3DTsAC44kG95u+8Gs2DNHrZy3pm3M2/obcD/VVOG2rR8BfrlteO
         IO1A==
X-Gm-Message-State: AOAM53359/E0qipIvzpUfJ8dMPL7l41PRTgOXPkLSBjXxnPeUq1zFfnW
	fRD/swM8XckNeQHlQvrtpCo=
X-Google-Smtp-Source: ABdhPJx2pFo1JBbcwOPCclySg5qYJbSPM1iD9xgWmVvzMhssN+6aplzxkeJkmAVU8SBon8IM2uVtiQ==
X-Received: by 2002:a05:6214:290:: with SMTP id l16mr12985865qvv.187.1596457832661;
        Mon, 03 Aug 2020 05:30:32 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id z14sm20184299qtn.92.2020.08.03.05.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 05:30:32 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/5.4: fix perf build with binutils 2.35
Date: Mon,  3 Aug 2020 08:30:26 -0400
Message-Id: <590db15c8ffae3ead1f481a3132e3c6fac9073f1.1596457310.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1596457310.git.bruce.ashfield@gmail.com>
References: <cover.1596457310.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    1fe4ee7f680c libtraceevent: Fix build with binutils 2.35

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
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
2.19.1

