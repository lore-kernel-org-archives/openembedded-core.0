Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.9784.1620227953647534844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gjyy8787;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id g14so2494560edy.6
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hC5JU+s+61dZis5H+celoTqlLEBrp6YEdoUW+9Ra79w=;
        b=Gjyy8787kGi8k3K1OGRcXtg76+C9n6Cj4eQJxMGh0kKXmbeJfRtl0WFdA+dPmN9NHn
         WY4QAzY1EYTlfceAmgujAtecbEI9IVBvBvKPUUjsqRrdOCI7Kya4yCrPOYoWQlcv4c1E
         6Z/7lLJB2YZjEVgudOt6OIy/7sK7VN0IJ4DnE7ax01yoT0sDD+UvRfsrMB5gbUh00kzK
         LvxbP4Lnl5KbXBGcwtDxIL4+eeCXOXWiAdy/T0YtBA9sMbKpIDLEjK/DY4NgVDu6XiVk
         qL/3Ihy0RkfA1f00Zaq52kgQpj4IlmVYmzqxmfdsoUIhaja200mELl8cLhcytDcf+tsv
         YAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hC5JU+s+61dZis5H+celoTqlLEBrp6YEdoUW+9Ra79w=;
        b=Q8H9dA3YY5Q0NCLGJeezcj3oslIWjkTinQUPG7DYZRFReQesrLOghK/AcoVY0bCmKf
         97XrgLeKlwqghzmUC2qYw9yvXg92CMWtsBxN3zrXMGGjapPup1nQVC2bakbg8WcI/LAa
         iOkmQcv5nv1Gs1otb7KH3sKOhKdhJH0n0YgzNNulovECIrIf9nHhwQ6qMHOnTIeU526p
         iCqbnVqgCdDvTolruiMML2ur2YTjGeZtwqjsUqWcx4xxKgatqXgZQEmIiWy6fMA0T3Ie
         mSjvDEJxXmtoh9xI9Gzgkhmj+WKwdOKCSdpCrVKiIhI3N0TwIwfmRtKCXYiYXBveLcgi
         JdyQ==
X-Gm-Message-State: AOAM532R4zea3qA8sTvqXBlHT9+ju/zKxEyedr/JcPYo/R9fLjlvdALX
	2kcTdu84eLUokONAhA+y8foBBNfPz7Zk3Q==
X-Google-Smtp-Source: ABdhPJysIZhuuxZURxcgVX8HJ+zHYZZ6zzRRwba1wz/1YPH4Wx9yWgr6kPF1MyPXoQ7EAmKhltZdog==
X-Received: by 2002:a50:9fa8:: with SMTP id c37mr17751392edf.48.1620227952180;
        Wed, 05 May 2021 08:19:12 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:11 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/61] gnupg: upgrade 2.2.27 -> 2.3.1
Date: Wed,  5 May 2021 17:18:09 +0200
Message-Id: <20210505151850.660512-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove 0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch
as upstream has removed the .m4 files.

Rebase other patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ig-to-find-pth-instead-of-pth-config.patch | 105 ------------------
 ...-a-custom-value-for-the-location-of-.patch |   6 +-
 ...use-pkgconfig-instead-of-npth-config.patch |  73 +++++++-----
 .../0003-dirmngr-uses-libgpg-error.patch      |  17 +--
 .../gnupg/gnupg/relocate.patch                |  20 ++--
 .../gnupg/{gnupg_2.2.27.bb => gnupg_2.3.1.bb} |   3 +-
 6 files changed, 68 insertions(+), 156 deletions(-)
 delete mode 100644 meta/recipes-support/gnupg/gnupg/0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch
 rename meta/recipes-support/gnupg/{gnupg_2.2.27.bb => gnupg_2.3.1.bb} (94%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch b/meta/recipes-support/gnupg/gnupg/0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch
deleted file mode 100644
index 5c9c022226..0000000000
--- a/meta/recipes-support/gnupg/gnupg/0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 59a3c76d4016ffc615f1c45184f4c6820061d69c Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Wed, 16 Aug 2017 11:14:12 +0800
-Subject: [PATCH 1/4] Use pkg-config to find pth instead of pth-config.
-
-Upstream-Status: Denied
-[not submitted but they've been clear they don't want a pkg-config
-dependency]
-
-RP 2014/5/22
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Rebase to 2.1.23
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- m4/gnupg-pth.m4 | 53 ++++++++---------------------------------------------
- 1 file changed, 8 insertions(+), 45 deletions(-)
-
-diff --git a/m4/gnupg-pth.m4 b/m4/gnupg-pth.m4
-index 6dc9e0e..5892531 100644
---- a/m4/gnupg-pth.m4
-+++ b/m4/gnupg-pth.m4
-@@ -17,33 +17,9 @@ dnl implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- # Taken and modified from the m4 macros which come with Pth.
- AC_DEFUN([GNUPG_PTH_VERSION_CHECK],
-   [
--    _pth_version=`$PTH_CONFIG --version | awk 'NR==1 {print [$]3}'`
-     _req_version="ifelse([$1],,1.2.0,$1)"
-+    PKG_CHECK_MODULES(PTH, [pth >= $_req_version], [have_pth=yes], [have_pth=no])
- 
--    AC_MSG_CHECKING(for PTH - version >= $_req_version)
--    for _var in _pth_version _req_version; do
--        eval "_val=\"\$${_var}\""
--        _major=`echo $_val | sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\([[ab.]]\)\([[0-9]]*\)/\1/'`
--        _minor=`echo $_val | sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\([[ab.]]\)\([[0-9]]*\)/\2/'`
--        _rtype=`echo $_val | sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\([[ab.]]\)\([[0-9]]*\)/\3/'`
--        _micro=`echo $_val | sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\([[ab.]]\)\([[0-9]]*\)/\4/'`
--        case $_rtype in
--            "a" ) _rtype=0 ;;
--            "b" ) _rtype=1 ;;
--            "." ) _rtype=2 ;;
--        esac
--        _hex=`echo dummy | awk '{ printf("%d%02d%1d%02d", major, minor, rtype, micro); }' \
--              "major=$_major" "minor=$_minor" "rtype=$_rtype" "micro=$_micro"`
--        eval "${_var}_hex=\"\$_hex\""
--    done
--    have_pth=no
--    if test ".$_pth_version_hex" != .; then
--        if test ".$_req_version_hex" != .; then
--            if test $_pth_version_hex -ge $_req_version_hex; then
--                have_pth=yes
--            fi
--        fi
--    fi
-     if test $have_pth = yes; then
-        AC_MSG_RESULT(yes)
-        AC_MSG_CHECKING([whether PTH installation is sane])
-@@ -51,9 +27,9 @@ AC_DEFUN([GNUPG_PTH_VERSION_CHECK],
-          _gnupg_pth_save_cflags=$CFLAGS
-          _gnupg_pth_save_ldflags=$LDFLAGS
-          _gnupg_pth_save_libs=$LIBS
--         CFLAGS="$CFLAGS `$PTH_CONFIG --cflags`"
--         LDFLAGS="$LDFLAGS `$PTH_CONFIG --ldflags`"
--         LIBS="$LIBS `$PTH_CONFIG --libs --all`"
-+         CFLAGS="$CFLAGS $PTH_CFLAGS"
-+         LDFLAGS="$LDFLAGS $PTH_LDFLAGS"
-+         LIBS="$LIBS $PTH_LIBS"
-          AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pth.h>
-                                          ],
-                                          [[ pth_init ();]])],
-@@ -80,26 +56,13 @@ AC_DEFUN([GNUPG_PTH_VERSION_CHECK],
- # PTH_CLFAGS and PTH_LIBS are AS_SUBST.
- #
- AC_DEFUN([GNUPG_PATH_PTH],
--[ AC_ARG_WITH(pth-prefix,
--             AC_HELP_STRING([--with-pth-prefix=PFX],
--                           [prefix where GNU Pth is installed (optional)]),
--     pth_config_prefix="$withval", pth_config_prefix="")
--  if test x$pth_config_prefix != x ; then
--     PTH_CONFIG="$pth_config_prefix/bin/pth-config"
--  fi
--  AC_PATH_PROG(PTH_CONFIG, pth-config, no)
-+[
-   tmp=ifelse([$1], ,1.3.7,$1)
--  if test "$PTH_CONFIG" != "no"; then
--    GNUPG_PTH_VERSION_CHECK($tmp)
--    if test $have_pth = yes; then      
--       PTH_CFLAGS=`$PTH_CONFIG --cflags`
--       PTH_LIBS=`$PTH_CONFIG --ldflags`
--       PTH_LIBS="$PTH_LIBS `$PTH_CONFIG --libs --all`"
--       AC_DEFINE(HAVE_PTH, 1,
-+  GNUPG_PTH_VERSION_CHECK($tmp)
-+  if test $have_pth = yes; then
-+      AC_DEFINE(HAVE_PTH, 1,
-                 [Defined if the GNU Pth is available])
--    fi
-   fi
-   AC_SUBST(PTH_CFLAGS)
-   AC_SUBST(PTH_LIBS)
- ])
--
--- 
-1.8.3.1
-
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index a0af2d48dc..ecd6263626 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From abc5c396aaddaef2e6811362e3e0cc0da28c2b34 Mon Sep 17 00:00:00 2001
+From 52ba9d34cd9317145ee8a93afd5d73dd0cbf3182 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 64cb8c6..3fe9027 100644
+index 7a2d410..14a7203 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1824,7 +1824,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1841,7 +1841,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 6d86e5c99b..d3790ac782 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,7 +1,7 @@
-From 53c2aec2e13f4e2d09be7148869c862f07dfdd4d Mon Sep 17 00:00:00 2001
+From 15668161c351aee5f29152db2972b1648da11210 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
-Subject: [PATCH 2/4] use pkgconfig instead of npth config
+Subject: [PATCH] use pkgconfig instead of npth config
 
 Upstream-Status: Inappropriate [openembedded specific]
 
@@ -9,29 +9,45 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
 Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
- m4/npth.m4 | 34 ++++++++--------------------------
- 1 file changed, 8 insertions(+), 26 deletions(-)
+ m4/npth.m4 | 53 ++++++++---------------------------------------------
+ 1 file changed, 8 insertions(+), 45 deletions(-)
 
 diff --git a/m4/npth.m4 b/m4/npth.m4
-index 17c2644..15a931b 100644
+index 06cdaee..4adda01 100644
 --- a/m4/npth.m4
 +++ b/m4/npth.m4
-@@ -17,10 +17,10 @@ AC_DEFUN([_AM_PATH_NPTH_CONFIG],
+@@ -19,25 +19,10 @@ AC_DEFUN([_AM_PATH_NPTH_CONFIG],
    if test "x$npth_config_prefix" != x ; then
        NPTH_CONFIG="$npth_config_prefix/bin/npth-config"
    fi
--  AC_PATH_PROG(NPTH_CONFIG, npth-config, no)
 +  AC_PATH_PROG(PKGCONFIG, pkg-config, no)
  
+-  use_gpgrt_config=""
+-  if test x"$NPTH_CONFIG" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-    if $GPGRT_CONFIG npth --exists; then
+-      NPTH_CONFIG="$GPGRT_CONFIG npth"
+-      AC_MSG_NOTICE([Use gpgrt-config as npth-config])
+-      use_gpgrt_config=yes
+-    fi
+-  fi
+-  if test -z "$use_gpgrt_config"; then
+-    AC_PATH_PROG(NPTH_CONFIG, npth-config, no)
+-  fi
+-
 -  if test "$NPTH_CONFIG" != "no" ; then
--    npth_version=`$NPTH_CONFIG --version`
+-    if test -z "$use_gpgrt_config"; then
+-      npth_version=`$NPTH_CONFIG --version`
+-    else
+-      npth_version=`$NPTH_CONFIG --modversion`
+-    fi
 +  if test "$PKGCONFIG" != "no" ; then
 +    npth_version=`$PKGCONFIG --modversion npth`
    fi
    npth_version_major=`echo $npth_version | \
                 sed 's/\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
-@@ -45,7 +45,7 @@ AC_DEFUN([AM_PATH_NPTH],
+@@ -62,7 +47,7 @@ AC_DEFUN([AM_PATH_NPTH],
  
    AC_MSG_CHECKING(for NPTH - version >= $min_npth_version)
    ok=no
@@ -40,7 +56,7 @@ index 17c2644..15a931b 100644
      req_major=`echo $min_npth_version | \
                 sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
      req_minor=`echo $min_npth_version | \
-@@ -66,28 +66,9 @@ AC_DEFUN([AM_PATH_NPTH],
+@@ -83,32 +68,9 @@ AC_DEFUN([AM_PATH_NPTH],
    fi
    if test $ok = yes; then
      AC_MSG_RESULT([yes ($npth_version)])
@@ -48,20 +64,24 @@ index 17c2644..15a931b 100644
 -    AC_MSG_RESULT(no)
 -  fi
 -  if test $ok = yes; then
--     # If we have a recent NPTH, we should also check that the
--     # API is compatible.
--     if test "$req_npth_api" -gt 0 ; then
+-    # If we have a recent NPTH, we should also check that the
+-    # API is compatible.
+-    if test "$req_npth_api" -gt 0 ; then
+-      if test -z "$use_gpgrt_config"; then
 -        tmp=`$NPTH_CONFIG --api-version 2>/dev/null || echo 0`
--        if test "$tmp" -gt 0 ; then
--           AC_MSG_CHECKING([NPTH API version])
--           if test "$req_npth_api" -eq "$tmp" ; then
--             AC_MSG_RESULT([okay])
--           else
--             ok=no
--             AC_MSG_RESULT([does not match. want=$req_npth_api got=$tmp])
--           fi
+-      else
+-        tmp=`$NPTH_CONFIG --variable=api_version 2>/dev/null || echo 0`
+-      fi
+-      if test "$tmp" -gt 0 ; then
+-        AC_MSG_CHECKING([NPTH API version])
+-        if test "$req_npth_api" -eq "$tmp" ; then
+-          AC_MSG_RESULT([okay])
+-        else
+-          ok=no
+-          AC_MSG_RESULT([does not match. want=$req_npth_api got=$tmp])
 -        fi
--     fi
+-      fi
+-    fi
 -  fi
 -  if test $ok = yes; then
 -    NPTH_CFLAGS=`$NPTH_CONFIG --cflags`
@@ -70,9 +90,9 @@ index 17c2644..15a931b 100644
 +    NPTH_LIBS=`$PKGCONFIG --libs npth`
 +    AC_MSG_WARN([[GOT HERE - $NPTH_LIBS ]])
      ifelse([$2], , :, [$2])
-     npth_config_host=`$NPTH_CONFIG --host 2>/dev/null || echo none`
-     if test x"$npth_config_host" != xnone ; then
-@@ -103,6 +84,7 @@ AC_DEFUN([AM_PATH_NPTH],
+     if test -z "$use_gpgrt_config"; then
+       npth_config_host=`$NPTH_CONFIG --host 2>/dev/null || echo none`
+@@ -128,6 +90,7 @@ AC_DEFUN([AM_PATH_NPTH],
        fi
      fi
    else
@@ -80,6 +100,3 @@ index 17c2644..15a931b 100644
      NPTH_CFLAGS=""
      NPTH_LIBS=""
      ifelse([$3], , :, [$3])
--- 
-1.8.3.1
-
diff --git a/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch b/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
index a13b4d5fb5..b4106d3620 100644
--- a/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
+++ b/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
@@ -1,4 +1,4 @@
-From 6c75656b68cb6e38b039ae532bd39437cd6daec5 Mon Sep 17 00:00:00 2001
+From 9ace8f1b68ab708c44dce4c0152b975fbceb0398 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:18:01 +0800
 Subject: [PATCH] dirmngr uses libgpg error
@@ -11,18 +11,19 @@ Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 ---
- dirmngr/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
+ dirmngr/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dirmngr/Makefile.am b/dirmngr/Makefile.am
-index 00d3c42..450d873 100644
+index 77ca3f5..1446775 100644
 --- a/dirmngr/Makefile.am
 +++ b/dirmngr/Makefile.am
-@@ -101,6 +101,7 @@ dirmngr_LDADD = $(libcommonpth) \
+@@ -86,7 +86,7 @@ endif
+ dirmngr_LDADD = $(libcommonpth) \
          $(DNSLIBS) $(LIBASSUAN_LIBS) \
  	$(LIBGCRYPT_LIBS) $(KSBA_LIBS) $(NPTH_LIBS) \
- 	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) $(NETLIBS) \
-+	$(GPG_ERROR_LIBS) \
-         $(dirmngr_robj)
+-	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) $(NETLIBS)
++	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) $(NETLIBS) $(GPG_ERROR_LIBS)
  if USE_LDAP
  dirmngr_LDADD += $(ldaplibs)
+ endif
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 7f7812cd46..9b0f0a8ce0 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From bd66af2ac7bb6d9294ac8055a55462ba7c4f9c9b Mon Sep 17 00:00:00 2001
+From d6992692d1c36983b709fe1ff049cc91ef2c408a Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 4b6e46e..58989b4 100644
+index 85e09c4..e1410e2 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -763,7 +763,7 @@ gnupg_socketdir (void)
+@@ -788,7 +788,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -24,7 +24,7 @@ index 4b6e46e..58989b4 100644
      }
  
    return name;
-@@ -789,7 +789,7 @@ gnupg_sysconfdir (void)
+@@ -814,7 +814,7 @@ gnupg_sysconfdir (void)
      }
    return name;
  #else /*!HAVE_W32_SYSTEM*/
@@ -33,7 +33,7 @@ index 4b6e46e..58989b4 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -818,7 +818,7 @@ gnupg_bindir (void)
+@@ -843,7 +843,7 @@ gnupg_bindir (void)
    else
      return rdir;
  #else /*!HAVE_W32_SYSTEM*/
@@ -42,7 +42,7 @@ index 4b6e46e..58989b4 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -831,7 +831,7 @@ gnupg_libexecdir (void)
+@@ -856,7 +856,7 @@ gnupg_libexecdir (void)
  #ifdef HAVE_W32_SYSTEM
    return gnupg_bindir ();
  #else /*!HAVE_W32_SYSTEM*/
@@ -51,7 +51,7 @@ index 4b6e46e..58989b4 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -845,7 +845,7 @@ gnupg_libdir (void)
+@@ -870,7 +870,7 @@ gnupg_libdir (void)
      name = xstrconcat (w32_rootdir (), DIRSEP_S "lib" DIRSEP_S "gnupg", NULL);
    return name;
  #else /*!HAVE_W32_SYSTEM*/
@@ -60,7 +60,7 @@ index 4b6e46e..58989b4 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -859,7 +859,7 @@ gnupg_datadir (void)
+@@ -884,7 +884,7 @@ gnupg_datadir (void)
      name = xstrconcat (w32_rootdir (), DIRSEP_S "share" DIRSEP_S "gnupg", NULL);
    return name;
  #else /*!HAVE_W32_SYSTEM*/
@@ -69,7 +69,7 @@ index 4b6e46e..58989b4 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -875,7 +875,7 @@ gnupg_localedir (void)
+@@ -900,7 +900,7 @@ gnupg_localedir (void)
                         NULL);
    return name;
  #else /*!HAVE_W32_SYSTEM*/
@@ -78,7 +78,7 @@ index 4b6e46e..58989b4 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -943,7 +943,7 @@ gnupg_cachedir (void)
+@@ -971,7 +971,7 @@ gnupg_cachedir (void)
      }
    return dir;
  #else /*!HAVE_W32_SYSTEM*/
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.27.bb b/meta/recipes-support/gnupg/gnupg_2.3.1.bb
similarity index 94%
rename from meta/recipes-support/gnupg/gnupg_2.2.27.bb
rename to meta/recipes-support/gnupg/gnupg_2.3.1.bb
index 1181c8341b..77331efc0b 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.27.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.1.bb
@@ -15,7 +15,6 @@ inherit autotools gettext texinfo pkgconfig
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0001-Use-pkg-config-to-find-pth-instead-of-pth-config.patch \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0003-dirmngr-uses-libgpg-error.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
@@ -25,7 +24,7 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI_append_class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "34e60009014ea16402069136e0a5f63d9b65f90096244975db5cea74b3d02399"
+SRC_URI[sha256sum] = "c498db346a9b9a4b399e514c8f56dfc0a888ce8f327f10376ff984452cd154ec"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.31.1

