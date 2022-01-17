Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9069AC433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 14:34:25 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web12.11795.1642430064447871817
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 06:34:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dd8vYXuT;
 spf=pass (domain: gmail.com, ip: 209.85.222.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id l15so30678146uai.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 06:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wqp5YEZkOerYTqWJJgbEkthBxkHHCFWwMFNF7NNSep4=;
        b=Dd8vYXuTz6FU9Vd8ScQysY1R48b/kiU/IHuQ8CaJVMxsPQNeEBff6KpcPB4DbI6Bya
         15d/TrR5K1h1BjMnZdhuyXOXsgbV+adcabqVcteHnG4BoIj6MEnWBQFXvIt7hD5K5tiv
         YculomFldH88yBN6wT7sxio73Vo/Mv7jyrxXGzd2sqh3rMg0Io1SCtLuDWC4YBgxdCtC
         pClWr+3VQoNl5djawC8t4ZeokUaWvPpKNg2Z5pXBPJZ8ejwuQlqCpOugCf8/TWTzSR2I
         w1EHywbyqVeC6ZHAUtYe5+PWcU/IrmAfZB+k/4/Mis8BvYoobuQi2RQ86fhLzo08CDe1
         mhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wqp5YEZkOerYTqWJJgbEkthBxkHHCFWwMFNF7NNSep4=;
        b=V1PzcS6K1ErCOb28HUQuS7NvSf9YyLTsG28qw8wCiuz7sTTeWfN5NXVK3kyw1PnxB4
         QtalJuhj71BRra7qfDpwUY3bAjp1nAtQasJgNCVCch6Ji8M+rTJHhYFgK+1vorKjgWmg
         eU+DrqSOIPiqGTqLv2SSmiarEsX9/crnj6c1XwHQzeL3g+3dYu7e23SrNZouM/lfweFU
         bByGPL3pAvI0b6zmi3mhVtBEnP1Qwz0Mo0fibCI6Qq/AZTFcAvJPW4UFNP+ItKso3dak
         Gl2WsCCUKwSJviQbLF9GFqigK2wJIJ657+qoM+6+x8QMLBbz3NDB/nay2l7/aD8ODjx+
         mlvw==
X-Gm-Message-State: AOAM532nSOsKIGO/MkUWrDx3wEAD3qGsXJ08/SpNQsnRJ6JSTGVYRZs9
	hc75spnTi6nNxIcESNL81U9lrT+Y4HjVcsZ7l30=
X-Google-Smtp-Source: 
 ABdhPJzeWHPG6IgrMZWgCA0zRyiGyTr+PJDBsKMsHwTygtPI2BUhDRI8PBy4ot3c8t6UI//HLUOYP1lK1aZNmup2CFk=
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr8105143uai.89.1642430063567;
 Mon, 17 Jan 2022 06:34:23 -0800 (PST)
MIME-Version: 1.0
References: <1642429843-13852-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1642429843-13852-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Jan 2022 15:34:12 +0100
Message-ID: 
 <CANNYZj8Gd1UTVDTtNFW2fEE8knxQZxn63Gd_1m=hWc7TwG8_tg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meson: upgrade 0.60.3 -> 0.61.0
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000081e75905d5c80c65"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 14:34:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160653

--00000000000081e75905d5c80c65
Content-Type: text/plain; charset="UTF-8"

Please hold this off, I have a 0.61.1 patch.

Alex

On Mon, 17 Jan 2022 at 15:31, wangmy <wangmy@fujitsu.com> wrote:

> 0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> removed since it is included in 0.61.0
>
> Changelog:
> ==========
> backend_startup_project will no longer erase the last project in a VS
> solution
> if it is not the specified project.
>
> Previously the Windows module only accepted CustomTargets with one output,
> it now accepts them with more than one output, and creates a windows
> resource
> target for each output. Additionally it now accepts indexes of
> CustomTargets
>
> Add a man page backend to refman
>
> extract_objects() supports generated sources
>
> Python 3.6 support will be dropped in the next release
>
> Warning if check kwarg of run_command is missing
>
> meson rewrite can modify extra_files
>
> meson rewrite target <target> info outputs target's extra_files
>
> As Visual Studio 2022 is released recently, it's time to support the new
> version
> in Meson. This mainly includes the new "v143" platform tools.
>
> Support for CMake <3.14 is now deprecated for CMake subprojects
>
> Added support for sccache
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-devtools/meson/meson.inc         |  3 +-
>  ...sues-that-arise-when-cross-compiling.patch | 39 -------------------
>  .../{meson_0.60.3.bb => meson_0.61.0.bb}      |  0
>  ...on_0.60.3.bb => nativesdk-meson_0.61.0.bb} |  0
>  4 files changed, 1 insertion(+), 41 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
>  rename meta/recipes-devtools/meson/{meson_0.60.3.bb => meson_0.61.0.bb}
> (100%)
>  rename meta/recipes-devtools/meson/{nativesdk-meson_0.60.3.bb =>
> nativesdk-meson_0.61.0.bb} (100%)
>
> diff --git a/meta/recipes-devtools/meson/meson.inc
> b/meta/recipes-devtools/meson/meson.inc
> index 042cf130e4..452b0c18ee 100644
> --- a/meta/recipes-devtools/meson/meson.inc
> +++ b/meta/recipes-devtools/meson/meson.inc
> @@ -8,14 +8,13 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
>  SRC_URI = "
> https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz
> \
> -
>  file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
>
> file://0001-python-module-do-not-manipulate-the-environment-when.patch \
>             file://disable-rpath-handling.patch \
>             file://0001-Make-CPU-family-warnings-fatal.patch \
>             file://0002-Support-building-allarch-recipes-again.patch \
>             file://0001-is_debianlike-always-return-False.patch \
>             "
> -SRC_URI[sha256sum] =
> "87ca5fa9358a01864529392bd64e027158eb94afca7c7766b1866ef27eccb98e"
> +SRC_URI[sha256sum] =
> "ea9f33246b1f23f02e90a50e75e0f41e526f6dabf0c24f3e00e27a3f5abdc35c"
>
>  UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
>  UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
> diff --git
> a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> deleted file mode 100644
> index b098c4a123..0000000000
> ---
> a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From bbdd6679e49bcba5ec022b240ac234a87b451e41 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Fri, 4 Aug 2017 16:16:41 +0300
> -Subject: [PATCH] gtkdoc: add support for a binary wrapper
> -
> -Make it possible to specify a wrapper for executing binaries
> -in cross-compiling scenarios.
> -(usually, some kind of target hardware emulator, such as qemu)
> -
> -Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/9627
> ]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
> ----
> - mesonbuild/modules/gnome.py | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> -index 1c6952d..5a6ff94 100644
> ---- a/mesonbuild/modules/gnome.py
> -+++ b/mesonbuild/modules/gnome.py
> -@@ -35,7 +35,7 @@ from ..mesonlib import (
> - from ..dependencies import Dependency, PkgConfigDependency,
> InternalDependency
> - from ..interpreterbase import noPosargs, noKwargs, permittedKwargs,
> FeatureNew, FeatureNewKwargs, FeatureDeprecatedKwargs, FeatureDeprecated
> - from ..interpreterbase import typed_kwargs, KwargInfo, ContainerTypeInfo
> --from ..programs import ExternalProgram, OverrideProgram
> -+from ..programs import ExternalProgram, OverrideProgram,
> EmptyExternalProgram
> - from ..build import CustomTarget, CustomTargetIndex, GeneratedList
> -
> - if T.TYPE_CHECKING:
> -@@ -1103,6 +1103,9 @@ class GnomeModule(ExtensionModule):
> -             args.append(f'--{program_name}={path}')
> -         if namespace:
> -             args.append('--namespace=' + namespace)
> -+        if state.environment.need_exe_wrapper() and not
> isinstance(state.environment.get_exe_wrapper(), EmptyExternalProgram):
> -+            args.append('--run=' + '
> '.join(state.environment.get_exe_wrapper().get_command()))
> -+
> -         args += self._unpack_args('--htmlargs=', 'html_args', kwargs)
> -         args += self._unpack_args('--scanargs=', 'scan_args', kwargs)
> -         args += self._unpack_args('--scanobjsargs=', 'scanobjs_args',
> kwargs)
> diff --git a/meta/recipes-devtools/meson/meson_0.60.3.bb
> b/meta/recipes-devtools/meson/meson_0.61.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/meson/meson_0.60.3.bb
> rename to meta/recipes-devtools/meson/meson_0.61.0.bb
> diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.60.3.bb
> b/meta/recipes-devtools/meson/nativesdk-meson_0.61.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/meson/nativesdk-meson_0.60.3.bb
> rename to meta/recipes-devtools/meson/nativesdk-meson_0.61.0.bb
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160647):
> https://lists.openembedded.org/g/openembedded-core/message/160647
> Mute This Topic: https://lists.openembedded.org/mt/88484714/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000081e75905d5c80c65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please hold this off, I have a 0.61.1 patch.</div><di=
v><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, 17 Jan 2022 at 15:31, wangmy &lt;<a =
href=3D"mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">0001-gtkdoc-fix-issues=
-that-arise-when-cross-compiling.patch<br>
removed since it is included in 0.61.0<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
backend_startup_project will no longer erase the last project in a VS solut=
ion<br>
if it is not the specified project.<br>
<br>
Previously the Windows module only accepted CustomTargets with one output,<=
br>
it now accepts them with more than one output, and creates a windows resour=
ce<br>
target for each output. Additionally it now accepts indexes of CustomTarget=
s<br>
<br>
Add a man page backend to refman<br>
<br>
extract_objects() supports generated sources<br>
<br>
Python 3.6 support will be dropped in the next release<br>
<br>
Warning if check kwarg of run_command is missing<br>
<br>
meson rewrite can modify extra_files<br>
<br>
meson rewrite target &lt;target&gt; info outputs target&#39;s extra_files<b=
r>
<br>
As Visual Studio 2022 is released recently, it&#39;s time to support the ne=
w version<br>
in Meson. This mainly includes the new &quot;v143&quot; platform tools.<br>
<br>
Support for CMake &lt;3.14 is now deprecated for CMake subprojects<br>
<br>
Added support for sccache<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/meson/meson.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 3 +-<br>
=C2=A0...sues-that-arise-when-cross-compiling.patch | 39 ------------------=
-<br>
=C2=A0.../{<a href=3D"http://meson_0.60.3.bb" rel=3D"noreferrer" target=3D"=
_blank">meson_0.60.3.bb</a> =3D&gt; <a href=3D"http://meson_0.61.0.bb" rel=
=3D"noreferrer" target=3D"_blank">meson_0.61.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 0<br>
=C2=A0...<a href=3D"http://on_0.60.3.bb" rel=3D"noreferrer" target=3D"_blan=
k">on_0.60.3.bb</a> =3D&gt; <a href=3D"http://nativesdk-meson_0.61.0.bb" re=
l=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.61.0.bb</a>} |=C2=A0 0=
<br>
=C2=A04 files changed, 1 insertion(+), 41 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-=
issues-that-arise-when-cross-compiling.patch<br>
=C2=A0rename meta/recipes-devtools/meson/{<a href=3D"http://meson_0.60.3.bb=
" rel=3D"noreferrer" target=3D"_blank">meson_0.60.3.bb</a> =3D&gt; <a href=
=3D"http://meson_0.61.0.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.61=
.0.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/meson/{<a href=3D"http://nativesdk-meson=
_0.60.3.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.60.3.bb<=
/a> =3D&gt; <a href=3D"http://nativesdk-meson_0.61.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">nativesdk-meson_0.61.0.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/=
meson/meson.inc<br>
index 042cf130e4..452b0c18ee 100644<br>
--- a/meta/recipes-devtools/meson/meson.inc<br>
+++ b/meta/recipes-devtools/meson/meson.inc<br>
@@ -8,14 +8,13 @@ LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/mesonbuild/meson/rele=
ases/download/$%7BPV%7D/meson-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/mesonbuild/meson/releases/download/${PV}/mes=
on-${PV}.tar.gz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gtkdoc-fix-issues-tha=
t-arise-when-cross-compiling.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-python-module-do-not-=
manipulate-the-environment-when.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://disable-rpath-handling.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Make-CPU-family-warni=
ngs-fatal.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Support-building-alla=
rch-recipes-again.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-is_debianlike-always-=
return-False.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;87ca5fa9358a01864529392bd64e027158eb94afca7c7=
766b1866ef27eccb98e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ea9f33246b1f23f02e90a50e75e0f41e526f6dabf0c24=
f3e00e27a3f5abdc35c&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/mesonbuild=
/meson/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/me=
sonbuild/meson/releases</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;meson-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar=
&quot;<br>
diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-=
arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-g=
tkdoc-fix-issues-that-arise-when-cross-compiling.patch<br>
deleted file mode 100644<br>
index b098c4a123..0000000000<br>
--- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-w=
hen-cross-compiling.patch<br>
+++ /dev/null<br>
@@ -1,39 +0,0 @@<br>
-From bbdd6679e49bcba5ec022b240ac234a87b451e41 Mon Sep 17 00:00:00 2001<br>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targ=
et=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
-Date: Fri, 4 Aug 2017 16:16:41 +0300<br>
-Subject: [PATCH] gtkdoc: add support for a binary wrapper<br>
-<br>
-Make it possible to specify a wrapper for executing binaries<br>
-in cross-compiling scenarios.<br>
-(usually, some kind of target hardware emulator, such as qemu)<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/mesonbuild/meson=
/pull/9627" rel=3D"noreferrer" target=3D"_blank">https://github.com/mesonbu=
ild/meson/pull/9627</a>]<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
-<br>
----<br>
- mesonbuild/modules/gnome.py | 5 ++++-<br>
- 1 file changed, 4 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py<br>
-index 1c6952d..5a6ff94 100644<br>
---- a/mesonbuild/modules/gnome.py<br>
-+++ b/mesonbuild/modules/gnome.py<br>
-@@ -35,7 +35,7 @@ from ..mesonlib import (<br>
- from ..dependencies import Dependency, PkgConfigDependency, InternalDepen=
dency<br>
- from ..interpreterbase import noPosargs, noKwargs, permittedKwargs, Featu=
reNew, FeatureNewKwargs, FeatureDeprecatedKwargs, FeatureDeprecated<br>
- from ..interpreterbase import typed_kwargs, KwargInfo, ContainerTypeInfo<=
br>
--from ..programs import ExternalProgram, OverrideProgram<br>
-+from ..programs import ExternalProgram, OverrideProgram, EmptyExternalPro=
gram<br>
- from ..build import CustomTarget, CustomTargetIndex, GeneratedList<br>
- <br>
- if T.TYPE_CHECKING:<br>
-@@ -1103,6 +1103,9 @@ class GnomeModule(ExtensionModule):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.append(f&#39;--{progr=
am_name}=3D{path}&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if namespace:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.append(&#39;--namespa=
ce=3D&#39; + namespace)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if state.environment.need_exe_wrapper() and n=
ot isinstance(state.environment.get_exe_wrapper(), EmptyExternalProgram):<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append(&#39;--run=3D&#39; =
+ &#39; &#39;.join(state.environment.get_exe_wrapper().get_command()))<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args +=3D self._unpack_args(&#39;--htmla=
rgs=3D&#39;, &#39;html_args&#39;, kwargs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args +=3D self._unpack_args(&#39;--scana=
rgs=3D&#39;, &#39;scan_args&#39;, kwargs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args +=3D self._unpack_args(&#39;--scano=
bjsargs=3D&#39;, &#39;scanobjs_args&#39;, kwargs)<br>
diff --git a/meta/recipes-devtools/meson/<a href=3D"http://meson_0.60.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">meson_0.60.3.bb</a> b/meta/recipes-de=
vtools/meson/<a href=3D"http://meson_0.61.0.bb" rel=3D"noreferrer" target=
=3D"_blank">meson_0.61.0.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/meson/<a href=3D"http://meson_0.60.3.bb" =
rel=3D"noreferrer" target=3D"_blank">meson_0.60.3.bb</a><br>
rename to meta/recipes-devtools/meson/<a href=3D"http://meson_0.61.0.bb" re=
l=3D"noreferrer" target=3D"_blank">meson_0.61.0.bb</a><br>
diff --git a/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_=
0.60.3.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.60.3.bb</=
a> b/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_0.61.0.b=
b" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.61.0.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_0=
.60.3.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.60.3.bb</a=
><br>
rename to meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_0.6=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.61.0.bb</a><=
br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160647): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160647" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160647</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88484714/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88484714/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000081e75905d5c80c65--

