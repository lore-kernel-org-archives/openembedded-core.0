Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69785C3DA7F
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 10:19:02 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.89708.1722593936316126760
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 03:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CxNPF9qY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.176, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ef2cb7d562so100437481fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 03:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722593934; x=1723198734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQLBAxX5mU4PDWxLC7XzHjJTzPnXzH+fetT+5z21SZs=;
        b=CxNPF9qYZIyAS3FIHs4RwYCFrZnO8UEu4lnWL8l6OG7uCzvqwZX+NVBHyfblnFCAM7
         0YEpzQM6lj00sQLHMjFOIMGr7YOXVhxSWl4G8EPM4ydh/flFrloO6s/XXOKg0CRyJwv2
         UrtVCI65ySmkzTBI9kIwXu3ZX360oDizQlLKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722593934; x=1723198734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQLBAxX5mU4PDWxLC7XzHjJTzPnXzH+fetT+5z21SZs=;
        b=LKHAsajltfsVp9e64Ug9nniSc1GlWECyTVgXGdQBrLsIrvNG28XmSHX4xIksaJOWId
         2cRYZem35ydFeaqV+2ZyLLCSsH+xBPxTERv/wO6+014XoNxDxdMXJCMmAC+N+J806aa1
         eFr8DEdmkQat5l7KSiTR07IsjIl4EJqphCxWTXT9zdHUS24eMejEa5h+U0QFRgCZOyeS
         XAJIyBNk3H5veaYcbZW9SXwuOHKKDTRj10F8i+gf5ll5AZDI0eLMHljiLnL4pdcrZFYU
         zZagAG2nNuuUrrNogLjQhayHeTHYVlP5dxr+s0GixTaSPiHGC6O/sO2E48cOJuvLaPsZ
         5JbA==
X-Gm-Message-State: AOJu0YyWHYFxHYOE6tnyckiMOteiFdkoT8f5F+JkNZPVGBd6X5RKcDGS
	8TDKLELuPtpIZLj7t3j10/jKSEi3ZTQuW9mWCNMX8C4ZTku7TOCF3FLCF9Vexb3xBv8mg7nRc5w
	3lLs=
X-Google-Smtp-Source: AGHT+IH+VY6ax2HgWeax97Z0YKzq22JmSHYbA7u6lUbh59BvP8I4OBqLx0H2bV3Sv1GtncuThwQ1lg==
X-Received: by 2002:a2e:2c14:0:b0:2ef:24a0:c176 with SMTP id 38308e7fff4ca-2f15aac182cmr23052761fa.28.1722593933425;
        Fri, 02 Aug 2024 03:18:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2ef2:8ccb:3250:e48c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd01e0a7sm1573924f8f.43.2024.08.02.03.18.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 03:18:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] libtool: Upgrade 2.5.0 -> 2.5.1
Date: Fri,  2 Aug 2024 11:18:50 +0100
Message-ID: <20240802101851.437996-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240802101851.437996-1-richard.purdie@linuxfoundation.org>
References: <20240802101851.437996-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 10:19:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202896

Switch from an alpha to a beta release.

Drop two patches merged upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libtool-2.5.0.inc => libtool-2.5.1.inc}  |  6 +---
 ...-cross_2.5.0.bb => libtool-cross_2.5.1.bb} |  0
 ...ative_2.5.0.bb => libtool-native_2.5.1.bb} |  0
 ...-Add-missing-sysroot-to-library-path.patch | 26 ----------------
 .../libtool/libtool/filefix.patch             | 30 -------------------
 .../{libtool_2.5.0.bb => libtool_2.5.1.bb}    |  0
 ...ol_2.5.0.bb => nativesdk-libtool_2.5.1.bb} |  0
 7 files changed, 1 insertion(+), 61 deletions(-)
 rename meta/recipes-devtools/libtool/{libtool-2.5.0.inc => libtool-2.5.1.inc} (87%)
 rename meta/recipes-devtools/libtool/{libtool-cross_2.5.0.bb => libtool-cross_2.5.1.bb} (100%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.5.0.bb => libtool-native_2.5.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch
 delete mode 100644 meta/recipes-devtools/libtool/libtool/filefix.patch
 rename meta/recipes-devtools/libtool/{libtool_2.5.0.bb => libtool_2.5.1.bb} (100%)
 rename meta/recipes-devtools/libtool/{nativesdk-libtool_2.5.0.bb => nativesdk-libtool_2.5.1.bb} (100%)

diff --git a/meta/recipes-devtools/libtool/libtool-2.5.0.inc b/meta/recipes-devtools/libtool/libtool-2.5.1.inc
similarity index 87%
rename from meta/recipes-devtools/libtool/libtool-2.5.0.inc
rename to meta/recipes-devtools/libtool/libtool-2.5.1.inc
index e0c9aae387a..94344d4d416 100644
--- a/meta/recipes-devtools/libtool/libtool-2.5.0.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.5.1.inc
@@ -10,19 +10,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://alpha.gnu.org/gnu/libtool/libtool-${PV}.tar.gz \
            file://0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch \
-           file://0003-ltmain.in-Add-missing-sysroot-to-library-path.patch \
            file://0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch \
            file://0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch \
            file://dont-depend-on-help2man.patch \
            file://0006-libtool.m4-Handle-as-a-sysroot-correctly.patch \
            file://0008-libtool-Check-for-static-libs-for-internal-compiler-.patch \
            file://nohardcodepaths.patch \
-           file://filefix.patch \
           "
 
-
-
-SRC_URI[sha256sum] = "d438c317455d85554ce2f998be48866fd40cfcbf834d60b3026f4fc0ed583d23"
+SRC_URI[sha256sum] = "6a83edafd42d4e2ebdc09579f99ce828d5f932f1738de02495cc8c2884e430ce"
 
 inherit autotools texinfo
 EXTRA_AUTORECONF = "--exclude=libtoolize"
diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb b/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb
rename to meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb b/meta/recipes-devtools/libtool/libtool-native_2.5.1.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool-native_2.5.0.bb
rename to meta/recipes-devtools/libtool/libtool-native_2.5.1.bb
diff --git a/meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch b/meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch
deleted file mode 100644
index 2436f68a49a..00000000000
--- a/meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From: Khem Raj <raj.khem@gmail.com>
-Subject: [PATCH 03/12] ltmain.in: Add missing sysroot to library path
-
-When using a sysroot we should append it to libdir, which is helpful in
-cross builds as the system is staged in the sysroot. For normal builds,
-i.e. when lt_sysroot is not set, it will still behave the same and add
--L/usr/lib to the relink command.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00017.html]
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=3221f9f0fb98d5740ab5d0e8db6a731302520644]
-
-Index: libtool-2.5.0/build-aux/ltmain.in
-===================================================================
---- libtool-2.5.0.orig/build-aux/ltmain.in
-+++ libtool-2.5.0/build-aux/ltmain.in
-@@ -6514,7 +6514,7 @@ func_mode_link ()
- 	      fi
- 	    else
- 	      # We cannot seem to hardcode it, guess we'll fake it.
--	      add_dir=-L$libdir
-+	      add_dir="-L$lt_sysroot$libdir"
- 	      # Try looking first in the location we're being installed to.
- 	      if test -n "$inst_prefix_dir"; then
- 		case $libdir in
diff --git a/meta/recipes-devtools/libtool/libtool/filefix.patch b/meta/recipes-devtools/libtool/libtool/filefix.patch
deleted file mode 100644
index 4d851329549..00000000000
--- a/meta/recipes-devtools/libtool/libtool/filefix.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-[PATCH] libtool.m4: Fix AC_CHECK_PROG usage
-
-In commit:
-
-https://git.savannah.gnu.org/cgit/libtool.git/commit/m4/libtool.m4?id=64bef5ba65f6820cd5f88e5249324b4f5955ee25
-
-AC_CHECK_TOOL was changed to AC_CHECK_PROG however the arguments are
-different and this result is a value of ":". Change this to match the
-original intent.
-
-The lack of FILECMD was causing failures for mips64 builds as -m elf was 
-being passed to LD which isn't supported on our targets.
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2024-06/msg00000.html]
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: libtool-2.5.0/m4/libtool.m4
-===================================================================
---- libtool-2.5.0.orig/m4/libtool.m4
-+++ libtool-2.5.0/m4/libtool.m4
-@@ -8216,7 +8216,7 @@ AC_SUBST([DLLTOOL])
- # ----------------
- # Check for a file(cmd) program that can be used to detect file type and magic
- m4_defun([_LT_DECL_FILECMD],
--[AC_CHECK_PROG([FILECMD], [file], [:])
-+[AC_CHECK_PROG([FILECMD], [file], [file], [:])
- _LT_DECL([], [FILECMD], [1], [A file(cmd) program that detects file types])
- ])# _LD_DECL_FILECMD
- 
diff --git a/meta/recipes-devtools/libtool/libtool_2.5.0.bb b/meta/recipes-devtools/libtool/libtool_2.5.1.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool_2.5.0.bb
rename to meta/recipes-devtools/libtool/libtool_2.5.1.bb
diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb b/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.1.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb
rename to meta/recipes-devtools/libtool/nativesdk-libtool_2.5.1.bb

