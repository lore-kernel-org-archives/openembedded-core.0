Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE13BC38145
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:27:58 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.471.1660894072009517843
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fYmgUDOh;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id n4so4154421wrp.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=fc7xKl4bsrgptNCAMCuw5Vfboa0Yq+2HDcnvoEP6Ku0=;
        b=fYmgUDOhOuNjJH40E9NOSHgR7w5h+EXorGxogQTXq6y9/3c6aOA928LoDHzv/ockXd
         CZB6Zs8DbUAK2tNxR88tRPJhP0sD9RJo+TsJBiKeDSQDmiI/SjC1ugE8wZudEYPmyCxn
         f6dTQ0CcWKu9mfO7if15MrZB2lrA40DAGhZRddFpcBQoGta8i56/B99Y7TeUgoEBtDPj
         NB2W7FDrYCP2FACQgc+nxhRIR4lFPVtjVvLYnfpYzz5T34EANfgqNJvhpuvdAb01s5rs
         mtkVubU51rRJvhriUhyN6wAepUcFCqV89QS541XJFDzXWbkJWenREDoNQB4o1/sXpbj+
         gnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=fc7xKl4bsrgptNCAMCuw5Vfboa0Yq+2HDcnvoEP6Ku0=;
        b=re8XoYFwwnq2R2yr3r0hsUhkPdfh8bCsIB6yc1UgW1mZinVH4hDaQWnQeh6k1U9dxL
         9rh73Lb/ghw7jUsI//EDgWUEJ9e8uqqlrX3DaSuWEh3gFtn+k+8CSTevexlNQArXinWS
         KEdXomf5OVspuQQfJ73+7RwuW4PWIW9YMOKw3G0vwbYj95en0mptMqLc26zL98WFfbdk
         Ct7UOd0dWQA9Y4fL7g+lJzBmG/f0/kQpdOCQHs5Fw0BXMg0Qk5dmhUMVLFUu3Ud+nhIv
         GilXgvwuAIxf3abvlvvx16CtGtv/ITeVXeISLfYhDOViGBp7agGZLYwEXQNWzIwjnoUt
         0vNw==
X-Gm-Message-State: ACgBeo1+LNrY0q/GW3RDtN6G3z83mdi0xM+w2AB/weR4yIGn4B0ZfWmN
	QHybRLXhYT7H+AaqBfaa7MYfPHAv53Y=
X-Google-Smtp-Source: 
 AA6agR5UCz153mzV7ijRZW2IBRICnYARyz1RIR16sfDYx4eQ2ClnKZFguAG2C7wgcwrdREykZx6dyg==
X-Received: by 2002:a5d:4b92:0:b0:223:7666:2b8e with SMTP id
 b18-20020a5d4b92000000b0022376662b8emr3363514wrt.195.1660894070520;
        Fri, 19 Aug 2022 00:27:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:27:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/42] slang: update 2.3.2 -> 2.3.3
Date: Fri, 19 Aug 2022 09:26:51 +0200
Message-Id: <20220819072727.2236928-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:27:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169577

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../slang/slang/dont-link-to-host.patch       | 23 ++++++++++++---
 .../slang/slang/terminfo_fixes.patch          | 28 +++++++++++++++----
 .../slang/{slang_2.3.2.bb => slang_2.3.3.bb}  |  3 +-
 3 files changed, 43 insertions(+), 11 deletions(-)
 rename meta/recipes-extended/slang/{slang_2.3.2.bb => slang_2.3.3.bb} (95%)

diff --git a/meta/recipes-extended/slang/slang/dont-link-to-host.patch b/meta/recipes-extended/slang/slang/dont-link-to-host.patch
index 42dba0fae4..4b02068991 100644
--- a/meta/recipes-extended/slang/slang/dont-link-to-host.patch
+++ b/meta/recipes-extended/slang/slang/dont-link-to-host.patch
@@ -1,3 +1,8 @@
+From b4a6e3c8309cff0f2311cd959c5091213b633851 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 7 Feb 2017 14:35:43 +0000
+Subject: [PATCH] slang: rewrite recipe to run autoconf
+
 SLANG_INST_LIB is the location of where slang will end up, but when building for
 packaging this doesn't have DESTDIR appended so can potentially link to the host
 for cross builds and will trigger QA errors.
@@ -7,10 +12,20 @@ As this is obviously wrong, delete it.
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+---
+ slsh/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
 diff --git a/slsh/Makefile.in b/slsh/Makefile.in
-index cba9d81..4c1c370 100644
+index addd343..63a5c9b 100644
 --- a/slsh/Makefile.in
 +++ b/slsh/Makefile.in
-@@ -80 +80 @@ SHELL = /bin/sh
--INST_LIBS = $(DEST_LIB_DIR) $(RPATH) $(SLANG_INST_LIB) -lslang $(READLINE_LIB) $(DYNAMIC_LIBS)
-+INST_LIBS = $(DEST_LIB_DIR) $(RPATH) -lslang $(READLINE_LIB) $(DYNAMIC_LIBS)
+@@ -77,7 +77,7 @@ SLSYSWRAP_LIB = @LIB_SLSYSWRAP@
+ #----------------------------------------------------------------------------
+ @SET_MAKE@
+ SHELL = /bin/sh
+-INST_LIBS = $(DEST_LIB_DIR) $(RPATH) $(SLANG_INST_LIB) -lslang $(LDFLAGS) $(READLINE_LIB) $(DYNAMIC_LIBS)
++INST_LIBS = $(DEST_LIB_DIR) $(RPATH) -lslang $(LDFLAGS) $(READLINE_LIB) $(DYNAMIC_LIBS)
+ DEFS = -DSLSH_CONF_DIR='"$(SLSH_CONF_DIR)"' -DSLSH_PATH='"$(SLSH_LIB_DIR)"' \
+  -DSLSH_CONF_DIR_ENV='$(SLSH_CONF_DIR_ENV)' -DSLSH_LIB_DIR_ENV='$(SLSH_LIB_DIR_ENV)' \
+  -DSLSH_PATH_ENV='$(SLSH_PATH_ENV)' $(SLSYSWRAP_DEF)
diff --git a/meta/recipes-extended/slang/slang/terminfo_fixes.patch b/meta/recipes-extended/slang/slang/terminfo_fixes.patch
index 3ca20a8cab..331b7f02e4 100644
--- a/meta/recipes-extended/slang/slang/terminfo_fixes.patch
+++ b/meta/recipes-extended/slang/slang/terminfo_fixes.patch
@@ -1,3 +1,8 @@
+From 2a75095638002d37a2f9c7aeb0ec54f271b0a1c4 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Tue, 1 Aug 2017 12:36:53 -0700
+Subject: [PATCH] slang: fix terminfo related problems
+
 Do not use the JD_TERMCAP macro since we cannot get the terminfo from
 ncurses pkg-config, but fix the macro to not reference host directories.
 Also add src/test/Makefile.in so that we can use -ltermcap if we want to.
@@ -8,10 +13,18 @@ Upstream-Status: Inappropriate [see above]
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
+---
+ autoconf/aclocal.m4   |  8 +---
+ autoconf/configure.ac | 11 +++++-
+ src/test/Makefile.in  | 90 +++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 100 insertions(+), 9 deletions(-)
+ create mode 100644 src/test/Makefile.in
 
+diff --git a/autoconf/aclocal.m4 b/autoconf/aclocal.m4
+index b2dfcd3..5f94ed3 100644
 --- a/autoconf/aclocal.m4
 +++ b/autoconf/aclocal.m4
-@@ -506,14 +506,10 @@ then
+@@ -509,15 +509,9 @@ then
  else
     MISC_TERMINFO_DIRS=""
  fi
@@ -19,8 +32,8 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
 -                  /usr/lib/terminfo \
 -                  /usr/share/terminfo \
 -                  /usr/share/lib/terminfo \
--		  /usr/local/lib/terminfo"
-+
+-		  /usr/local/lib/terminfo \
+-                  /etc/terminfo /lib/terminfo"
  TERMCAP=-ltermcap
  
 -for terminfo_dir in $JD_Terminfo_Dirs
@@ -28,9 +41,11 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
  do
     if test -d $terminfo_dir
     then
+diff --git a/autoconf/configure.ac b/autoconf/configure.ac
+index 8e11e13..9e6402c 100644
 --- a/autoconf/configure.ac
 +++ b/autoconf/configure.ac
-@@ -249,7 +249,14 @@ AC_CHECK_SIZEOF(size_t)
+@@ -250,7 +250,14 @@ AC_CHECK_SIZEOF(size_t)
  JD_CHECK_LONG_LONG
  JD_LARGE_FILE_SUPPORT
  
@@ -46,7 +61,7 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
  JD_GCC_WARNINGS
  
  JD_SET_OBJ_SRC_DIR(src)
-@@ -364,7 +371,7 @@ AC_CONFIG_HEADER(src/sysconf.h:src/confi
+@@ -365,7 +372,7 @@ AC_CONFIG_HEADER(src/sysconf.h:src/config.hin)
  dnl AC_CONFIG_SUBDIRS(demo)
  
  AC_OUTPUT(Makefile:autoconf/Makefile.in \
@@ -55,6 +70,9 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
    slang.pc:autoconf/slangpc.in \
  )
  
+diff --git a/src/test/Makefile.in b/src/test/Makefile.in
+new file mode 100644
+index 0000000..4b7307f
 --- /dev/null
 +++ b/src/test/Makefile.in
 @@ -0,0 +1,90 @@
diff --git a/meta/recipes-extended/slang/slang_2.3.2.bb b/meta/recipes-extended/slang/slang_2.3.3.bb
similarity index 95%
rename from meta/recipes-extended/slang/slang_2.3.2.bb
rename to meta/recipes-extended/slang/slang_2.3.3.bb
index 08cc9670dc..05b8aff0f2 100644
--- a/meta/recipes-extended/slang/slang_2.3.2.bb
+++ b/meta/recipes-extended/slang/slang_2.3.3.bb
@@ -23,8 +23,7 @@ SRC_URI = "http://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
            file://run-ptest \
           "
 
-SRC_URI[md5sum] = "c2d5a7aa0246627da490be4e399c87cb"
-SRC_URI[sha256sum] = "fc9e3b0fc4f67c3c1f6d43c90c16a5c42d117b8e28457c5b46831b8b5d3ae31a"
+SRC_URI[sha256sum] = "f9145054ae131973c61208ea82486d5dd10e3c5cdad23b7c4a0617743c8f5a18"
 
 UPSTREAM_CHECK_URI = "http://www.jedsoft.org/releases/slang/"
 PREMIRRORS:append = " http://www.jedsoft.org/releases/slang/.* http://www.jedsoft.org/releases/slang/old/"
-- 
2.30.2


