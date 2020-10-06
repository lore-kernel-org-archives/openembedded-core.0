Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.1846.1602011079525191842
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 12:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bmnSWkI8;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id v123so17869877qkd.9
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 12:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uGwL5Vm8FkXl7S0ryZzjq0bwcHeKLvWI31/IoftVPig=;
        b=bmnSWkI8g012KfFqd69xS3b0MLN01rcKjTPgR+YP3keZH6dHbD+lVg04C5eZ2VT9kt
         xWCtr5Zlwc9GqFEErd6pUwiHfQQbQDzywAJqZtTxdvgsl++wSeJn/9wAsTWz5kEsYt58
         n5/SubZ+qw1UHGVWM6Ds4LTu5x4Hb7ZsYs0avlSu/c0HamYLJh9H4dMNQYB9aUGcYkV4
         JNjA1v6BokV0lp3be9PtWrSNOZS6MWg5gJiTw5o9DV8XzrrM4L3vLlKV7huH3Ib9rMN1
         AG/BWMXLy+gJ3ultaaQlUz4+yvj0H4JmNtz9lytWNO9g335sXnAaPa/Oqz46Q46eWfp7
         oK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uGwL5Vm8FkXl7S0ryZzjq0bwcHeKLvWI31/IoftVPig=;
        b=uLGoieMl91QRFqjmzhpx0TOLHwOhuyu7ksYcTuflAZuNfbiqNojeyb7hAu2FBOlHPq
         0+V4pD5fvBhcvXipMlne2WlcI9GhlQH9tD9c3A1GbSWPgQ/mu1UqQzUXn8DXN64BvGBM
         zQoUy5tFhCFIEPyACoRp/3iiwEvdUgtLTB5SGfQHU5+ms0KAvw9KfZiolqN+Gmwh2cwe
         OwytefR13VP/4ByQs2kJp5DSbCIz8Cg8ITCbFgkbeON2btAJ5K0KP3527bRqVFNcitgv
         kjcCi1NcqQg+NAyHup3fXQeOeW0Tj07SqExkBqJRlRecICmlep2n0mCV8fX4cZyKlRxO
         KqAw==
X-Gm-Message-State: AOAM531EHERVuUVnQxKLgnqZ/qtF2x0oOpfwcU8I3FYeJ+QlffNlTYku
	Ml2aXrTHaDWZ2hrhGLeD8Jg=
X-Google-Smtp-Source: ABdhPJwLHyKB0WQ7LMZtqmVkfMedoC6IdLSMjU2jboNaeHDYb9sEkCmSFidN3qDKJhJBVkdtfIGkKg==
X-Received: by 2002:ae9:e512:: with SMTP id w18mr2391814qkf.125.1602011078588;
        Tue, 06 Oct 2020 12:04:38 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id q19sm606604qtj.72.2020.10.06.12.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 12:04:37 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/5.4: fix kprobes build warning
Date: Tue,  6 Oct 2020 15:04:28 -0400
Message-Id: <f390f0180b903158f49aa9fc58e1bb71b34e8178.1602010969.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1602010968.git.bruce.ashfield@gmail.com>
References: <cover.1602010968.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    178189d65780 kprobes: Fix compiler warning for !CONFIG_KPROBES_ON_FTRACE

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.4.bb |  2 +-
 .../linux/linux-yocto-tiny_5.4.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index eded625bff..f5b61306b1 100644
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
index d06d653d71..ad963bb5d1 100644
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
2.19.1

