Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04341C25B7E
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 18:12:26 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.3631.1716833540624264003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 11:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K+t5Ax/d;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6269ad71b6so4811766b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 11:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716833539; x=1717438339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJRQZEw+6Prkl58+7Q/yAA91t2uCYlIvw9cKTAsNyXA=;
        b=K+t5Ax/dT/Hnmj1NbK/nOSVaEdm6ocy1n6FtRSmzfp2IOC+rAjZxNCCEOnZjLeTBOc
         wqPQoiwmNtOWa9Bocg8hMKmgRYtgIwQRvt1/01F6YtakbsjWANCz3SgYOF9gML1Y9z2S
         C0L4vUNStnsXESxdZFCGSAC5AR2BB3DKf6K+A3rsrWS29Nl5b5SiiwLTWSMWBk1eTS/J
         P6RxQ8nfyaVZUzbQtnG1OZQN7H6ZZt3oRPaLEQT360pM++3yr2baaYM0AnREp6JGCGjk
         Wnt7+k7nViVKWCRwRKkRh+3JiCbS8+nUyBz/pOza7gqFiQEjMrjoZ1ro/jYnwRV7SzrC
         Vuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716833539; x=1717438339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJRQZEw+6Prkl58+7Q/yAA91t2uCYlIvw9cKTAsNyXA=;
        b=pifpdd6pQ/kCffXYcJ2tXsQSw8PeM7Jl0dVEzFnZpvH05/RFskZKAjXPJT7iCh0mQG
         JwPK/c/kc8qOosyEh+6SedWzbvayQYPw4c/OWrGoU/ABDiNAgLNmqyQ9EFQbZjuX8CzP
         aSnzHNbbwv7ylWpnLBfXMo/2rihNTSdu8rLRHULhXZtHYxPKqp/ZGWUD8hhUvryYdSk4
         mi+5AaQ3G/jwefd3IsqqRpuqZ5JWgtnI6JykRpCPeySd2+TDGa1JJvV7DOAG6extxQt+
         0WMiRsM5BIMeCWHve/CA4X8uEdvVzZHsJgPbHyw07YN9wARG56l07zEm9WhXHovRfKIA
         3l1g==
X-Gm-Message-State: AOJu0YxF9633A3mZW4iReATv3Fr3O0NQ4mqF4Wzz1+m6ybeQ6zOg/iv2
	dLYjggXoq7iZHQ3XbD38HADZIWqrpcSNEeu7H6ULtdfJqktq5bHGrk+hHw==
X-Google-Smtp-Source: AGHT+IFNtchGVqEOxKVROQC2m89idwmXFXLKtiZbc2tNhA1hXJJypLBzanEvN+ZHsM1TvHWEejcu/Q==
X-Received: by 2002:a17:907:a19f:b0:a5c:dcd4:351b with SMTP id a640c23a62f3a-a626511457dmr618862266b.58.1716833538761;
        Mon, 27 May 2024 11:12:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc50064sm510272466b.107.2024.05.27.11.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 11:12:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/13] boost: update 1.84.0 -> 1.85.0
Date: Mon, 27 May 2024 20:12:02 +0200
Message-Id: <20240527181214.1778037-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 18:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199918

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../boost/{boost-1.84.0.inc => boost-1.85.0.inc}          | 2 +-
 ...uild-native_1.84.0.bb => boost-build-native_1.85.0.bb} | 2 +-
 ...t-set-up-arch-instruction-set-flags-we-do-that-o.patch | 6 +++---
 .../boost/0001-dont-setup-compiler-flags-m32-m64.patch    | 4 ++--
 .../boost/boost/boost-math-disable-pch-for-gcc.patch      | 8 ++++----
 .../boost/{boost_1.84.0.bb => boost_1.85.0.bb}            | 0
 6 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-support/boost/{boost-1.84.0.inc => boost-1.85.0.inc} (90%)
 rename meta/recipes-support/boost/{boost-build-native_1.84.0.bb => boost-build-native_1.85.0.bb} (92%)
 rename meta/recipes-support/boost/{boost_1.84.0.bb => boost_1.85.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-1.84.0.inc b/meta/recipes-support/boost/boost-1.85.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.84.0.inc
rename to meta/recipes-support/boost/boost-1.85.0.inc
index 5bbea2ba5bc..c2380bba6ec 100644
--- a/meta/recipes-support/boost/boost-1.84.0.inc
+++ b/meta/recipes-support/boost/boost-1.85.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "cc4b893acf645c9d4b698e9a0f08ca8846aa5d6c68275c14c3e7949c24109454"
+SRC_URI[sha256sum] = "7009fe1faa1697476bdc7027703a2badb84e849b7b0baad5086b087b971f8617"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost-build-native_1.84.0.bb b/meta/recipes-support/boost/boost-build-native_1.85.0.bb
similarity index 92%
rename from meta/recipes-support/boost/boost-build-native_1.84.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.85.0.bb
index a345bac4999..b333c7c81a3 100644
--- a/meta/recipes-support/boost/boost-build-native_1.84.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.85.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master"
-SRCREV = "8d86b9a85407d73d6e8c631771f18c2a237d2d71"
+SRCREV = "b0311a0d4f3bb0f93d06d3c6faca510c7f5a2012"
 PE = "1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"
diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index 9ba5d5cc334..fffc675b08b 100644
--- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -1,4 +1,4 @@
-From 18185e939ca121335a6172c8e50872af8122a759 Mon Sep 17 00:00:00 2001
+From 0130a1c0d8ba3c0d59258cb79e8b4a04fe6d8eec Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 18 Dec 2018 15:42:57 +0100
 Subject: [PATCH] Don't set up arch/instruction-set flags, we do that
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 153 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index 834f5e1bf..493a43e6d 100644
+index e5f8f53a4..0186545e8 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -1113,156 +1113,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
+@@ -1111,156 +1111,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
          <architecture>$(architecture)/<instruction-set>$(instruction-set)
          : $(values) ;
  }
diff --git a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
index 913810a3400..1b01a04c6d9 100644
--- a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
+++ b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
@@ -1,4 +1,4 @@
-From bbb0845c0a79238fb2e84cca41826a0944b6ce7e Mon Sep 17 00:00:00 2001
+From 9c3d6fa3544ca7bd6d8c4f4edbb62282cbc35861 Mon Sep 17 00:00:00 2001
 From: Anuj Mittal <anuj.mittal@intel.com>
 Date: Thu, 14 Nov 2019 10:13:53 +0800
 Subject: [PATCH] dont setup compiler flags -m32/-m64
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 14 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index 493a43e6d..42dccbdfe 100644
+index 0186545e8..ba33c4086 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
 @@ -360,20 +360,6 @@ local rule compile-link-flags ( * )
diff --git a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
index 9b6fcc63588..9cb671e0134 100644
--- a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
+++ b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
@@ -1,4 +1,4 @@
-From d6864bd78c01c5e8578805a7b67555c70a0e99a2 Mon Sep 17 00:00:00 2001
+From a61dd2b1336c06d232df58212ece88067e8a80bb Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Fri, 23 Sep 2016 01:04:50 -0700
 Subject: [PATCH] boost-math: disable pch for gcc
@@ -14,13 +14,13 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libs/math/build/Jamfile.v2 b/libs/math/build/Jamfile.v2
-index fd840287e..5aff7d724 100644
+index 6549e06b7..342cbf0b1 100644
 --- a/libs/math/build/Jamfile.v2
 +++ b/libs/math/build/Jamfile.v2
-@@ -14,7 +14,7 @@ project
+@@ -13,7 +13,7 @@ project
+       <toolset>intel-win:<linkflags>-nologo 
        #<toolset>intel-linux:<pch>off
        <toolset>intel-darwin:<pch>off
-       <toolset>msvc-7.1:<pch>off
 -      <toolset>gcc,<target-os>windows:<pch>off
 +      <toolset>gcc:<pch>off
        #<toolset>gcc:<cxxflags>-fvisibility=hidden
diff --git a/meta/recipes-support/boost/boost_1.84.0.bb b/meta/recipes-support/boost/boost_1.85.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.84.0.bb
rename to meta/recipes-support/boost/boost_1.85.0.bb
-- 
2.39.2


