Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F828C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 16:02:40 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.6565.1705507351109911331
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 08:02:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gOkpvQce;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-20757468411so2837479fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 08:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705507350; x=1706112150; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spLyBN4Raql2hNu/4vfa788JqCr54cBOO/PGDromkJk=;
        b=gOkpvQce/fn8k66Z+s5znr0JVx9U/5OYlxyhPUSfLqidR91tNy0dc4wSen533h2Wpp
         p35RmA6jpjPmOrEQCoBy1z+brtlYEAvqyFNJ4uXQ3dp/4bEeOQl6p8c1mT/kYOca9ukN
         aA7QOZfE/OBBbD9SuqqV4PXgVso1Kbt9OY6BGirmltixjdJkFy3itarK1NsFvJQJyrzA
         SxTy/YXuXAWmogECppNAAi+b31hfL8W6QkSAuLUKvLlxheEKNP4zSgVm0sWtNEd3ruLe
         bDEu0DojCmBzysZXv6EoNzBBkbA19mjU+zDs3mA9KBg4xTWCE1J8Qhv8GEVcUVAKusd7
         JrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507350; x=1706112150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spLyBN4Raql2hNu/4vfa788JqCr54cBOO/PGDromkJk=;
        b=BDEtBcZ5SLOmmUUSV2Hd4F4ys6LElfQuYw6P1I+zenkQw2byKL5Aq1Cv94CvdKepsd
         YMHwbkzft3NBmPXWrjwhcT3clocIGdjDbl3vW1ksMwmph9qiEHC2V+mhlw6ztkPQlcac
         Kt+73J/FgvcwxqL+YhkfNdJebKJa9Ss9jiaAzBN6rMoe7UY9ygaPjyXZmZFHmVf5gYoP
         B8ggEcuK7XRf13C/umoURld9UMgGWC7Zvjl61Wju5pklKt01XcxulaL7UlnKj4zEuEuj
         In1QE7NeYtTHwt3cq2C6/BGbXxZR7tKjA5aZWtpmW+FoyokEzHlW75bNv+xVqxn7rJ6c
         fTww==
X-Gm-Message-State: AOJu0YxJmHINpEELJTw4WrBA8hAf7sR7UvHMT3bDcbuejAcr/8O70/N2
	3CMVNwwk65KiB4O+3miLobNj7ILw+TF56t7vLYI=
X-Google-Smtp-Source: AGHT+IGHoU8TIS0jPlUYi+nnzLXZMQJOoTN+1RYAt8BwEFzzbpp2rOio+xhnwhfyFdyIZpo5gZDQS0C7p51DjO5iT/I=
X-Received: by 2002:a05:6871:d08b:b0:204:32a:7b96 with SMTP id
 mw11-20020a056871d08b00b00204032a7b96mr12198659oac.95.1705507350311; Wed, 17
 Jan 2024 08:02:30 -0800 (PST)
MIME-Version: 1.0
References: <1705310874-24840-1-git-send-email-wangmy@fujitsu.com> <20240117145356e21db1e4@mail.local>
In-Reply-To: <20240117145356e21db1e4@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Jan 2024 08:02:04 -0800
Message-ID: <CAMKF1sq3SDN9nC-9Cph8Xq-r3mj21EX-9oy1yvwimsMk0gdJkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] swig: upgrade 4.1.1 -> 4.2.0
To: alexandre.belloni@bootlin.com
Cc: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 16:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193932

On Wed, Jan 17, 2024 at 6:54=E2=80=AFAM Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> This causes failures on the autobuilders:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4241/s=
teps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/8438/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/8470/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/8446/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/8314/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/5592/s=
teps/11/logs/stdio
>

yes I also see this
bindings/python3/../src/capng_swig.i:33: Error: Unknown directive '%except'=
.

compiling libcap-ng-python which is related to this.

>
> On 15/01/2024 17:27:54+0800, wangmy wrote:
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > 0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
> > 0001-configure-use-pkg-config-for-pcre-detection.patch
> > determinism.patch
> > refreshed for 4.2.0
> >
> > Changelog:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -Various template wrapping improvements: template template parameters,
> >  variadic templates, partially specialized templates, const template
> >  parameters and improved error checking instantiating templates.
> > -Improved decltype() support for expressions.
> > -C++14 auto without trailing return type and C++11 auto variables.
> > -Numerous C++ using declarations improvements.
> > -Numerous fixes for constructors, destructors and assignment operators:
> >  implicit, default and deleted and related non-assignable variable
> >  wrappers.
> > -STL: std::array and std::map improvements, std::string_view support
> >  added.
> > -Various C preprocessor improvements.
> > -Various issues fixed to do with architecture specific long type.
> > -Various Doxygen improvements.
> > -D1/Tango support removed. D2/Phobos is now the supported D version
> >  and SWIG now generates code which works with recent D2 releases.
> > -New Javascript generator targeting Node.js binary stable ABI Node-API.
> > -Octave 8.1 support added.
> > -PHP7 support removed, PHP8 is now the supported PHP version.
> > -Python STL container wrappers now use the Python Iterator Protocol.
> > -Python stable ABI support added.
> > -Python 3.12 support added.
> > -Ruby 3.2 and 3.3 support.
> > -Scilab 2023.* support added.
> > -Various minor enhancements for C#, Go, Guile, Javascript, Lua, Ocaml,
> >  Perl, PHP, R, Racket, Ruby, Scilab and Tcl.
> > -A number of deprecated features have been removed.
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  ...self-exe-for-swig-swiglib-on-non-Win32-plat.patch | 10 ++++++----
> >  ...configure-use-pkg-config-for-pcre-detection.patch |  6 +++---
> >  meta/recipes-devtools/swig/swig/determinism.patch    | 12 +++++++++++-
> >  .../swig/{swig_4.1.1.bb =3D> swig_4.2.0.bb}            |  2 +-
> >  4 files changed, 21 insertions(+), 9 deletions(-)
> >  rename meta/recipes-devtools/swig/{swig_4.1.1.bb =3D> swig_4.2.0.bb} (=
72%)
> >
> > diff --git a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for=
-swig-swiglib-on-non-Win32-plat.patch b/meta/recipes-devtools/swig/swig/000=
1-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
> > index f27f80ea18..3f9c298430 100644
> > --- a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-s=
wiglib-on-non-Win32-plat.patch
> > +++ b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-s=
wiglib-on-non-Win32-plat.patch
> > @@ -1,4 +1,4 @@
> > -From a4a0440a644c6c5e5da096efe3cf05ba309a284f Mon Sep 17 00:00:00 2001
> > +From ca02368e2fcb469649534e00eeb21a3c86300f1e Mon Sep 17 00:00:00 2001
> >  From: "NODA, Kai" <nodakai@gmail.com>
> >  Date: Sun, 22 Apr 2012 17:01:02 +0900
> >  Subject: [PATCH] Use /proc/self/exe for "swig -swiglib" on non-Win32
> > @@ -10,9 +10,11 @@ Upstream-Status: Submitted
> >  http://sourceforge.net/mailarchive/message.php?msg_id=3D29179733
> >
> >  ---
> > - Source/Modules/main.cxx |   24 ++++++++++++++++++++++--
> > + Source/Modules/main.cxx | 24 ++++++++++++++++++++++--
> >   1 file changed, 22 insertions(+), 2 deletions(-)
> >
> > +diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
> > +index 8a44921..8250dee 100644
> >  --- a/Source/Modules/main.cxx
> >  +++ b/Source/Modules/main.cxx
> >  @@ -25,6 +25,11 @@
> > @@ -27,7 +29,7 @@ http://sourceforge.net/mailarchive/message.php?msg_id=
=3D29179733
> >
> >   // Global variables
> >
> > -@@ -934,9 +939,9 @@ int SWIG_main(int argc, char *argv[], co
> > +@@ -886,9 +891,9 @@ int SWIG_main(int argc, char *argv[], const Target=
LanguageModule *tlm) {
> >
> >     // Check for SWIG_LIB environment variable
> >     if ((c =3D getenv("SWIG_LIB")) =3D=3D (char *) 0) {
> > @@ -38,7 +40,7 @@ http://sourceforge.net/mailarchive/message.php?msg_id=
=3D29179733
> >       if (!(GetModuleFileName(0, buf, MAX_PATH) =3D=3D 0 || (p =3D strr=
chr(buf, '\\')) =3D=3D 0)) {
> >         *(p + 1) =3D '\0';
> >         SwigLib =3D NewStringf("%sLib", buf); // Native windows install=
ation path
> > -@@ -946,7 +951,22 @@ int SWIG_main(int argc, char *argv[], co
> > +@@ -898,7 +903,22 @@ int SWIG_main(int argc, char *argv[], const Targe=
tLanguageModule *tlm) {
> >       if (Len(SWIG_LIB_WIN_UNIX) > 0)
> >         SwigLibWinUnix =3D NewString(SWIG_LIB_WIN_UNIX); // Unix instal=
lation path using a drive letter (for msys/mingw)
> >   #else
> > diff --git a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-con=
fig-for-pcre-detection.patch b/meta/recipes-devtools/swig/swig/0001-configu=
re-use-pkg-config-for-pcre-detection.patch
> > index cfcbd8c73a..40e98af77c 100644
> > --- a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for=
-pcre-detection.patch
> > +++ b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for=
-pcre-detection.patch
> > @@ -1,4 +1,4 @@
> > -From ffb785ed8d3cac3c28e014b1238d93e2bc1f0c01 Mon Sep 17 00:00:00 2001
> > +From 94f53f3f6629c2b7ffcffe0dd6ff4b5874271d26 Mon Sep 17 00:00:00 2001
> >  From: Koen Kooi <koen.kooi@linaro.org>
> >  Date: Tue, 17 Jun 2014 08:18:17 +0200
> >  Subject: [PATCH] configure: use pkg-config for pcre detection
> > @@ -11,10 +11,10 @@ Upstream-Status: Pending
> >   1 file changed, 7 insertions(+), 32 deletions(-)
> >
> >  diff --git a/configure.ac b/configure.ac
> > -index f88004a..3a2b47c 100644
> > +index c060028..a330266 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> > -@@ -57,39 +57,14 @@ AC_MSG_RESULT([$with_pcre])
> > +@@ -49,39 +49,14 @@ AC_MSG_RESULT([$with_pcre])
> >
> >   dnl To make configuring easier, check for a locally built PCRE using =
the Tools/pcre-build.sh script
> >   if test x"${with_pcre}" =3D xyes ; then
> > diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/r=
ecipes-devtools/swig/swig/determinism.patch
> > index 84c399182a..8e6b01deb3 100644
> > --- a/meta/recipes-devtools/swig/swig/determinism.patch
> > +++ b/meta/recipes-devtools/swig/swig/determinism.patch
> > @@ -1,13 +1,23 @@
> > +From 2a106412fa86e57b6c069a6498fa6181ec5f983e Mon Sep 17 00:00:00 2001
> > +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > +Date: Mon, 1 Mar 2021 00:11:10 +0000
> > +Subject: [PATCH] swig: Fix reproducibility issue
> > +
> >  Remove the compiler commandline/platform from the compiled binary as t=
his
> >  breaks reproducibilty.
> >
> >  Upstream-Status: Inappropriate [OE reproducibiity fix upstream unlikel=
y to take]
> >  RP 2021/3/1
> >
> > +---
> > + Source/Modules/main.cxx | 1 -
> > + 1 file changed, 1 deletion(-)
> >
> > +diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
> > +index 8250dee..415761d 100644
> >  --- a/Source/Modules/main.cxx
> >  +++ b/Source/Modules/main.cxx
> > -@@ -642,7 +642,6 @@ static void getoptions(int argc, char *a
> > +@@ -629,7 +629,6 @@ static void getoptions(int argc, char *argv[]) {
> >       }
> >         } else if (strcmp(argv[i], "-version") =3D=3D 0) {
> >       fprintf(stdout, "\nSWIG Version %s\n", Swig_package_version());
> > diff --git a/meta/recipes-devtools/swig/swig_4.1.1.bb b/meta/recipes-de=
vtools/swig/swig_4.2.0.bb
> > similarity index 72%
> > rename from meta/recipes-devtools/swig/swig_4.1.1.bb
> > rename to meta/recipes-devtools/swig/swig_4.2.0.bb
> > index b9e0175299..2ab4ed006c 100644
> > --- a/meta/recipes-devtools/swig/swig_4.1.1.bb
> > +++ b/meta/recipes-devtools/swig/swig_4.2.0.bb
> > @@ -4,4 +4,4 @@ SRC_URI +=3D "file://0001-Use-proc-self-exe-for-swig-sw=
iglib-on-non-Win32-plat.pat
> >              file://0001-configure-use-pkg-config-for-pcre-detection.pa=
tch \
> >              file://determinism.patch \
> >             "
> > -SRC_URI[sha256sum] =3D "2af08aced8fcd65cdb5cc62426768914bedc735b1c2503=
25203716f78e39ac9b"
> > +SRC_URI[sha256sum] =3D "261ca2d7589e260762817b912c075831572b72ff271794=
2f75b3e51244829c97"
> > --
> > 2.34.1
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193916): https://lists.openembedded.org/g/openembedde=
d-core/message/193916
> Mute This Topic: https://lists.openembedded.org/mt/103735728/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

