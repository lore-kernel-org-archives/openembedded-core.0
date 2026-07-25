Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80488C531C9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 16:27:09 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.265.1784989823137354967
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2026 07:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=npgnhoqH;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: zizuzacker@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cacf197759so19797775ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 07:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784989822; x=1785594622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OnfcjJA9R+wJR1bizGPHRz71Kqg3VY+lZjLqmWRZT5w=;
        b=npgnhoqHgZGt2JvvEmWOri5dQtjy3FmOVapN5dt56AXnySLhKtHmuUxXtAE7KcDjsg
         SxAk76nPxTLdlx9m5ljPXGgMVT0zM1lCshP7SHHHnU+aCh49WXdjPH+IS+RoKQar9uC7
         2nOGcSkEB7ikojaK8ELFB5uDxqxer/hpQ+ha7dhQ7wcYrETbHFTaIsnoaCFaRMZyyRAf
         JWm2EcTRy1lzoWzVEp3Rn1ZJjcGLyzYaRAXyXf2ZBNafMBtYWZK2xtsvPSs59i6+xbqR
         i6jVEKTDLAQH+HufSnK7o5kGzYYDBS58S7NpcmlSz82iTaQPGJzsnQt8ivGlFGz4mPb/
         5cMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784989822; x=1785594622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OnfcjJA9R+wJR1bizGPHRz71Kqg3VY+lZjLqmWRZT5w=;
        b=NjoQ9fTbgezAAftuhP9DhW3mZNG8/j9FuIXOIGX9o/v7k1MrMzQpZCTBMoAc4mHGwn
         aC+SEsWsbZV06akuOuMV/xYMlxT+/hSrJgam693SIBKOnD3JVRjun8ss56/QdJrf4kMj
         k/ZCjVgDLIdE7LImQf4YrQMNTalkh97TujXTE6dimO3qONZp9rWcIjJRFzijaTjfLZBj
         /d1OSFExAB18S7ig1MDI2dR6lY3XnHO47HtayZJCdQ3TydYEIyeXfqVrZHR8eNO4Gwlz
         RDWZl6W++/UFORKR1SdeU7+Gv6oqs3i0+ZVjjungtkdx54IL575eWp9YxczA70bleUCp
         69lw==
X-Gm-Message-State: AOJu0Yyg/IvRPAwt/Tugl7rsNPmve1HO2WHT8Q8dLa3pnuwqSQb4dntQ
	/lYnik5kvcM5geWXH848osaUkbbiBx5PvxQGeRzDqxwv5W4GGxfrsXci2WNNV3FG
X-Gm-Gg: AR+sD10FfFzCsPcVTfCaveYgQFuaQxvRrrnrwmREjAtXAc4EZYONr28GSc6SLbpTwvM
	wbdaLbtVTHzKqhodOcXiFbGC/SYRBU5RqqdlOWu9I6pVt4umDz+NGwH2lbUSwPDLLgU+DCEB/G9
	SeRO7LW38XZsvW4GIv5FJCB2bei237F1jMp6bhu/YE48MIpBdRSYfhuQSlR0hFfYXgQcZcGppgW
	ONb4wF7Q/7ru6xBznoKsoBvVxS0gF3+fXYzvuJJs7l8P1RWr1Lhlxp3jxC+z2yvPJJk/rMPyaze
	sNEW1B1wJ0xdCGS2YhmB1nzk4DEp/d2bondTYc4X+r1MrMxbs4cfoDsB/ObuHBg7J7nEnFOGjt6
	EbG07MouNgHbmM6SQCP/0zQft67cHzJhO1faysQq3tuO9EL1GkbTXEyGyDfyzwtwIq43B
X-Received: by 2002:a17:902:f684:b0:2c9:97a9:2096 with SMTP id d9443c01a7336-2cfde8916fbmr24512965ad.42.1784989822466;
        Sat, 25 Jul 2026 07:30:22 -0700 (PDT)
Received: from ltu.. ([2001:ee0:4041:efc5:bfb0:104e:8f:340f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419e3asm11290940eec.11.2026.07.25.07.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:30:21 -0700 (PDT)
From: "Zk47T" <zizuzacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: zizuzacker@gmail.com
Subject: [PATCH 1/1] rm_work: fix recipe self-exclusion lost when RM_WORK_EXCLUDE is conditional
Date: Sat, 25 Jul 2026 21:30:15 +0700
Message-Id: <20260725143015.23804-2-zizuzacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260725143015.23804-1-zizuzacker@gmail.com>
References: <20260725143015.23804-1-zizuzacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 16:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242017

A recipe keeps its WORKDIR by adding itself to the exclusion list:

    RM_WORK_EXCLUDE += "${PN}"

+= is evaluated at parse time against the unoverridden variable, so it
appends to the base value. As soon as configuration sets an override such
as RM_WORK_EXCLUDE:qemuarm64, that override takes precedence at lookup
time and the recipe's own entry is hidden from both the python guard in
inject_rm_work() and the shell guard in do_rm_work.

The WORKDIR is then removed even though it was meant to be kept. For
gcc-source that is the shared source tree the other gcc recipes build
from, 1.4G here, so the next build needing it fetches, unpacks and
patches it again, and anything still using it while do_rm_work runs can
fail outright. The report has gcc-source do_patch failing.

Use :append, which is applied on top of whichever override wins. With no
override involved both operators produce the same string, so task
signatures and sstate are unaffected.

gcc-source used deltask, which had no such failure mode, until
1f2a3cdadac1 switched it to this idiom; the other three recipes adopted
the idiom afterwards.

Fixes: 1f2a3cdadac1 ("gcc-source.inc: cleanly disable do_rm_work")
[YOCTO #16157]

Signed-off-by: Nguyen Minh Tien <zizuzacker@gmail.com>
---
 meta/classes/rm_work.bbclass                        | 6 ++++++
 meta/recipes-core/meta/meta-ide-support.bb          | 2 +-
 meta/recipes-core/meta/wic-tools.bb                 | 2 +-
 meta/recipes-devtools/clang/llvm-project-source.inc | 2 +-
 meta/recipes-devtools/gcc/gcc-source.inc            | 2 +-
 5 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 52ecfafb72..cdef74f6a7 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -16,6 +16,12 @@
 #
 # RM_WORK_EXCLUDE += "icu-native icu busybox"
 #
+# += does not combine with a conditional value, so use :append if either the
+# configuration or a recipe excluding itself may be overridden:
+#
+# RM_WORK_EXCLUDE:append:qemuarm64 = " busybox"
+# RM_WORK_EXCLUDE:append = " ${PN}"
+#
 # Recipes can also configure which entries in their ${WORKDIR}
 # are preserved besides temp, which already gets excluded by default
 # because it contains logs:
diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index c449302923..222ae21b29 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "virtual/libc ${MLPREFIX}gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native cmake-native autoconf-native automake-native meson-native intltool-native pkgconfig-native"
-RM_WORK_EXCLUDE += "${PN}"
+RM_WORK_EXCLUDE:append = " ${PN}"
 
 inherit toolchain-scripts nopackages deploy testsdk
 
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index 823dbe6db6..9123f6e55a 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -23,7 +23,7 @@ inherit nopackages
 
 # The sysroot of wic-tools is needed for wic, but if rm_work is enabled, it will
 # be removed before wic has a chance to use it, hence the exclusion below.
-RM_WORK_EXCLUDE += "${PN}"
+RM_WORK_EXCLUDE:append = " ${PN}"
 
 python do_build_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/recipes-devtools/clang/llvm-project-source.inc
index 85b5ef06dc..af601914bc 100644
--- a/meta/recipes-devtools/clang/llvm-project-source.inc
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -3,7 +3,7 @@ deltask do_compile
 deltask do_install
 deltask do_populate_sysroot
 deltask do_populate_lic
-RM_WORK_EXCLUDE += "${PN}"
+RM_WORK_EXCLUDE:append = " ${PN}"
 
 inherit nopackages allarch
 
diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index d760171661..d2bb5222bf 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -3,7 +3,7 @@ deltask do_compile
 deltask do_install
 deltask do_populate_sysroot
 deltask do_populate_lic
-RM_WORK_EXCLUDE += "${PN}"
+RM_WORK_EXCLUDE:append = " ${PN}"
 
 inherit nopackages allarch
 
-- 
2.34.1


