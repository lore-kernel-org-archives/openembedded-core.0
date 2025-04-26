Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFDFC369D8
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 02:35:37 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.2772.1745634932579364004
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 19:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hNz+91BS;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223fb0f619dso33340295ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 19:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745634932; x=1746239732; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AZNhrPu/ql7VC/XdDgtKSsy0/I0x2aFYmrukg/YtJw=;
        b=hNz+91BSQzlIkZXlTUWLPXbXJ+AnPfYSaFrYOINrkq/wMs8faKrdIVljFXaPNEM7qn
         FmQYC0Ki7GbR/pj8hDk2pw5kCgH0BxmQNCjyuwldXAUK7tunAo37iiv4cQHPZIastPMx
         muVbQYrRfx8c8G2lF8WR2oJ9ctH/kpkF+C4RNKo+z3UX5/6A3uj2JypMnJ9nnGXWztcH
         ZFsl/0phTaYKc3XZWr+HKGCf3sx24pximGOiJZs914/NJzq2GQ7xn9aaAr7dsRyQqWKS
         i4uUpJpf0aGrYkX9ZUtwciqt1NupW3KlZfuIih+acxTih2JYs+AxBUhuSYIPXkHpPeVs
         MlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745634932; x=1746239732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AZNhrPu/ql7VC/XdDgtKSsy0/I0x2aFYmrukg/YtJw=;
        b=TU3UgP0HzjYEq3E+J+k1uoJIqQGcV037/nkgHSL3P+yZimNQpHLJWODxiH3uA7S5nu
         +PpkE1l/x25YfEn7QmBKsNcbK0pcVNAHVbPz1ZBosQF0/jiI/FjPNCCXoVJQA5c3vt03
         /XFZgupzUjXScDldQoH+Ki4AtxKAg6Oc109tld/k3ot4yiYB0vLEadEIfYUVOH/1Oke9
         STh9Q+kMi9JMdM2jU5Hr07Ayf+H01s7FqbdgTX9h5u+ebe7tU4m8pjBt40bfvELDg09J
         8nXqpyJP75SuPgQUN1p2/zE4QyZhJ054fsEyBrRXXHBRABGFEscmQMierVc4hLMQgCIY
         mfNg==
X-Gm-Message-State: AOJu0YzEuci61B0sRpJu4oLWPRkPunFJOghDbT30Jt1N1u5jbjMrsqZd
	ZG6MgbiTUj2TR86wctBA4/vvL8aYSU8X0Dqvo0QD8+lkF2EBmw2RC8rQ95bk
X-Gm-Gg: ASbGncsg2C4HlJN2WXC9OJi5ghViykhv75MYGrAt73RT3NYmNC61JG54QH1iDJOa158
	huuJgMKUUHV212PRVski7P9kaW/OCTjts9MZCD5ZyTX1NLkJA7GEe9ouqn3mJZAkaugtMULdHEo
	eHmBogLSab50XxvtoX+HMeEa09s7uaqwK8vpcLs71JnnGMuyWoRA7At3OVBav3YlKJcEXgZWkeD
	X5jUMhQYL+afCXgS2eheNcmuu+v/aDv6TWnsmd8kFqLfIpMamcQWL2CYHXtal6T2OVZt00NZbR9
	FvtQGJvNZB7NUnhh60bDFfXqt83/ZJq+
X-Google-Smtp-Source: AGHT+IFXv3OnkrCFQk5ynsHXDoGZDchdh7x5pbKWcQF6+POvn+eEcBaF3ztg8lQIn4iuCzRPoFw7Zw==
X-Received: by 2002:a17:902:ec8e:b0:224:1c41:a4c0 with SMTP id d9443c01a7336-22dbf5d9ecbmr60472065ad.9.1745634931816;
        Fri, 25 Apr 2025 19:35:31 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4db97b3sm40057475ad.55.2025.04.25.19.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 19:35:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Apr 2025 19:35:12 -0700
Subject: [PATCH v3 10/10] maintainers.inc: Add myself as maintainer for
 clang family of recipes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-clang-merge-v3-10-feea6f07d130@gmail.com>
References: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
In-Reply-To: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 02:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215509

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


