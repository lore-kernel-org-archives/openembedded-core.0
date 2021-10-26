Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E86C4332F
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 11:11:45 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.10542.1635246704362871981
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 04:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aNqcaC1A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id m22so15175964wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 04:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zGole+rAXeprZcsD7+RuMhqhH+TPkxc6ix0CercqaM8=;
        b=aNqcaC1APBmSpy27An0Yzzeq5LKPMsfoGm2cI/dhEXiz0+f+EZlnPBmjItilaP0MVS
         OXu0Iu1M89Sl604EIOicu+0mDAhaOhy9VSj4VMK9qAURrqF15MMg6G5b9yW5jK7mjO9A
         XYefPnVcLMcx5LrTZsGhDoH7xSor6mEWIuIhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zGole+rAXeprZcsD7+RuMhqhH+TPkxc6ix0CercqaM8=;
        b=2A9JxU9+BpW/m/1JHuz+bdBS9jtRmymESKIeCcI8KpyHY6UeggSL+sIcJarQMUCpLy
         qHPxLyh6n3egTmDdoaMqsxA0j9zHkbDFHKZ5Kb1L9E8Mduov2jkkF80TuArpf0LfsjsD
         /PfQ0ocnZmsjR/xEyau7MoWUuNJYJjq4yqjlgOul4desZt4otTkC0jRhgow5tUTOSiT+
         qD7G1ClafpPGxyA/mhzcAv3HqY7gPiBq8UIl+0pCyHb1hWSZ1e2k6IWIkskesRgjwviQ
         or7BmIscu9q48Wu2yCX6cp28ZH76GqnBskDDWzx7jEBT+RB1jsRRTQ5YMn4N5jRxFCKK
         DdSw==
X-Gm-Message-State: AOAM533DJ/oh/TZvIfYPXGlrfwlC+1d2CTIYI9J88Inh+ytKU6B21XkK
	/uG8ucuN2GHkMZRWwEjKewwiLJ0CNEEgRQ==
X-Google-Smtp-Source: 
 ABdhPJzsyOqHYw0LvfVYf4OxttNLLWyGwPhHMERzsLk+mFvX/FJ+kxamwVltoLm6hbds7eUMqusgzg==
X-Received: by 2002:adf:ca09:: with SMTP id o9mr30254037wrh.303.1635246702709;
        Tue, 26 Oct 2021 04:11:42 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6b9e:385e:1583:4f40])
        by smtp.gmail.com with ESMTPSA id
 f17sm11403510wrv.89.2021.10.26.04.11.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 04:11:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] gcc: Drop broken/unneeded patch
Date: Tue, 26 Oct 2021 12:11:40 +0100
Message-Id: <20211026111140.3298966-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211026111140.3298966-1-richard.purdie@linuxfoundation.org>
References: <20211026111140.3298966-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 11:11:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157386

This patch looks obsolete because it looks like part of an upstream
backport on a very old gcc version (4.3.3) and looks incomplete. The
diff also has little context making it likely to be a rebase error.

Builds seem find without it so drop it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc        |  1 -
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch | 70 -------------------
 2 files changed, 71 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index 1ab779533ca..23dfea2319e 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -32,7 +32,6 @@ SRC_URI = "\
            ${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
            file://0002-gcc-poison-system-directories.patch \
-           file://0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
            file://0004-64-bit-multilib-hack.patch \
            file://0005-optional-libstdc.patch \
            file://0006-COLLECT_GCC_OPTIONS.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
deleted file mode 100644
index 7a676545557..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 274a27da6fe355c4c49953b3b69c8949d2412c62 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:08:31 +0400
-Subject: [PATCH] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
-
-Before committing, I noticed that PR/32161 was marked as a dup of PR/32009, but my previous patch did not fix it.
-
-This alternative patch is better because it lets you just use CFLAGS_FOR_TARGET to set the compilation flags for libgcc. Since bootstrapped target libraries are never compiled with the native compiler, it makes little sense to use different flags for stage1 and later stages. And it also makes little sense to use a different variable than CFLAGS_FOR_TARGET.
-
-Other changes I had to do include:
-
-- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am to configure.ac, because otherwise the BOOT_CFLAGS are substituted into CFLAGS_FOR_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS). It is also cleaner this way though.
-
-- passing the right CFLAGS to configure scripts as exported environment variables
-
-I also stopped passing LIBCFLAGS to configure scripts since they are unused in the whole src tree. And I updated the documentation as H-P reminded me to do.
-
-Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4 shortly. Ok for 4.3?
-
-Signed-off-by: Paolo Bonzini  <bonzini@gnu.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- configure | 32 ++++++++++++++++++++++++++++++++
- 1 file changed, 32 insertions(+)
-
-diff --git a/configure b/configure
-index bcebad264ec..86e4ee7c383 100755
---- a/configure
-+++ b/configure
-@@ -8977,6 +8977,38 @@ fi
- 
- 
- 
-+# During gcc bootstrap, if we use some random cc for stage1 then CFLAGS
-+# might be empty or "-g".  We don't require a C++ compiler, so CXXFLAGS
-+# might also be empty (or "-g", if a non-GCC C++ compiler is in the path).
-+# We want to ensure that TARGET libraries (which we know are built with
-+# gcc) are built with "-O2 -g", so include those options when setting
-+# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
-+if test "x$CFLAGS_FOR_TARGET" = x; then
-+  CFLAGS_FOR_TARGET=$CFLAGS
-+  case " $CFLAGS " in
-+    *" -O2 "*) ;;
-+    *) CFLAGS_FOR_TARGET="-O2 $CFLAGS" ;;
-+  esac
-+  case " $CFLAGS " in
-+    *" -g "* | *" -g3 "*) ;;
-+    *) CFLAGS_FOR_TARGET="-g $CFLAGS" ;;
-+  esac
-+fi
-+
-+
-+if test "x$CXXFLAGS_FOR_TARGET" = x; then
-+  CXXFLAGS_FOR_TARGET=$CXXFLAGS
-+  case " $CXXFLAGS " in
-+    *" -O2 "*) ;;
-+    *) CXXFLAGS_FOR_TARGET="-O2 $CXXFLAGS" ;;
-+  esac
-+  case " $CXXFLAGS " in
-+    *" -g "* | *" -g3 "*) ;;
-+    *) CXXFLAGS_FOR_TARGET="-g $CXXFLAGS" ;;
-+  esac
-+fi
-+
-+
- # Handle --with-headers=XXX.  If the value is not "yes", the contents of
- # the named directory are copied to $(tooldir)/sys-include.
- if test x"${with_headers}" != x && test x"${with_headers}" != xno ; then
-- 
2.32.0


