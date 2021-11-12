Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF717C433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 00:10:26 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.8301.1636675825983975505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 16:10:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cTa8himD;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id bu11so5223568qvb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 16:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+7dcU8byFY2xTrOwoAyqwxA5t+zcRL1fu8RCuD98R6A=;
        b=cTa8himDbavJQ1hlKfyjOc/3oXhfv4Uc/xyeA6nTEU1kunXWrUnAuGfx157H1qZ8rI
         km2WVmL2cfkVVMhlhRFebM1BGJtp8cddvQCFOYoPli+2GLRfjCLzcr6tQgqeiyuoJF1I
         eoyta2fdZfDLMWZn/GlAVZ8X9nxjcYD4F1BT50wks5i8Bjt/y4HxSeKzFB4pZ11qIUEu
         kKQqFHglZfVFiM+fF8+UGX/GXtKw6G/xIezaFrmjCwu2aANQa2uosZakIvyOA4Uzjmwm
         cAkYJ7HPjx+ycN7PgqFSChpE7fy2fFIF1A7ERGPUhu+GJZD1GIeWYnqq9SSVR8jAOHaI
         bsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+7dcU8byFY2xTrOwoAyqwxA5t+zcRL1fu8RCuD98R6A=;
        b=75GkBHctIYSkXdC2QYLXU5YGPRw8ngjfCC8HzDJnxnXObQ+HN5Rp/JVVTcCet4hDzX
         tyuDcL1bjoSyP+FxnKQEsA+lpGiOezsZw6qPvpzamRzaznWr8I8rgadBlVfk/yX3DfLO
         SLVbyPARt3VO6cXmlrlRsbO5YXx6q3tHs1O7m1W1uWRMHRl1I9WQrEn5JTBEuksVuQdb
         l21TiL8c7Q8DTiRxxmyTVfvLQExPrmgvRgBOm9ieFOrk7HWiwTjk+o91me+t9sn3LFPY
         dmSCx4Bn9FKfZQ4CNHNoTdnaoPLyjhdJ0sL+YGcj9R5YdQUXslLNrb4um/w2Gcs0DjRl
         BC2g==
X-Gm-Message-State: AOAM530qzM8vAzwRiBPTiW7rCnlN0tieyygZ02O0koLihy+jDoq9D+Bh
	MlRnTLXIvjyPehSbRfVDQgWQuui3gkU7XoAomOZv6PO4VLg=
X-Google-Smtp-Source: 
 ABdhPJykWZTiJX8F8MAWu6H7Qi48Y4+WSUfN/VweMhKoejQggN4vzip5qUpegyH3SE8srXAnkkCecA+aEToXZIhvI44=
X-Received: by 2002:ad4:5e8b:: with SMTP id
 jl11mr10793240qvb.18.1636675824801;
 Thu, 11 Nov 2021 16:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20211110193937.2606747-1-alex@linutronix.de>
 <20211110193937.2606747-21-alex@linutronix.de>
In-Reply-To: <20211110193937.2606747-21-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Nov 2021 16:09:58 -0800
Message-ID: 
 <CAMKF1sp4+w70RNRPABteoLrV_gRhvi=SdqSG645wGE5Bxdb22Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 21/24] meson: upgrade 0.59.2 -> 0.60.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 00:10:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158202

seeing a bunch of packages fail common error seems to be

meson.build:1:0: ERROR: Unknown options: "introspection"

list is here

https://errors.yoctoproject.org/Errors/Build/135855/

On Wed, Nov 10, 2021 at 11:40 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-devtools/meson/meson.inc         |  2 +-
>  ...-not-manipulate-the-environment-when.patch | 53 +++++++++----------
>  .../meson/meson/disable-rpath-handling.patch  | 14 ++---
>  .../{meson_0.59.2.bb => meson_0.60.1.bb}      |  0
>  ...on_0.59.2.bb => nativesdk-meson_0.60.1.bb} |  0
>  5 files changed, 33 insertions(+), 36 deletions(-)
>  rename meta/recipes-devtools/meson/{meson_0.59.2.bb => meson_0.60.1.bb} (100%)
>  rename meta/recipes-devtools/meson/{nativesdk-meson_0.59.2.bb => nativesdk-meson_0.60.1.bb} (100%)
>
> diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
> index 174ebd9f31..f383ad9f74 100644
> --- a/meta/recipes-devtools/meson/meson.inc
> +++ b/meta/recipes-devtools/meson/meson.inc
> @@ -15,7 +15,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
>             file://0002-Support-building-allarch-recipes-again.patch \
>             file://0001-is_debianlike-always-return-False.patch \
>             "
> -SRC_URI[sha256sum] = "13dee549a7ba758b7e33ce7719f28d1d337a98d10d378a4779ccc996f5a2fc49"
> +SRC_URI[sha256sum] = "5add789c953d984b500858b2851ee3d7add0460cf1a6f852f0a721af17384e13"
>
>  UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
>  UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
> diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
> index fdadc6869b..86abfa9d52 100644
> --- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
> +++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
> @@ -1,4 +1,4 @@
> -From 2264e67d7c2c22ca634fd26ea8ada6f0344ab280 Mon Sep 17 00:00:00 2001
> +From dd5b4a200cd2fdf7fef627c4b6752f90c00b863a Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 19 Nov 2018 14:24:26 +0100
>  Subject: [PATCH] python module: do not manipulate the environment when calling
> @@ -8,36 +8,31 @@ Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>
>  ---
> - mesonbuild/modules/python.py | 12 ------------
> - 1 file changed, 12 deletions(-)
> + mesonbuild/modules/python.py | 7 +------
> + 1 file changed, 1 insertion(+), 6 deletions(-)
>
>  diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.py
> -index 422155b..aaf5844 100644
> +index f479ab9..b934bc6 100644
>  --- a/mesonbuild/modules/python.py
>  +++ b/mesonbuild/modules/python.py
> -@@ -70,11 +70,6 @@ class PythonDependency(ExternalDependency):
> -                 old_pkg_libdir = os.environ.get('PKG_CONFIG_LIBDIR')
> -                 old_pkg_path = os.environ.get('PKG_CONFIG_PATH')
> -
> --                os.environ.pop('PKG_CONFIG_PATH', None)
> --
> --                if pkg_libdir:
> --                    os.environ['PKG_CONFIG_LIBDIR'] = pkg_libdir
> --
> -                 try:
> -                     self.pkgdep = PkgConfigDependency(pkg_name, environment, kwargs)
> -                     mlog.debug(f'Found "{pkg_name}" via pkgconfig lookup in LIBPC ({pkg_libdir})')
> -@@ -83,13 +78,6 @@ class PythonDependency(ExternalDependency):
> -                     mlog.debug(f'"{pkg_name}" could not be found in LIBPC ({pkg_libdir})')
> -                     mlog.debug(e)
> -
> --                if old_pkg_path is not None:
> --                    os.environ['PKG_CONFIG_PATH'] = old_pkg_path
> --
> --                if old_pkg_libdir is not None:
> --                    os.environ['PKG_CONFIG_LIBDIR'] = old_pkg_libdir
> --                else:
> --                    os.environ.pop('PKG_CONFIG_LIBDIR', None)
> -             else:
> -                 mlog.debug(f'"{pkg_name}" could not be found in LIBPC ({pkg_libdir}), this is likely due to a relocated python installation')
> +@@ -239,10 +239,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
> +         # If python-X.Y.pc exists in LIBPC, we will try to use it
> +         def wrap_in_pythons_pc_dir(name: str, env: 'Environment', kwargs: T.Dict[str, T.Any],
> +                                    installation: 'PythonInstallation') -> 'ExternalDependency':
> +-            old_pkg_libdir = os.environ.pop('PKG_CONFIG_LIBDIR', None)
> +-            old_pkg_path = os.environ.pop('PKG_CONFIG_PATH', None)
> +-            if pkg_libdir:
> +-                os.environ['PKG_CONFIG_LIBDIR'] = pkg_libdir
> +             try:
> +                 return PythonPkgConfigDependency(name, env, kwargs, installation)
> +             finally:
> +@@ -251,8 +247,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
> +                         os.environ[name] = value
> +                     elif name in os.environ:
> +                         del os.environ[name]
> +-                set_env('PKG_CONFIG_LIBDIR', old_pkg_libdir)
> +-                set_env('PKG_CONFIG_PATH', old_pkg_path)
> ++                pass
>
> +         candidates.extend([
> +             functools.partial(wrap_in_pythons_pc_dir, pkg_name, env, kwargs, installation),
> diff --git a/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
> index 7c766c61b0..7aaed8b4a3 100644
> --- a/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
> +++ b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
> @@ -1,4 +1,4 @@
> -From 27bbd3c9d8d86de545fcf6608564a14571c98a61 Mon Sep 17 00:00:00 2001
> +From 18600f7a1cddf23aeabd188f86e66983f27ccfe3 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Fri, 23 Nov 2018 15:28:28 +0000
>  Subject: [PATCH] meson: Disable rpath stripping at install time
> @@ -10,26 +10,28 @@ is a specific directive to do something differently in the project.
>  RP 2018/11/23
>
>  Upstream-Status: Submitted [https://github.com/mesonbuild/meson/issues/2567]
> -
>  ---
>   mesonbuild/minstall.py | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
>  diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
> -index 212568a..06366d4 100644
> +index 7d0da13..17d50db 100644
>  --- a/mesonbuild/minstall.py
>  +++ b/mesonbuild/minstall.py
> -@@ -653,8 +653,11 @@ class Installer:
> +@@ -718,8 +718,11 @@ class Installer:
>               if file_copied:
>                   self.did_install_something = True
>                   try:
>  -                    self.fix_rpath(outname, t.rpath_dirs_to_remove, install_rpath, final_path,
> --                                         install_name_mappings, verbose=False)
> +-                                   install_name_mappings, verbose=False)
>  +                    if install_rpath:
>  +                        self.fix_rpath(outname, t.rpath_dirs_to_remove, install_rpath, final_path,
> -+                                           install_name_mappings, verbose=False)
> ++                                       install_name_mappings, verbose=False)
>  +                    else:
>  +                        print("RPATH changes at install time disabled")
>                   except SystemExit as e:
>                       if isinstance(e.code, int) and e.code == 0:
>                           pass
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-devtools/meson/meson_0.59.2.bb b/meta/recipes-devtools/meson/meson_0.60.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/meson/meson_0.59.2.bb
> rename to meta/recipes-devtools/meson/meson_0.60.1.bb
> diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.59.2.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.60.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/meson/nativesdk-meson_0.59.2.bb
> rename to meta/recipes-devtools/meson/nativesdk-meson_0.60.1.bb
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158105): https://lists.openembedded.org/g/openembedded-core/message/158105
> Mute This Topic: https://lists.openembedded.org/mt/86965718/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

