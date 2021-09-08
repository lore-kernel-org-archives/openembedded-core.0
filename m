Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.15610.1631124099130553358
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZNg+/lFI;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id i28so4587886wrb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xnNebcYsk+tLiUXlnY4pHkb1TjTVZyPuViNkq2/10wA=;
        b=ZNg+/lFIEVwQW1a/oGaTWMDneZK36/ynJVChTGzXbABdhwChXxbxvZ5fpdJbdgcsL7
         N63xMmmE81HxmIJhn8KVU7yUJNpPJWz7MjFScAyrNyHFpEhT3Stp5zlIxJHD5niIq6Qn
         w5zMFWGroSYbutjzSlPmVDx+1JGRXs9rr65gugIAvIyZ8esDKj8YQuB63Hrj/y9zNuMN
         BEhGyzpi4EtgcGUd10vg3kVP9IqPhqwH3n8tKgYQfPAtrzVdPlGqowsf3eWUkKYufXoJ
         mDRFhjbcolksjreeKoNmfujFeLXkekDCOsY4tJPoWyFARjPZS6xWqsgzkZN6tnt6bZa2
         rkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xnNebcYsk+tLiUXlnY4pHkb1TjTVZyPuViNkq2/10wA=;
        b=ZnbY9OW5Wt+2fT9pNCKMz43TIPuVn7WS57ldYeBAxPG44gMSzH5hiyvyFSFHAXKmfN
         t/hEY2I67GPhE7FZUD3T0sGD8CIhIZcrcTzr1Cxe7Ag+0C9UArcJdG0hM/QGfBYVpTa9
         L4nQCgiA9bdy2pMOr5CKvPKwxXr9k+sg6qyDGx0214d66oKn+KASoV5hYFrn9YLiWKyf
         ZFPOZZQtC+yEuq17+DOu6WDTA11VkjYO1vJr7CdENyo2KmRsdW8BmJtisEyQdWnb6cSW
         EIDXwdUFiNvzZtP7RIlNEm4UVSGoODau0fgAwSOwW/mmrTWBRkYGypkEJvjySzvUXeQi
         CW2A==
X-Gm-Message-State: AOAM533cAwUm7C0dtuaAIvAiTpkJ4PpPj2PpQEP+1ZvMgRV+vymJYHQ1
	TamR81yX9sRmEDTlNUD8qlglsFP6NgY=
X-Google-Smtp-Source: ABdhPJzkXtSm2sSS+WUtA52vqoqFxciuDyR3c/Dw50Km7PFoBEJe2heMldrCdZfLKaB/mxWZHKiKvA==
X-Received: by 2002:a5d:4dce:: with SMTP id f14mr5505415wru.204.1631124097725;
        Wed, 08 Sep 2021 11:01:37 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:37 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/26] pinentry: update 1.1.1 -> 1.2.0
Date: Wed,  8 Sep 2021 20:01:12 +0200
Message-Id: <20210908180125.103473-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

Rebase patches.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/oescripts.py     |   2 +-
 .../gpg-error_pkconf.patch                    | 126 ++++++++++--------
 .../libassuan_pkgconf.patch                   |   0
 .../{pinentry_1.1.1.bb => pinentry_1.2.0.bb}  |   2 +-
 4 files changed, 74 insertions(+), 56 deletions(-)
 rename meta/recipes-support/pinentry/{pinentry-1.1.1 => pinentry-1.2.0}/gpg-error_pkconf.patch (57%)
 rename meta/recipes-support/pinentry/{pinentry-1.1.1 => pinentry-1.2.0}/libassuan_pkgconf.patch (100%)
 rename meta/recipes-support/pinentry/{pinentry_1.1.1.bb => pinentry_1.2.0.bb} (93%)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 8a10ff357b..255994b0f8 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -167,7 +167,7 @@ class OEListPackageconfigTests(OEScriptTests):
     def test_packageconfig_flags_option_all(self):
         results = runCmd('%s/contrib/list-packageconfig-flags.py -a' % self.scripts_dir)
         expected_endlines = []
-        expected_endlines.append("pinentry-1.1.1")
+        expected_endlines.append("pinentry-1.2.0")
         expected_endlines.append("PACKAGECONFIG ncurses libcap")
         expected_endlines.append("PACKAGECONFIG[qt] --enable-pinentry-qt, --disable-pinentry-qt, qtbase-native qtbase")
         expected_endlines.append("PACKAGECONFIG[gtk2] --enable-pinentry-gtk2, --disable-pinentry-gtk2, gtk+ glib-2.0")
diff --git a/meta/recipes-support/pinentry/pinentry-1.1.1/gpg-error_pkconf.patch b/meta/recipes-support/pinentry/pinentry-1.2.0/gpg-error_pkconf.patch
similarity index 57%
rename from meta/recipes-support/pinentry/pinentry-1.1.1/gpg-error_pkconf.patch
rename to meta/recipes-support/pinentry/pinentry-1.2.0/gpg-error_pkconf.patch
index 537735dba8..507c0c3917 100644
--- a/meta/recipes-support/pinentry/pinentry-1.1.1/gpg-error_pkconf.patch
+++ b/meta/recipes-support/pinentry/pinentry-1.2.0/gpg-error_pkconf.patch
@@ -1,4 +1,4 @@
-From 7b60f1563ecdb7020c145de8a96cae1c0a66c595 Mon Sep 17 00:00:00 2001
+From 54a4c9d3e5f1897ed4b978d5cdee646ca7a4f637 Mon Sep 17 00:00:00 2001
 From: Armin Kuster <akuster@mvista.com>
 Date: Fri, 2 Sep 2005 11:50:01 +0000
 Subject: [PATCH] Add gtk+, avahi, dbus-0.34 (.36 coming soon) and
@@ -11,14 +11,14 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Armin Kuster <akuster@mvista.com>
 
 ---
- m4/gpg-error.m4 | 141 ++----------------------------------------------
- 1 file changed, 4 insertions(+), 137 deletions(-)
+ m4/gpg-error.m4 | 159 ++----------------------------------------------
+ 1 file changed, 4 insertions(+), 155 deletions(-)
 
 diff --git a/m4/gpg-error.m4 b/m4/gpg-error.m4
-index c9b235f..a4fd41c 100644
+index 56a5d07..c0bec1f 100644
 --- a/m4/gpg-error.m4
 +++ b/m4/gpg-error.m4
-@@ -25,141 +25,12 @@ dnl config script does not match the host specification the script
+@@ -26,159 +26,12 @@ dnl config script does not match the host specification the script
  dnl is added to the gpg_config_script_warn variable.
  dnl
  AC_DEFUN([AM_PATH_GPG_ERROR],
@@ -61,45 +61,79 @@ index c9b235f..a4fd41c 100644
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
+-  AC_PATH_PROG(GPGRT_CONFIG, gpgrt-config, no, [$prefix/bin:$PATH])
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
+-          sed -n -e "/^libraries/{s/libraries: =//;s/:/\\
+-/g;p;}"); then
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
@@ -120,22 +154,6 @@ index c9b235f..a4fd41c 100644
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
 +[
@@ -164,7 +182,7 @@ index c9b235f..a4fd41c 100644
      if test x"$gpg_error_config_host" != xnone ; then
        if test x"$gpg_error_config_host" != x"$host" ; then
    AC_MSG_WARN([[
-@@ -174,10 +45,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
+@@ -193,10 +46,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
        fi
      fi
    else
diff --git a/meta/recipes-support/pinentry/pinentry-1.1.1/libassuan_pkgconf.patch b/meta/recipes-support/pinentry/pinentry-1.2.0/libassuan_pkgconf.patch
similarity index 100%
rename from meta/recipes-support/pinentry/pinentry-1.1.1/libassuan_pkgconf.patch
rename to meta/recipes-support/pinentry/pinentry-1.2.0/libassuan_pkgconf.patch
diff --git a/meta/recipes-support/pinentry/pinentry_1.1.1.bb b/meta/recipes-support/pinentry/pinentry_1.2.0.bb
similarity index 93%
rename from meta/recipes-support/pinentry/pinentry_1.1.1.bb
rename to meta/recipes-support/pinentry/pinentry_1.2.0.bb
index 98577fe3ef..504ba3b5cc 100644
--- a/meta/recipes-support/pinentry/pinentry_1.1.1.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.2.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://gpg-error_pkconf.patch \
 "
 
-SRC_URI[sha256sum] = "cd12a064013ed18e2ee8475e669b9f58db1b225a0144debdb85a68cecddba57f"
+SRC_URI[sha256sum] = "10072045a3e043d0581f91cd5676fcac7ffee957a16636adedaa4f583a616470"
 
 inherit autotools pkgconfig
 
-- 
2.31.1

