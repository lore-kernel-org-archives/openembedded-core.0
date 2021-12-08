Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B436EC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 09:32:56 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web12.9978.1638955975768614994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 01:32:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cBf8oOW1;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id ay21so3521838uab.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 01:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cd/9gZ6xOAzsJW1w6L41kSwgC2EOYyUoV5w5hBXUM+c=;
        b=cBf8oOW1LTzsc9sEdiQR7RBzmJHRA1oMCphQyoHbmmVLpEBB9tZ/7ifyKsr4z44WHU
         eYms3ZsvF3gP/JlJPvEw6ei4mAyB0dIsumd4b81lYPECBmVgI60tR8Y4W0YTm4lVXgcJ
         qnKHY/pmFZTjLCiVyMPrhoi7Frb05cuYPeL6xU5lF+xCgtFN5WVZRz9BpVoO6FGaBiAA
         FTY485iFREr6Vem7poav28UkUscW+r6qU1a/C87CKDKqT5FK7X1kDB2V7kav+wqizm41
         CpXZ6AQsloACLdGjm1OEwbAkVsL00rC8hNCBoDBijcCMygNKGHOB2VPX4lRFiUjr0vFx
         SmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cd/9gZ6xOAzsJW1w6L41kSwgC2EOYyUoV5w5hBXUM+c=;
        b=k/IC+ZtTaSJYBotId0SJ8dOXQCdPCUBAbgeePLSLKmpECG03EXio/rgAK6iprTQ+wo
         +PcpNki3Us7MlGbUwDWfbLMxvwAZO86HzLWQMpouemWPoPeRvgdh54InbilZ2grjrJZ2
         wAuJ6vvLnnCrAu9gRR9gNo1gBKbeZ9VoKjxbdNwQKPbI7utHPgWys9F61dLcUkQqX28M
         KURtfrGGwe6w/ObfrrKeIfCpOUMBk0gvn3wxN1qxQ9OoRCZhmbbSwZV9xiDOTVOhxu0H
         t1jeQP8xbPzjZqDaESGvkrCAFzD30qQYd1xt6o1RAFFqPA+MGbU6Z0hLX3eiDNvyEYo4
         Nxdg==
X-Gm-Message-State: AOAM532UgkzCsHqM/kLNwtWA/0etTOyVg+cbcQdzRXD7B8pPmjEjXWhI
	mjHSv0Xt54stowSFgR3rVe2xAa8INC4LxsoIkKc=
X-Google-Smtp-Source: 
 ABdhPJwosaE5CSrNfHeQSXJJWhnqr4dmFc8xslY13c8ZvC7UQ3/vXuXEgku98oCBojzexltRWLm30Ol9hyuvhrGCr+Y=
X-Received: by 2002:a05:6102:3232:: with SMTP id
 x18mr51426254vsf.38.1638955974868;
 Wed, 08 Dec 2021 01:32:54 -0800 (PST)
MIME-Version: 1.0
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-3-alex@linutronix.de>
 <094d6ad8-56a7-837c-b2f2-be82c79511b6@synaptics.com>
In-Reply-To: <094d6ad8-56a7-837c-b2f2-be82c79511b6@synaptics.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Dec 2021 10:32:43 +0100
Message-ID: 
 <CANNYZj-K9YTk4yBcMZXsG2zNQBLkhLsn6JtmZVcrXYkASxHmhQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/26] meson: configure and use generic
 exe_wrapper
To: Hsia-Jun Li <Randy.Li@synaptics.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000af415205d29f2c5a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 09:32:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159352

--000000000000af415205d29f2c5a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It seems like the issue is not that qemu can't run the executable, it's
that executable it wants to run is not there. I'm not sure why it wants to
run something in a 'system' location through qemu, as I do not have access
to your layer.

If qemu-usermode is not in MACHINE_FEATURES, then the wrapper is not
configured at all, and so things should go back to what they were. Can you
check that it's not?

Alex

On Wed, 8 Dec 2021 at 10:27, Hsia-Jun Li <Randy.Li@synaptics.com> wrote:

>
>
> On 12/4/21 15:13, Alexander Kanavin wrote:
> > CAUTION: Email originated externally, do not click links or open
> attachments unless you recognize the sender and know the content is safe.
> >
> >
> > This replaces the specific gtkdoc wrapper setting
> > (which was rejected by upstream in
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_mesonbu=
ild_meson_pull_9627&d=3DDwIDAg&c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM=
0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=3DCAFnH4fxB5TbFzRZLDR=
gLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=3Dd8BltpV_tYTB24NoB22HJJW4K=
ZkMUZszeTnLXy4O-MA&e=3D
> )
> > with a generic, officially supported and documented exe_wrapper,
> > which is enabled subject to qemu usermode support
> > (just as is done for g-i and gtk-doc with autotools).
> >
> > gtk-doc support is adjusted so that this wrapper is passed to
> > meson's gtk-doc module, which passes it to gtk-doc.
> >
> > The adjusted patch is re-submitted upstream.
> >
> > The side effect of this is that meson is now able to run
> > target binaries in a generic way when it wants to, so this
> > may affect cross-builds - hopefully in a positive way.
>
> Unfortunately, the meta layer I made for android native would be the
> victim of that.
>
> | DEBUG: Executing shell function do_configure
> | NOTE: Executing meson ...
> | qemu-arm: Could not open '/system/bin/linker': No such file or director=
y
> | The Meson build system
> | Version: 0.60.1
>
> I am not sure how I should make qemu usermode be compatible with the
> Android environment. I just add "qemu-usermode" into
> MACHINE_FEATURES_BACKFILL_CONSIDERED in the machine configure of the
> meta-android-ndk.
>
> I should report this more early but I can't spend much time on this
> android project.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >   meta/classes/meson.bbclass                    | 30 +++++++++++++++++-=
-
> >   ...sues-that-arise-when-cross-compiling.patch | 27 +++++++++++------
> >   2 files changed, 46 insertions(+), 11 deletions(-)
> >
> > diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> > index a7981e481f..ffec5f3269 100644
> > --- a/meta/classes/meson.bbclass
> > +++ b/meta/classes/meson.bbclass
> > @@ -1,7 +1,12 @@
> > -inherit python3native meson-routines
> > +inherit python3native meson-routines qemu
> >
> >   DEPENDS:append =3D " meson-native ninja-native"
> >
> > +EXEWRAPPER_ENABLED:class-native =3D "False"
> > +EXEWRAPPER_ENABLED:class-nativesdk =3D "False"
> > +EXEWRAPPER_ENABLED ?=3D "${@bb.utils.contains('MACHINE_FEATURES',
> 'qemu-usermode', 'True', 'False', d)}"
> > +DEPENDS:append =3D "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED'=
)
> =3D=3D 'True' else ''}"
> > +
> >   # As Meson enforces out-of-tree builds we can just use cleandirs
> >   B =3D "${WORKDIR}/build"
> >   do_configure[cleandirs] =3D "${B}"
> > @@ -36,6 +41,9 @@ MESON_CROSS_FILE =3D ""
> >   MESON_CROSS_FILE:class-target =3D "--cross-file ${WORKDIR}/meson.cros=
s"
> >   MESON_CROSS_FILE:class-nativesdk =3D "--cross-file
> ${WORKDIR}/meson.cross"
> >
> > +# Needed to set up qemu wrapper below
> > +export STAGING_DIR_HOST
> > +
> >   def rust_tool(d, target_var):
> >       rustc =3D d.getVar('RUSTC')
> >       if not rustc:
> > @@ -62,6 +70,7 @@ cups-config =3D 'cups-config'
> >   g-ir-scanner =3D '${STAGING_BINDIR}/g-ir-scanner-wrapper'
> >   g-ir-compiler =3D '${STAGING_BINDIR}/g-ir-compiler-wrapper'
> >   ${@rust_tool(d, "HOST_SYS")}
> > +${@"exe_wrapper =3D '${WORKDIR}/meson-qemuwrapper'" if
> d.getVar('EXEWRAPPER_ENABLED') =3D=3D 'True' else ""}
> >
> >   [built-in options]
> >   c_args =3D ${@meson_array('CFLAGS', d)}
> > @@ -71,7 +80,6 @@ cpp_link_args =3D ${@meson_array('LDFLAGS', d)}
> >
> >   [properties]
> >   needs_exe_wrapper =3D true
> > -gtkdoc_exe_wrapper =3D '${B}/gtkdoc-qemuwrapper'
> >
> >   [host_machine]
> >   system =3D '${@meson_operating_system('HOST_OS', d)}'
> > @@ -106,6 +114,24 @@ cpp_link_args =3D ${@meson_array('BUILD_LDFLAGS', =
d)}
> >   EOF
> >   }
> >
> > +do_write_config:append:class-target() {
> > +    # Write out a qemu wrapper that will be used as exe_wrapper so tha=
t
> meson
> > +    # can run target helper binaries through that.
> > +    qemu_binary=3D"${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST',
> ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
> > +    cat > ${WORKDIR}/meson-qemuwrapper << EOF
> > +#!/bin/sh
> > +# Use a modules directory which doesn't exist so we don't load random
> things
> > +# which may then get deleted (or their dependencies) and potentially
> segfault
> > +export GIO_MODULE_DIR=3D${STAGING_LIBDIR}/gio/modules-dummy
> > +
> > +# meson sets this wrongly (only to libs in build-dir),
> qemu-wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
> > +unset LD_LIBRARY_PATH
> > +
> > +$qemu_binary "\$@"
> > +EOF
> > +    chmod +x ${WORKDIR}/meson-qemuwrapper
> > +}
> > +
> >   # Tell externalsrc that changes to this file require a reconfigure
> >   CONFIGURE_FILES =3D "meson.build"
> >
> > diff --git
> a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-whe=
n-cross-compiling.patch
> b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-whe=
n-cross-compiling.patch
> > index ab4d5969d9..b098c4a123 100644
> > ---
> a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-whe=
n-cross-compiling.patch
> > +++
> b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-whe=
n-cross-compiling.patch
> > @@ -1,29 +1,38 @@
> > -From 2f9c59e0489e569c5382404667c10f5c200a72ad Mon Sep 17 00:00:00 2001
> > +From bbdd6679e49bcba5ec022b240ac234a87b451e41 Mon Sep 17 00:00:00 2001
> >   From: Alexander Kanavin <alex.kanavin@gmail.com>
> >   Date: Fri, 4 Aug 2017 16:16:41 +0300
> > -Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling
> > +Subject: [PATCH] gtkdoc: add support for a binary wrapper
> >
> >   Make it possible to specify a wrapper for executing binaries
> > +in cross-compiling scenarios.
> >   (usually, some kind of target hardware emulator, such as qemu)
> >
> >   Upstream-Status: Submitted [
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_mesonbu=
ild_meson_pull_9627&d=3DDwIDAg&c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM=
0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=3DCAFnH4fxB5TbFzRZLDR=
gLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=3Dd8BltpV_tYTB24NoB22HJJW4K=
ZkMUZszeTnLXy4O-MA&e=3D
> ]
> >   Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >
> >   ---
> > - mesonbuild/modules/gnome.py | 4 ++++
> > - 1 file changed, 4 insertions(+)
> > + mesonbuild/modules/gnome.py | 5 ++++-
> > + 1 file changed, 4 insertions(+), 1 deletion(-)
> >
> >   diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.p=
y
> > -index dc2979e..c9ff9bd 100644
> > +index 1c6952d..5a6ff94 100644
> >   --- a/mesonbuild/modules/gnome.py
> >   +++ b/mesonbuild/modules/gnome.py
> > -@@ -1053,6 +1053,10 @@ class GnomeModule(ExtensionModule):
> > +@@ -35,7 +35,7 @@ from ..mesonlib import (
> > + from ..dependencies import Dependency, PkgConfigDependency,
> InternalDependency
> > + from ..interpreterbase import noPosargs, noKwargs, permittedKwargs,
> FeatureNew, FeatureNewKwargs, FeatureDeprecatedKwargs, FeatureDeprecated
> > + from ..interpreterbase import typed_kwargs, KwargInfo,
> ContainerTypeInfo
> > +-from ..programs import ExternalProgram, OverrideProgram
> > ++from ..programs import ExternalProgram, OverrideProgram,
> EmptyExternalProgram
> > + from ..build import CustomTarget, CustomTargetIndex, GeneratedList
> > +
> > + if T.TYPE_CHECKING:
> > +@@ -1103,6 +1103,9 @@ class GnomeModule(ExtensionModule):
> >                args.append(f'--{program_name}=3D{path}')
> >            if namespace:
> >                args.append('--namespace=3D' + namespace)
> > -+        gtkdoc_exe_wrapper =3D
> state.environment.properties.host.get('gtkdoc_exe_wrapper', None)
> > -+        if gtkdoc_exe_wrapper is not None:
> > -+            args.append('--run=3D' + gtkdoc_exe_wrapper)
> > ++        if state.environment.need_exe_wrapper() and not
> isinstance(state.environment.get_exe_wrapper(), EmptyExternalProgram):
> > ++            args.append('--run=3D' + '
> '.join(state.environment.get_exe_wrapper().get_command()))
> >   +
> >            args +=3D self._unpack_args('--htmlargs=3D', 'html_args', kw=
args)
> >            args +=3D self._unpack_args('--scanargs=3D', 'scan_args', kw=
args)
> > --
> > 2.20.1
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#159150):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_159150&d=3DDwIFaQ&c=3D7dfBJ8cXbWjhc0BhIm=
u8wVIoUFmBzj1s88r8EGyM0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=
=3DCAFnH4fxB5TbFzRZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=3D45V=
6_TRrNONJsAD5I2vogAQnnZusJBFo0xgaXn91aC8&e=3D
> > Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_87494764_6350696&d=3DDwIFaQ&c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r=
8EGyM0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=3DCAFnH4fxB5TbFz=
RZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=3Dr1-DZP8UnKe5blruwC2x=
C0yCg4vPMbgdQB7csVRG5FI&e=3D
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFm=
Bzj1s88r8EGyM0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=3DCAFnH4=
fxB5TbFzRZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&s=3DaCJ012s9D9DQ=
3yG-GuuQFs_6APt34sTiwSp8typpm6Q&e=3D
> [randy.li@synaptics.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> --
> Hsia-Jun(Randy) Li
>

--000000000000af415205d29f2c5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It seems like the issue is not that qemu can&#39;t ru=
n the executable, it&#39;s that executable it wants to run is not there. I&=
#39;m not sure why it wants to run something in a &#39;system&#39; location=
 through qemu, as I do not have access to your layer.</div><div><br></div><=
div>If qemu-usermode is not in MACHINE_FEATURES, then the wrapper is not co=
nfigured at all, and so things should go back to what they were. Can you ch=
eck that it&#39;s not?<br></div><div><br></div><div>Alex<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 8=
 Dec 2021 at 10:27, Hsia-Jun Li &lt;<a href=3D"mailto:Randy.Li@synaptics.co=
m">Randy.Li@synaptics.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
<br>
On 12/4/21 15:13, Alexander Kanavin wrote:<br>
&gt; CAUTION: Email originated externally, do not click links or open attac=
hments unless you recognize the sender and know the content is safe.<br>
&gt; <br>
&gt; <br>
&gt; This replaces the specific gtkdoc wrapper setting<br>
&gt; (which was rejected by upstream in <a href=3D"https://urldefense.proof=
point.com/v2/url?u=3Dhttps-3A__github.com_mesonbuild_meson_pull_9627&amp;d=
=3DDwIDAg&amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&amp;r=3DP4xb2=
_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&amp;m=3DCAFnH4fxB5TbFzRZLDRgLtKrp2Zz=
M4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&amp;s=3Dd8BltpV_tYTB24NoB22HJJW4KZkMUZ=
szeTnLXy4O-MA&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldef=
ense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_mesonbuild_meson_pull_9=
627&amp;d=3DDwIDAg&amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&amp;=
r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&amp;m=3DCAFnH4fxB5TbFzRZLDR=
gLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&amp;s=3Dd8BltpV_tYTB24NoB22HJ=
JW4KZkMUZszeTnLXy4O-MA&amp;e=3D</a> )<br>
&gt; with a generic, officially supported and documented exe_wrapper,<br>
&gt; which is enabled subject to qemu usermode support<br>
&gt; (just as is done for g-i and gtk-doc with autotools).<br>
&gt; <br>
&gt; gtk-doc support is adjusted so that this wrapper is passed to<br>
&gt; meson&#39;s gtk-doc module, which passes it to gtk-doc.<br>
&gt; <br>
&gt; The adjusted patch is re-submitted upstream.<br>
&gt; <br>
&gt; The side effect of this is that meson is now able to run<br>
&gt; target binaries in a generic way when it wants to, so this<br>
&gt; may affect cross-builds - hopefully in a positive way.<br>
<br>
Unfortunately, the meta layer I made for android native would be the <br>
victim of that.<br>
<br>
| DEBUG: Executing shell function do_configure<br>
| NOTE: Executing meson ...<br>
| qemu-arm: Could not open &#39;/system/bin/linker&#39;: No such file or di=
rectory<br>
| The Meson build system<br>
| Version: 0.60.1<br>
<br>
I am not sure how I should make qemu usermode be compatible with the <br>
Android environment. I just add &quot;qemu-usermode&quot; into <br>
MACHINE_FEATURES_BACKFILL_CONSIDERED in the machine configure of the <br>
meta-android-ndk.<br>
<br>
I should report this more early but I can&#39;t spend much time on this <br=
>
android project.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes/meson.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 30 +++++++++++++++++--<br>
&gt;=C2=A0 =C2=A0...sues-that-arise-when-cross-compiling.patch | 27 +++++++=
++++------<br>
&gt;=C2=A0 =C2=A02 files changed, 46 insertions(+), 11 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass<b=
r>
&gt; index a7981e481f..ffec5f3269 100644<br>
&gt; --- a/meta/classes/meson.bbclass<br>
&gt; +++ b/meta/classes/meson.bbclass<br>
&gt; @@ -1,7 +1,12 @@<br>
&gt; -inherit python3native meson-routines<br>
&gt; +inherit python3native meson-routines qemu<br>
&gt; <br>
&gt;=C2=A0 =C2=A0DEPENDS:append =3D &quot; meson-native ninja-native&quot;<=
br>
&gt; <br>
&gt; +EXEWRAPPER_ENABLED:class-native =3D &quot;False&quot;<br>
&gt; +EXEWRAPPER_ENABLED:class-nativesdk =3D &quot;False&quot;<br>
&gt; +EXEWRAPPER_ENABLED ?=3D &quot;${@bb.utils.contains(&#39;MACHINE_FEATU=
RES&#39;, &#39;qemu-usermode&#39;, &#39;True&#39;, &#39;False&#39;, d)}&quo=
t;<br>
&gt; +DEPENDS:append =3D &quot;${@&#39; qemu-native&#39; if d.getVar(&#39;E=
XEWRAPPER_ENABLED&#39;) =3D=3D &#39;True&#39; else &#39;&#39;}&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0# As Meson enforces out-of-tree builds we can just use cle=
andirs<br>
&gt;=C2=A0 =C2=A0B =3D &quot;${WORKDIR}/build&quot;<br>
&gt;=C2=A0 =C2=A0do_configure[cleandirs] =3D &quot;${B}&quot;<br>
&gt; @@ -36,6 +41,9 @@ MESON_CROSS_FILE =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0MESON_CROSS_FILE:class-target =3D &quot;--cross-file ${WOR=
KDIR}/meson.cross&quot;<br>
&gt;=C2=A0 =C2=A0MESON_CROSS_FILE:class-nativesdk =3D &quot;--cross-file ${=
WORKDIR}/meson.cross&quot;<br>
&gt; <br>
&gt; +# Needed to set up qemu wrapper below<br>
&gt; +export STAGING_DIR_HOST<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0def rust_tool(d, target_var):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rustc =3D d.getVar(&#39;RUSTC&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if not rustc:<br>
&gt; @@ -62,6 +70,7 @@ cups-config =3D &#39;cups-config&#39;<br>
&gt;=C2=A0 =C2=A0g-ir-scanner =3D &#39;${STAGING_BINDIR}/g-ir-scanner-wrapp=
er&#39;<br>
&gt;=C2=A0 =C2=A0g-ir-compiler =3D &#39;${STAGING_BINDIR}/g-ir-compiler-wra=
pper&#39;<br>
&gt;=C2=A0 =C2=A0${@rust_tool(d, &quot;HOST_SYS&quot;)}<br>
&gt; +${@&quot;exe_wrapper =3D &#39;${WORKDIR}/meson-qemuwrapper&#39;&quot;=
 if d.getVar(&#39;EXEWRAPPER_ENABLED&#39;) =3D=3D &#39;True&#39; else &quot=
;&quot;}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0[built-in options]<br>
&gt;=C2=A0 =C2=A0c_args =3D ${@meson_array(&#39;CFLAGS&#39;, d)}<br>
&gt; @@ -71,7 +80,6 @@ cpp_link_args =3D ${@meson_array(&#39;LDFLAGS&#39;, =
d)}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0[properties]<br>
&gt;=C2=A0 =C2=A0needs_exe_wrapper =3D true<br>
&gt; -gtkdoc_exe_wrapper =3D &#39;${B}/gtkdoc-qemuwrapper&#39;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0[host_machine]<br>
&gt;=C2=A0 =C2=A0system =3D &#39;${@meson_operating_system(&#39;HOST_OS&#39=
;, d)}&#39;<br>
&gt; @@ -106,6 +114,24 @@ cpp_link_args =3D ${@meson_array(&#39;BUILD_LDFLA=
GS&#39;, d)}<br>
&gt;=C2=A0 =C2=A0EOF<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; <br>
&gt; +do_write_config:append:class-target() {<br>
&gt; +=C2=A0 =C2=A0 # Write out a qemu wrapper that will be used as exe_wra=
pper so that meson<br>
&gt; +=C2=A0 =C2=A0 # can run target helper binaries through that.<br>
&gt; +=C2=A0 =C2=A0 qemu_binary=3D&quot;${@qemu_wrapper_cmdline(d, &#39;$ST=
AGING_DIR_HOST&#39;, [&#39;$STAGING_DIR_HOST/${libdir}&#39;,&#39;$STAGING_D=
IR_HOST/${base_libdir}&#39;])}&quot;<br>
&gt; +=C2=A0 =C2=A0 cat &gt; ${WORKDIR}/meson-qemuwrapper &lt;&lt; EOF<br>
&gt; +#!/bin/sh<br>
&gt; +# Use a modules directory which doesn&#39;t exist so we don&#39;t loa=
d random things<br>
&gt; +# which may then get deleted (or their dependencies) and potentially =
segfault<br>
&gt; +export GIO_MODULE_DIR=3D${STAGING_LIBDIR}/gio/modules-dummy<br>
&gt; +<br>
&gt; +# meson sets this wrongly (only to libs in build-dir), qemu-wrapper_c=
mdline() and GIR_EXTRA_LIBS_PATH take care of it properly<br>
&gt; +unset LD_LIBRARY_PATH<br>
&gt; +<br>
&gt; +$qemu_binary &quot;\$@&quot;<br>
&gt; +EOF<br>
&gt; +=C2=A0 =C2=A0 chmod +x ${WORKDIR}/meson-qemuwrapper<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0# Tell externalsrc that changes to this file require a rec=
onfigure<br>
&gt;=C2=A0 =C2=A0CONFIGURE_FILES =3D &quot;meson.build&quot;<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-=
that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0=
001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch<br>
&gt; index ab4d5969d9..b098c4a123 100644<br>
&gt; --- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-ar=
ise-when-cross-compiling.patch<br>
&gt; +++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-ar=
ise-when-cross-compiling.patch<br>
&gt; @@ -1,29 +1,38 @@<br>
&gt; -From 2f9c59e0489e569c5382404667c10f5c200a72ad Mon Sep 17 00:00:00 200=
1<br>
&gt; +From bbdd6679e49bcba5ec022b240ac234a87b451e41 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 =C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin=
@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date: Fri, 4 Aug 2017 16:16:41 +0300<br>
&gt; -Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling<b=
r>
&gt; +Subject: [PATCH] gtkdoc: add support for a binary wrapper<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Make it possible to specify a wrapper for executing binari=
es<br>
&gt; +in cross-compiling scenarios.<br>
&gt;=C2=A0 =C2=A0(usually, some kind of target hardware emulator, such as q=
emu)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Upstream-Status: Submitted [<a href=3D"https://urldefense.=
proofpoint.com/v2/url?u=3Dhttps-3A__github.com_mesonbuild_meson_pull_9627&a=
mp;d=3DDwIDAg&amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&amp;r=3DP=
4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&amp;m=3DCAFnH4fxB5TbFzRZLDRgLtKr=
p2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&amp;s=3Dd8BltpV_tYTB24NoB22HJJW4KZ=
kMUZszeTnLXy4O-MA&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://ur=
ldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_mesonbuild_meson_pu=
ll_9627&amp;d=3DDwIDAg&amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&=
amp;r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&amp;m=3DCAFnH4fxB5TbFzR=
ZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&amp;s=3Dd8BltpV_tYTB24NoB=
22HJJW4KZkMUZszeTnLXy4O-MA&amp;e=3D</a> ]<br>
&gt;=C2=A0 =C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:ale=
x.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0---<br>
&gt; - mesonbuild/modules/gnome.py | 4 ++++<br>
&gt; - 1 file changed, 4 insertions(+)<br>
&gt; + mesonbuild/modules/gnome.py | 5 ++++-<br>
&gt; + 1 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modu=
les/gnome.py<br>
&gt; -index dc2979e..c9ff9bd 100644<br>
&gt; +index 1c6952d..5a6ff94 100644<br>
&gt;=C2=A0 =C2=A0--- a/mesonbuild/modules/gnome.py<br>
&gt;=C2=A0 =C2=A0+++ b/mesonbuild/modules/gnome.py<br>
&gt; -@@ -1053,6 +1053,10 @@ class GnomeModule(ExtensionModule):<br>
&gt; +@@ -35,7 +35,7 @@ from ..mesonlib import (<br>
&gt; + from ..dependencies import Dependency, PkgConfigDependency, Internal=
Dependency<br>
&gt; + from ..interpreterbase import noPosargs, noKwargs, permittedKwargs, =
FeatureNew, FeatureNewKwargs, FeatureDeprecatedKwargs, FeatureDeprecated<br=
>
&gt; + from ..interpreterbase import typed_kwargs, KwargInfo, ContainerType=
Info<br>
&gt; +-from ..programs import ExternalProgram, OverrideProgram<br>
&gt; ++from ..programs import ExternalProgram, OverrideProgram, EmptyExtern=
alProgram<br>
&gt; + from ..build import CustomTarget, CustomTargetIndex, GeneratedList<b=
r>
&gt; +<br>
&gt; + if T.TYPE_CHECKING:<br>
&gt; +@@ -1103,6 +1103,9 @@ class GnomeModule(ExtensionModule):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append(f&#=
39;--{program_name}=3D{path}&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if namespace:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append(&#3=
9;--namespace=3D&#39; + namespace)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtkdoc_exe_wrapper =3D state.environment=
.properties.host.get(&#39;gtkdoc_exe_wrapper&#39;, None)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if gtkdoc_exe_wrapper is not None:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append(&#39;--run=3D&=
#39; + gtkdoc_exe_wrapper)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if state.environment.need_exe_wrapper() =
and not isinstance(state.environment.get_exe_wrapper(), EmptyExternalProgra=
m):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append(&#39;--run=3D&=
#39; + &#39; &#39;.join(state.environment.get_exe_wrapper().get_command()))=
<br>
&gt;=C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args +=3D self._unpack_args(&=
#39;--htmlargs=3D&#39;, &#39;html_args&#39;, kwargs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args +=3D self._unpack_args(&=
#39;--scanargs=3D&#39;, &#39;scan_args&#39;, kwargs)<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#159150): <a href=3D"https://urldefense.proofpoint.=
com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_messa=
ge_159150&amp;d=3DDwIFaQ&amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0U=
Y&amp;r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&amp;m=3DCAFnH4fxB5TbF=
zRZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&amp;s=3D45V6_TRrNONJsAD=
5I2vogAQnnZusJBFo0xgaXn91aC8&amp;e=3D" rel=3D"noreferrer" target=3D"_blank"=
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.=
org_g_openembedded-2Dcore_message_159150&amp;d=3DDwIFaQ&amp;c=3D7dfBJ8cXbWj=
hc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&amp;r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7P=
XU-mLTeZE&amp;m=3DCAFnH4fxB5TbFzRZLDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ=
_nXRe4e&amp;s=3D45V6_TRrNONJsAD5I2vogAQnnZusJBFo0xgaXn91aC8&amp;e=3D</a><br=
>
&gt; Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.openembedded.org_mt_87494764_6350696&amp;d=3DDwIFaQ&amp;=
c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&amp;r=3DP4xb2_7biqBxD4LGGPr=
SV6j-jf3C3xlR7PXU-mLTeZE&amp;m=3DCAFnH4fxB5TbFzRZLDRgLtKrp2ZzM4vwpRgeHylkuq=
rk5HT83nok425kJ_nXRe4e&amp;s=3Dr1-DZP8UnKe5blruwC2xC0yCg4vPMbgdQB7csVRG5FI&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_87494764_6350696&amp;d=
=3DDwIFaQ&amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&amp;r=3DP4xb2=
_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&amp;m=3DCAFnH4fxB5TbFzRZLDRgLtKrp2Zz=
M4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&amp;s=3Dr1-DZP8UnKe5blruwC2xC0yCg4vPMb=
gdQB7csVRG5FI&amp;e=3D</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&=
amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&amp;r=3DP4xb2_7biqBxD4L=
GGPrSV6j-jf3C3xlR7PXU-mLTeZE&amp;m=3DCAFnH4fxB5TbFzRZLDRgLtKrp2ZzM4vwpRgeHy=
lkuqrk5HT83nok425kJ_nXRe4e&amp;s=3DaCJ012s9D9DQ3yG-GuuQFs_6APt34sTiwSp8typp=
m6Q&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proof=
point.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore=
_unsub&amp;d=3DDwIFaQ&amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&a=
mp;r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&amp;m=3DCAFnH4fxB5TbFzRZ=
LDRgLtKrp2ZzM4vwpRgeHylkuqrk5HT83nok425kJ_nXRe4e&amp;s=3DaCJ012s9D9DQ3yG-Gu=
uQFs_6APt34sTiwSp8typpm6Q&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:randy.li@sy=
naptics.com" target=3D"_blank">randy.li@synaptics.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
-- <br>
Hsia-Jun(Randy) Li<br>
</blockquote></div>

--000000000000af415205d29f2c5a--

