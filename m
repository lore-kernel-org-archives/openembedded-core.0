Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web08.35901.1607958573364949896
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 07:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R07kBYmE;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id p12so7910029qvj.13
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 07:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fdR4SbxLsnSMB1L1ui/Vj5RSY4sNOfEHKwQGRl5V6W0=;
        b=R07kBYmEwrubZyQ2t03Qd++KksG4RjJ6ERDUS+MV7QeNFM6yM5ZYNiY+4AMn8oYoT/
         tQJSfA55VQXKHJWGHel2ZBl8pQfHjMaJnoHZ8qN0IoX9FfKLlQq68JQrKxINRMSp6UrM
         UVwKbOB7xYclUmVdKn2x+Kg13h2gdAjp+BWHWeMadQHhkaqnWVEz4Xz/hmFOxF2XfBB1
         VY9Xqv7+8UTOKC87q4m+ZIIcVuw18t3Mh3fQqBSz8K0nN2K+q11X60oqhDi3U3sUC+iy
         ASIKKjfEvnPBOzBftJv49oqgLfM2xet3wrc1Pzk+z3vQsgpr6taCvTtV6zYmYlGtfsAH
         X4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fdR4SbxLsnSMB1L1ui/Vj5RSY4sNOfEHKwQGRl5V6W0=;
        b=oW8sXj40UC86gl4OQvV2KcdHX/VUYsoNV6jdVlJs9czGktkEfc0C/A8Za0nYbV/32Q
         KHqaW7TnCZ9hqOxq5ck3neNVBJH73BnxAsp8VkKwyCjHyuUaRIR824yNhNxWPbk71Qlm
         k/TJNVlxXdQAiLOOntxNr+RXlFEe4g8M3pbDpoLbfR1qoHJHV2QoqNuKEMVbGHbI5V36
         azaJKoG2WsNF0fLOp7kx7U6wCvKCjp46eXXn/XWPGMdG2eUukjslJcyLYBiBqnzBfSFY
         bHr9HpLLUe3fSLIZHZv7mEfF8R+FtIZXPXcsgTbFdtrjQxmkX8/Cli2PZObxPla5+KiT
         ZY0g==
X-Gm-Message-State: AOAM532BNdXQ2sEfkswuQMabuQtVKX3WJK6CbkPy53a/mOioQ9bIM09l
	glGUs6cyVTIK+ej6FxyrVL4=
X-Google-Smtp-Source: ABdhPJzrNvPCHeGBQTsHEha7SjmrX/QuMx8wK3ael+zCXqxQ8sXhJ5d25A8hXpRaV+vZkZkegc3RZQ==
X-Received: by 2002:a0c:c3cf:: with SMTP id p15mr33454392qvi.13.1607958572271;
        Mon, 14 Dec 2020 07:09:32 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id a194sm13565070qkc.70.2020.12.14.07.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 07:09:31 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] linux-yocto/cfg: qemuppc: set CONFIG_SCSI to '=y'
Date: Mon, 14 Dec 2020 10:09:20 -0500
Message-Id: <d71383e13c7858050fd3d07a864fbe44d699c2e1.1607958349.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1607958349.git.bruce.ashfield@gmail.com>
References: <cover.1607958349.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following configuration commit(s):

    72a1fe336d7 qemuppc: configure the CONFIG_SCSI to '=y'

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index d415c3c63a..8bc93bf438 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "1ab0814d41526c27888888188d884884c8b4a52d"
-SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
+SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index 033dfc76a2..f5f7c87a31 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
+SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 33ca5856a3..3b462d5872 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "9a4d015ce467549f5f587a5001cd333ea7182aa2"
 SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
-SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
+SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 50cee07620..4afddae092 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "9509db6e3ed6a23b1f7495b53248d1cbfe22710b"
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
+SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 1a14c8bdb5..456875a7b5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
 SRCREV_machine_qemux86-64 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
 SRCREV_machine_qemumips64 ?= "f8d0d215cf1a02a1e2915b8d57fb8f9f29e5dc49"
 SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
-SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
+SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index af576891e2..3f94d22654 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_machine_qemux86-64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_machine_qemumips64 ?= "01a02b058f9a8941032b298b8d25c673526152f4"
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
+SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

