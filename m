Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA45C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:41 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.14814.1639070740946371311
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 09:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BEg373fR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id d9so10956086wrw.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 09:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QosLxcDpLiH7nw/Go8BvKzr74HseeXBtmyX+dB3bfVg=;
        b=BEg373fR1k6L07R3PEJ/c4/krPd8m87cwgIDUAJj+my4eGDZ6KVEx9a8S6KxBWp6uk
         ZL766iSM2QRWVPsZs28em51YU899L5u6UjxExZfyPC1VNr/TK0q4BjUmmHggK1FGzSdu
         /heN08eUXt6t4JXCyBl+4cx1+7OC/PbWuK8vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QosLxcDpLiH7nw/Go8BvKzr74HseeXBtmyX+dB3bfVg=;
        b=vbVWpEOZUfj+wVT1H5QQv/wcOhYHsvFOqas534Vyac1+wbhujEKsC4ieRGaFDY3xuv
         5FWFpWTxUjLHBS901qsAN43+a71KKwdOM769l6rEXoWqkF08U+apCrp6L/omsSXubmns
         LR68oy4TKB9wHQKJRhk8/ClRIj0UdWJeI/QR/O8tkh5q18cas5OlgNpBF4OmGyx9Bu1W
         yv8wrVGxHoMf6Wb4CG69uyX6GtaNbSliWZIiHJYsKzfoxPfZuJHO43tJF7XC+ayBXp5F
         jQipAg0C1WcCKe9dbzhQk3/fsHKMzxUbQjzh7jtDtkGEGHxlRvd5/GCbkOTXOFsqcjp1
         gjPg==
X-Gm-Message-State: AOAM533PdLFMOHNZ10NPM0E0UV5inmw0fdYDbWa8U+h43lbquwYCnpPq
	0885ZKZvjPtgm94ShW56JDN4cDzZx1q8cg==
X-Google-Smtp-Source: 
 ABdhPJxYMFPrMUe2X9mRahZYS4WsPnKRLYMPOKDJJj3cfgyoyFyitYbLiilLWklRyFh2lUbz5Tdb+g==
X-Received: by 2002:adf:fe81:: with SMTP id l1mr8062511wrr.522.1639070739225;
        Thu, 09 Dec 2021 09:25:39 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:cb2b:2e37:1385:897e])
        by smtp.gmail.com with ESMTPSA id i7sm304146wro.58.2021.12.09.09.25.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:39 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] binutils: Drop mips default target patch
Date: Thu,  9 Dec 2021 17:25:36 +0000
Message-Id: <20211209172537.641755-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211209172537.641755-1-richard.purdie@linuxfoundation.org>
References: <20211209172537.641755-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 17:25:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159465

Similarly to the recent gcc change, we make gcc default to the 64 bit target
through configuration now so we don't need to patch this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../binutils/binutils-2.37.inc                |  1 -
 ...e-default-emulation-for-mips64-linux.patch | 57 -------------------
 2 files changed, 58 deletions(-)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.37.inc b/meta/recipes-devtools/binutils/binutils-2.37.inc
index a3e0fbc769d..8c6e659e73d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.37.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.37.inc
@@ -26,7 +26,6 @@ SRC_URI = "\
      file://0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch \
      file://0008-warn-for-uses-of-system-directories-when-cross-linki.patch \
-     file://0009-Change-default-emulation-for-mips64-linux.patch \
      file://0010-Add-support-for-Netlogic-XLP.patch \
      file://0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
      file://0013-Use-libtool-2.4.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch
deleted file mode 100644
index fab92d52e68..00000000000
--- a/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From fb6d52dda9c230baf869ed5f981581a7b5094b70 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Mar 2015 01:44:14 +0000
-Subject: [PATCH] Change default emulation for mips64*-*-linux
-
-we change the default emulations to be N64 instead of N32
-
-Upstream-Status: Inappropriate [ OE configuration Specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- bfd/config.bfd   | 8 ++++----
- ld/configure.tgt | 8 ++++----
- 2 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/bfd/config.bfd b/bfd/config.bfd
-index 30087e3b8f8..1896e11790c 100644
---- a/bfd/config.bfd
-+++ b/bfd/config.bfd
-@@ -891,12 +891,12 @@ case "${targ}" in
-     targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec mips_ecoff_be_vec mips_ecoff_le_vec"
-     ;;
-   mips64*el-*-linux*)
--    targ_defvec=mips_elf32_ntrad_le_vec
--    targ_selvecs="mips_elf32_ntrad_be_vec mips_elf32_trad_le_vec mips_elf32_trad_be_vec mips_elf64_trad_le_vec mips_elf64_trad_be_vec"
-+    targ_defvec=mips_elf64_trad_le_vec
-+    targ_selvecs="mips_elf32_ntrad_be_vec mips_elf32_ntrad_le_vec mips_elf32_trad_le_vec mips_elf32_trad_be_vec mips_elf64_trad_be_vec"
-     ;;
-   mips64*-*-linux*)
--    targ_defvec=mips_elf32_ntrad_be_vec
--    targ_selvecs="mips_elf32_ntrad_le_vec mips_elf32_trad_be_vec mips_elf32_trad_le_vec mips_elf64_trad_be_vec mips_elf64_trad_le_vec"
-+    targ_defvec=mips_elf64_trad_be_vec
-+    targ_selvecs="mips_elf32_ntrad_be_vec mips_elf32_ntrad_be_vec mips_elf32_trad_be_vec mips_elf32_trad_le_vec mips_elf64_trad_le_vec"
-     ;;
-   mips*el-*-linux*)
-     targ_defvec=mips_elf32_trad_le_vec
-diff --git a/ld/configure.tgt b/ld/configure.tgt
-index 6205d7c9872..c08533658e5 100644
---- a/ld/configure.tgt
-+++ b/ld/configure.tgt
-@@ -530,12 +530,12 @@ mips*-*-vxworks*)	targ_emul=elf32ebmipvxworks
- 			;;
- mips*-*-windiss)	targ_emul=elf32mipswindiss
- 			;;
--mips64*el-*-linux-*)	targ_emul=elf32ltsmipn32
--			targ_extra_emuls="elf32btsmipn32 elf32ltsmip elf32btsmip elf64ltsmip elf64btsmip"
-+mips64*el-*-linux-*)	targ_emul=elf64ltsmip
-+			targ_extra_emuls="elf32btsmipn32 elf32ltsmipn32 elf32ltsmip elf32btsmip elf64btsmip"
- 			targ_extra_libpath=$targ_extra_emuls
- 			;;
--mips64*-*-linux-*)	targ_emul=elf32btsmipn32
--			targ_extra_emuls="elf32ltsmipn32 elf32btsmip elf32ltsmip elf64btsmip elf64ltsmip"
-+mips64*-*-linux-*)	targ_emul=elf64btsmip
-+			targ_extra_emuls="elf32btsmipn32 elf32ltsmipn32 elf32btsmip elf32ltsmip elf64ltsmip"
- 			targ_extra_libpath=$targ_extra_emuls
- 			;;
- mips*el-*-linux-*)	targ_emul=elf32ltsmip
-- 
2.32.0


