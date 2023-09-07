Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C6EEC8754
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 19:12:55 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web11.22250.1694113973519940959
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 12:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=XXdw9+BD;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: raj.khem@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-44ebf4c623eso458452137.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 12:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694113972; x=1694718772; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1e6xXMr+H78eBx35D1fzZ6Cx1NvZ4OnspEA3FGN7UE=;
        b=XXdw9+BD0y6e3FZCOg9QrXrpeyTYGyj2O635RmKU7WAdDXAKC66YeXJiO7q9+NsDg/
         NsYpz59AzxCL3eXTF4YgpfOi11NUrL+Q8SctXNhOKjKIxVBHezZ3tYPPRmmrMvEto7en
         X4SzEFNo0G9dEjfpkdHSVS74xNMORoS+Jj9q4BV/tsXgycVz7YP2YQPhGOh8DC5cMROi
         FkiEH6fMptX/Q9l/BO+eeThBI7XZqd3vjnSS43nm5+0dzfo7TXrRr7NfNifdh9g9KTib
         iBEyHk5tsm1m9QxDv/PXfA0oc6kDS6YYosnuenHr6yQ/yMtCn9tSAwUEF2KKFkdDbDXa
         owag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694113972; x=1694718772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1e6xXMr+H78eBx35D1fzZ6Cx1NvZ4OnspEA3FGN7UE=;
        b=TxVCLnKcyEPuTpCBLJFzM13A9i8Jr94iPRN09zYN9qxy0dDt+2wlD1z4QZTWKrP4G0
         V8gfpXTaozj21dvkM5RFU5W6Inj9dUanQg/PhteYNpwEX5SCQfT8lqsrdoH6gxFq0Wqa
         +EVFLd83hPGFtWnGFooUYnf+YRh4PeWw7TWfi2G9287ql77NFtf2kbk4jiqLUL0zgLpY
         wtNLEQ7XPwZXSj5wzskjr12Jy2H2eGH9h8FccFsCb0V7hTxjr6Fs3WNf8tWHV/of2QGz
         QBJnK3BWTOXgcEQRNiv3OI7n+Q0GmbCEkobjuRiyjC6KLEbmDsVFfR5vcuKxwZTuI+Ep
         f8IA==
X-Gm-Message-State: AOJu0YzImGTmuQrSuZ1u1MsMcC/hr00FRZXu6+LeMLSk6Db4KS0mz+SP
	Dj9IQNAkQKM3K+1skFbpVDeoO8J/EtvJh/aQ7nk=
X-Google-Smtp-Source: AGHT+IHlLdpLhjT7uUhBkqbPafzvWlafgaaADFRHLKBTDtB3/3pw/u0dtedMhDprSRA0BdEnh+e3kb1sK1oU22zQhRQ=
X-Received: by 2002:a67:e9c1:0:b0:44d:44bb:1f60 with SMTP id
 q1-20020a67e9c1000000b0044d44bb1f60mr753052vso.19.1694113972321; Thu, 07 Sep
 2023 12:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230906165633.2382629-1-alex@linutronix.de> <20230906165633.2382629-2-alex@linutronix.de>
In-Reply-To: <20230906165633.2382629-2-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Sep 2023 12:12:26 -0700
Message-ID: <CAMKF1sr9BdQCEnH5qV3Xg2GOQN=xuJt7cz-7+hLftY2jU-tWsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/17] gettext: upgrade 0.21.1 -> 0.22
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 19:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187395

fontforge fails due to this see -
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3095/step=
s/15/logs/stdio

cd /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/=
build/po
&& /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/=
recipe-sysroot-native/usr/bin/msgfmt
--check -o /mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/2=
0230101/build/po/fr.mo
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/git=
/po/fr.po
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/git=
/po/fr.po:294:
'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
the directive number 3, the argument size specifier is invalid.
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/git=
/po/fr.po:305:
'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
the directive number 4, the argument size specifier is invalid.
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/git=
/po/fr.po:7435:
'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
the directive number 2, the argument size specifier is invalid.
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/git=
/po/fr.po:19927:
'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
the directive number 2, the argument size specifier is invalid.
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/git=
/po/fr.po:19935:
'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
the directive number 2, the argument size specifier is invalid.
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/git=
/po/fr.po:19970:
'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
the directive number 2, the argument size specifier is invalid.
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/git=
/po/fr.po:19986:
'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
the directive number 2, the argument size specifier is invalid.
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/git=
/po/fr.po:20459:
'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
the directive number 2, the argument size specifier is invalid.
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/git=
/po/fr.po:21045:
'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
the directive number 2, the argument size specifier is invalid.
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/git=
/po/fr.po:21443:
'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
the directive number 2, the argument size specifier is invalid.
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/git=
/po/fr.po:21772:
'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
the directive number 2, the argument size specifier is invalid.
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/git=
/po/fr.po:24553:
'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
the directive number 2, the argument size specifier is invalid.
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/git=
/po/fr.po:24564:
'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In
the directive number 2, the argument size specifier is invalid.
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/fontforge-native/20230101/rec=
ipe-sysroot-native/usr/bin/msgfmt:
found 13 fatal errors

On Wed, Sep 6, 2023 at 9:56=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>
> Drop autoconf-2.73.patch as upstream did update the gnulib.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../gettext-0.21.1/autoconf-2.73.patch        | 50 -------------------
>  ...21.1.bb =3D> gettext-minimal-native_0.22.bb} |  0
>  .../COPYING                                   |  0
>  meta/recipes-core/gettext/gettext-sources.inc |  2 +-
>  ...t-env.in-do-not-add-C-CXX-parameters.patch |  0
>  ...01-tests-autopoint-3-unset-MAKEFLAGS.patch |  0
>  .../parallel.patch                            |  0
>  .../{gettext-0.21.1 =3D> gettext}/run-ptest     |  0
>  .../serial-tests-config.patch                 |  0
>  .../use-pkgconfig.patch                       |  0
>  .../{gettext_0.21.1.bb =3D> gettext_0.22.bb}    |  3 +-
>  11 files changed, 3 insertions(+), 52 deletions(-)
>  delete mode 100644 meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.7=
3.patch
>  rename meta/recipes-core/gettext/{gettext-minimal-native_0.21.1.bb =3D> =
gettext-minimal-native_0.22.bb} (100%)
>  rename meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D> gettext-mi=
nimal}/COPYING (100%)
>  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext}/0001-init=
-env.in-do-not-add-C-CXX-parameters.patch (100%)
>  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext}/0001-test=
s-autopoint-3-unset-MAKEFLAGS.patch (100%)
>  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext}/parallel.=
patch (100%)
>  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext}/run-ptest=
 (100%)
>  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext}/serial-te=
sts-config.patch (100%)
>  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext}/use-pkgco=
nfig.patch (100%)
>  rename meta/recipes-core/gettext/{gettext_0.21.1.bb =3D> gettext_0.22.bb=
} (99%)
>
> diff --git a/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch=
 b/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch
> deleted file mode 100644
> index ae5b2491bb8..00000000000
> --- a/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -The gnulib largefile macro needs updating to work with autoconf 2.73. Ra=
ther
> -than the full code:
> -
> -https://git.savannah.gnu.org/cgit/gnulib.git/commit/m4/largefile.m4?id=
=3Df91f633858cf132e50924224c50d6264a92caabb
> -
> -Just tweak the exiting code to work with 2.73. The next gettext upgrade =
should
> -update to new gnulib
> -
> -Upstream-Status: Inappropriate
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -
> -Index: gettext-0.21.1/gettext-runtime/gnulib-m4/largefile.m4
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gettext-0.21.1.orig/gettext-runtime/gnulib-m4/largefile.m4
> -+++ gettext-0.21.1/gettext-runtime/gnulib-m4/largefile.m4
> -@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> - # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.69:
> - # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5=
,
> - # or configures them incorrectly in some cases.
> --m4_version_prereq([2.70], [], [
> -+m4_version_prereq([2.73], [], [
> -
> - # _AC_SYS_LARGEFILE_TEST_INCLUDES
> - # -------------------------------
> -Index: gettext-0.21.1/gettext-tools/gnulib-m4/largefile.m4
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gettext-0.21.1.orig/gettext-tools/gnulib-m4/largefile.m4
> -+++ gettext-0.21.1/gettext-tools/gnulib-m4/largefile.m4
> -@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> - # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.69:
> - # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5=
,
> - # or configures them incorrectly in some cases.
> --m4_version_prereq([2.70], [], [
> -+m4_version_prereq([2.73], [], [
> -
> - # _AC_SYS_LARGEFILE_TEST_INCLUDES
> - # -------------------------------
> -Index: gettext-0.21.1/libtextstyle/gnulib-m4/largefile.m4
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gettext-0.21.1.orig/libtextstyle/gnulib-m4/largefile.m4
> -+++ gettext-0.21.1/libtextstyle/gnulib-m4/largefile.m4
> -@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
> - # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.69:
> - # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5=
,
> - # or configures them incorrectly in some cases.
> --m4_version_prereq([2.70], [], [
> -+m4_version_prereq([2.73], [], [
> -
> - # _AC_SYS_LARGEFILE_TEST_INCLUDES
> - # -------------------------------
> diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.21.1.bb b=
/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb
> similarity index 100%
> rename from meta/recipes-core/gettext/gettext-minimal-native_0.21.1.bb
> rename to meta/recipes-core/gettext/gettext-minimal-native_0.22.bb
> diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21.1/COPYING b/m=
eta/recipes-core/gettext/gettext-minimal/COPYING
> similarity index 100%
> rename from meta/recipes-core/gettext/gettext-minimal-0.21.1/COPYING
> rename to meta/recipes-core/gettext/gettext-minimal/COPYING
> diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes=
-core/gettext/gettext-sources.inc
> index da2860fbc85..b4fb6479161 100644
> --- a/meta/recipes-core/gettext/gettext-sources.inc
> +++ b/meta/recipes-core/gettext/gettext-sources.inc
> @@ -1,4 +1,4 @@
>  HOMEPAGE =3D "http://www.gnu.org/software/gettext/gettext.html"
>  SRC_URI =3D "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
>             "
> -SRC_URI[sha256sum] =3D "e8c3650e1d8cee875c4f355642382c1df83058bd5a11ee85=
55c0cf276d646d45"
> +SRC_URI[sha256sum] =3D "49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504=
a5861820e0fb06ab"
> diff --git a/meta/recipes-core/gettext/gettext-0.21.1/0001-init-env.in-do=
-not-add-C-CXX-parameters.patch b/meta/recipes-core/gettext/gettext/0001-in=
it-env.in-do-not-add-C-CXX-parameters.patch
> similarity index 100%
> rename from meta/recipes-core/gettext/gettext-0.21.1/0001-init-env.in-do-=
not-add-C-CXX-parameters.patch
> rename to meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C=
-CXX-parameters.patch
> diff --git a/meta/recipes-core/gettext/gettext-0.21.1/0001-tests-autopoin=
t-3-unset-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext/0001-tests-au=
topoint-3-unset-MAKEFLAGS.patch
> similarity index 100%
> rename from meta/recipes-core/gettext/gettext-0.21.1/0001-tests-autopoint=
-3-unset-MAKEFLAGS.patch
> rename to meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-=
MAKEFLAGS.patch
> diff --git a/meta/recipes-core/gettext/gettext-0.21.1/parallel.patch b/me=
ta/recipes-core/gettext/gettext/parallel.patch
> similarity index 100%
> rename from meta/recipes-core/gettext/gettext-0.21.1/parallel.patch
> rename to meta/recipes-core/gettext/gettext/parallel.patch
> diff --git a/meta/recipes-core/gettext/gettext-0.21.1/run-ptest b/meta/re=
cipes-core/gettext/gettext/run-ptest
> similarity index 100%
> rename from meta/recipes-core/gettext/gettext-0.21.1/run-ptest
> rename to meta/recipes-core/gettext/gettext/run-ptest
> diff --git a/meta/recipes-core/gettext/gettext-0.21.1/serial-tests-config=
.patch b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
> similarity index 100%
> rename from meta/recipes-core/gettext/gettext-0.21.1/serial-tests-config.=
patch
> rename to meta/recipes-core/gettext/gettext/serial-tests-config.patch
> diff --git a/meta/recipes-core/gettext/gettext-0.21.1/use-pkgconfig.patch=
 b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
> similarity index 100%
> rename from meta/recipes-core/gettext/gettext-0.21.1/use-pkgconfig.patch
> rename to meta/recipes-core/gettext/gettext/use-pkgconfig.patch
> diff --git a/meta/recipes-core/gettext/gettext_0.21.1.bb b/meta/recipes-c=
ore/gettext/gettext_0.22.bb
> similarity index 99%
> rename from meta/recipes-core/gettext/gettext_0.21.1.bb
> rename to meta/recipes-core/gettext/gettext_0.22.bb
> index a3eb3bba541..71e84521b0d 100644
> --- a/meta/recipes-core/gettext/gettext_0.21.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.22.bb
> @@ -30,7 +30,6 @@ SRC_URI +=3D " \
>             file://serial-tests-config.patch \
>             file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
>             file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
> -           file://autoconf-2.73.patch \
>             "
>
>  inherit autotools texinfo pkgconfig ptest
> @@ -201,6 +200,8 @@ RDEPENDS:${PN}-ptest:append:libc-glibc =3D "\
>      glibc-charmap-euc-kr \
>      glibc-gconv-euc-jp \
>      glibc-charmap-euc-jp \
> +    glibc-gconv-gb18030 \
> +    glibc-charmap-gb18030 \
>      locale-base-de-de \
>      locale-base-fr-fr \
>  "
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187324): https://lists.openembedded.org/g/openembedde=
d-core/message/187324
> Mute This Topic: https://lists.openembedded.org/mt/101197336/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

