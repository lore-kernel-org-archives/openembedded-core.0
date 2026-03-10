Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2903FFD4F23
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:13 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2660.1773168065517441019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SjGqI6T7;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-46708149af2so1568079b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773168064; x=1773772864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZsTCBgME1PNRjxHczDMbLqJbIl+DF2WK2U4einEvRE=;
        b=SjGqI6T7ly4hHDAV16C5S0lK9xuFfxvfeSlYzXLIfi8rSFAmpU3lhfxWj4/r8XhLYT
         ZgPPMEvZG/UIOr4fumzZzmoOG5wfvEipTXn2ELbG+u7P4PVIl7/an7n0kXYzqMfXiNHF
         0iwe54AAgCOcweXEU7rTty7ra80TYMpnvqK7wm6asVnTug7b+RRx0pqxFnxFxSZriz3v
         9m8fLzx9/Kbw15nvAm9OG31dpWzJJ3VU1d1vT1PS6LE7EdHcpkQOp19RqR1zi5z+hSe5
         5NuOfRNSmzjrJ/SXFTSwdPazgjjJ9Ny76DW5577QrmJ0Ml25PRJZJuxGs6pNITWmihOU
         ynYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773168064; x=1773772864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZsTCBgME1PNRjxHczDMbLqJbIl+DF2WK2U4einEvRE=;
        b=LZHg/m7SU8Ebdn/5yRXg155h1AazTK+RXTdOxSQ+VfdP/KlJpwuNt9wlWHs2J49MFG
         2aEQP4ieVWpJqhZpLEgBxtSwOn9TqWHog3W3WgTN5aVMrQdcIYBLlBlZjKAYEA8CoM/y
         CKPznvq4RSTng6XYPhCTOOHe2rBXk8tmLQNu8T1hKmLdUhANaCLG0TuYmcWu2BIKDObq
         Z4ErFn0Pdoj2V9z7Gthv9imrhWoo36Ex4BoHgwsBYQ5kamQ1WyPgnXzFMSVnj4MI6uTW
         ZEwTbOJJSUdlcY9I8HzUkDmYvv3qiQ4JnE+nfx5LgM2p1L8rFbzUJr42xTi3tJKBFTPh
         LJOQ==
X-Gm-Message-State: AOJu0YzaSp2wcKwBGA4Vu+OaTFViLk2WExzZ8bqm7Gg/J4KvOMI/BFGn
	d6UWx/vB3amhN38ggWdx2F1OLVlHhb4EEYGUCqaVmPyKD30K9moxi2rJKtrcCg==
X-Gm-Gg: ATEYQzzce8C+k2mN2w5rwrzigcYNkSGwWkdZG2Km8TvVEgrH4L9t64ecnlmev+cCSde
	LgPM4HaNitmqQdcDiBWWEPWihsfqEWxzcMBsFX9885+qR0hkeMx4vZq83rvvGjJzmrQF3O9b8uK
	hTW02Nvh589v/V2928DDkaMwfQwbL2Pljeo0YBAl2RetlyH5Pfs9vKg3uqUI+8qT62sn1yMCAhn
	FchGRtJZOCsSMUu2m8s5Pd2Zi4J93QhLK9WIWenY2G9owXFJ1+qQXyAigni70h+CaxuvpAQ0Ntk
	xX/NKzQTOI+Vj/M/u1Ly4W6YHuVIH5Q7QXGImkBUpIS5HvUfnB+6j58wdOjLVYC9d4v4YUB5t0m
	OjUZwJKGSCh76KrBgwLSz3KCeJ9o5vhZX4a6yD/a1eGldODTzXsz51vODbz8qxXXEyE7ip8zZev
	9S2cGUpovLcj2yHPKvIOrm
X-Received: by 2002:a05:6808:c162:b0:455:d5d1:8ac0 with SMTP id 5614622812f47-466dcb76992mr8745223b6e.53.1773168064561;
        Tue, 10 Mar 2026 11:41:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::9891])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4671d2a7ebfsm2444524b6e.20.2026.03.10.11.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:41:04 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 01/15] llvm-project-source: Use allarch.bbclass
Date: Tue, 10 Mar 2026 12:38:21 -0600
Message-ID: <20260310184058.533343-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184058.533343-1-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232812

Converts the recipe to use allarch.bbclass. This is necessary because
SSTATE_PKGARCH is set to "allarch" based on if allarch is inherited or
not. If it is not, SSTATE_PKGARCH has the value "all", which means any
data written out based on it cannot be found (because "all" is not in
SSTATE_ARCHS)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/clang/llvm-project-source.inc | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/recipes-devtools/clang/llvm-project-source.inc
index 13e54efbc2..6bb595b7bc 100644
--- a/meta/recipes-devtools/clang/llvm-project-source.inc
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -5,7 +5,7 @@ deltask do_populate_sysroot
 deltask do_populate_lic
 RM_WORK_EXCLUDE += "${PN}"
 
-inherit nopackages
+inherit nopackages allarch
 
 PN = "llvm-project-source-${PV}"
 WORKDIR = "${TMPDIR}/work-shared/llvm-project-source-${PV}-${PR}"
@@ -14,14 +14,8 @@ SSTATE_SWSPEC = "sstate:llvm-project-source::${PV}:${PR}::${SSTATE_VERSION}:"
 STAMP = "${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-${PR}"
 STAMPCLEAN = "${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-*"
 
-INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
 PACKAGES = ""
-TARGET_ARCH = "allarch"
-TARGET_AS_ARCH = "none"
-TARGET_CC_ARCH = "none"
-TARGET_LD_ARCH = "none"
-TARGET_OS = "linux"
 baselib = "lib"
 PACKAGE_ARCH = "all"
 
-- 
2.53.0


