Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69047D33A3E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:46:05 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.28090.1730832355910331922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XbAonhsM;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7ea68af2f62so4407114a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832355; x=1731437155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIGK07TqJ1B3hW4Ss7rZFNAW8Z49iCU0vVgpneH9XVk=;
        b=XbAonhsMfOZt849CF0tRfqDDrjhVwyrGafiYD40HgrtZJY9lPRVKfqZYAW1abECzsU
         yZVGKMBsGgNPqwfpBbL/3m70P6UF/+zLabNTuGFWwwAZ2O1XLCpN5uvDRYwBvIR/75bD
         RiuvXBkZtCJVLdIclM01aWeKPNsqyPtCtewxd4ryLOlRTVoIHzTRYG3Dkuy9zW6fmW2s
         zSERHQ68Kkihkf00LJsSwxyBhhknppurjD18aAooir1nVNAOaY7FJa7twzV86goMf/FI
         I2yQF9UXDNITq/dGmNQRUvQYf+l7xLtfdTwgfp4aCYw3dIt3efX/mmS+YwC/L+SgDZBs
         5UPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832355; x=1731437155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIGK07TqJ1B3hW4Ss7rZFNAW8Z49iCU0vVgpneH9XVk=;
        b=St0HDhqDqzyce1HfBVmRuWHEhbOpr8O9FyAsn2+DWGTOgi0Xl+PEdyk+8paWra2XSp
         e03NlL5DEC+JxuhA+T8WojTbnjsv5GDr06tiFHUURsnQfKaXIIp0JgHFNW5QzXSNWE7z
         lgp9k6HBVORoVcA1hbM2MmflT2hGY1ytrR/LX4M6iTfitmvJjlJ+rqBwYoB5Kr3jmzMD
         N2yQli+A7mTT0tNNLWla4u12gHJerqTWjI2QEvLdhEyrPDsPeGdfjWSyowBFFWtj9oKM
         XczswWvHefxoLTk3CXkHBOEksZ/3GzXES/0kZLHoDFZJ+y42DzaSgfiK336QBhe44lIP
         AINQ==
X-Gm-Message-State: AOJu0Yxu4+vPtDPhp62b4636e/+r7vFyC+/JHLKlUTadnBqJ+IsJh8D9
	zCM/9TDEfH/8VPDpZal6hVI+jHDyYO3Vv7hJTkL5mwVBWDWUMc3saDiLVg==
X-Google-Smtp-Source: AGHT+IHFvl/XrVgb+iLGYyOjbdsTRlwbJP1NcKaK10XbxfDQ4P3HfeRvx64VADmC3iYqK0qb5uy5fw==
X-Received: by 2002:a17:90b:5448:b0:2e2:e8a9:a1f with SMTP id 98e67ed59e1d1-2e94c2c30famr25244913a91.13.1730832355145;
        Tue, 05 Nov 2024 10:45:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:45:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 13/19] maintainers.inc: Add myself as maintainer for clang family of recipes
Date: Tue,  5 Nov 2024 10:45:32 -0800
Message-ID: <20241105184540.3450302-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206741

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 7aafa7a2d14..f3ae74423a1 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -96,8 +96,14 @@ RECIPE_MAINTAINER:pn-cantarell-fonts = "Alexander Kanavin <alex.kanavin@gmail.co
 RECIPE_MAINTAINER:pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-chrpath = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-clang = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-clang-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-clang-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-clang-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-cmake = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-cmake-native = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-compiler-rt = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-compiler-rt-sanitizers = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-connman = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-connman-conf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-connman-gnome = "Ross Burton <ross.burton@arm.com>"
@@ -320,8 +326,10 @@ RECIPE_MAINTAINER:pn-libcap-ng = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcap-ng-python = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcgroup = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libcheck = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-libclc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libcomps = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-libcxx = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libdaemon = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libdazzle = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libdnf = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -469,7 +477,7 @@ RECIPE_MAINTAINER:pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-19.1.3 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-lrzsz = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -537,6 +545,7 @@ RECIPE_MAINTAINER:pn-musl-obstack = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-musl-utils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-nasm = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-buildtools-perl-dummy = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-nativesdk-clang-glue = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-nativesdk-icecc-toolchain = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-nativesdk-libtool = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-packagegroup-sdk-host = "Ross Burton <ross.burton@arm.com>"
@@ -556,6 +565,7 @@ RECIPE_MAINTAINER:pn-npth = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-nss-myhostname = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-numactl = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-ofono = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-openmp = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-opensbi = "Thomas Perrot <thomas.perrot@bootlin.com>"
 RECIPE_MAINTAINER:pn-openssh = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-openssl = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -775,6 +785,7 @@ RECIPE_MAINTAINER:pn-socat = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-speex = "Michael Opdenacker <michael@opdenacker.org>"
 RECIPE_MAINTAINER:pn-speexdsp = "Michael Opdenacker <michael@opdenacker.org>"
 RECIPE_MAINTAINER:pn-spirv-headers = "Jose Quaresma <quaresma.jose@gmail.com>"
+RECIPE_MAINTAINER:pn-spirv-llvm-translator = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-spirv-tools = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER:pn-sqlite3 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-squashfs-tools = "Robert Yang <liezhi.yang@windriver.com>"

