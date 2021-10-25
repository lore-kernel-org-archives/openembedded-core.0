Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375C8C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 20:04:43 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.2428.1635192282075286267
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 13:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dhXbsabU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id p14so8915125wrd.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 13:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rDo0hsZymKqsY19ekvQK+j5Chaa5Q4+HeeFYaBT47tc=;
        b=dhXbsabUFjRoe3bYz78cGosbpoHN+/hxij81eWrvZ0vDAs1TlKpwwba9d6TmsjmIvE
         TtnBDx1LVsDQ16vzm/ARirtcTH25/h2NYI11Vkx37VOiUkeppm7ofZc/NAYjolQ8SkL1
         0dxgQX1aSCmM1k8k1g19YTEnbc+y4TjrOpDWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rDo0hsZymKqsY19ekvQK+j5Chaa5Q4+HeeFYaBT47tc=;
        b=jg5GLbTnQLlTRQfpzON4ifhpcsx8akJbM3qAzEDRGQtjsEuia+Qc7wLt6kTeDDdo6L
         UFPqkBap5BBJC/t1a13mtdM9Z46X3luNoxv6GPmIjU6/mX1pOQx0k2ecXd6yG7Fh8Txw
         U0pvylfZ4zqTdgUhzMms4Az/PTtB1JHlvHg9iHRhsbuROJoBNEc1WOWveHzxL7RSt9s5
         Txd77nkFxufqC06E2BgQ7RQAJEKTy2hc7AEg6DjnuUHfhnD9RoLDSkdubp7BmJVaj8P7
         23cznsFQ+W2qEk8Qdv3vKiH4+GRumWCQgEefv2yD5CG41XhZB87z8tP+DBOyI+Fci6iG
         pB2Q==
X-Gm-Message-State: AOAM530Wv3XVOJVrW95umxOXPl+R4iZnj/0jvRLYH7vC9iueAWyXCewB
	CsE7h3gcp7hqFcVLKDqkhhON7Zwi1+stSg==
X-Google-Smtp-Source: 
 ABdhPJz6G9aifPs/obSKVCTdrQ+HJCHBQSx8FsAzWH8xqFBkEvsd8cHP6SKwqiiGPa8ZqKaSGQU7tQ==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr7148233wrq.385.1635192279626;
        Mon, 25 Oct 2021 13:04:39 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5fb2:414a:7b8b:6fb3])
        by smtp.gmail.com with ESMTPSA id
 f9sm6747889wrx.31.2021.10.25.13.04.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 13:04:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libtool: Update patchset to match those submitted upstream
Date: Mon, 25 Oct 2021 21:04:38 +0100
Message-Id: <20211025200438.3281227-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 20:04:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157361

I went through and cleaned up the headers/descriptions on several of the
libtool patchset and submitted (or resubmitted in some cases) them
upstream. This patch updates/renames them to match what I did.

I did fix some whitespace issues in some of the patches and also merged
one case where we had a patch of already patched code.

This makes it clear what was submitted and makes resubmission easier if
ever needed too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libtool/libtool-2.4.6.inc                 | 25 ++++++------
 ...-trailing-slashes-on-install-command.patch | 35 +++++++++++++++++
 ...-the-with-sysroot-option-to-avoid-c.patch} | 13 ++++---
 ...Add-missing-sysroot-to-library-path.patch} | 10 +++--
 ...root-paths-being-encoded-into-RPATH.patch} | 16 ++++----
 ...ncode-RATHS-which-match-default-lin.patch} | 37 ++++++++++--------
 ...ol.m4-Handle-as-a-sysroot-correctly.patch} | 18 +++++----
 ...ool-Fix-support-for-NIOS2-processor.patch} |  9 +++--
 ...-static-libs-for-internal-compiler-.patch} | 13 ++++---
 ...sure-autoheader-run-before-autoconf.patch} | 10 ++---
 ...sure-autoheader-run-before-automake.patch} |  9 +++--
 ...prefix-map-compiler-options-correct.patch} |  6 ++-
 ...producibility-stop-encoding-hostnam.patch} | 12 ++++--
 .../libtool/libtool/fixinstall.patch          |  6 +--
 .../libtool/libtool/norm-rpath.patch          | 38 -------------------
 .../libtool/libtool/trailingslash.patch       | 35 -----------------
 16 files changed, 139 insertions(+), 153 deletions(-)
 create mode 100644 meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch
 rename meta/recipes-devtools/libtool/libtool/{rename-with-sysroot.patch => 0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch} (90%)
 rename meta/recipes-devtools/libtool/libtool/{use-sysroot-in-libpath.patch => 0003-ltmain.in-Add-missing-sysroot-to-library-path.patch} (63%)
 rename meta/recipes-devtools/libtool/libtool/{fix-final-rpath.patch => 0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch} (74%)
 rename meta/recipes-devtools/libtool/libtool/{fix-rpath.patch => 0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch} (57%)
 rename meta/recipes-devtools/libtool/libtool/{fix-resolve-lt-sysroot.patch => 0006-libtool.m4-Handle-as-a-sysroot-correctly.patch} (60%)
 rename meta/recipes-devtools/libtool/libtool/{0001-libtool-Fix-support-for-NIOS2-processor.patch => 0007-libtool-Fix-support-for-NIOS2-processor.patch} (90%)
 rename meta/recipes-devtools/libtool/libtool/{0001-libtool-Check-for-static-libs-for-internal-compiler-.patch => 0008-libtool-Check-for-static-libs-for-internal-compiler-.patch} (71%)
 rename meta/recipes-devtools/libtool/libtool/{0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch => 0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch} (79%)
 rename meta/recipes-devtools/libtool/libtool/{0001-Makefile.am-make-sure-autoheader-run-before-automake.patch => 0010-Makefile.am-make-sure-autoheader-run-before-automake.patch} (75%)
 rename meta/recipes-devtools/libtool/libtool/{lto-prefix.patch => 0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch} (82%)
 rename meta/recipes-devtools/libtool/libtool/{debian-no_hostname.patch => 0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch} (55%)
 mode change 100755 => 100644
 delete mode 100644 meta/recipes-devtools/libtool/libtool/norm-rpath.patch
 delete mode 100644 meta/recipes-devtools/libtool/libtool/trailingslash.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index 7104c98c203..2df46aa7735 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -9,22 +9,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://libltdl/COPYING.LIB;md5=4fbd65380cdd255951079008b364516c "
 
 SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
-           file://trailingslash.patch \
-           file://rename-with-sysroot.patch \
-           file://use-sysroot-in-libpath.patch \
-           file://fix-final-rpath.patch \
-           file://fix-rpath.patch \
-           file://norm-rpath.patch \
+           file://0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch \
+           file://0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch \
+           file://0003-ltmain.in-Add-missing-sysroot-to-library-path.patch \
+           file://0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch \
+           file://0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch \
            file://dont-depend-on-help2man.patch \
-           file://fix-resolve-lt-sysroot.patch \
+           file://0006-libtool.m4-Handle-as-a-sysroot-correctly.patch \
            file://nohardcodepaths.patch \
            file://unwind-opt-parsing.patch \
-           file://0001-libtool-Fix-support-for-NIOS2-processor.patch \
-           file://0001-libtool-Check-for-static-libs-for-internal-compiler-.patch \
-           file://0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch \
-           file://0001-Makefile.am-make-sure-autoheader-run-before-automake.patch \
-           file://lto-prefix.patch \
-           file://debian-no_hostname.patch \
+           file://0007-libtool-Fix-support-for-NIOS2-processor.patch \
+           file://0008-libtool-Check-for-static-libs-for-internal-compiler-.patch \
+           file://0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch \
+           file://0010-Makefile.am-make-sure-autoheader-run-before-automake.patch \
+           file://0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch \
+           file://0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch \
           "
 
 SRC_URI[md5sum] = "addf44b646ddb4e3919805aa88fa7c5e"
diff --git a/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch b/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch
new file mode 100644
index 00000000000..eeb5ebf4161
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch
@@ -0,0 +1,35 @@
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Subject: [PATCH 01/12] ltmain.in: Handle trailing slashes on install commands correctly
+
+A command like:
+
+libtool --mode=install /usr/bin/install -c gck-roots-store-standalone.la '/image/usr/lib/gnome-keyring/standalone/'
+
+where the path ends with a trailing slash currently fails. This occurs in
+software like gnome-keyring or pulseaudio and is because the comparision
+code doesn't see the paths as equal. Strip both paths to ensure this works
+reliably.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00010.html]
+
+diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
+--- a/build-aux/ltmain.in
++++ b/build-aux/ltmain.in
+@@ -2356,8 +2356,14 @@ func_mode_install ()
+ 	func_append dir "$objdir"
+ 
+ 	if test -n "$relink_command"; then
++	  # Strip any trailing slash from the destination.
++	  func_stripname '' '/' "$libdir"
++	  destlibdir=$func_stripname_result
++	  func_stripname '' '/' "$destdir"
++	  s_destdir=$func_stripname_result
++
+ 	  # Determine the prefix the user has applied to our future dir.
+-	  inst_prefix_dir=`$ECHO "$destdir" | $SED -e "s%$libdir\$%%"`
++	  inst_prefix_dir=`$ECHO "X$s_destdir" | $Xsed -e "s%$destlibdir\$%%"`
+ 
+ 	  # Don't allow the user to place us outside of our expected
+ 	  # location b/c this prevents finding dependent libraries that
diff --git a/meta/recipes-devtools/libtool/libtool/rename-with-sysroot.patch b/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch
similarity index 90%
rename from meta/recipes-devtools/libtool/libtool/rename-with-sysroot.patch
rename to meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch
index ad2b1105306..6da283959ed 100644
--- a/meta/recipes-devtools/libtool/libtool/rename-with-sysroot.patch
+++ b/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch
@@ -1,16 +1,17 @@
-Upstream-Status: Pending
+From: Khem Raj <raj.khem@gmail.com>
+Subject: [PATCH 02/12] libtool.m4: Rename the --with-sysroot option to avoid conflict with gcc/binutils
 
 This patch renames the --with-sysroot option to --with-libtool-sysroot
 to avoid namespace conflict with binutils, gcc and other toolchain
-components.
+components since these componets also add that option to configure
+and this becomes confusing and conflicting otherwise.
 
-I also reported the problem to libtool here
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
+Upstream report:
 http://lists.gnu.org/archive/html/libtool/2010-10/msg00048.html
 
--Khem Raj <raj.khem@gmail.com>
-
-Updated by: Robert Yang <liezhi.yang@windriver.com>
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00014.html]
 
 diff --git a/m4/libtool.m4 b/m4/libtool.m4
 --- a/m4/libtool.m4
diff --git a/meta/recipes-devtools/libtool/libtool/use-sysroot-in-libpath.patch b/meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch
similarity index 63%
rename from meta/recipes-devtools/libtool/libtool/use-sysroot-in-libpath.patch
rename to meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch
index 6af99f327c9..0103a004513 100644
--- a/meta/recipes-devtools/libtool/libtool/use-sysroot-in-libpath.patch
+++ b/meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch
@@ -1,12 +1,14 @@
-Upstream-Status: Pending
+From: Khem Raj <raj.khem@gmail.com>
+Subject: [PATCH 03/12] ltmain.in: Add missing sysroot to library path
 
-When using sysroot we should append it to libdir, which is helpful in
+When using a sysroot we should append it to libdir, which is helpful in
 cross builds as the system is staged in the sysroot. For normal builds,
 i.e. when lt_sysroot is not set, it will still behave the same and add
 -L/usr/lib to the relink command.
 
--Khem Raj <raj.khem@gmail.com>
-Updated by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00017.html]
 
 diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
 --- a/build-aux/ltmain.in
diff --git a/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch b/meta/recipes-devtools/libtool/libtool/0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch
similarity index 74%
rename from meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
rename to meta/recipes-devtools/libtool/libtool/0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch
index 5c9f8cc9c0d..21b3dfe306d 100644
--- a/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
+++ b/meta/recipes-devtools/libtool/libtool/0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch
@@ -1,13 +1,13 @@
-Upstream-Status: Inappropriate [embedded specific]
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Subject: [PATCH 04/12] ltmain.sh: Fix sysroot paths being encoded into RPATHs
 
-Enalbing sysroot support exposed a bug where the final library
-had an RPATH encoded into it which still pointed to the sysroot.
-This works around the issue until it gets sorted out upstream.
+There is a bug where RPATHs could end up containing sysroot values when
+cross compiling which is obviously incorrect. Strip out sysroot components
+from libdir when building RPATH values to avoid this.
 
-Fix suggested by Richard Purdie <richard.purdie@intel.com>
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
-Updated by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00009.html]
 
 diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
 --- a/build-aux/ltmain.in
diff --git a/meta/recipes-devtools/libtool/libtool/fix-rpath.patch b/meta/recipes-devtools/libtool/libtool/0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch
similarity index 57%
rename from meta/recipes-devtools/libtool/libtool/fix-rpath.patch
rename to meta/recipes-devtools/libtool/libtool/0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch
index a2ec9473e76..50d47d9f7a8 100644
--- a/meta/recipes-devtools/libtool/libtool/fix-rpath.patch
+++ b/meta/recipes-devtools/libtool/libtool/0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch
@@ -1,18 +1,21 @@
-We don't want to add RPATHS which match default linker
-search paths, they're a waste of space. This patch
-filters libtools list and removes the ones we don't need.
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Subject: [PATCH 05/12] ltmain.in: Don't encode RATHS which match default linker paths
 
-RP 23/9/2011
+We don't want to add RPATHS which match default linker search paths, they're
+a waste of space. This patch filters libtools list of paths to encoode and
+removes the ones we don't need.
 
-Upstream-Status: Pending
+Libtool may be passed link paths of the form "/usr/lib/../lib" so normalize
+the paths before comparision.
 
-Updated by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Index: libtool-2.4.2/build-aux/ltmain.in
-===================================================================
---- libtool-2.4.2.orig/build-aux/ltmain.in
-+++ libtool-2.4.2/build-aux/ltmain.in
-@@ -7286,8 +7286,14 @@ EOF
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00013.html]
+
+diff -u b/build-aux/ltmain.in b/build-aux/ltmain.in
+--- b/build-aux/ltmain.in
++++ b/build-aux/ltmain.in	2012-08-22 11:01:34.191345989 -0700
+@@ -7286,8 +7286,16 @@
  		  esac
  		fi
  	      else
@@ -20,8 +23,10 @@ Index: libtool-2.4.2/build-aux/ltmain.in
 -		func_append dep_rpath " $flag"
 +                # We only want to hardcode in an rpath if it isn't in the
 +                # default dlsearch path.
++                func_normal_abspath "$libdir"
++                libdir_norm=$func_normal_abspath_result
 +	        case " $sys_lib_dlsearch_path " in
-+	        *" $libdir "*) ;;
++	        *" $libdir_norm "*) ;;
 +	        *) eval flag=\"$hardcode_libdir_flag_spec\"
 +                   func_append dep_rpath " $flag"
 +                   ;;
@@ -29,7 +34,7 @@ Index: libtool-2.4.2/build-aux/ltmain.in
  	      fi
  	    elif test -n "$runpath_var"; then
  	      case "$perm_rpath " in
-@@ -8019,8 +8025,14 @@ EOF
+@@ -8019,8 +8027,16 @@
  	      esac
  	    fi
  	  else
@@ -37,8 +42,10 @@ Index: libtool-2.4.2/build-aux/ltmain.in
 -	    func_append rpath " $flag"
 +            # We only want to hardcode in an rpath if it isn't in the
 +            # default dlsearch path.
++            func_normal_abspath "$libdir"
++            libdir_norm=$func_normal_abspath_result
 +	    case " $sys_lib_dlsearch_path " in
-+	    *" $libdir "*) ;;
++	    *" $libdir_norm "*) ;;
 +	    *) eval flag=\"$hardcode_libdir_flag_spec\"
 +               rpath+=" $flag"
 +               ;;
@@ -46,7 +53,7 @@ Index: libtool-2.4.2/build-aux/ltmain.in
  	  fi
  	elif test -n "$runpath_var"; then
  	  case "$perm_rpath " in
-@@ -8070,8 +8082,14 @@ EOF
+@@ -8070,8 +8086,14 @@
  	      esac
  	    fi
  	  else
diff --git a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch b/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch
similarity index 60%
rename from meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
rename to meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch
index 1bd95980c07..999971241fa 100644
--- a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
+++ b/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch
@@ -1,16 +1,18 @@
-Upstream-Status: Pending
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Subject: [PATCH 06/12] libtool.m4: Handle "/" as a sysroot correctly
 
-This patch updates libtool.m4 (and its output) to resolve a problem
-with variable 'lt_sysroot' not being properly updated if the option
-'--with[-libtool]-sysroot' is not provided when running the 'configure'
-script for a package.
+Update libtool.m4 to resolve a problem with lt_sysroot not being properly
+updated if the option '--with[-libtool]-sysroot' is not provided when
+running the 'configure' script for a package so that "/" as a sysroot
+is handled correctly by libtool.
 
-I have also reported the problem to libtool here
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
+Upstream Report:
 http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
 
-Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
-Updated by: Robert Yang <liezhi.yang@windriver.com>
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00018.html]
+
 ---
 diff --git a/m4/libtool.m4 b/m4/libtool.m4
 --- a/m4/libtool.m4
diff --git a/meta/recipes-devtools/libtool/libtool/0001-libtool-Fix-support-for-NIOS2-processor.patch b/meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-support-for-NIOS2-processor.patch
similarity index 90%
rename from meta/recipes-devtools/libtool/libtool/0001-libtool-Fix-support-for-NIOS2-processor.patch
rename to meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-support-for-NIOS2-processor.patch
index bbd36d8dc1c..395464e9084 100644
--- a/meta/recipes-devtools/libtool/libtool/0001-libtool-Fix-support-for-NIOS2-processor.patch
+++ b/meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-support-for-NIOS2-processor.patch
@@ -1,7 +1,5 @@
-From df2cd898e48208f26320d40c3ed6b19c75c27142 Mon Sep 17 00:00:00 2001
 From: Marek Vasut <marex@denx.de>
-Date: Thu, 17 Sep 2015 00:43:15 +0200
-Subject: [PATCH] libtool: Fix support for NIOS2 processor
+Subject: [PATCH 07/12] libtool: Fix support for NIOS2 processor
 
 The name of the system contains the string "nios2". This string
 is caught by the some of the greedy checks for OS/2 in libtool,
@@ -13,7 +11,10 @@ checks to prevent the OS/2 check incorrectly trapping the nios2
 as well.
 
 Signed-off-by: Marek Vasut <marex@denx.de>
-Upstream-Status: Submitted
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00021.html]
+
 ---
  build-aux/ltmain.in | 20 ++++++++++++++++++++
  1 file changed, 20 insertions(+)
diff --git a/meta/recipes-devtools/libtool/libtool/0001-libtool-Check-for-static-libs-for-internal-compiler-.patch b/meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch
similarity index 71%
rename from meta/recipes-devtools/libtool/libtool/0001-libtool-Check-for-static-libs-for-internal-compiler-.patch
rename to meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch
index 8c7c39feb6f..afffdb9fd49 100644
--- a/meta/recipes-devtools/libtool/libtool/0001-libtool-Check-for-static-libs-for-internal-compiler-.patch
+++ b/meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch
@@ -1,8 +1,7 @@
-From 40a2da75e6d95cc7c498ebda95ab19ae0db2ebfb Mon Sep 17 00:00:00 2001
+From b9993338080325a6e2b2ec94ca0ece80e7fa3fb6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 26 Jan 2019 12:54:26 -0800
-Subject: [PATCH] libtool: Check for static libs for internal compiler
- libraries
+Subject: [PATCH 08/12] libtool: Check for static libs for internal compiler libraries
 
 Libtool checks only for libraries linked as -l* when trying to
 find internal compiler libraries. Clang, however uses the absolute
@@ -10,11 +9,13 @@ path to link its internal libraries e.g. compiler_rt. This patch
 handles clang's statically linked libraries when finding internal
 compiler libraries.
 
-https://crbug.com/749263
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Upstream-Status: Submitted [https://debbugs.gnu.org/cgi/bugreport.cgi?bug=27866]
+https://crbug.com/749263
+https://debbugs.gnu.org/cgi/bugreport.cgi?bug=27866
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00016.html]
 ---
  m4/libtool.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch b/meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
similarity index 79%
rename from meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
rename to meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
index 2e9908725e0..348cd3c1ae8 100644
--- a/meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
+++ b/meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
@@ -1,7 +1,5 @@
-From dfbbbd359e43e0a55fbea06f2647279ad8761cb9 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 24 Mar 2021 03:04:13 +0000
-Subject: [PATCH] Makefile.am: make sure autoheader run before autoconf
+Subject: [PATCH 09/12] Makefile.am: make sure autoheader run before autoconf
 
 autoheader will update ../libtool-2.4.6/libltdl/config-h.in which
 autoconf needs, so there comes a race sometimes as below:
@@ -10,9 +8,11 @@ autoconf needs, so there comes a race sometimes as below:
 
 So make sure autoheader run before autoconf to avoid this race.
 
-Upstream-Status: Submitted [libtool-patches@gnu.org maillist]
-
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00015.html]
+
 ---
  Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-automake.patch b/meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch
similarity index 75%
rename from meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-automake.patch
rename to meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch
index 87f84923468..cd963ef1be8 100644
--- a/meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-automake.patch
+++ b/meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch
@@ -1,7 +1,5 @@
-From e82c06584f02e3e4487aa73aa05981e2a35dc6d1 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
-Date: Tue, 13 Apr 2021 07:17:29 +0000
-Subject: [PATCH] Makefile.am: make sure autoheader run before automake
+Subject: [PATCH 10/12] Makefile.am: make sure autoheader run before automake
 
 When use automake to generate Makefile.in from Makefile.am, there
 comes below race:
@@ -10,7 +8,10 @@ comes below race:
 It is because the file config-h.in in updating process by autoheader,
 so make automake run after autoheader to avoid the above race.
 
-Upstream-Status: Submitted [libtool-patches@gnu.org maillist]
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00020.html]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
diff --git a/meta/recipes-devtools/libtool/libtool/lto-prefix.patch b/meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch
similarity index 82%
rename from meta/recipes-devtools/libtool/libtool/lto-prefix.patch
rename to meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch
index 2bd010b8e48..d46eb18977d 100644
--- a/meta/recipes-devtools/libtool/libtool/lto-prefix.patch
+++ b/meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch
@@ -1,9 +1,13 @@
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Subject: [PATCH 11/12] ltmain.in: Handle prefix-map compiler options correctly
+
 If lto is enabled, we need the prefix-map variables to be passed to the linker.
 Add these to the list of options libtool passes through.
 
-Upstream-Status: Pending
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
+Upstream-Status: Sumbitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00019.html]
+
 Index: libtool-2.4.6/build-aux/ltmain.in
 ===================================================================
 --- libtool-2.4.6.orig/build-aux/ltmain.in
diff --git a/meta/recipes-devtools/libtool/libtool/debian-no_hostname.patch b/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
old mode 100755
new mode 100644
similarity index 55%
rename from meta/recipes-devtools/libtool/libtool/debian-no_hostname.patch
rename to meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
index 5add0cca3bf..64f911d46c6
--- a/meta/recipes-devtools/libtool/libtool/debian-no_hostname.patch
+++ b/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
@@ -1,10 +1,16 @@
-libtool: remove host specific info from header file
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Subject: [PATCH 12/12] libtool.m4: For reproducibility stop encoding hostname in libtool script
+
+For reproducibilty, stop encoding the hostname into the libtool script, this isn't
+really adding much to debugging and most distros are carrying such a patch now as
+reproducibility is important.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 https://sources.debian.org/data/main/libt/libtool/2.4.6-10/debian/patches/
         no_hostname.patch
 
-Upstream-Status: Inappropriate [not author]
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00011.html]
 
 ---
 Index: libtool-2.4.6/m4/libtool.m4
diff --git a/meta/recipes-devtools/libtool/libtool/fixinstall.patch b/meta/recipes-devtools/libtool/libtool/fixinstall.patch
index 8f343bf436a..48330d82fbf 100644
--- a/meta/recipes-devtools/libtool/libtool/fixinstall.patch
+++ b/meta/recipes-devtools/libtool/libtool/fixinstall.patch
@@ -27,9 +27,9 @@ diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
  
 -	if test -n "$relink_command"; then
 +	if test "$fast_install" = no && test -n "$relink_command"; then
-       # Strip any trailing slash from the destination.
-       func_stripname '' '/' "$libdir"
-       destlibdir=$func_stripname_result
+ 	  # Strip any trailing slash from the destination.
+ 	  func_stripname '' '/' "$libdir"
+	  destlibdir=$func_stripname_result
 @@ -2394,7 +2394,7 @@ func_mode_install ()
  	  shift
  
diff --git a/meta/recipes-devtools/libtool/libtool/norm-rpath.patch b/meta/recipes-devtools/libtool/libtool/norm-rpath.patch
deleted file mode 100644
index 1e4c65e024d..00000000000
--- a/meta/recipes-devtools/libtool/libtool/norm-rpath.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-libtool: normalize link paths before considering for RPATH
-
-Libtool may be passed link paths of the form "/usr/lib/../lib", which
-fool its detection code into thinking it should be included as an
-RPATH in the generated binary.  Normalize before comparision.
-
-Signed-off-by: Andy Ross <andy.ross@windriver.com>
-Upstream-Status: Pending
-
-Updated by: Robert Yang <liezhi.yang@windriver.com>
-
-diff -ur a/build-aux/ltmain.in b/build-aux/ltmain.in
---- a/build-aux/ltmain.in	2012-08-16 13:58:55.058900363 -0700
-+++ b/build-aux/ltmain.in	2012-08-22 11:01:34.191345989 -0700
-@@ -7288,8 +7288,10 @@
- 	      else
-                 # We only want to hardcode in an rpath if it isn't in the
-                 # default dlsearch path.
-+                func_normal_abspath "$libdir"
-+                libdir_norm=$func_normal_abspath_result
- 	        case " $sys_lib_dlsearch_path " in
--	        *" $libdir "*) ;;
-+	        *" $libdir_norm "*) ;;
- 	        *) eval flag=\"$hardcode_libdir_flag_spec\"
-                    func_append dep_rpath " $flag"
-                    ;;
-@@ -8027,8 +8029,10 @@
- 	  else
-             # We only want to hardcode in an rpath if it isn't in the
-             # default dlsearch path.
-+            func_normal_abspath "$libdir"
-+            libdir_norm=$func_normal_abspath_result
- 	    case " $sys_lib_dlsearch_path " in
--	    *" $libdir "*) ;;
-+	    *" $libdir_norm "*) ;;
- 	    *) eval flag=\"$hardcode_libdir_flag_spec\"
-                rpath+=" $flag"
-                ;;
diff --git a/meta/recipes-devtools/libtool/libtool/trailingslash.patch b/meta/recipes-devtools/libtool/libtool/trailingslash.patch
deleted file mode 100644
index e8824d7db9e..00000000000
--- a/meta/recipes-devtools/libtool/libtool/trailingslash.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Pending
-
-A command like /bin/sh ../../i586-poky-linux-libtool   --mode=install /usr/bin/install -c   gck-roots-store-standalone.la '/media/data1/builds/poky1/tmp/work/core2-poky-linux/gnome-keyring-2.26.1-r1/image/usr/lib/gnome-keyring/standalone/' fails (e.g. gnome-keyring or pulseaudio)
-
-This is because libdir has a trailing slash which breaks the comparision.
-
-RP 2/1/10
-
-Merged a patch received from Gary Thomas <gary@mlbassoc.com>
-
-Date: 2010/07/12
-Nitin A Kamble <nitin.a.kamble@intel.com>
-
-Updated by: Robert Yang <liezhi.yang@windriver.com>
-
-diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
---- a/build-aux/ltmain.in
-+++ b/build-aux/ltmain.in
-@@ -2356,8 +2356,15 @@ func_mode_install ()
- 	func_append dir "$objdir"
- 
- 	if test -n "$relink_command"; then
-+      # Strip any trailing slash from the destination.
-+      func_stripname '' '/' "$libdir"
-+      destlibdir=$func_stripname_result
-+
-+      func_stripname '' '/' "$destdir"
-+      s_destdir=$func_stripname_result
-+
- 	  # Determine the prefix the user has applied to our future dir.
--	  inst_prefix_dir=`$ECHO "$destdir" | $SED -e "s%$libdir\$%%"`
-+	  inst_prefix_dir=`$ECHO "X$s_destdir" | $Xsed -e "s%$destlibdir\$%%"`
- 
- 	  # Don't allow the user to place us outside of our expected
- 	  # location b/c this prevents finding dependent libraries that
-- 
2.32.0


