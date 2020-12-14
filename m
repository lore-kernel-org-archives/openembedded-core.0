Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.35427.1607956691173963127
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:38:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RfPGXD9r;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id e2so1561137plt.12
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=jKhf01gw4y0zEKlWcHMZqm8bp8WIb9STfMOCERqKuaU=;
        b=RfPGXD9rP/9MVTSY8C/ESQ1MbsuNPXM3GhYQZZPLf0Cv9oBt2EGu2UlkJBj09LjGmE
         M/tYAkkjsDba1hH5V2ZonExsBC1f5ednRagtUL5lhtnLq4zQ2rEDCyHOwrRxIvFzWcXZ
         pFDAwtAr6aKchf4GVd3IGo3KpKjQNf45+AYiDIZTYU570gPYexJdwZb7fx972CRr/gv/
         bRQUO7BqXpTEMri8/F39pR01xHiNCvC9+7nhKwYl3gnAKHd6pnk8HM27XgPGwcBomaBn
         jTZBl5p+V2zp6ktLJIC13pTybu1YwfD1pjkAY/OIOrUpiMOrXv4odzGtIZEkgQo857iI
         kASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=jKhf01gw4y0zEKlWcHMZqm8bp8WIb9STfMOCERqKuaU=;
        b=e05SVdBl5fvPF/Onx3WN/HjCWUCPO8K9QPWiBWClxsoabSWw+TxDKg1MCHZijsEQKj
         ZPzUoLYIgfHtNAJyE7rIZGejRty3m4DmaZ33Tnl3izGK4dsccJ/v2KzLKU5NUUCnVZvG
         P7J/u+0QF1n+O3pcBGo4IJPz0RQ/KZJ/qB8X56vSPCOexQXwMYMfxZYi8CLLVisYwNHv
         FQeDCy3z+Hc4tzyb5YmCvH9eJZn4EU4yde6alcHBLpZVE6i4f+LJdgACc6XiPycrDeLw
         9dJrue/U7ZPOy/EGb3KZ/pQKqa8sJKZEnpsat1PvFGCHWp3efpCn3PWyLviwSJ0H8ggk
         TLKA==
X-Gm-Message-State: AOAM530vugce6C2bJeK5+0yTctQsmjtMu1oNu8Sm0GVG/d9uiA+tUUAa
	bUl03dvIpEDYNh+Nyyjq3x07B91YcRVbYQbU
X-Google-Smtp-Source: ABdhPJw7YkaaJezRMBlabalHbv3qmyOoEq3LSGnDIqzqWed0Doo+SKXJgYsEzrlG2OuIzOthzNvT5A==
X-Received: by 2002:a17:902:9681:b029:db:fd65:d10e with SMTP id n1-20020a1709029681b02900dbfd65d10emr5278040plp.6.1607956690278;
        Mon, 14 Dec 2020 06:38:10 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.38.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:38:09 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/25] llvm: sort the lists in generated source reproducibibly
Date: Mon, 14 Dec 2020 04:36:50 -1000
Message-Id: <da485fc44fb10aede3298dc149d16cbce91d55ae.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e2e230bd7ad73a57bfb6808a3c537f74f35e2378)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...r-sort-ClassInfo-lists-by-name-as-we.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_git.bb        |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
new file mode 100644
index 0000000000..20eea060b1
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -0,0 +1,31 @@
+From 86940d87026432683fb6741cd8a34d3b9b18e40d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 27 Nov 2020 10:11:08 +0000
+Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
+
+Otherwise, there are instances which are identical in
+every other field and therefore sort non-reproducibly
+(which breaks binary and source reproducibiliy).
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ llvm/utils/TableGen/AsmMatcherEmitter.cpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
+index ccf0959389b..1f801e83b7d 100644
+--- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
++++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
+@@ -359,7 +359,10 @@ public:
+     // name of a class shouldn't be significant. However, some of the backends
+     // accidentally rely on this behaviour, so it will have to stay like this
+     // until they are fixed.
+-    return ValueName < RHS.ValueName;
++    if (ValueName != RHS.ValueName)
++        return ValueName < RHS.ValueName;
++    // All else being equal, we should sort by name, for source and binary reproducibility
++    return Name < RHS.Name;
+   }
+ };
+ 
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 6ea1b80e1f..534e2c685f 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -33,7 +33,8 @@ SRCREV = "c1a0a213378a458fbea1a5c77b315c7dce08fd05"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-          "
+           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
+           "
 
 UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.17.1

