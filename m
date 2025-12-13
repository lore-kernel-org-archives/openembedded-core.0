Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2ECAD5AE4F
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:08 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2858.1765619999757590843
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 01:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bkyon4RD;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29845b06dd2so24129855ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 01:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765619999; x=1766224799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuVFb9Oa++h6dAPZ60lFhA4WkoBh6V0vKDKdkMrZnnQ=;
        b=bkyon4RDmhOPvT1HhLmiZfwRi8ZBVENTv9dSIosHHJAGco9gOb8hnmjI98vwgMMQvq
         V64X6b3OJ2vb7dh6DdkXdlJ4/hP/6HkEMxz9Z0tgbc/fly2XC4XC5GirW6AqubIykyae
         2hmIr8QH0JTxpEm8d+YHT1PtkfCpOiz+Lhs97YEF4hRaj2OpJy7Tlh/UjlVJ/7LkznCn
         7DiMAsYp7OlvJXBlN+ngqEIPEx00FO7CfccKwlTwKNrG0RZMJO6nEH2bvuidw9IyGf+a
         rgvdaYDSZ0RVgZfXbJWkzPwQL1ldnlX3kkoKmaFg7I/qfB8p07n1/vkB0CKIUWVnk5s4
         e2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765619999; x=1766224799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GuVFb9Oa++h6dAPZ60lFhA4WkoBh6V0vKDKdkMrZnnQ=;
        b=ApjvxiJ/B8fbC9kKANf7vsdPAKzjhfzvzqDKbHFyN7M+I452UW3LeH8hfXXQ/SBjXw
         RKU7N95OrLvDBVE2tBPdCne8rZ9xHVJgC5x7PdbG0zjORH8rH4ErOwaXHNqIDhcQDpW7
         2t+Qm+95uLtWUx55TnpHjKCpWHKD0bclRcElyHwXz7XJmd1NYt2nv2P7DD5VK7gzoDwC
         LMJIARLdFt1oJHiwVU5CgKslRsn/+gK9Vs/QEhCV6+dv5EPJ4aGADspCbNJqls6CfTQx
         z1CnLlpztYudELuNm9zYT4xXmZ6fAyP9tmIWdSDeZ9c8iqk+6PwrmmayKqy6hL5m5PV5
         WtUQ==
X-Gm-Message-State: AOJu0YzQVcPwqj5cKDBXNQ3MF190kLXuFcm4/cHRxCTv9lp3ZDTU3G2o
	gVoUYtOZIOMl8mwDPt1ZiPx3x5URdZEVMlWwgF9c3PmcRtPhrcUhf3/vWZeq+w==
X-Gm-Gg: AY/fxX5pToCyeKHZrvGj9cGCmZxxRYevWfeMElDr3D5LWP3A0MwXe4itURoXeKHVLAh
	81TSPh2/3Z3JVoJ4ebWqc/bHbCCk+x2pF5aHhERlSk4XwXwdHryr1zWDUn0y9LqTuKaf04HvsD1
	UP/SgXlkBXzdp2A95KL6uk3hxO8JpXPRGcTRpopQXRC0a7XMM5UofV13VBwNDJSlfklSmmfafS8
	DiJrBygas+4JGrejMrkbDr4b+TwN7+QUih0wSW7r1Zl8KGPXppQLcGrBw2w4FgML9WsV0p7ZvEl
	vbmC2YUe9LHFfk6fKq6978GMUETsV8O02wBA2y/5Ys6kl4qqXZkRp+ARIuZUY5bIEJtDJGXV/O9
	+5b24FNAsSF6qrm0059xgvS7IbVKmQn7Y1+ZX6of/3zRz1U+Jm9L4CIjzm0+FswsigF7VmVwrT9
	9BKKgiofdz5YCx2j6+MjW6r9ue
X-Google-Smtp-Source: AGHT+IESzOe+QXo7sTH1xSlsPgg1OdmXCMItIfbIwjQFYVKQ1X1mpnS3Ouvky+jUs87VvSwENnTGcw==
X-Received: by 2002:a17:902:d4ca:b0:295:2645:9f5 with SMTP id d9443c01a7336-29f23c7b410mr51363965ad.37.1765619999000;
        Sat, 13 Dec 2025 01:59:59 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.01.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:59:58 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 08/67] llvm/clang: Upgrade to 21.1.6 release
Date: Sat, 13 Dec 2025 15:28:32 +0530
Message-ID: <20251213095931.2571498-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227626

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Brings following bugfixes on top of 21.1.5

a832a5222e48 (HEAD, tag: llvmorg-21.1.6) Reland "[LoongArch] Add `isSafeToMove` hook to prevent unsafe instruction motion" (#167465)
2d631cc168b2 [CMake][Release] Stop linking against stage1 runtimes (#164017)
6ca64545e1eb [MachineCopyPropagation] Remove logic to recognise and delete no-op moves produced after forwarded uses (#167336)
69586a904bb8 [RISCV] Correct the CFA offsets for stack probing. (#166616)
2fde0df91125 [clang][modules] Fix crash in enum visibility lookup for C++20 header units (#166272)
251d2d374e01 [Github] Backport ABI Workflow Changes to Release Branch
4b2ac3f7a210 [debugserver] Fix debugserver build on < macOS 10.15 (#166599)
4aaab27c2343 Bump version to 21.1.6

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit f5a44a698bb33615241b23333e6e402ea3af97ea)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6c3174cbb7..49e067eee7 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-21.1.5 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-21.1.6 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index f5e3875d2c..4051ce6085 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "21"
 MINOR_VER = "1"
-PATCH_VER = "5"
+PATCH_VER = "6"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 6aec58d44d..f19599ae58 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "1794be4bf974e99a3fe1da4b2b9b1456c02ae9479c942f365441d8d207bd650c"
+SRC_URI[sha256sum] = "ae67086eb04bed7ca11ab880349b5f1ab6f50e1b88cda376eaf8a845b935762b"
 
 SRC_URI = "\
     ${BASEURI} \

