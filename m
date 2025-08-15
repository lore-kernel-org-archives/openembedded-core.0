Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9794BCA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 16:25:16 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.15903.1755275108229079554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 09:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IT0H3nO0;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2445818eb6eso17005965ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 09:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755275107; x=1755879907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s4l8cQdOJsgwEkAKs9Zp3kd2YbpmXAVM5e1o4NRk7eE=;
        b=IT0H3nO0Q1V49pDNSIkTvjsXjtZ9xcfBjMrqry/O3FHKDgn+Lu/Lfob130lW/0xE0E
         9G1KMfijPs9x70xCDhZLBo/beOTbnwP1DTab7EnLi1BcdZbroanWVFX6HKDwfuSGU4fH
         frjcCzHTSNbvnHSBqDtNnIl5pXL0UZzA6e58C3+3F1htABxT5+p9BKzP8v4ax0ay7Mbb
         VQB/TSgtib55ove8etLeV7AZxJKenHMsG2Abhm+ZqpfJpc9fnSEp57zcv+dGZL8rqjLh
         7ULYGHyfuHqhsgQLPlNnDrG61hZcHNtqIRPhl4efWd9CNsLqxFri4yLkk1PdbqwquInq
         3naQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755275107; x=1755879907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4l8cQdOJsgwEkAKs9Zp3kd2YbpmXAVM5e1o4NRk7eE=;
        b=sE7jsNYgoskyw/pIn9/qpwn98Kczoy6MWde5/C2aMRoPNy6uXKF3tbpip7XMsLlAz4
         kIQp+7LWvDzI7mBAT5UyPLUAz+ExdvAF1NF/gAn5z7/FKVdsmZ+sIzY6Meii23vr6FO0
         JKVilJi+rj2PuvrqPmfOCVfpG5aTgdwBTi2T/1Zg6JFKXbn9hGkuu+t+Uf+ppL0p7OX3
         xb3W3Niuqfepkkl5llTRGCgaoJe5OdHganB6ppS/A92NOzYwU+MdfuCKErmebcdtFpwV
         mpCuwHIuoDlxaEMGVb1KNfiDj5uCG/JPNMoia1m0988cwaileQsxdAzRFHw0vTspKpWm
         pqdw==
X-Gm-Message-State: AOJu0YzEyEy4gLntOde/jTUnjwMeoNbsxhCFZHAV6rgFLuNEMD+cKy/F
	D1B56i8eR/aCeHfVAWWpGj8tfjBDF7qPf0lx5CWKSu2RTZySzP+BtzyOrAIUV8g9
X-Gm-Gg: ASbGncsyjyEbmAR/FRLHX9RTJXVqPXeC8wvLMz+k9LLPqPGB7nX5DX6eD5YVwAq2L/b
	WAY/9vWJIAm5jqo7XM9R9HiTkzjIBIsc0x0ZY4CipSZgGtgveJSdbEBsekTtCDMBiAppPimgxxX
	oowjOAjqXUxYTN2jM/Pd1fnBI+BjNyavOMho5/PTXe0D0NwSOFFDiCzolv6sU1/259A2roQAGDs
	1JQNIfEbSEG8DeaXH/SAjwArjYJzQJaOJ+GRwuiY+6OvAC24MajZiT14VnRgocsKI7mCOGaQ8mr
	80u72qSkZq1An80W+sdcAYKVIxONJY8DEtDoteu8jIiU+ZJbWhA3CRduH5YRIrbb24WNDgYFuAA
	d2KnInFDvf4mZP9pBxBME
X-Google-Smtp-Source: AGHT+IGMbGj1ON789eg6K/9kHfq/9fDtpzkeotDp71FJl0RxWl6QtsKRFgsC6lzmSRSNbwTdJ8HK/g==
X-Received: by 2002:a17:903:1ae6:b0:240:25f3:211b with SMTP id d9443c01a7336-2446d980b96mr39557505ad.51.1755275106595;
        Fri, 15 Aug 2025 09:25:06 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c4d57bsm1551595a91.20.2025.08.15.09.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 09:25:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] spirv-llvm-translator: Upgrade to 21.1.0
Date: Fri, 15 Aug 2025 09:25:02 -0700
Message-ID: <20250815162502.3092192-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 16:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221978

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-translator_20.1.4.bb => spirv-llvm-translator_21.1.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_20.1.4.bb => spirv-llvm-translator_21.1.0.bb} (88%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
similarity index 88%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
index 64a73ce55aa..6a6c6ac77c4 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-SRCREV = "74843f2186bb63b6802758222084da17fcbe603c"
+SRCREV = "acb023b63a4bafd53d0ba6a1a452b1f0e5671458"
 SRC_URI = " \
-    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
+    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${SPIRV_BRANCH} \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
@@ -20,6 +20,7 @@ inherit cmake pkgconfig python3native
 # Specify any options you want to pass to cmake using EXTRA_OECMAKE:
 # for CMAKE_SHARED_LIBS=OFF see https://github.com/KhronosGroup/SPIRV-LLVM-Translator/issues/1868
 EXTRA_OECMAKE = "\
+    -DBASE_LLVM_VERSION='${@oe.utils.trim_version('${PV}', 3)}' \
     -DBUILD_SHARED_LIBS=ON \
     -DCMAKE_BUILD_TYPE=Release \
     -DCMAKE_POSITION_INDEPENDENT_CODE=ON \

