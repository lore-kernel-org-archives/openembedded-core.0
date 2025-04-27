Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99569C369DC
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 03:18:35 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.20825.1745723825980032353
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 20:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mibwrg1F;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3085f827538so4966442a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 20:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745723825; x=1746328625; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AZNhrPu/ql7VC/XdDgtKSsy0/I0x2aFYmrukg/YtJw=;
        b=mibwrg1FxSlS1vW4AUQODOWyYfK7EPbs3DWX/9iyzjZlJP/cAK9vIbH7jAsj10/E5l
         3Mfiw3GYGBBdLOzEZ5e8fu08lUynj+CAuR+hbqaL5zdbJyBuWwcUMlFYBaoBQZgh/z4C
         nHx7u/FrcoNzb/7EQCMLHfUKg5uvI1uP6wUNyfaT9xaZrkMkxqEppppVrwSi5ufgEFHS
         z1kB9pIqbgC3TjkQTZNLDRmRx3QFWGcHbHnvwd9vuqqESG5kRm18FB0esorOczFoh1u2
         7YdWa+4ILXsvjCCiD9LGqDZARF2/1N+8pqiN0KKrd2jvBDr+hCqispoLUFN3St5LLNRB
         WsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745723825; x=1746328625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AZNhrPu/ql7VC/XdDgtKSsy0/I0x2aFYmrukg/YtJw=;
        b=EwCdwp5ZumvBaGHv1ICBDn93FlAwzciQhrPDZzWBMFwJcrokWaOb5OlsFgtg5mLZCO
         Z3PGAJlh/I5MjdTC5bELMlW61pPBqSU2U2FtAwbDnaTQkNHn/mqL2dPvicsjr56Y4NYw
         Cg4AVwOb5fFk52Ybc/raBWAZ/qqUyg8Cr5MJUTzB+LdPlUnBgeGegwopQzR0K8FGSNwA
         wvM8aEePX7xxDouqVtsbWAFBtbL5ID88ICbKixbjls98Fc18uJTD1psWMRzMFUa5aI2A
         S2UogBNR43YbpB+ZQBi1I5eiKSx1XZfCejhIhwoYjhVT27lfxm5Rl1rWZXgbHInoPk9Q
         ylqQ==
X-Gm-Message-State: AOJu0YythJRgt1s05tVz/FEkPseGYYabaIKHoKY2lzWkPdKVMWZj3E2e
	AIdIS/FuP2Mw9V0YYOfDJBOFUwvoXZQ++AKbX04NCQfVLgaNq8ZpRJlMKPOU
X-Gm-Gg: ASbGncsakfy+u+/4vtBUe5aUHWjJEc2AVoroIKxqCLul80K3RODDTByHu9GuO9QoaFf
	KcbmfVcp4q9JTDD/V/HFee3KdL6qvmfm7MFYp5jBjxyvrh/ifemztnOKHmjn/rBiInks/3IkHSF
	yZc3Y3KYpYdn4xr6FlSpboivet08PKrY8Xyizes8JmOETp7KlVFEBClW8BZnY3EmioZ0o+NjL8M
	/+lO9jj4A4rGm4j/vKSVsdOaUVtuWwSKtMTIF1oPLkao83nE9WCKdURaMyUimx04Y/kw2cdPlsC
	hOrQwDfBAANzWnMhhtWQ2BDY/70xy5KO
X-Google-Smtp-Source: AGHT+IGK6Cw+lN9/aztC9bkJf9VurryKlr+Q1f6+UgAVS0h5vZHxVQ6vCEvRyrScR/csewPSiy6PBQ==
X-Received: by 2002:a17:90b:586e:b0:305:2d27:7ca7 with SMTP id 98e67ed59e1d1-30a0133b15fmr7219577a91.16.1745723825256;
        Sat, 26 Apr 2025 20:17:05 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f774e4ffsm4362452a91.12.2025.04.26.20.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 20:17:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Apr 2025 20:16:49 -0700
Subject: [PATCH v4 10/10] maintainers.inc: Add myself as maintainer for
 clang family of recipes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-clang-merge-v4-10-42d205904261@gmail.com>
References: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
In-Reply-To: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 03:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215541

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8065287c171dca14b85b2b78660a24b5994337a0..8f480c768ec1aee41c51ae86a85d4137a388a638 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -97,8 +97,14 @@ RECIPE_MAINTAINER:pn-cantarell-fonts = "Unassigned <unassigned@yoctoproject.org>
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
@@ -325,6 +331,7 @@ RECIPE_MAINTAINER:pn-libcgroup = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libcheck = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcomps = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-libcxx = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libdaemon = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdazzle = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdisplay-info = "Hiago De Franco <hiago.franco@toradex.com>"
@@ -472,7 +479,7 @@ RECIPE_MAINTAINER:pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-20.1.2 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-lrzsz = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -540,6 +547,7 @@ RECIPE_MAINTAINER:pn-musl-obstack = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-musl-utils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-nasm = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-buildtools-perl-dummy = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-nativesdk-clang-glue = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-nativesdk-icecc-toolchain = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-nativesdk-libtool = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-packagegroup-sdk-host = "Ross Burton <ross.burton@arm.com>"
@@ -559,6 +567,7 @@ RECIPE_MAINTAINER:pn-npth = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-nss-myhostname = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-numactl = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-ofono = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-openmp = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-opensbi = "Thomas Perrot <thomas.perrot@bootlin.com>"
 RECIPE_MAINTAINER:pn-openssh = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-openssl = "Unassigned <unassigned@yoctoproject.org>"

-- 
2.49.0


