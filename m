Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1FFC433F5
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 14:07:36 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.40606.1639577254860953832
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 06:07:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=Kfgvsfx8;
 spf=pass (domain: madison.systems, ip: 209.85.167.53,
 mailfrom: matt@madison.systems)
Received: by mail-lf1-f53.google.com with SMTP id bi37so43417492lfb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 06:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dW00DXmVulHXmcVkyBeorc3T4jDchjT0QsiU79UBfSg=;
        b=Kfgvsfx8NQivaq6kelO17W5Em0LP/fh9Cyeu0G6YaFIa24jvcaQA19r4Yd5M1zC+Zv
         1LwWnsACMi2hRSJGf6t4S3aFW4k3J15rqQcY/G2+anPi8t7y8H17Y15SP4By7aq6kf5q
         GTa0ZiKyuDQtMNHAnTZJkYMMRfDVcb9vvFOQfdDrZ7spirG8aEBjBd2KVmuv6IpxbWi3
         dQy6x3o294v4ukqzJG12BxcFztt6moRvhx6d022/DUvzBALDhUkdTSjcjYzDfCewRGpQ
         3iZbEGYuXNRc9S/Dg6jyk7/TTmQqmA7cYY7+yh2QDYKejqIY8h6Wc27hHDKsiBQ45Ty7
         o8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dW00DXmVulHXmcVkyBeorc3T4jDchjT0QsiU79UBfSg=;
        b=2YSLxecBW2aL2FmYTg3AzTdYn55ZIykTsi6oDBAg/fve46igRsjfZgMv7tGVpgYRkt
         NFFxeNjFLDjEwVSzD2EXS/uVlQ1VRczscVa/y3cL2riYlBNcCAftoIaGvewL1nRYEqEF
         krQKImQXfZPD5MX4Vb8whrwmdDnwAAF+D/32gUe8qkmZBcoYFXQ+XfRGx1iAgoYUX8b6
         jqKa4bchwBr4jPL5FkAk0PiPLQE3cDWQAqoPXhP700MHfST3OOUIoyeg4NzwEcJ1Ckl3
         B6EGXiCeOMSzfY3Y4woo888J9zaPh0H/rcXPQw+4eHyLwDCyptGWNTD0PEt2oZt3p5D6
         yF4g==
X-Gm-Message-State: AOAM530a+QXqQo07EObK4DfoZXfZXb+GjSyYipPPrPS4ie6Kg1+z6w0p
	820p4QhNg9xM6AVkcstL7WDUEYN5d79R4ot8NlhQSg==
X-Google-Smtp-Source: 
 ABdhPJzhFN5ARLiCRgu7H2YRNBsYV+qHfGXjk66TngKHOCgwV4YJMur9SL49jVr9jFzQNE37ZTpD6x0y3ijqe7CqaLI=
X-Received: by 2002:a05:6512:23a7:: with SMTP id
 c39mr10212456lfv.655.1639577252379;
 Wed, 15 Dec 2021 06:07:32 -0800 (PST)
MIME-Version: 1.0
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-3-alex@linutronix.de>
In-Reply-To: <20211204071323.2480163-3-alex@linutronix.de>
From: Matt Madison <matt@madison.systems>
Date: Wed, 15 Dec 2021 06:07:21 -0800
Message-ID: 
 <CAGgRHJpbpit-O5dRs_ytafLgk8cOb4qReACeGDaB2sk=jB+qWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/26] meson: configure and use generic
 exe_wrapper
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000b5d45705d32fd3be"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Dec 2021 14:07:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159724

--000000000000b5d45705d32fd3be
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 3, 2021 at 11:13 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> This replaces the specific gtkdoc wrapper setting
> (which was rejected by upstream in
> https://github.com/mesonbuild/meson/pull/9627)
> with a generic, officially supported and documented exe_wrapper,
> which is enabled subject to qemu usermode support
> (just as is done for g-i and gtk-doc with autotools).
>
> gtk-doc support is adjusted so that this wrapper is passed to
> meson's gtk-doc module, which passes it to gtk-doc.
>
> The adjusted patch is re-submitted upstream.
>
> The side effect of this is that meson is now able to run
> target binaries in a generic way when it wants to, so this
> may affect cross-builds - hopefully in a positive way.
>

Inheriting the qemu class unconditionally causes task hash changes for
allarch recipes
that use meson (e.g. cantarell-fonts) when MACHINE is changed from, say, an
x86 architecture
to an aarch64 architecture, due to the qemu bbclass referencing the
OLDEST_KERNEL
variable.

I'm not sure of the best way to fix this; doing an overwrite of
OLDEST_KERNEL in
allarch.bbclass as is done for some other variables might be OK? I'm not
sure it
makes sense for allarch recipes to reference any QEMU stuff at all, so
maybe splitting
all of the exe_wrapper support into a separate bbclass that is only
inherited when
EXEWRAPPER_ENABLED is True is better?

Thanks,
-Matt


>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes/meson.bbclass                    | 30 +++++++++++++++++--
>  ...sues-that-arise-when-cross-compiling.patch | 27 +++++++++++------
>  2 files changed, 46 insertions(+), 11 deletions(-)
>
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index a7981e481f..ffec5f3269 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -1,7 +1,12 @@
> -inherit python3native meson-routines
> +inherit python3native meson-routines qemu
>
>  DEPENDS:append = " meson-native ninja-native"
>
> +EXEWRAPPER_ENABLED:class-native = "False"
> +EXEWRAPPER_ENABLED:class-nativesdk = "False"
> +EXEWRAPPER_ENABLED ?= "${@bb.utils.contains('MACHINE_FEATURES',
> 'qemu-usermode', 'True', 'False', d)}"
> +DEPENDS:append = "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED') ==
> 'True' else ''}"
> +
>  # As Meson enforces out-of-tree builds we can just use cleandirs
>  B = "${WORKDIR}/build"
>  do_configure[cleandirs] = "${B}"
> @@ -36,6 +41,9 @@ MESON_CROSS_FILE = ""
>  MESON_CROSS_FILE:class-target = "--cross-file ${WORKDIR}/meson.cross"
>  MESON_CROSS_FILE:class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
>
> +# Needed to set up qemu wrapper below
> +export STAGING_DIR_HOST
> +
>  def rust_tool(d, target_var):
>      rustc = d.getVar('RUSTC')
>      if not rustc:
> @@ -62,6 +70,7 @@ cups-config = 'cups-config'
>  g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
>  g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
>  ${@rust_tool(d, "HOST_SYS")}
> +${@"exe_wrapper = '${WORKDIR}/meson-qemuwrapper'" if
> d.getVar('EXEWRAPPER_ENABLED') == 'True' else ""}
>
>  [built-in options]
>  c_args = ${@meson_array('CFLAGS', d)}
> @@ -71,7 +80,6 @@ cpp_link_args = ${@meson_array('LDFLAGS', d)}
>
>  [properties]
>  needs_exe_wrapper = true
> -gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
>
>  [host_machine]
>  system = '${@meson_operating_system('HOST_OS', d)}'
> @@ -106,6 +114,24 @@ cpp_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
>  EOF
>  }
>
> +do_write_config:append:class-target() {
> +    # Write out a qemu wrapper that will be used as exe_wrapper so that
> meson
> +    # can run target helper binaries through that.
> +    qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST',
> ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
> +    cat > ${WORKDIR}/meson-qemuwrapper << EOF
> +#!/bin/sh
> +# Use a modules directory which doesn't exist so we don't load random
> things
> +# which may then get deleted (or their dependencies) and potentially
> segfault
> +export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
> +
> +# meson sets this wrongly (only to libs in build-dir),
> qemu-wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
> +unset LD_LIBRARY_PATH
> +
> +$qemu_binary "\$@"
> +EOF
> +    chmod +x ${WORKDIR}/meson-qemuwrapper
> +}
> +
>  # Tell externalsrc that changes to this file require a reconfigure
>  CONFIGURE_FILES = "meson.build"
>
> diff --git
> a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> index ab4d5969d9..b098c4a123 100644
> ---
> a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> +++
> b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
> @@ -1,29 +1,38 @@
> -From 2f9c59e0489e569c5382404667c10f5c200a72ad Mon Sep 17 00:00:00 2001
> +From bbdd6679e49bcba5ec022b240ac234a87b451e41 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 4 Aug 2017 16:16:41 +0300
> -Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling
> +Subject: [PATCH] gtkdoc: add support for a binary wrapper
>
>  Make it possible to specify a wrapper for executing binaries
> +in cross-compiling scenarios.
>  (usually, some kind of target hardware emulator, such as qemu)
>
>  Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/9627
> ]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>
>  ---
> - mesonbuild/modules/gnome.py | 4 ++++
> - 1 file changed, 4 insertions(+)
> + mesonbuild/modules/gnome.py | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
>
>  diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> -index dc2979e..c9ff9bd 100644
> +index 1c6952d..5a6ff94 100644
>  --- a/mesonbuild/modules/gnome.py
>  +++ b/mesonbuild/modules/gnome.py
> -@@ -1053,6 +1053,10 @@ class GnomeModule(ExtensionModule):
> +@@ -35,7 +35,7 @@ from ..mesonlib import (
> + from ..dependencies import Dependency, PkgConfigDependency,
> InternalDependency
> + from ..interpreterbase import noPosargs, noKwargs, permittedKwargs,
> FeatureNew, FeatureNewKwargs, FeatureDeprecatedKwargs, FeatureDeprecated
> + from ..interpreterbase import typed_kwargs, KwargInfo, ContainerTypeInfo
> +-from ..programs import ExternalProgram, OverrideProgram
> ++from ..programs import ExternalProgram, OverrideProgram,
> EmptyExternalProgram
> + from ..build import CustomTarget, CustomTargetIndex, GeneratedList
> +
> + if T.TYPE_CHECKING:
> +@@ -1103,6 +1103,9 @@ class GnomeModule(ExtensionModule):
>               args.append(f'--{program_name}={path}')
>           if namespace:
>               args.append('--namespace=' + namespace)
> -+        gtkdoc_exe_wrapper =
> state.environment.properties.host.get('gtkdoc_exe_wrapper', None)
> -+        if gtkdoc_exe_wrapper is not None:
> -+            args.append('--run=' + gtkdoc_exe_wrapper)
> ++        if state.environment.need_exe_wrapper() and not
> isinstance(state.environment.get_exe_wrapper(), EmptyExternalProgram):
> ++            args.append('--run=' + '
> '.join(state.environment.get_exe_wrapper().get_command()))
>  +
>           args += self._unpack_args('--htmlargs=', 'html_args', kwargs)
>           args += self._unpack_args('--scanargs=', 'scan_args', kwargs)
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159150):
> https://lists.openembedded.org/g/openembedded-core/message/159150
> Mute This Topic: https://lists.openembedded.org/mt/87494764/3618418
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [matt@madison.systems]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b5d45705d32fd3be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 3, 2021 at 11:13 PM Alexa=
nder Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">This replaces the specific gtkdoc wrapper setting<br>
(which was rejected by upstream in <a href=3D"https://github.com/mesonbuild=
/meson/pull/9627" rel=3D"noreferrer" target=3D"_blank">https://github.com/m=
esonbuild/meson/pull/9627</a>)<br>
with a generic, officially supported and documented exe_wrapper,<br>
which is enabled subject to qemu usermode support<br>
(just as is done for g-i and gtk-doc with autotools).<br>
<br>
gtk-doc support is adjusted so that this wrapper is passed to<br>
meson&#39;s gtk-doc module, which passes it to gtk-doc.<br>
<br>
The adjusted patch is re-submitted upstream.<br>
<br>
The side effect of this is that meson is now able to run<br>
target binaries in a generic way when it wants to, so this<br>
may affect cross-builds - hopefully in a positive way.<br></blockquote><div=
><br></div><div>Inheriting the qemu class unconditionally causes task hash =
changes for allarch recipes</div><div>that use meson (e.g. cantarell-fonts)=
 when MACHINE is changed from, say, an x86 architecture</div><div>to an aar=
ch64 architecture, due to the qemu bbclass referencing the OLDEST_KERNEL</d=
iv><div>variable.</div><div><br></div><div>I&#39;m not sure of the best way=
 to fix this; doing an overwrite of OLDEST_KERNEL in</div><div>allarch.bbcl=
ass as is done for some other variables might be OK? I&#39;m not sure it</d=
iv><div>makes sense for allarch recipes to reference any QEMU stuff at all,=
 so maybe splitting</div><div>all of the exe_wrapper support into a separat=
e bbclass that is only inherited when</div><div>EXEWRAPPER_ENABLED is True =
is better?</div><div><br></div><div>Thanks,</div><div>-Matt</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0meta/classes/meson.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 30 +++++++++++++++++--<br>
=C2=A0...sues-that-arise-when-cross-compiling.patch | 27 +++++++++++------<=
br>
=C2=A02 files changed, 46 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass<br>
index a7981e481f..ffec5f3269 100644<br>
--- a/meta/classes/meson.bbclass<br>
+++ b/meta/classes/meson.bbclass<br>
@@ -1,7 +1,12 @@<br>
-inherit python3native meson-routines<br>
+inherit python3native meson-routines qemu<br>
<br>
=C2=A0DEPENDS:append =3D &quot; meson-native ninja-native&quot;<br>
<br>
+EXEWRAPPER_ENABLED:class-native =3D &quot;False&quot;<br>
+EXEWRAPPER_ENABLED:class-nativesdk =3D &quot;False&quot;<br>
+EXEWRAPPER_ENABLED ?=3D &quot;${@bb.utils.contains(&#39;MACHINE_FEATURES&#=
39;, &#39;qemu-usermode&#39;, &#39;True&#39;, &#39;False&#39;, d)}&quot;<br=
>
+DEPENDS:append =3D &quot;${@&#39; qemu-native&#39; if d.getVar(&#39;EXEWRA=
PPER_ENABLED&#39;) =3D=3D &#39;True&#39; else &#39;&#39;}&quot;<br>
+<br>
=C2=A0# As Meson enforces out-of-tree builds we can just use cleandirs<br>
=C2=A0B =3D &quot;${WORKDIR}/build&quot;<br>
=C2=A0do_configure[cleandirs] =3D &quot;${B}&quot;<br>
@@ -36,6 +41,9 @@ MESON_CROSS_FILE =3D &quot;&quot;<br>
=C2=A0MESON_CROSS_FILE:class-target =3D &quot;--cross-file ${WORKDIR}/meson=
.cross&quot;<br>
=C2=A0MESON_CROSS_FILE:class-nativesdk =3D &quot;--cross-file ${WORKDIR}/me=
son.cross&quot;<br>
<br>
+# Needed to set up qemu wrapper below<br>
+export STAGING_DIR_HOST<br>
+<br>
=C2=A0def rust_tool(d, target_var):<br>
=C2=A0 =C2=A0 =C2=A0rustc =3D d.getVar(&#39;RUSTC&#39;)<br>
=C2=A0 =C2=A0 =C2=A0if not rustc:<br>
@@ -62,6 +70,7 @@ cups-config =3D &#39;cups-config&#39;<br>
=C2=A0g-ir-scanner =3D &#39;${STAGING_BINDIR}/g-ir-scanner-wrapper&#39;<br>
=C2=A0g-ir-compiler =3D &#39;${STAGING_BINDIR}/g-ir-compiler-wrapper&#39;<b=
r>
=C2=A0${@rust_tool(d, &quot;HOST_SYS&quot;)}<br>
+${@&quot;exe_wrapper =3D &#39;${WORKDIR}/meson-qemuwrapper&#39;&quot; if d=
.getVar(&#39;EXEWRAPPER_ENABLED&#39;) =3D=3D &#39;True&#39; else &quot;&quo=
t;}<br>
<br>
=C2=A0[built-in options]<br>
=C2=A0c_args =3D ${@meson_array(&#39;CFLAGS&#39;, d)}<br>
@@ -71,7 +80,6 @@ cpp_link_args =3D ${@meson_array(&#39;LDFLAGS&#39;, d)}<b=
r>
<br>
=C2=A0[properties]<br>
=C2=A0needs_exe_wrapper =3D true<br>
-gtkdoc_exe_wrapper =3D &#39;${B}/gtkdoc-qemuwrapper&#39;<br>
<br>
=C2=A0[host_machine]<br>
=C2=A0system =3D &#39;${@meson_operating_system(&#39;HOST_OS&#39;, d)}&#39;=
<br>
@@ -106,6 +114,24 @@ cpp_link_args =3D ${@meson_array(&#39;BUILD_LDFLAGS&#3=
9;, d)}<br>
=C2=A0EOF<br>
=C2=A0}<br>
<br>
+do_write_config:append:class-target() {<br>
+=C2=A0 =C2=A0 # Write out a qemu wrapper that will be used as exe_wrapper =
so that meson<br>
+=C2=A0 =C2=A0 # can run target helper binaries through that.<br>
+=C2=A0 =C2=A0 qemu_binary=3D&quot;${@qemu_wrapper_cmdline(d, &#39;$STAGING=
_DIR_HOST&#39;, [&#39;$STAGING_DIR_HOST/${libdir}&#39;,&#39;$STAGING_DIR_HO=
ST/${base_libdir}&#39;])}&quot;<br>
+=C2=A0 =C2=A0 cat &gt; ${WORKDIR}/meson-qemuwrapper &lt;&lt; EOF<br>
+#!/bin/sh<br>
+# Use a modules directory which doesn&#39;t exist so we don&#39;t load ran=
dom things<br>
+# which may then get deleted (or their dependencies) and potentially segfa=
ult<br>
+export GIO_MODULE_DIR=3D${STAGING_LIBDIR}/gio/modules-dummy<br>
+<br>
+# meson sets this wrongly (only to libs in build-dir), qemu-wrapper_cmdlin=
e() and GIR_EXTRA_LIBS_PATH take care of it properly<br>
+unset LD_LIBRARY_PATH<br>
+<br>
+$qemu_binary &quot;\$@&quot;<br>
+EOF<br>
+=C2=A0 =C2=A0 chmod +x ${WORKDIR}/meson-qemuwrapper<br>
+}<br>
+<br>
=C2=A0# Tell externalsrc that changes to this file require a reconfigure<br=
>
=C2=A0CONFIGURE_FILES =3D &quot;meson.build&quot;<br>
<br>
diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-=
arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-g=
tkdoc-fix-issues-that-arise-when-cross-compiling.patch<br>
index ab4d5969d9..b098c4a123 100644<br>
--- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-w=
hen-cross-compiling.patch<br>
+++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-w=
hen-cross-compiling.patch<br>
@@ -1,29 +1,38 @@<br>
-From 2f9c59e0489e569c5382404667c10f5c200a72ad Mon Sep 17 00:00:00 2001<br>
+From bbdd6679e49bcba5ec022b240ac234a87b451e41 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Fri, 4 Aug 2017 16:16:41 +0300<br>
-Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling<br>
+Subject: [PATCH] gtkdoc: add support for a binary wrapper<br>
<br>
=C2=A0Make it possible to specify a wrapper for executing binaries<br>
+in cross-compiling scenarios.<br>
=C2=A0(usually, some kind of target hardware emulator, such as qemu)<br>
<br>
=C2=A0Upstream-Status: Submitted [<a href=3D"https://github.com/mesonbuild/=
meson/pull/9627" rel=3D"noreferrer" target=3D"_blank">https://github.com/me=
sonbuild/meson/pull/9627</a>]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
<br>
=C2=A0---<br>
- mesonbuild/modules/gnome.py | 4 ++++<br>
- 1 file changed, 4 insertions(+)<br>
+ mesonbuild/modules/gnome.py | 5 ++++-<br>
+ 1 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.p=
y<br>
-index dc2979e..c9ff9bd 100644<br>
+index 1c6952d..5a6ff94 100644<br>
=C2=A0--- a/mesonbuild/modules/gnome.py<br>
=C2=A0+++ b/mesonbuild/modules/gnome.py<br>
-@@ -1053,6 +1053,10 @@ class GnomeModule(ExtensionModule):<br>
+@@ -35,7 +35,7 @@ from ..mesonlib import (<br>
+ from ..dependencies import Dependency, PkgConfigDependency, InternalDepen=
dency<br>
+ from ..interpreterbase import noPosargs, noKwargs, permittedKwargs, Featu=
reNew, FeatureNewKwargs, FeatureDeprecatedKwargs, FeatureDeprecated<br>
+ from ..interpreterbase import typed_kwargs, KwargInfo, ContainerTypeInfo<=
br>
+-from ..programs import ExternalProgram, OverrideProgram<br>
++from ..programs import ExternalProgram, OverrideProgram, EmptyExternalPro=
gram<br>
+ from ..build import CustomTarget, CustomTargetIndex, GeneratedList<br>
+ <br>
+ if T.TYPE_CHECKING:<br>
+@@ -1103,6 +1103,9 @@ class GnomeModule(ExtensionModule):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append(f&#39;--{progr=
am_name}=3D{path}&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if namespace:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append(&#39;--namespa=
ce=3D&#39; + namespace)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtkdoc_exe_wrapper =3D state.environment.prop=
erties.host.get(&#39;gtkdoc_exe_wrapper&#39;, None)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if gtkdoc_exe_wrapper is not None:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append(&#39;--run=3D&#39; =
+ gtkdoc_exe_wrapper)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if state.environment.need_exe_wrapper() and n=
ot isinstance(state.environment.get_exe_wrapper(), EmptyExternalProgram):<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append(&#39;--run=3D&#39; =
+ &#39; &#39;.join(state.environment.get_exe_wrapper().get_command()))<br>
=C2=A0+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args +=3D self._unpack_args(&#39;--htmla=
rgs=3D&#39;, &#39;html_args&#39;, kwargs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args +=3D self._unpack_args(&#39;--scana=
rgs=3D&#39;, &#39;scan_args&#39;, kwargs)<br>
-- <br>
2.20.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159150): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159150" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159150</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87494764/3618=
418" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87494764/3618418</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [matt@madison.systems]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000b5d45705d32fd3be--

