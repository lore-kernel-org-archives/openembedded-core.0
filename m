Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.20858.1621847653731974665
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i5uXm7Ga;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id i7so22836378ejc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=An63NVDP/nhW7ASu0SHXozczOi20oEJ+HJNWXsQHrlo=;
        b=i5uXm7Ga9itYM73/9M1aLcSEqbitSNGUiqhtvQJ8PSHEKM3dPobLjvsFT0s5gGrL2N
         aIbfegs+6DNsrbr1V+Xqz60S+j+8cycqkrIqFtzCiYA6ZSr/QmllZDk4N+sAa8t76koB
         V/Q6vdlNQGlFQQzYZz1x85RmluVML0KGgTJBtNIjkaDExorJSvfQEKz/ulRfrewRy73h
         9ImBQYPfbuWEhrIWL0Y9gOmyGAZ020EHwk9Ih8Ebdc30IVUznGetDcGaJlEUq61O4gKH
         pBpznPq4X+yj/dwIB0hSIbiqEgCs9RyqnsCOMe9KdDUxZXzHwFuu71Mq8zR0v5MeuylD
         MF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=An63NVDP/nhW7ASu0SHXozczOi20oEJ+HJNWXsQHrlo=;
        b=hI3CIR+ifZUDZ+22kzzmsqcbN8HHZ5kK7dSYUPWQgG4UuefsSP1naDdc3gnBSuQ88E
         jF4cddUrm258oBQXoDvVlF6BVEG1W7YShO6TxBbmwHKnpcyuPRZlC632pQwsid32XgTs
         qOUrGZ80CeLS5AZOD4Gio9Ny2/kiwfEh1MEKKdKlJuSfmjsfi90FbKo3lONNu9nwgsS1
         s+0oE3c7wcODZ17iLvIvtURjphzKef85QX+4oqfYQY3Ge74HeRBjvlbJj77ZvHPTNNXk
         b5agDr0wf9AXam/r6j/Q6sBSuYPrf3dHisYXP9EeP5RLM3EgRFz/+UWVr5galHFHt5Qv
         9tqQ==
X-Gm-Message-State: AOAM531pIpYz5T0aOW7TERDfs7LsN0X0soGbf9Nu3+/Tg5yofdPSmnRi
	kqmLprObhsI6X5qzj9vGqP2k+DdSJCs=
X-Google-Smtp-Source: ABdhPJyc+2pUXkj0wiq+88slpPYtjDRPukAImQK2c+hLu+zTMm1nIm+jbxe3GKykE1rTSU0Nb+dQhA==
X-Received: by 2002:a17:906:a255:: with SMTP id bi21mr6351536ejb.323.1621847652278;
        Mon, 24 May 2021 02:14:12 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:11 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/21] libgpg-error: update 1.41 -> 1.42
Date: Mon, 24 May 2021 11:13:39 +0200
Message-Id: <20210524091347.419253-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...not-hardcode-gnu-libc-when-generatin.patch |  27 ++++
 .../libgpg-error/libgpg-error/fix-cross.patch |  28 ++++
 .../libgpg-error/libgpg-error/pkgconfig.patch | 129 ++++++++++--------
 ...gpg-error_1.41.bb => libgpg-error_1.42.bb} |   4 +-
 4 files changed, 130 insertions(+), 58 deletions(-)
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-configure.ac-do-not-hardcode-gnu-libc-when-generatin.patch
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/fix-cross.patch
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.41.bb => libgpg-error_1.42.bb} (87%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-configure.ac-do-not-hardcode-gnu-libc-when-generatin.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-configure.ac-do-not-hardcode-gnu-libc-when-generatin.patch
new file mode 100644
index 0000000000..0f6e309391
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-configure.ac-do-not-hardcode-gnu-libc-when-generatin.patch
@@ -0,0 +1,27 @@
+From 7437acb228678ea5d8288b930b4f5b72c3d449ed Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 24 May 2021 11:03:42 +0200
+Subject: [PATCH] configure.ac: do not hardcode gnu libc when generating
+ lock-obj
+
+This erroneously excluded e.g. musl libc.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c0aab53..6d46d13 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -603,7 +603,7 @@ if test x"$gl_use_threads" = xno; then
+   AC_MSG_NOTICE([generated src/lock-obj-pub.native.h for $host])
+ elif test x$cross_compiling = xyes; then
+   case $host in
+-    *-*-linux-gnu*)
++    *-*-linux-*)
+     AC_CHECK_TOOL(OBJDUMP, [objdump])
+     if test -n "$OBJDUMP"; then
+       lock_obj_h_generated=yes
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/fix-cross.patch b/meta/recipes-support/libgpg-error/libgpg-error/fix-cross.patch
new file mode 100644
index 0000000000..ae424cdb9a
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/fix-cross.patch
@@ -0,0 +1,28 @@
+From: David Michael <fedora.dm0@gmail.com>
+Date: Fri, 26 Mar 2021 07:06:50 +0000 (+0900)
+Subject: build: Fix generation of lock-obj-pub.native.h for cross build.
+X-Git-Url: http://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commitdiff_plain;h=33593864cd54143db594c4237bba41e14179061c
+
+build: Fix generation of lock-obj-pub.native.h for cross build.
+
+* src/gen-lock-obj.sh: Capture echo output with quotes.
+
+Fixes-commit: 99ae862a96a569724f49a604ebb7d3f6d2c2d374
+Signed-off-by: David Michael <fedora.dm0@gmail.com>
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+
+diff --git a/src/gen-lock-obj.sh b/src/gen-lock-obj.sh
+index a710f0c..258eec6 100755
+--- a/src/gen-lock-obj.sh
++++ b/src/gen-lock-obj.sh
+@@ -38,7 +38,7 @@
+ #     AWK=gawk ./gen-lock-obj.sh
+ #
+ 
+-if test -n `echo -n`; then
++if test -n "`echo -n`"; then
+     ECHO_C='\c'
+     ECHO_N=''
+ else
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 83054a9c44..aea8eba5fa 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -1,4 +1,4 @@
-From ec309e20b5a27d42a5fb915c328d61e924ab5f19 Mon Sep 17 00:00:00 2001
+From 62651c5c7b4a391f16dbe1b09c6e220efe5c8a35 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 29 Mar 2018 15:12:17 +0800
 Subject: [PATCH] support pkgconfig
@@ -12,15 +12,16 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Refactored for 1.33
 Signed-off-by: Armin Kuster <akuster808@gmail.com>
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+
 ---
- src/gpg-error.m4 | 142 +----------------------------------------------
- 1 file changed, 3 insertions(+), 139 deletions(-)
+ src/gpg-error.m4 | 159 +----------------------------------------------
+ 1 file changed, 3 insertions(+), 156 deletions(-)
 
 diff --git a/src/gpg-error.m4 b/src/gpg-error.m4
-index c9b235f..176bd6a 100644
+index d910754..76f045c 100644
 --- a/src/gpg-error.m4
 +++ b/src/gpg-error.m4
-@@ -26,139 +26,12 @@ dnl is added to the gpg_config_script_warn variable.
+@@ -27,156 +27,12 @@ dnl is added to the gpg_config_script_warn variable.
  dnl
  AC_DEFUN([AM_PATH_GPG_ERROR],
  [ AC_REQUIRE([AC_CANONICAL_HOST])
@@ -62,45 +63,78 @@ index c9b235f..176bd6a 100644
 -  min_gpg_error_version=ifelse([$1], ,1.33,$1)
 -  ok=no
 -
--  if test "$prefix" = NONE ; then
--    prefix_option_expanded=/usr/local
--  else
--    prefix_option_expanded="$prefix"
--  fi
--  if test "$exec_prefix" = NONE ; then
--    exec_prefix_option_expanded=$prefix_option_expanded
--  else
--    exec_prefix_option_expanded=$(prefix=$prefix_option_expanded eval echo $exec_prefix)
--  fi
--  libdir_option_expanded=$(prefix=$prefix_option_expanded exec_prefix=$exec_prefix_option_expanded eval echo $libdir)
+-  AC_PATH_PROG(GPGRT_CONFIG, gpgrt-config, no)
+-  if test "$GPGRT_CONFIG" != "no"; then
+-    # Determine gpgrt_libdir
+-    #
+-    # Get the prefix of gpgrt-config assuming it's something like:
+-    #   <PREFIX>/bin/gpgrt-config
+-    gpgrt_prefix=${GPGRT_CONFIG%/*/*}
+-    possible_libdir1=${gpgrt_prefix}/lib
+-    # Determine by using system libdir-format with CC, it's like:
+-    #   Normal style: /usr/lib
+-    #   GNU cross style: /usr/<triplet>/lib
+-    #   Debian style: /usr/lib/<multiarch-name>
+-    #   Fedora/openSUSE style: /usr/lib, /usr/lib32 or /usr/lib64
+-    # It is assumed that CC is specified to the one of host on cross build.
+-    if libdir_candidates=$(${CC:-cc} -print-search-dirs | \
+-          sed -n -e "/^libraries/{s/libraries: =//;s/:/\n/gp}"); then
+-      # From the output of -print-search-dirs, select valid pkgconfig dirs.
+-      libdir_candidates=$(for dir in $libdir_candidates; do
+-        if p=$(cd $dir 2>/dev/null && pwd); then
+-          test -d "$p/pkgconfig" && echo $p;
+-        fi
+-      done)
 -
--  if test -f $libdir_option_expanded/pkgconfig/gpg-error.pc; then
--    gpgrt_libdir=$libdir_option_expanded
--  else
--    if crt1_path=$(${CC:-cc} -print-file-name=crt1.o 2>/dev/null); then
--      if possible_libdir=$(cd ${crt1_path%/*} && pwd 2>/dev/null); then
--        if test -f $possible_libdir/pkgconfig/gpg-error.pc; then
--          gpgrt_libdir=$possible_libdir
+-      for possible_libdir0 in $libdir_candidates; do
+-        # possible_libdir0:
+-        #   Fallback candidate, the one of system-installed (by $CC)
+-        #   (/usr/<triplet>/lib, /usr/lib/<multiarch-name> or /usr/lib32)
+-        # possible_libdir1:
+-        #   Another candidate, user-locally-installed
+-        #   (<gpgrt_prefix>/lib)
+-        # possible_libdir2
+-        #   Most preferred
+-        #   (<gpgrt_prefix>/<triplet>/lib,
+-        #    <gpgrt_prefix>/lib/<multiarch-name> or <gpgrt_prefix>/lib32)
+-        if test "${possible_libdir0##*/}" = "lib"; then
+-          possible_prefix0=${possible_libdir0%/lib}
+-          possible_prefix0_triplet=${possible_prefix0##*/}
+-          if test -z "$possible_prefix0_triplet"; then
+-            continue
+-          fi
+-          possible_libdir2=${gpgrt_prefix}/$possible_prefix0_triplet/lib
+-        else
+-          possible_prefix0=${possible_libdir0%%/lib*}
+-          possible_libdir2=${gpgrt_prefix}${possible_libdir0#$possible_prefix0}
+-        fi
+-        if test -f ${possible_libdir2}/pkgconfig/gpg-error.pc; then
+-          gpgrt_libdir=${possible_libdir2}
+-        elif test -f ${possible_libdir1}/pkgconfig/gpg-error.pc; then
+-          gpgrt_libdir=${possible_libdir1}
+-        elif test -f ${possible_libdir0}/pkgconfig/gpg-error.pc; then
+-          gpgrt_libdir=${possible_libdir0}
 -        fi
--      fi
+-        if test -n "$gpgrt_libdir"; then break; fi
+-      done
+-    else
+-      # When we cannot determine system libdir-format, use this:
+-      gpgrt_libdir=${possible_libdir1}
 -    fi
+-  else
+-    unset GPGRT_CONFIG
 -  fi
 -
--  if test "$GPG_ERROR_CONFIG" = "no" -a -n "$gpgrt_libdir"; then
--    AC_PATH_PROG(GPGRT_CONFIG, gpgrt-config, no)
--    if test "$GPGRT_CONFIG" = "no"; then
--      unset GPGRT_CONFIG
+-  if test -n "$gpgrt_libdir"; then
+-    GPGRT_CONFIG="$GPGRT_CONFIG --libdir=$gpgrt_libdir"
+-    if $GPGRT_CONFIG gpg-error >/dev/null 2>&1; then
+-      GPG_ERROR_CONFIG="$GPGRT_CONFIG gpg-error"
+-      AC_MSG_NOTICE([Use gpgrt-config with $gpgrt_libdir as gpg-error-config])
+-      gpg_error_config_version=`$GPG_ERROR_CONFIG --modversion`
 -    else
--      GPGRT_CONFIG="$GPGRT_CONFIG --libdir=$gpgrt_libdir"
--      if $GPGRT_CONFIG gpg-error >/dev/null 2>&1; then
--        GPG_ERROR_CONFIG="$GPGRT_CONFIG gpg-error"
--        AC_MSG_NOTICE([Use gpgrt-config with $gpgrt_libdir as gpg-error-config])
--        gpg_error_config_version=`$GPG_ERROR_CONFIG --modversion`
--      else
--        unset GPGRT_CONFIG
--      fi
+-      unset GPGRT_CONFIG
 -    fi
--  else
+-  elif test "$GPG_ERROR_CONFIG" != "no"; then
 -    gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
 -  fi
 -  if test "$GPG_ERROR_CONFIG" != "no"; then
@@ -121,22 +155,6 @@ index c9b235f..176bd6a 100644
 -            fi
 -        fi
 -    fi
--    if test -z "$GPGRT_CONFIG" -a -n "$gpgrt_libdir"; then
--      if test "$major" -gt 1 -o "$major" -eq 1 -a "$minor" -ge 33; then
--        AC_PATH_PROG(GPGRT_CONFIG, gpgrt-config, no)
--        if test "$GPGRT_CONFIG" = "no"; then
--          unset GPGRT_CONFIG
--        else
--          GPGRT_CONFIG="$GPGRT_CONFIG --libdir=$gpgrt_libdir"
--          if $GPGRT_CONFIG gpg-error >/dev/null 2>&1; then
--            GPG_ERROR_CONFIG="$GPGRT_CONFIG gpg-error"
--            AC_MSG_NOTICE([Use gpgrt-config with $gpgrt_libdir as gpg-error-config])
--          else
--            unset GPGRT_CONFIG
--          fi
--        fi
--      fi
--    fi
 -  fi
 -  AC_MSG_CHECKING(for GPG Error - version >= $min_gpg_error_version)
 +  min_gpg_error_version=ifelse([$1], ,0.0,$1)
@@ -163,7 +181,7 @@ index c9b235f..176bd6a 100644
      fi
      if test x"$gpg_error_config_host" != xnone ; then
        if test x"$gpg_error_config_host" != x"$host" ; then
-@@ -174,15 +47,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
+@@ -192,15 +48,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
        fi
      fi
    else
@@ -179,6 +197,3 @@ index c9b235f..176bd6a 100644
 -  AC_SUBST(GPG_ERROR_MT_CFLAGS)
 -  AC_SUBST(GPG_ERROR_MT_LIBS)
  ])
--- 
-2.25.1
-
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb
similarity index 87%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.41.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.42.bb
index a0119729d8..c972d9a953 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb
@@ -17,9 +17,11 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
            file://0001-Do-not-fail-when-testing-config-scripts.patch \
+           file://fix-cross.patch \
+           file://0001-configure.ac-do-not-hardcode-gnu-libc-when-generatin.patch \
            "
 
-SRC_URI[sha256sum] = "64b078b45ac3c3003d7e352a5e05318880a5778c42331ce1ef33d1a0d9922742"
+SRC_URI[sha256sum] = "fc07e70f6c615f8c4f590a8e37a9b8dd2e2ca1e9408f8e60459c67452b925e23"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.31.1

