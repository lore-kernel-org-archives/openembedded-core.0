Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.14856.1602253168605628064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 07:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GeXNj1jn;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 7so7269379pgm.11
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 07:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=WLqJz8rfZi56+Ea5glhQ66rFnPOoA+yyYYyw6F+ObHE=;
        b=GeXNj1jnIU75ZxfrESUubwzl8jlCp1Q4e7zMif0lobFGAPvKvu+kkKS0WKhnkxyAoN
         MnCAXHkrmIvZR68wVtGCtBvQzuuuo47Sq4uQdMEaSw0Lf3ugHDSE2ccMGEx4iAEZEQJm
         y79T9GULNPDC8Kl6DPqwtt8E/BUhIhZd7iE3Oj009Zo4L3LiDd0KsWKTDm5pudVjPT6K
         B3lZ322cFvKdka477wcKjRtJwx9RCYwP7rOA0ZJDaXYbiuXKNYTSRHhUZQlEJCw81WW2
         OdZdmss96gSamZ4XP8ahpjLiN2VZNDyqyjE9y8foAzDd+BDGdWPGP4ecxqEozQmh65MP
         d6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=WLqJz8rfZi56+Ea5glhQ66rFnPOoA+yyYYyw6F+ObHE=;
        b=WUrcLcxOhxxuEaUfNJF3LfNmdgWdBpLIr+r2ku7ECJBpyLBbzKVMZu0Qswku35JE/i
         KM3o6NzGS+4acVMlEC3flYiXfgp5KjhMG936UR6kh3r/MieObheejN2ps+0MSpAPspQR
         UcV/UcMQs8eVlUPERkvnKoYCc+pk3qj0Y+w3NZfGIq/403048jpXEQb3185rTBwemIAZ
         ruEGccjrhbjQOVP8pze4MAiBhtWM4y1EutEV1niTRyzNfBvtOI34oLaKltKMI5ttdnJX
         FJcPWsvHp07Ut8nDHBuonYjog46VPOPE22sXONQGNYd1/2Cl9xKJ+PJCOvsK3eXtqbLt
         riyg==
X-Gm-Message-State: AOAM531iCKsFqJL4X5Wl1dTEz6sH+gkw62ccBTOz3AGVlNOzGFIk2dqT
	Ao7VsbRtNltQN/X0bLa/6YcyZ1gW/b7hWX4q
X-Google-Smtp-Source: ABdhPJwI/LwhbWKjNX3DEte+UEF735bAeIxGB0Tjgja4R8QQo1eyl87CW3wsUZlzFE3cwtpSJ2nUtQ==
X-Received: by 2002:a62:8389:0:b029:152:416d:f026 with SMTP id h131-20020a6283890000b0290152416df026mr12682088pfe.64.1602253167716;
        Fri, 09 Oct 2020 07:19:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n127sm10736116pfn.155.2020.10.09.07.19.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:19:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/14] linux-yocto/5.4: fix kprobes build warning
Date: Fri,  9 Oct 2020 04:18:44 -1000
Message-Id: <350e5bdf0bb79750452bb57c1aba7e0b343c2634.1602253014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602253014.git.steve@sakoman.com>
References: <cover.1602253014.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    178189d65780 kprobes: Fix compiler warning for !CONFIG_KPROBES_ON_FTRACE

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aa2b309a938f4af5f5d95bc7e7f3c0e9d77f3dd3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.4.bb |  2 +-
 .../linux/linux-yocto-tiny_5.4.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 73876bb99e..22fc6f3881 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1d9e25c4f35155580cef313ff2a76de545124a1d"
+SRCREV_machine ?= "7845a542e9defb056524ac7b362a9fd2eb3fd0c7"
 SRCREV_meta ?= "0d860e075788a92601dff3eb9b615ee41e465040"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 853fc93694..c6e5bff052 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "bb77791bc00cfa70211dd238d312b4db950c0808"
-SRCREV_machine ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
+SRCREV_machine_qemuarm ?= "c7da9d62e37698db556ccb45f20b6a7953769793"
+SRCREV_machine ?= "178189d65780e9526bcd9e47d3cd9ea6ecb8f47a"
 SRCREV_meta ?= "0d860e075788a92601dff3eb9b615ee41e465040"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 88a582dd4e..ce6188ca6a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "894e63d3256613faa39931a6ae505cfd196df067"
-SRCREV_machine_qemuarm64 ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
-SRCREV_machine_qemumips ?= "aa13fdb2c5f8c4e4e432bfee6df9c8f76ec8ac70"
-SRCREV_machine_qemuppc ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
-SRCREV_machine_qemuriscv64 ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
-SRCREV_machine_qemux86 ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
-SRCREV_machine_qemux86-64 ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
-SRCREV_machine_qemumips64 ?= "4fb21d604fc54db63221ea28ab90622c29d74202"
-SRCREV_machine ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
+SRCREV_machine_qemuarm ?= "ea89b3a28f6a28c4c158ca3d64c2df4dd68321ed"
+SRCREV_machine_qemuarm64 ?= "178189d65780e9526bcd9e47d3cd9ea6ecb8f47a"
+SRCREV_machine_qemumips ?= "d1f9cfb34040a4fc2d7a6827a27893aaa6b434e6"
+SRCREV_machine_qemuppc ?= "178189d65780e9526bcd9e47d3cd9ea6ecb8f47a"
+SRCREV_machine_qemuriscv64 ?= "178189d65780e9526bcd9e47d3cd9ea6ecb8f47a"
+SRCREV_machine_qemux86 ?= "178189d65780e9526bcd9e47d3cd9ea6ecb8f47a"
+SRCREV_machine_qemux86-64 ?= "178189d65780e9526bcd9e47d3cd9ea6ecb8f47a"
+SRCREV_machine_qemumips64 ?= "362db79de010ca86e7e75fa468083ffbd6006e54"
+SRCREV_machine ?= "178189d65780e9526bcd9e47d3cd9ea6ecb8f47a"
 SRCREV_meta ?= "0d860e075788a92601dff3eb9b615ee41e465040"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
-- 
2.17.1

