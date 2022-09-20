Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDACC6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 22:28:07 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web12.3499.1663712876891209108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 15:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JGX7J1QL;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id g20so3602801ljg.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 15:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=j77adMucAKR40ytdMChmHDvlbTJa89BSRx0ZpEzK1kU=;
        b=JGX7J1QLDTCzmX6YbSYltDV2FmoTN8fqdN3HKmxbKt+4bkD0oyTSquY386sL/wdvGc
         +nwNpVm2QipN5d1hrQns6EMAIKaxLkKARST0DzZR3KU6cXAbBnKRtT46Iw/ZGJUuET/H
         ykQ36hspvNf8Y8vtV91YYplKoaqzJ7xkL7bhz5muuy4fnG8HyoidfYZ8kWJxSpxkyP24
         pOBiBXtzhosDGuY7BQQXICT673hPJuVsFAfS/4BVp3PBsS6dnrmPHd30ELyoaGIUof3D
         Cw1pAXL80L61z3fk7BpWfTKzLW7c6dQv9Ni66TLHH5f1pSuRss2e1+M0sbzguYtk04/f
         O/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=j77adMucAKR40ytdMChmHDvlbTJa89BSRx0ZpEzK1kU=;
        b=AccFgmx8+R92++q4NayQEg6+NZeNFtah6pXRaePNNvAgpfkSQ2OIBwy8anWTFAjvZE
         nn+b3YZjWQpT9q1z8N0Jr4BdXzmZA/ATyuFGoo7jFah+v/Hn0Aogl6UBgGv4f0/UK10R
         HjP750/OaVWdpB0dyjZ307mMl0gdlJKDT+2X/EpL59xug2Q5Dv5B5Tccmbby1GWtaJsw
         EYt+fiVbgyRcM22V5HTKT5UggPcO+d0mTxcamLqoci03Adyyy2KtYzHuFcenuu/Gbnsa
         BCmIWBfLsQrtZG3wiqY0w9lksE8MNRgxB/3vvCkyIH9TbNktLEJmBEa6oWe7FPLzmqjY
         RZUQ==
X-Gm-Message-State: ACrzQf3JytRSxCBIgqRSBBkXg4WIjwIlJZxdvPUhFQ6ncGaXPAYMmtaq
	14c8i9K1XVeHTW4Ai7I4/diFvulQYIyORvbRpY8=
X-Google-Smtp-Source: 
 AMsMyM7ob6GrSNKcRzrnos1lVS0h3l6kX0qnmQFvfp0Aclj1nFElsDAN51i7zt+2qGv/An8yy0pr30waoSvWyTdY6pw=
X-Received: by 2002:a05:651c:104e:b0:26b:fceb:a526 with SMTP id
 x14-20020a05651c104e00b0026bfceba526mr7246315ljm.109.1663712874771; Tue, 20
 Sep 2022 15:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220920221250.1544461-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220920221250.1544461-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 21 Sep 2022 00:27:43 +0200
Message-ID: 
 <CANNYZj-3C7jdhZFcu5XB7zHqbaiVtfgvDoOFrm+Pu7QOJ8w60Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2 v2] rpm: Upgrade 4.17.1 -> 4.18rc1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 22:28:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170915

Is it possible to submit fifofix.patch upstream while the issue is
still 'hot' in your head? :) Should be just a github PR.

Alex

On Wed, 21 Sept 2022 at 00:12, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> rpm is close to release and give our release timings, update to the
> rc1 of 4.18.
>
> Includes fixes for CVE-2021-35937, CVE-2021-35938 and CVE-2021-35939
> which can't be easily backported.
>
> Add a PACKAGECONFIG option for a new readline dependency and disable
> it by default since it pulls in GPLv3 and that breaks a number of
> our test configurations as things stand.
>
> Refresh patches and drop the error.h patch as error() no longer used.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...olor-setting-for-mips64_n32-binaries.patch | 22 +++---
>  ...satisfiable-dependency-when-building.patch | 10 +--
>  ...lib-rpm-as-the-installation-path-for.patch | 26 +++----
>  ...1-Do-not-read-config-files-from-HOME.patch | 11 ++-
>  ...-PATH-environment-variable-before-ru.patch | 10 +--
>  ...lling-execute-package-scriptlets-wit.patch | 20 +++---
>  ...not-insert-payloadflags-into-.rpm-me.patch |  8 +--
>  ...-linux-gnux32-variant-to-triplet-han.patch | 17 ++---
>  ...o-not-build-manpages-requires-pandoc.patch | 11 ++-
>  ....c-fix-file-conflicts-for-MIPS64-N32.patch | 13 ++--
>  ...tools-Add-error.h-for-non-glibc-case.patch | 71 -------------------
>  ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch | 17 ++---
>  ...ge-logging-level-around-scriptlets-t.patch | 16 ++---
>  meta/recipes-devtools/rpm/files/fifofix.patch | 22 ++++++
>  meta/recipes-devtools/rpm/rpm_4.17.1.bb       | 10 ++-
>  15 files changed, 113 insertions(+), 171 deletions(-)
>  delete mode 100644 meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/fifofix.patch
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
> index 331ea849e69..9f5dde07205 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
> @@ -11,11 +11,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   rpmrc.in      | 2 ++
>   2 files changed, 6 insertions(+)
>
> -diff --git a/build/rpmfc.c b/build/rpmfc.c
> -index 10c380ee9..b7655aa93 100644
> ---- a/build/rpmfc.c
> -+++ b/build/rpmfc.c
> -@@ -639,6 +639,7 @@ exit:
> +Index: git/build/rpmfc.c
> +===================================================================
> +--- git.orig/build/rpmfc.c
> ++++ git/build/rpmfc.c
> +@@ -645,6 +645,7 @@ exit:
>   static const struct rpmfcTokens_s rpmfcTokens[] = {
>     { "directory",              RPMFC_INCLUDE },
>
> @@ -23,7 +23,7 @@ index 10c380ee9..b7655aa93 100644
>     { "ELF 32-bit",             RPMFC_ELF32|RPMFC_INCLUDE },
>     { "ELF 64-bit",             RPMFC_ELF64|RPMFC_INCLUDE },
>
> -@@ -1149,6 +1150,9 @@ static uint32_t getElfColor(const char *fn)
> +@@ -1150,6 +1151,9 @@ static uint32_t getElfColor(const char *
>                 color = RPMFC_ELF32;
>                 break;
>             }
> @@ -33,11 +33,11 @@ index 10c380ee9..b7655aa93 100644
>             elf_end(elf);
>         }
>         close(fd);
> -diff --git a/rpmrc.in b/rpmrc.in
> -index 5bd9ba3e5..f15bb8dad 100644
> ---- a/rpmrc.in
> -+++ b/rpmrc.in
> -@@ -137,6 +137,8 @@ archcolor: mipsr6el 1
> +Index: git/rpmrc.in
> +===================================================================
> +--- git.orig/rpmrc.in
> ++++ git/rpmrc.in
> +@@ -139,6 +139,8 @@ archcolor: mipsr6el 1
>   archcolor: mips64r6 2
>   archcolor: mips64r6el 2
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
> index 4029233fb70..8440c3516d6 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
> @@ -14,11 +14,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   build/pack.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> -diff --git a/build/pack.c b/build/pack.c
> -index e6cec1816..810cd7351 100644
> ---- a/build/pack.c
> -+++ b/build/pack.c
> -@@ -724,10 +724,6 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
> +Index: git/build/pack.c
> +===================================================================
> +--- git.orig/build/pack.c
> ++++ git/build/pack.c
> +@@ -709,10 +709,6 @@ static rpmRC packageBinary(rpmSpec spec,
>         headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,16);
>       }
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> index c6cf9d4c881..6f613d0a7d8 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   rpm.am       | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)
>
> -diff --git a/configure.ac b/configure.ac
> -index 372875fc4..1b7add9ee 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -884,7 +884,7 @@ else
> +Index: git/configure.ac
> +===================================================================
> +--- git.orig/configure.ac
> ++++ git/configure.ac
> +@@ -942,7 +942,7 @@ else
>       usrprefix=$prefix
>   fi
>
> @@ -26,10 +26,10 @@ index 372875fc4..1b7add9ee 100644
>   AC_SUBST(RPMCONFIGDIR)
>
>   AC_SUBST(OBJDUMP)
> -diff --git a/macros.in b/macros.in
> -index d53ab5ed5..9d10441c8 100644
> ---- a/macros.in
> -+++ b/macros.in
> +Index: git/macros.in
> +===================================================================
> +--- git.orig/macros.in
> ++++ git/macros.in
>  @@ -911,7 +911,7 @@ package or when debugging this package.\
>   %_sharedstatedir      %{_prefix}/com
>   %_localstatedir               %{_prefix}/var
> @@ -39,10 +39,10 @@ index d53ab5ed5..9d10441c8 100644
>   %_includedir          %{_prefix}/include
>   %_infodir             %{_datadir}/info
>   %_mandir              %{_datadir}/man
> -diff --git a/rpm.am b/rpm.am
> -index ebe4e40d1..e6920e258 100644
> ---- a/rpm.am
> -+++ b/rpm.am
> +Index: git/rpm.am
> +===================================================================
> +--- git.orig/rpm.am
> ++++ git/rpm.am
>  @@ -1,10 +1,10 @@
>   # Internal binaries
>   ## HACK: It probably should be $(libexecdir)/rpm or $(libdir)/rpm
> diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
> index 96eb4189520..fda64eefe01 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
> @@ -9,10 +9,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   lib/rpmrc.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> -diff --git a/lib/rpmrc.c b/lib/rpmrc.c
> -index 4ed991321..19fe80f98 100644
> ---- a/lib/rpmrc.c
> -+++ b/lib/rpmrc.c
> +Index: git/lib/rpmrc.c
> +===================================================================
> +--- git.orig/lib/rpmrc.c
> ++++ git/lib/rpmrc.c
>  @@ -458,8 +458,7 @@ static void setDefaults(void)
>       if (!defrcfiles) {
>         defrcfiles = rstrscat(NULL, confdir, "/rpmrc", ":",
> @@ -33,6 +33,3 @@ index 4ed991321..19fe80f98 100644
>       }
>   #else
>       macrofiles = MACROFILES;
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
> index 41cdf6ed774..ae24b663aae 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
> @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   lib/rpmscript.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff --git a/lib/rpmscript.c b/lib/rpmscript.c
> -index 6a31e0d..2b0e438 100644
> ---- a/lib/rpmscript.c
> -+++ b/lib/rpmscript.c
> -@@ -184,7 +184,7 @@ static void doScriptExec(ARGV_const_t argv, ARGV_const_t prefixes,
> +Index: git/lib/rpmscript.c
> +===================================================================
> +--- git.orig/lib/rpmscript.c
> ++++ git/lib/rpmscript.c
> +@@ -231,7 +231,7 @@ static void doScriptExec(ARGV_const_t ar
>         if (ipath && ipath[5] != '%')
>             path = ipath;
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
> index 2a0069cafe3..bd3314a90f8 100644
> --- a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
> @@ -28,9 +28,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   lib/rpmscript.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
>
> ---- a/lib/rpmscript.c
> -+++ b/lib/rpmscript.c
> -@@ -17,7 +17,7 @@
> +Index: git/lib/rpmscript.c
> +===================================================================
> +--- git.orig/lib/rpmscript.c
> ++++ git/lib/rpmscript.c
> +@@ -18,7 +18,7 @@
>   #include "rpmio/rpmio_internal.h"
>
>   #include "lib/rpmplugins.h"     /* rpm plugins hooks */
> @@ -39,7 +41,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   #include "debug.h"
>
>   struct scriptNextFileFunc_s {
> -@@ -391,8 +391,7 @@ exit:
> +@@ -427,8 +427,7 @@ exit:
>         Fclose(out);    /* XXX dup'd STDOUT_FILENO */
>
>       if (fn) {
> @@ -49,18 +51,18 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>         free(fn);
>       }
>       free(mline);
> -@@ -426,7 +425,13 @@ rpmRC rpmScriptRun(rpmScript script, int
> +@@ -462,7 +461,13 @@ rpmRC rpmScriptRun(rpmScript script, int
>
>       if (rc != RPMRC_FAIL) {
>         if (script_type & RPMSCRIPTLET_EXEC) {
> --          rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
> +-          rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
>  +          if (getenv("RPM_NO_CHROOT_FOR_SCRIPTS") != NULL) {
>  +              rpmChrootOut();
> -+              rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
> ++              rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
>  +              rpmChrootIn();
>  +          } else {
> -+              rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
> ++              rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
>  +          }
>         } else {
> -           rc = runLuaScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
> +           rc = runLuaScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
>         }
> diff --git a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
> index 79b168257ee..64433abb6a1 100644
> --- a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
> @@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>   build/pack.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff --git a/build/pack.c b/build/pack.c
> -index 932cb213e..b45d0726f 100644
> ---- a/build/pack.c
> -+++ b/build/pack.c
> +Index: git/build/pack.c
> +===================================================================
> +--- git.orig/build/pack.c
> ++++ git/build/pack.c
>  @@ -328,7 +328,7 @@ static char *getIOFlags(Package pkg)
>             headerPutString(pkg->header, RPMTAG_PAYLOADCOMPRESSOR, compr);
>         buf = xstrdup(rpmio_flags);
> diff --git a/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch b/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch
> index 2174a79e752..29b6686a940 100644
> --- a/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch
> @@ -11,13 +11,13 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>   configure.ac | 4 ++++
>   1 file changed, 4 insertions(+)
>
> -diff --git a/configure.ac b/configure.ac
> -index 372875fc49..7d6a3d274e 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -845,6 +845,10 @@ if echo "$host_os" | grep '.*-gnuabi64$' > /dev/null ; then
> -       host_os=`echo "${host_os}" | sed 's/-gnuabi64$//'`
> -       host_os_gnu=-gnuabi64
> +Index: git/configure.ac
> +===================================================================
> +--- git.orig/configure.ac
> ++++ git/configure.ac
> +@@ -903,6 +903,10 @@ if echo "$host_os" | grep '.*-gnux32$' >
> +       host_os=`echo "${host_os}" | sed 's/-gnux32$//'`
> +       host_os_gnu=-gnux32
>   fi
>  +if echo "$host_os" | grep '.*-gnux32$' > /dev/null ; then
>  +      host_os=`echo "${host_os}" | sed 's/-gnux32$//'`
> @@ -26,6 +26,3 @@ index 372875fc49..7d6a3d274e 100644
>   if echo "$host_os" | grep '.*-gnu$' > /dev/null ; then
>         host_os=`echo "${host_os}" | sed 's/-gnu$//'`
>   fi
> ---
> -2.30.2
> -
> diff --git a/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch b/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch
> index ced52d10071..d7137f1d103 100644
> --- a/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch
> @@ -9,10 +9,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   docs/Makefile.am | 2 --
>   1 file changed, 2 deletions(-)
>
> -diff --git a/docs/Makefile.am b/docs/Makefile.am
> -index 5a6bd203a..6257767fd 100644
> ---- a/docs/Makefile.am
> -+++ b/docs/Makefile.am
> +Index: git/docs/Makefile.am
> +===================================================================
> +--- git.orig/docs/Makefile.am
> ++++ git/docs/Makefile.am
>  @@ -1,7 +1,5 @@
>   ## Process this file with automake to produce Makefile.in
>
> @@ -21,6 +21,3 @@ index 5a6bd203a..6257767fd 100644
>   EXTRA_DIST =
>
>   EXTRA_DIST += \
> ---
> -2.32.0
> -
> diff --git a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
> index 6678c105cdb..82e6567dc74 100644
> --- a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
> @@ -31,11 +31,11 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
>   lib/transaction.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> -diff --git a/lib/transaction.c b/lib/transaction.c
> -index 67b9db5..82386b8 100644
> ---- a/lib/transaction.c
> -+++ b/lib/transaction.c
> -@@ -391,7 +391,18 @@ static int handleColorConflict(rpmts ts,
> +Index: git/lib/transaction.c
> +===================================================================
> +--- git.orig/lib/transaction.c
> ++++ git/lib/transaction.c
> +@@ -402,7 +402,18 @@ static int handleColorConflict(rpmts ts,
>                     rpmfsSetAction(ofs, ofx, FA_CREATE);
>                 rpmfsSetAction(fs, fx, FA_SKIPCOLOR);
>                 rConflicts = 0;
> @@ -55,6 +55,3 @@ index 67b9db5..82386b8 100644
>         }
>       }
>
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch b/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch
> deleted file mode 100644
> index 9783396639f..00000000000
> --- a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -From 9b9d717f484ec913cdd3804e43489b3dc18bd77c Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 31 Oct 2020 22:14:05 -0700
> -Subject: [PATCH] tools: Add error.h for non-glibc case
> -
> -error is glibc specific API, so this patch will mostly not accepted
> -upstream given that elfutils has been closely tied to glibc
> -
> -Upstream-Status: Inappropriate [workaround for musl]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> - tools/elfdeps.c |  6 +++++-
> - tools/error.h   | 27 +++++++++++++++++++++++++++
> - 2 files changed, 32 insertions(+), 1 deletion(-)
> - create mode 100644 tools/error.h
> -
> -diff --git a/tools/elfdeps.c b/tools/elfdeps.c
> -index d205935bb..3a8945b33 100644
> ---- a/tools/elfdeps.c
> -+++ b/tools/elfdeps.c
> -@@ -5,10 +5,14 @@
> - #include <unistd.h>
> - #include <stdlib.h>
> - #include <fcntl.h>
> --#include <error.h>
> - #include <errno.h>
> - #include <popt.h>
> - #include <gelf.h>
> -+#ifdef __GLIBC__
> -+#include <error.h>
> -+#else
> -+#include "error.h"
> -+#endif
> -
> - #include <rpm/rpmstring.h>
> - #include <rpm/argv.h>
> -diff --git a/tools/error.h b/tools/error.h
> -new file mode 100644
> -index 000000000..ef06827a0
> ---- /dev/null
> -+++ b/tools/error.h
> -@@ -0,0 +1,27 @@
> -+#ifndef _ERROR_H_
> -+#define _ERROR_H_
> -+
> -+#include <stdarg.h>
> -+#include <stdio.h>
> -+#include <stdlib.h>
> -+#include <string.h>
> -+#include <errno.h>
> -+
> -+static unsigned int error_message_count = 0;
> -+
> -+static inline void error(int status, int errnum, const char* format, ...)
> -+{
> -+      va_list ap;
> -+      fprintf(stderr, "%s: ", program_invocation_name);
> -+      va_start(ap, format);
> -+      vfprintf(stderr, format, ap);
> -+      va_end(ap);
> -+      if (errnum)
> -+              fprintf(stderr, ": %s", strerror(errnum));
> -+      fprintf(stderr, "\n");
> -+      error_message_count++;
> -+      if (status)
> -+              exit(status);
> -+}
> -+
> -+#endif        /* _ERROR_H_ */
> diff --git a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
> index b3dbc319b6a..2fe96a839c3 100644
> --- a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
> +++ b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
> @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   lib/rpmrc.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
>
> -diff --git a/lib/rpmrc.c b/lib/rpmrc.c
> -index 19fe80f98..6b27b3941 100644
> ---- a/lib/rpmrc.c
> -+++ b/lib/rpmrc.c
> -@@ -455,10 +455,14 @@ const char * lookupInDefaultTable(const char * name,
> +Index: git/lib/rpmrc.c
> +===================================================================
> +--- git.orig/lib/rpmrc.c
> ++++ git/lib/rpmrc.c
> +@@ -455,10 +455,14 @@ const char * lookupInDefaultTable(const
>   static void setDefaults(void)
>   {
>       const char *confdir = rpmConfigDir();
> @@ -46,7 +46,7 @@ index 19fe80f98..6b27b3941 100644
>       }
>   #else
>       macrofiles = MACROFILES;
> -@@ -989,7 +993,11 @@ static void read_auxv(void)
> +@@ -997,7 +1001,11 @@ static void read_auxv(void)
>    */
>   static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char ** os)
>   {
> @@ -59,7 +59,7 @@ index 19fe80f98..6b27b3941 100644
>       static struct utsname un;
>       char * chptr;
>       canonEntry canon;
> -@@ -1286,6 +1294,7 @@ static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char ** os)
> +@@ -1307,6 +1315,7 @@ static void defaultMachine(rpmrcCtx ctx,
>
>       if (arch) *arch = un.machine;
>       if (os) *os = un.sysname;
> @@ -67,6 +67,3 @@ index 19fe80f98..6b27b3941 100644
>   }
>
>   static
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
> index 43e9859ef32..9dbe7125ded 100644
> --- a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
> +++ b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
> @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   lib/rpmscript.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> -diff --git a/lib/rpmscript.c b/lib/rpmscript.c
> -index 2b0e43862..e319673f1 100644
> ---- a/lib/rpmscript.c
> -+++ b/lib/rpmscript.c
> -@@ -226,7 +226,7 @@ static char * writeScript(const char *cmd, const char *script)
> +Index: git/lib/rpmscript.c
> +===================================================================
> +--- git.orig/lib/rpmscript.c
> ++++ git/lib/rpmscript.c
> +@@ -270,7 +270,7 @@ static char * writeScript(const char *cm
>       if (Ferror(fd))
>         goto exit;
>
> @@ -26,7 +26,7 @@ index 2b0e43862..e319673f1 100644
>         static const char set_x[] = "set -x\n";
>         /* Assume failures will be caught by the write below */
>         Fwrite(set_x, sizeof(set_x[0]), sizeof(set_x)-1, fd);
> -@@ -258,7 +258,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
> +@@ -302,7 +302,7 @@ static rpmRC runExtScript(rpmPlugins plu
>       char *mline = NULL;
>       rpmRC rc = RPMRC_FAIL;
>
> @@ -35,7 +35,7 @@ index 2b0e43862..e319673f1 100644
>
>       if (script) {
>         fn = writeScript(*argvp[0], script);
> -@@ -310,7 +310,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
> +@@ -354,7 +354,7 @@ static rpmRC runExtScript(rpmPlugins plu
>                 sname, strerror(errno));
>         goto exit;
>       } else if (pid == 0) {/* Child */
> @@ -44,7 +44,7 @@ index 2b0e43862..e319673f1 100644
>                sname, *argvp[0], (unsigned)getpid());
>
>         fclose(in);
> -@@ -353,7 +353,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_const_t prefixes,
> +@@ -397,7 +397,7 @@ static rpmRC runExtScript(rpmPlugins plu
>         reaped = waitpid(pid, &status, 0);
>       } while (reaped == -1 && errno == EINTR);
>
> diff --git a/meta/recipes-devtools/rpm/files/fifofix.patch b/meta/recipes-devtools/rpm/files/fifofix.patch
> new file mode 100644
> index 00000000000..0496b09d282
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/fifofix.patch
> @@ -0,0 +1,22 @@
> +Calling openat() on a fifo causes a pseudo hang for us (e.g. the fifo in psplash).
> +Avoid calling openat for fifos.
> +
> +Introduced upstream with:
> +
> +https://github.com/rpm-software-management/rpm/commit/96ec957e281220f8e137a2d5eb23b83a6377d556
> +
> +Upstream-Status: Pending
> +
> +Index: git/lib/fsm.c
> +===================================================================
> +--- git.orig/lib/fsm.c
> ++++ git/lib/fsm.c
> +@@ -1010,7 +1010,7 @@ int rpmPackageFilesInstall(rpmts ts, rpm
> +                     rc = RPMERR_UNKNOWN_FILETYPE;
> +             }
> +
> +-          if (!rc && fd == -1 && !S_ISLNK(fp->sb.st_mode)) {
> ++          if (!rc && fd == -1 && !S_ISLNK(fp->sb.st_mode) && !S_ISFIFO(fp->sb.st_mode)) {
> +               /* Only follow safe symlinks, and never on temporary files */
> +               fd = fsmOpenat(di.dirfd, fp->fpath,
> +                               fp->suffix ? AT_SYMLINK_NOFOLLOW : 0, 0);
> diff --git a/meta/recipes-devtools/rpm/rpm_4.17.1.bb b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> index 9b6446f265f..36ab90d91eb 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> @@ -24,7 +24,7 @@ HOMEPAGE = "http://www.rpm.org"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c4eec0c20c6034b9407a09945b48a43f"
>
> -SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.17.x;protocol=https \
> +SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protocol=https \
>             file://environment.d-rpm.sh \
>             file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
>             file://0001-Do-not-read-config-files-from-HOME.patch \
> @@ -36,14 +36,17 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.17.x;protoc
>             file://0001-perl-disable-auto-reqs.patch \
>             file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
>             file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
> -           file://0001-tools-Add-error.h-for-non-glibc-case.patch \
>             file://0001-docs-do-not-build-manpages-requires-pandoc.patch \
>             file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
>             file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch \
> +           file://fifofix.patch \
>             "
>
>  PE = "1"
> -SRCREV = "5bef402da334595ed9302b8bca1acdf5e88bfe11"
> +SRCREV = "07a6cca98489106b93467ecfaf5700368983a9b4"
> +PV = "4.17.1+4.18-rc1"
> +# can be removed in 4.18
> +CVE_CHECK_IGNORE += "CVE-2021-35937 CVE-2021-35938 CVE-2021-35939"
>
>  S = "${WORKDIR}/git"
>
> @@ -80,6 +83,7 @@ PACKAGECONFIG[imaevm] = "--with-imaevm,,ima-evm-utils"
>  PACKAGECONFIG[inhibit] = "--enable-inhibit-plugin,--disable-inhibit-plugin,dbus"
>  PACKAGECONFIG[rpm2archive] = "--with-archive,--without-archive,libarchive"
>  PACKAGECONFIG[sqlite] = "--enable-sqlite=yes,--enable-sqlite=no,sqlite3"
> +PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
>  PACKAGECONFIG[ndb] = "--enable-ndb,--disable-ndb"
>  PACKAGECONFIG[bdb-ro] = "--enable-bdb-ro,--disable-bdb-ro"
>  PACKAGECONFIG[zstd] = "--enable-zstd=yes,--enable-zstd=no,zstd"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170912): https://lists.openembedded.org/g/openembedded-core/message/170912
> Mute This Topic: https://lists.openembedded.org/mt/93814863/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

