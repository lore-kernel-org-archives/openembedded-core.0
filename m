Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.3970.1616211936175252800
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 20:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r7o58ggc;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id c3so5086181qkc.5
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 20:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YeDjrnc6CKw6sGsZXsf2420gKrQIEx5sHnO4dbEK/8A=;
        b=r7o58ggchRAwxrOtgq3NnsWlNZSYkV910Ku+10NrMemiYSxtf1qIo5A4Pfp/9RIRzc
         iU91xIA+TO6cUprOvsb3td/gcZDar/RnrtemFwaY+molWEfrfO5Tvm5yBTJihREUV89Y
         IN2RYfHUPZTJyJ2nS5o9NsJythJxXjSSKIQWS9Ge6m55puji7wTXsNypL3oubkx6B62C
         C53Tx3LI2FUe2+WeBU6IEfS7Rmis4owDRZBqAuwJvwOcyilUEIVr06Z13e1HEH8h7iRe
         0BVSxw0bSW8EYfTVhmtJDl0D0dIpoZ1sd18weG3TI9zmh7korxJlsBbll+nTJ+mfpubN
         DvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YeDjrnc6CKw6sGsZXsf2420gKrQIEx5sHnO4dbEK/8A=;
        b=CguzhmMLxefP49zwAKPn8vzCSxpTNXpthYS6rM5/zf3vWNJQOlk1Prtqu9r4oNC2gj
         mnyEovNo3/TQJEIBY6BQd5TqsWHk6PwMcybpW91HcQ3RM5ZUk5mZtNH+rS/18gz1uzHl
         OnNXg0rjcr0z10VDZ5k77gW9hVEVKRuXeFGNxT4+ibjD4kUgXs9KpwaEp/FokgPM+0SG
         +BWZmdtt3UTvU5GeycC0e87yMi8Ob9C4eZp6FTwfMQqn2dpy9GG/6XKUYIf8kY3tAHnG
         KGxRcgniJTTH8TWfhQuwiqSSowa+wSLVwHEJV6gmAhvdXvWJgToPiTotmtedInC+O0ML
         +mrQ==
X-Gm-Message-State: AOAM531UWmnTW267t8kH+d7BLOE9mlOVOveUbzgoY3DJMUYCm4q1QJJm
	wDI+AiUFXKJqMbkSwPhcaU6P2kBYl3LYt/8wNGk=
X-Google-Smtp-Source: ABdhPJxD++rsc+Tbj2Vl9XA+l/qN5uN67kDPPMEwjJlUe/Oi7Lh8ZkEJsIJBGsZjpPbA2joy62UlmMCK0ogmiakQOIs=
X-Received: by 2002:a37:a350:: with SMTP id m77mr1615922qke.146.1616211935195;
 Fri, 19 Mar 2021 20:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210319084401.576728-1-alex.kanavin@gmail.com> <20210319084401.576728-12-alex.kanavin@gmail.com>
In-Reply-To: <20210319084401.576728-12-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 19 Mar 2021 20:45:08 -0700
Message-ID: <CAMKF1soBhVCH+2YfBveNhPdtsMxOEizE9LDuhv4BX=ej6urKRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 12/16] automake: update 1.16.2 - > 1.16.3
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

here is a related failure
https://errors.yoctoproject.org/Errors/Details/574252/

On Fri, Mar 19, 2021 at 1:45 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Drop automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch;
> upstream has fixed the issue.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...in-shebangs-with-modern-use-warnings.patch | 60 -------------------
>  .../automake/automake/python-libdir.patch     | 16 ++---
>  ...{automake_1.16.2.bb => automake_1.16.3.bb} | 18 +++---
>  3 files changed, 16 insertions(+), 78 deletions(-)
>  delete mode 100644 meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch
>  rename meta/recipes-devtools/automake/{automake_1.16.2.bb => automake_1.16.3.bb} (61%)
>
> diff --git a/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch b/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch
> deleted file mode 100644
> index 0e84c4bf86..0000000000
> --- a/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From 857c843d4bcf576467b505eb05a47f3e7d32caaa Mon Sep 17 00:00:00 2001
> -From: Serhii Popovych <spopovyc@cisco.com>
> -Date: Wed, 10 Feb 2016 17:07:32 +0000
> -Subject: [PATCH] perl: Replace -w option in shebangs with modern "use
> - warnings" In some builds we might provide ac_cv_path_PERL as /usr/bin/env
> - perl to use newer version of the perl from users PATH rather than older from
> - standard system path.
> -
> -However using /usr/bin/env perl -w from shebang line isn't
> -possible because it translates to something like
> -/usr/bin/env -w perl and env complains about illegal option.
> -
> -To address this we can remove -w option from perl shebang
> -line and add "use warnings" statement.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -
> ----
> - bin/aclocal.in  | 3 ++-
> - bin/automake.in | 3 ++-
> - 2 files changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/bin/aclocal.in b/bin/aclocal.in
> -index 9a20325..bd185d4 100644
> ---- a/bin/aclocal.in
> -+++ b/bin/aclocal.in
> -@@ -1,4 +1,4 @@
> --#!@PERL@ -w
> -+#!@PERL@
> - # aclocal - create aclocal.m4 by scanning configure.ac      -*- perl -*-
> - # @configure_input@
> - # Copyright (C) 1996-2020 Free Software Foundation, Inc.
> -@@ -26,6 +26,7 @@ BEGIN
> - }
> -
> - use strict;
> -+use warnings;
> -
> - use Automake::Config;
> - use Automake::General;
> -diff --git a/bin/automake.in b/bin/automake.in
> -index 5ed404a..d387b8e 100644
> ---- a/bin/automake.in
> -+++ b/bin/automake.in
> -@@ -1,4 +1,4 @@
> --#!@PERL@ -w
> -+#!@PERL@
> - # automake - create Makefile.in from Makefile.am            -*- perl -*-
> - # @configure_input@
> - # Copyright (C) 1994-2020 Free Software Foundation, Inc.
> -@@ -23,6 +23,7 @@
> - package Automake;
> -
> - use strict;
> -+use warnings;
> -
> - BEGIN
> - {
> diff --git a/meta/recipes-devtools/automake/automake/python-libdir.patch b/meta/recipes-devtools/automake/automake/python-libdir.patch
> index ee1f725f76..f319fc001b 100644
> --- a/meta/recipes-devtools/automake/automake/python-libdir.patch
> +++ b/meta/recipes-devtools/automake/automake/python-libdir.patch
> @@ -1,4 +1,4 @@
> -From a80dacd5124d0713cf2c986b28d736e78dc6b0ca Mon Sep 17 00:00:00 2001
> +From 61bd143910001aaf610416d7ca56c52c0b081318 Mon Sep 17 00:00:00 2001
>  From: Kumar Gala <galak@kernel.crashing.org>
>  Date: Thu, 11 Aug 2011 01:26:33 -0500
>  Subject: [PATCH] automake: Update for python.m4 to respect libdir
> @@ -17,11 +17,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   1 file changed, 7 insertions(+), 20 deletions(-)
>
>  diff --git a/m4/python.m4 b/m4/python.m4
> -index 63c0a0e..7bbd2d2 100644
> +index b2302ba..dbc6954 100644
>  --- a/m4/python.m4
>  +++ b/m4/python.m4
> -@@ -94,12 +94,13 @@ AC_DEFUN([AM_PATH_PYTHON],
> -     [am_cv_python_version=`$PYTHON -c "import sys; sys.stdout.write(sys.version[[:3]])"`])
> +@@ -96,12 +96,13 @@ AC_DEFUN([AM_PATH_PYTHON],
> +     [am_cv_python_version=`$PYTHON -c "import sys; print('%u.%u' % sys.version_info[[:2]])"`])
>     AC_SUBST([PYTHON_VERSION], [$am_cv_python_version])
>
>  -  dnl Use the values of $prefix and $exec_prefix for the corresponding
> @@ -36,7 +36,7 @@ index 63c0a0e..7bbd2d2 100644
>     AC_SUBST([PYTHON_EXEC_PREFIX], ['${exec_prefix}'])
>
>     dnl At times (like when building shared libraries) you may want
> -@@ -144,14 +145,7 @@ except ImportError:
> +@@ -146,14 +147,7 @@ except ImportError:
>        else
>          am_py_prefix=$prefix
>        fi
> @@ -52,7 +52,7 @@ index 63c0a0e..7bbd2d2 100644
>        case $am_cv_python_pythondir in
>        $am_py_prefix*)
>          am__strip_prefix=`echo "$am_py_prefix" | sed 's|.|.|g'`
> -@@ -161,7 +155,7 @@ sys.stdout.write(sitedir)"`
> +@@ -163,7 +157,7 @@ sys.stdout.write(sitedir)"`
>          case $am_py_prefix in
>            /usr|/System*) ;;
>            *)
> @@ -61,7 +61,7 @@ index 63c0a0e..7bbd2d2 100644
>           ;;
>          esac
>          ;;
> -@@ -186,14 +180,7 @@ sys.stdout.write(sitedir)"`
> +@@ -188,14 +182,7 @@ sys.stdout.write(sitedir)"`
>        else
>          am_py_exec_prefix=$exec_prefix
>        fi
> @@ -77,7 +77,7 @@ index 63c0a0e..7bbd2d2 100644
>        case $am_cv_python_pyexecdir in
>        $am_py_exec_prefix*)
>          am__strip_prefix=`echo "$am_py_exec_prefix" | sed 's|.|.|g'`
> -@@ -203,7 +190,7 @@ sys.stdout.write(sitedir)"`
> +@@ -205,7 +192,7 @@ sys.stdout.write(sitedir)"`
>          case $am_py_exec_prefix in
>            /usr|/System*) ;;
>            *)
> diff --git a/meta/recipes-devtools/automake/automake_1.16.2.bb b/meta/recipes-devtools/automake/automake_1.16.3.bb
> similarity index 61%
> rename from meta/recipes-devtools/automake/automake_1.16.2.bb
> rename to meta/recipes-devtools/automake/automake_1.16.3.bb
> index 08ec034626..7dc59d9fe7 100644
> --- a/meta/recipes-devtools/automake/automake_1.16.2.bb
> +++ b/meta/recipes-devtools/automake/automake_1.16.3.bb
> @@ -19,16 +19,14 @@ RDEPENDS_${PN} += "\
>  RDEPENDS_${PN}_class-native = "autoconf-native hostperl-runtime-native"
>
>  SRC_URI += "file://python-libdir.patch \
> -            file://buildtest.patch \
> -            file://performance.patch \
> -            file://new_rt_path_for_test-driver.patch \
> -            file://automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch \
> -            file://0001-automake-Add-default-libtool_tag-to-cppasm.patch \
> -            file://0001-build-fix-race-in-parallel-builds.patch \
> -            "
> -
> -SRC_URI[md5sum] = "f1a14f2ab2b0fb861a011e1d94e589e0"
> -SRC_URI[sha256sum] = "b2f361094b410b4acbf4efba7337bdb786335ca09eb2518635a09fb7319ca5c1"
> +           file://buildtest.patch \
> +           file://performance.patch \
> +           file://new_rt_path_for_test-driver.patch \
> +           file://0001-automake-Add-default-libtool_tag-to-cppasm.patch \
> +           file://0001-build-fix-race-in-parallel-builds.patch \
> +           "
> +
> +SRC_URI[sha256sum] = "ce010788b51f64511a1e9bb2a1ec626037c6d0e7ede32c1c103611b9d3cba65f"
>
>  PERL = "${USRBINPATH}/perl"
>  PERL_class-native = "${USRBINPATH}/env perl"
> --
> 2.29.2
>
>
> 
>
