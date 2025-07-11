Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92ABC83F22
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 06:42:45 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.7720.1752216157174191124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 23:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HrPn3xfb;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23aeac7d77aso16229735ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 23:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752216156; x=1752820956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fab4HnC4epEZKCd58vdOzY2RKKdcO+7ugvmKAoNwZf8=;
        b=HrPn3xfb05pxAr5rr5PaLANt7VbjsraOvkQA3ENJFMmLvam4P+5D1R9FZZn61REVDv
         HuyWm4cN7KSR7Pw1GtUOF1nZtukCyQxNOpRnzidsHwqkz2zEJjuKMvPkCLJeyJwVFSbJ
         dAeSDFu/JeWYRG7NMPJkVTqpCAsG/eDV8eb1O1xto2gwHxy8/bvtajpNM6nQvGPWcTkW
         HFqSVlhjwqAT1zLQPrDf4Qqvt7Oasj/HXz0hXpq6971+yi3A/RYc9fGYNPGcZVrLzUP+
         lkB/FiyjqP5uSeWIz3xr9+/SwwnloEPDpfZbX3F+aLvPy4h9UOh4yPOAhSdTloCH3Gcp
         +KxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752216156; x=1752820956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fab4HnC4epEZKCd58vdOzY2RKKdcO+7ugvmKAoNwZf8=;
        b=NLh6EvLZ2gy9lEexs2clJHo3j2PFZAR0VYn86eublzma+0p4yfXc9AhuAy+cN4kKk0
         nmPGgSQQ+oqKVDwOaIZCMclVwU9yFAzebNsXaXKEQhkwEBvbwtIqZQhDTjUFbSsOM9YU
         R5xN3Tfx0spxLksaDSkEL7udZPKtpjwRjHDJAHDfY5B2fQJGhjqeuBzD1NjHMBlhpMXl
         v9dfixvF5bn60k7Rj3X1qSCCwJeHCNdZDjmXdNaAXKhheSCZr7Nn2FATLsITpGgX65E6
         BT8l81yRvG8wjSwVhnZ2vUCvopYjXOtd30cvgiKHALE0r7ZO21CsOniyGgNKIRg+6F/K
         8Yvw==
X-Gm-Message-State: AOJu0YxWCZljPsa6RZT0BlpTaFLiIJr3pGm3YmrRh2fKk/vyWN1+NNik
	NodlqSlnCC0QRM/pNbiYh6rv4KFgYOFgA0Xcnz05ZCZh8nSokO6RDDtu5Z+N6Ion
X-Gm-Gg: ASbGncvRYj5H8dSkW0eQTSTv1+4lrRNyN5LvwQuq2hK1blhQDM4+INMaX9yCShVk4x6
	pQuy0Qe7llCpj8JUBqR6PBJYSDIWLBKLQEyDwLnGZxfFbhWDnl6zi4cG9JRn5b2Q9ArT3ObBpGt
	QGwEyhNxe06hqw8b+J7qoe0Cd73r50DOJnl4RIywuHMHKVanSvHz94A72rdQbQEyuPpQPepnLVZ
	0JF2qxNEMbLmf99DR6aAdlZdsrWpHVKXiAbg5x/UoXomYtHL6exXBzoF5Ib6XVLJDJYms0MlNMx
	BUoPJb4m8SdyJV4NxuoNCWRnMC+AEtxrKWLHOvXfLCp/TAnf9Bi3iJpQj/RksUbsNuCBZ8oIoJt
	akfTbjeP8Ilrjkg==
X-Google-Smtp-Source: AGHT+IEYUGOx0rSXCu75gSMuqqz+mFfYwLVw3CIihRmU+S//UOqfh+wxukn0aGlNUkFCBdpJU+LoSQ==
X-Received: by 2002:a17:902:ea0d:b0:223:653e:eb09 with SMTP id d9443c01a7336-23df07daed6mr17146925ad.7.1752216156117;
        Thu, 10 Jul 2025 23:42:36 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4350bb0sm44626115ad.205.2025.07.10.23.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 23:42:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] compiler-rt: Use clang for native compile as well
Date: Thu, 10 Jul 2025 23:42:32 -0700
Message-ID: <20250711064233.590809-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 06:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220135

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/compiler-rt_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index 342a7b0e95e..4da85f29378 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -35,9 +35,9 @@ DEPENDS:remove:class-native = "libcxx-native compiler-rt-native"
 UNWINDLIB:class-nativesdk = "--unwindlib=libgcc"
 COMPILER_RT:class-nativesdk = "-rtlib=libgcc"
 LIBCPLUSPLUS:class-nativesdk = "-stdlib=libstdc++"
-UNWINDLIB:class-native = ""
-COMPILER_RT:class-native = ""
-LIBCPLUSPLUS:class-native = ""
+UNWINDLIB:class-native = "--unwindlib=libgcc"
+COMPILER_RT:class-native = "-rtlib=libgcc"
+LIBCPLUSPLUS:class-native = "-stdlib=libstdc++"
 UNWINDLIB:class-target = "--unwindlib=libgcc"
 COMPILER_RT:class-target = "-rtlib=libgcc"
 LIBCPLUSPLUS:class-target = "-stdlib=libstdc++"
@@ -57,6 +57,7 @@ LDFLAGS += "${COMPILER_RT} ${UNWINDLIB}"
 CXXFLAGS += "${LIBCPLUSPLUS}"
 
 TOOLCHAIN = "clang"
+TOOLCHAIN_NATIVE = "clang"
 
 def get_compiler_rt_arch(bb, d):
     if bb.utils.contains('TUNE_FEATURES', 'armv5 thumb dsp', True, False, d):

