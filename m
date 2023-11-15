Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E371DC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 09:58:18 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.9938.1700042297734806681
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 01:58:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=auHirXTH;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-507e85ebf50so8753385e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 01:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700042296; x=1700647096; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4HItg4LfOcBJQbjeP76BlBJuPo/Qxue/kaIbGKI7qnQ=;
        b=auHirXTH259FgU4sEV5y+9EyUvGBX7ck0GxXNegnGO6egUzh1sIsQEF4BGCEJXlssC
         9ryDen+ldIvR2Y9TqFsPpo17RaIDN69qfu/G5G71bukzxuEV5dqAok8sEE5Hhyd1Dkt+
         fdwaAgDAuCsbEtt6DpLg4toyvMv/QMf9vGy1/P/tvnMewTGngigNheShLuuyjXsuf8LN
         qNBatSvFFVzthcdxyhhuppJXTt2XDksNDulbxOFDRVP2BXgP8xKkFnfbsRgljETGmqsi
         vblwyfoHAhVb2rqk0rAA45W5qMsamGhWFYggKq+vcvs1wIWojEKoW79vv8xLFp9wgDuY
         8Tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700042296; x=1700647096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4HItg4LfOcBJQbjeP76BlBJuPo/Qxue/kaIbGKI7qnQ=;
        b=FE0/fxRG1PoGfuEnf2JO3aTmN0p3GNPvuKeiUbuwsLO86QLBCaUTYZvn7x5233F9sq
         lROiI4Y9MIh5MG5I0XcZYcCXvUVowNOMvp/VoyyRBy2rDiTYEuraHBz9truVJn7/4vM5
         CPc23q1bj+uwzv/zrl8q285uRcIjd3FHVfyia4iVWP93qE+L1ihNzR8q0XhrONSWVjye
         tNE6aD0WDYCtJNwJKfkuUkzfK2ew6GORHzLiRAZBwIebLcXPyHZaQOB66/YFaotzcYU+
         ivPGLiDmVM4tnQh1Seqf6V7YXD1KTF9ZbAwU7/+zNLbIg3Retg333wlFAYOHU4u04Nu2
         Bppw==
X-Gm-Message-State: AOJu0YxfpDUdi8QkaurbDiYj2/l4qPjOlFxLLdPwDNRw+0g3BePel3N4
	W84YWUN5AaSx4DVBHQo8ZVxWqDYxb1AyuXXpQxM=
X-Google-Smtp-Source: AGHT+IGv65WDdOHnS6Y+bHkDg57LaqNyTBVfgoeZ2+gum7O2P+W3WFjucUnmSKdvKNJVm6PSxTZTxqaCGjg+edFySlg=
X-Received: by 2002:a05:6512:3e1e:b0:509:4b8a:b65f with SMTP id
 i30-20020a0565123e1e00b005094b8ab65fmr10213523lfv.60.1700042295455; Wed, 15
 Nov 2023 01:58:15 -0800 (PST)
MIME-Version: 1.0
References: <20231113072524.119148-1-martin.jansa@gmail.com> <2023111414182077e85477@mail.local>
In-Reply-To: <2023111414182077e85477@mail.local>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Nov 2023 10:58:02 +0100
Message-ID: <CA+chaQfz_+dWwnfGGqfSfkBbD2-rwAWfckTTWCw8UP27TxiqNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2] bitbake.conf: drop ${PE} and ${PR} from -f{file,macro,debug}-prefix-map
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001fb72d060a2df1fd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 09:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190580

--0000000000001fb72d060a2df1fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

thanks, I've reproduced the issue and added additional fix for perf (and
few other recipes), will send updated series after more local testing.

Cheers,

On Tue, Nov 14, 2023 at 3:18=E2=80=AFPM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Hello Martin,
>
> The perf change uncovers:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/8098/st=
eps/12/logs/warnings
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/8056/st=
eps/12/logs/warnings
>
> And many more
>
> On 13/11/2023 08:25:24+0100, Martin Jansa wrote:
> > * ${EXTENDPE} and ${PR} was already dropped from ${WORKDIR} in:
> >   https://lists.openembedded.org/g/openembedded-core/message/185818
> >   adjust -fmacro-prefix-map and -fdebug-prefix-map similarly.
> >   As we don't depend on PR in WORKDIR maybe we don't need it in
> >   /usr/src/debug paths as well anymore.
> >
> > * The interesting side-effect of this is that for DISTROs which still
> >   use PR (e.g. webOS OSE), the difference in -fdebug-prefix-map causes
> >   all binaries to be slightly different when rebuilt with different PR
> >   (due to this path, even when otherwise they are binary reproducible)
> >   and when the number of digits in PR changes (e.g. from r9 to r10) it
> >   also results in slightly bigger binaries (and more unnecessary change=
s
> >   in buildhistory diffs).
> >
> >   For example this foo binary, the difference between "new" and "old" i=
s
> >   extra patch applied in SRC_URI (which doesn't affect the foo binary,
> >   but was the reason for PR bump).
> >
> >   And the binary is bigger with r10, identical with r6 and slightly
> >   different due to debug-prefix-map between r6 and r7:
> >
> >   $ ls -la 1.0.0-175-*/image/usr/sbin/foo
> >   -rwxr-xr-x 1 bitbake bitbake 30182460 Nov  8 08:29
> 1.0.0-175-new-r10/image/usr/sbin/foo
> >   -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 08:02
> 1.0.0-175-new-r6/image/usr/sbin/foo
> >   -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 07:49
> 1.0.0-175-new-r7/image/usr/sbin/foo
> >   -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 07:39
> 1.0.0-175-old-r6/image/usr/sbin/foo
> >
> >   $ md5sum 1.0.0-175-*/image/usr/sbin/foo
> >   8e3ab67d596f8cc2f9c6320dab10af01  1.0.0-175-new-r10/image/usr/sbin/fo=
o
> >   f6ff1e64fe6affb9ba0d8f278cf7ed79  1.0.0-175-new-r6/image/usr/sbin/foo
> >   6469a0b10aac233911e63c5ea97b03c0  1.0.0-175-new-r7/image/usr/sbin/foo
> >   f6ff1e64fe6affb9ba0d8f278cf7ed79  1.0.0-175-old-r6/image/usr/sbin/foo
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> > v2: shorten to summary to fix:
> > FAIL: test shortlog length: Edit shortlog so that it is 90 characters o=
r
> less (currently 140 characters) (test_mbox.TestMbox.test_shortlog_length)
> >
> >  meta/conf/bitbake.conf                            | 8 ++++----
> >  meta/recipes-core/ovmf/ovmf_git.bb                | 2 +-
> >  meta/recipes-devtools/go/go-cross-canadian.inc    | 2 +-
> >  meta/recipes-devtools/rust/cargo_1.70.0.bb        | 2 +-
> >  meta/recipes-extended/acpica/acpica_20230628.bb   | 2 +-
> >  meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb | 2 +-
> >  meta/recipes-kernel/perf/perf.bb                  | 2 +-
> >  meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb      | 2 +-
> >  8 files changed, 11 insertions(+), 11 deletions(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 67ff769046..3836a389b8 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -648,10 +648,10 @@ EXTRA_OEMAKE:prepend:task-install =3D
> "${PARALLEL_MAKEINST} "
> >  ##################################################################
> >  # Beware: applied last to first
> >  DEBUG_PREFIX_MAP ?=3D "-fcanon-prefix-map \
> > - -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${P=
R} \
> > - -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${P=
R} \
> > - -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${P=
R} \
> > - -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${P=
R} \
> > + -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${PV} \
> > + -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${PV} \
> > + -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${PV} \
> > + -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${PV} \
> >   -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> >   -fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \
> >   -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> > diff --git a/meta/recipes-core/ovmf/ovmf_git.bb
> b/meta/recipes-core/ovmf/ovmf_git.bb
> > index 6bbe21ac5c..bf67a2a4a8 100644
> > --- a/meta/recipes-core/ovmf/ovmf_git.bb
> > +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> > @@ -122,7 +122,7 @@ fix_toolchain:append:class-native() {
> >  # --debug-prefix-map to nasm (we carry a patch to nasm for this). The
> >  # tools definitions are built by ovmf-native so we need to pass this i=
n
> >  # at target build time when we know the right values.
> > -export NASM_PREFIX_MAP =3D
> "--debug-prefix-map=3D${WORKDIR}=3D/usr/src/debug/ovmf/${EXTENDPE}${PV}-$=
{PR}"
> > +export NASM_PREFIX_MAP =3D
> "--debug-prefix-map=3D${WORKDIR}=3D/usr/src/debug/ovmf/${PV}"
> >  export GCC_PREFIX_MAP =3D "${DEBUG_PREFIX_MAP} -Wno-stringop-overflow
> -Wno-maybe-uninitialized"
> >
> >  GCC_VER=3D"$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}')"
> > diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc
> b/meta/recipes-devtools/go/go-cross-canadian.inc
> > index 45758f3361..0a72e89bbd 100644
> > --- a/meta/recipes-devtools/go/go-cross-canadian.inc
> > +++ b/meta/recipes-devtools/go/go-cross-canadian.inc
> > @@ -8,7 +8,7 @@ PN =3D "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> >  # it uses gcc on build machine during go-cross-canadian bootstrap, but
> >  # the gcc version may be old and not support option '-fmacro-prefix-ma=
p'
> >  # which is one of default values of DEBUG_PREFIX_MAP
> > -DEBUG_PREFIX_MAP =3D
> "-fdebug-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-=
${PR} \
> > +DEBUG_PREFIX_MAP =3D
> "-fdebug-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${PV} \
> >                      -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> >                      -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> >                      "
> > diff --git a/meta/recipes-devtools/rust/cargo_1.70.0.bb
> b/meta/recipes-devtools/rust/cargo_1.70.0.bb
> > index a5c1064106..9a23ba9d5f 100644
> > --- a/meta/recipes-devtools/rust/cargo_1.70.0.bb
> > +++ b/meta/recipes-devtools/rust/cargo_1.70.0.bb
> > @@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY =3D "${RUSTSRC}/vendor"
> >
> >  inherit cargo pkgconfig
> >
> > -DEBUG_PREFIX_MAP +=3D
> "-fdebug-prefix-map=3D${RUSTSRC}/vendor=3D/usr/src/debug/${PN}/${EXTENDPE=
}${PV}-${PR}"
> > +DEBUG_PREFIX_MAP +=3D
> "-fdebug-prefix-map=3D${RUSTSRC}/vendor=3D/usr/src/debug/${PN}/${PV}"
> >
> >  do_cargo_setup_snapshot () {
> >       ${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh
> --prefix=3D"${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
> > diff --git a/meta/recipes-extended/acpica/acpica_20230628.bb
> b/meta/recipes-extended/acpica/acpica_20230628.bb
> > index b7921516a2..8ca1f0892f 100644
> > --- a/meta/recipes-extended/acpica/acpica_20230628.bb
> > +++ b/meta/recipes-extended/acpica/acpica_20230628.bb
> > @@ -36,7 +36,7 @@ EXTRA_OEMAKE =3D "CC=3D'${CC}' \
> >                  INSTALLDIR=3D${bindir} \
> >                  INSTALLFLAGS=3D \
> >                  YACC=3Dbison \
> > -                YFLAGS=3D'-y
> --file-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR}' \
> > +                YFLAGS=3D'-y
> --file-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${PV}' \
> >                  "
> >
> >  do_install() {
> > diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
> b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
> > index 99ed82dac4..ca1910966e 100644
> > --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
> > +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
> > @@ -24,7 +24,7 @@ RCONFLICTS:${PN} +=3D "jpeg"
> >
> >  inherit cmake pkgconfig
> >
> > -export NASMENV =3D "--reproducible
> --debug-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-$=
{PR}"
> > +export NASMENV =3D "--reproducible
> --debug-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${PV}"
> >
> >  # Add nasm-native dependency consistently for all build arches is hard
> >  EXTRA_OECMAKE:append:class-native =3D " -DWITH_SIMD=3DFalse"
> > diff --git a/meta/recipes-kernel/perf/perf.bb
> b/meta/recipes-kernel/perf/perf.bb
> > index a90acd55ef..dee8b50b31 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -98,7 +98,7 @@ EXTRA_OEMAKE =3D '\
> >      AR=3D"${AR}" \
> >      LD=3D"${LD}" \
> >      EXTRA_CFLAGS=3D"-ldw -I${S}" \
> > -    YFLAGS=3D'-y
> --file-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR}' \
> > +    YFLAGS=3D'-y --file-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}=
/${PV}'
> \
> >      EXTRA_LDFLAGS=3D"${PERF_EXTRA_LDFLAGS}" \
> >      perfexecdir=3D${libexecdir} \
> >      NO_GTK2=3D1 \
> > diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
> b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
> > index e65f80d64b..0ad2f80217 100644
> > --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
> > +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
> > @@ -151,7 +151,7 @@ do_configure() {
> >      export TMPDIR=3D"${B}/tmp"
> >      mkdir -p ${B}/tmp
> >      ${S}/configure ${EXTRA_OECONF}
> > -    sed -i -e "s,^X86ASMFLAGS=3D.*,&
> --debug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}
> --debug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR},g=
"
> ${B}/ffbuild/config.mak
> > +    sed -i -e "s,^X86ASMFLAGS=3D.*,&
> --debug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${PV}
> --debug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${PV},g"
> ${B}/ffbuild/config.mak
> >  }
> >
> >  # patch out build host paths for reproducibility
> > --
> > 2.42.1
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#190461):
> https://lists.openembedded.org/g/openembedded-core/message/190461
> > Mute This Topic: https://lists.openembedded.org/mt/102557173/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000001fb72d060a2df1fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>thanks, I&#39;ve reproduced the =
issue and added additional fix for perf (and few other recipes), will send =
updated series after more local testing.</div><div><br></div><div>Cheers,</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Tue, Nov 14, 2023 at 3:18=E2=80=AFPM Alexandre Belloni &lt;<a href=
=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hell=
o Martin,<br>
<br>
The perf change uncovers:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/42/build=
s/8098/steps/12/logs/warnings" rel=3D"noreferrer" target=3D"_blank">https:/=
/autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/8098/steps/12/lo=
gs/warnings</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/59/build=
s/8056/steps/12/logs/warnings" rel=3D"noreferrer" target=3D"_blank">https:/=
/autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/8056/steps/12/lo=
gs/warnings</a><br>
<br>
And many more<br>
<br>
On 13/11/2023 08:25:24+0100, Martin Jansa wrote:<br>
&gt; * ${EXTENDPE} and ${PR} was already dropped from ${WORKDIR} in:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-c=
ore/message/185818" rel=3D"noreferrer" target=3D"_blank">https://lists.open=
embedded.org/g/openembedded-core/message/185818</a><br>
&gt;=C2=A0 =C2=A0adjust -fmacro-prefix-map and -fdebug-prefix-map similarly=
.<br>
&gt;=C2=A0 =C2=A0As we don&#39;t depend on PR in WORKDIR maybe we don&#39;t=
 need it in<br>
&gt;=C2=A0 =C2=A0/usr/src/debug paths as well anymore.<br>
&gt; <br>
&gt; * The interesting side-effect of this is that for DISTROs which still<=
br>
&gt;=C2=A0 =C2=A0use PR (e.g. webOS OSE), the difference in -fdebug-prefix-=
map causes<br>
&gt;=C2=A0 =C2=A0all binaries to be slightly different when rebuilt with di=
fferent PR<br>
&gt;=C2=A0 =C2=A0(due to this path, even when otherwise they are binary rep=
roducible)<br>
&gt;=C2=A0 =C2=A0and when the number of digits in PR changes (e.g. from r9 =
to r10) it<br>
&gt;=C2=A0 =C2=A0also results in slightly bigger binaries (and more unneces=
sary changes<br>
&gt;=C2=A0 =C2=A0in buildhistory diffs).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0For example this foo binary, the difference between &quot;=
new&quot; and &quot;old&quot; is<br>
&gt;=C2=A0 =C2=A0extra patch applied in SRC_URI (which doesn&#39;t affect t=
he foo binary,<br>
&gt;=C2=A0 =C2=A0but was the reason for PR bump).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0And the binary is bigger with r10, identical with r6 and s=
lightly<br>
&gt;=C2=A0 =C2=A0different due to debug-prefix-map between r6 and r7:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0$ ls -la 1.0.0-175-*/image/usr/sbin/foo<br>
&gt;=C2=A0 =C2=A0-rwxr-xr-x 1 bitbake bitbake 30182460 Nov=C2=A0 8 08:29 1.=
0.0-175-new-r10/image/usr/sbin/foo<br>
&gt;=C2=A0 =C2=A0-rwxr-xr-x 1 bitbake bitbake 30182224 Nov=C2=A0 8 08:02 1.=
0.0-175-new-r6/image/usr/sbin/foo<br>
&gt;=C2=A0 =C2=A0-rwxr-xr-x 1 bitbake bitbake 30182224 Nov=C2=A0 8 07:49 1.=
0.0-175-new-r7/image/usr/sbin/foo<br>
&gt;=C2=A0 =C2=A0-rwxr-xr-x 1 bitbake bitbake 30182224 Nov=C2=A0 8 07:39 1.=
0.0-175-old-r6/image/usr/sbin/foo<br>
&gt; <br>
&gt;=C2=A0 =C2=A0$ md5sum 1.0.0-175-*/image/usr/sbin/foo<br>
&gt;=C2=A0 =C2=A08e3ab67d596f8cc2f9c6320dab10af01=C2=A0 1.0.0-175-new-r10/i=
mage/usr/sbin/foo<br>
&gt;=C2=A0 =C2=A0f6ff1e64fe6affb9ba0d8f278cf7ed79=C2=A0 1.0.0-175-new-r6/im=
age/usr/sbin/foo<br>
&gt;=C2=A0 =C2=A06469a0b10aac233911e63c5ea97b03c0=C2=A0 1.0.0-175-new-r7/im=
age/usr/sbin/foo<br>
&gt;=C2=A0 =C2=A0f6ff1e64fe6affb9ba0d8f278cf7ed79=C2=A0 1.0.0-175-old-r6/im=
age/usr/sbin/foo<br>
&gt; <br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.c=
om" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: shorten to summary to fix:<br>
&gt; FAIL: test shortlog length: Edit shortlog so that it is 90 characters =
or less (currently 140 characters) (test_mbox.TestMbox.test_shortlog_length=
)<br>
&gt; <br>
&gt;=C2=A0 meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8 ++++----<br>
&gt;=C2=A0 meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">ovmf_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta/recipes-devtools/go/go-cross-canadian.inc=C2=A0 =C2=A0 | 2 =
+-<br>
&gt;=C2=A0 meta/recipes-devtools/rust/<a href=3D"http://cargo_1.70.0.bb" re=
l=3D"noreferrer" target=3D"_blank">cargo_1.70.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 2 +-<br>
&gt;=C2=A0 meta/recipes-extended/acpica/<a href=3D"http://acpica_20230628.b=
b" rel=3D"noreferrer" target=3D"_blank">acpica_20230628.bb</a>=C2=A0 =C2=A0=
| 2 +-<br>
&gt;=C2=A0 meta/recipes-graphics/jpeg/<a href=3D"http://libjpeg-turbo_3.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libjpeg-turbo_3.0.1.bb</a> | 2 +-=
<br>
&gt;=C2=A0 meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">perf.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_6.0.bb" =
rel=3D"noreferrer" target=3D"_blank">ffmpeg_6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
| 2 +-<br>
&gt;=C2=A0 8 files changed, 11 insertions(+), 11 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 67ff769046..3836a389b8 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -648,10 +648,10 @@ EXTRA_OEMAKE:prepend:task-install =3D &quot;${PA=
RALLEL_MAKEINST} &quot;<br>
&gt;=C2=A0 ################################################################=
##<br>
&gt;=C2=A0 # Beware: applied last to first<br>
&gt;=C2=A0 DEBUG_PREFIX_MAP ?=3D &quot;-fcanon-prefix-map \<br>
&gt; - -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR} \<br>
&gt; - -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR} \<br>
&gt; - -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR} \<br>
&gt; - -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR} \<br>
&gt; + -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${PV} \<br>
&gt; + -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${PV} \<br>
&gt; + -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${PV} \<br>
&gt; + -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${PV} \<br>
&gt;=C2=A0 =C2=A0-fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
&gt;=C2=A0 =C2=A0-fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
&gt;=C2=A0 =C2=A0-fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \<br>
&gt; diff --git a/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ovmf_git.bb</a> b/meta/recipes-core/ovmf/=
<a href=3D"http://ovmf_git.bb" rel=3D"noreferrer" target=3D"_blank">ovmf_gi=
t.bb</a><br>
&gt; index 6bbe21ac5c..bf67a2a4a8 100644<br>
&gt; --- a/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">ovmf_git.bb</a><br>
&gt; +++ b/meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">ovmf_git.bb</a><br>
&gt; @@ -122,7 +122,7 @@ fix_toolchain:append:class-native() {<br>
&gt;=C2=A0 # --debug-prefix-map to nasm (we carry a patch to nasm for this)=
. The<br>
&gt;=C2=A0 # tools definitions are built by ovmf-native so we need to pass =
this in<br>
&gt;=C2=A0 # at target build time when we know the right values.<br>
&gt; -export NASM_PREFIX_MAP =3D &quot;--debug-prefix-map=3D${WORKDIR}=3D/u=
sr/src/debug/ovmf/${EXTENDPE}${PV}-${PR}&quot;<br>
&gt; +export NASM_PREFIX_MAP =3D &quot;--debug-prefix-map=3D${WORKDIR}=3D/u=
sr/src/debug/ovmf/${PV}&quot;<br>
&gt;=C2=A0 export GCC_PREFIX_MAP =3D &quot;${DEBUG_PREFIX_MAP} -Wno-stringo=
p-overflow -Wno-maybe-uninitialized&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 GCC_VER=3D&quot;$(${CC} -v 2&gt;&amp;1 | tail -n1 | awk &#39;{pr=
int $3}&#39;)&quot;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/rec=
ipes-devtools/go/go-cross-canadian.inc<br>
&gt; index 45758f3361..0a72e89bbd 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-cross-canadian.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-cross-canadian.inc<br>
&gt; @@ -8,7 +8,7 @@ PN =3D &quot;go-cross-canadian-${TRANSLATED_TARGET_ARC=
H}&quot;<br>
&gt;=C2=A0 # it uses gcc on build machine during go-cross-canadian bootstra=
p, but<br>
&gt;=C2=A0 # the gcc version may be old and not support option &#39;-fmacro=
-prefix-map&#39;<br>
&gt;=C2=A0 # which is one of default values of DEBUG_PREFIX_MAP<br>
&gt; -DEBUG_PREFIX_MAP =3D &quot;-fdebug-prefix-map=3D${WORKDIR}=3D/usr/src=
/debug/${PN}/${EXTENDPE}${PV}-${PR} \<br>
&gt; +DEBUG_PREFIX_MAP =3D &quot;-fdebug-prefix-map=3D${WORKDIR}=3D/usr/src=
/debug/${PN}/${PV} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;<br>
&gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://cargo_1.70.0=
.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.70.0.bb</a> b/meta/recipe=
s-devtools/rust/<a href=3D"http://cargo_1.70.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">cargo_1.70.0.bb</a><br>
&gt; index a5c1064106..9a23ba9d5f 100644<br>
&gt; --- a/meta/recipes-devtools/rust/<a href=3D"http://cargo_1.70.0.bb" re=
l=3D"noreferrer" target=3D"_blank">cargo_1.70.0.bb</a><br>
&gt; +++ b/meta/recipes-devtools/rust/<a href=3D"http://cargo_1.70.0.bb" re=
l=3D"noreferrer" target=3D"_blank">cargo_1.70.0.bb</a><br>
&gt; @@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY =3D &quot;${RUSTSRC}/vendo=
r&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit cargo pkgconfig<br>
&gt;=C2=A0 <br>
&gt; -DEBUG_PREFIX_MAP +=3D &quot;-fdebug-prefix-map=3D${RUSTSRC}/vendor=3D=
/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}&quot;<br>
&gt; +DEBUG_PREFIX_MAP +=3D &quot;-fdebug-prefix-map=3D${RUSTSRC}/vendor=3D=
/usr/src/debug/${PN}/${PV}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_cargo_setup_snapshot () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${WORKDIR}/rust-snapshot-components/${CARGO_=
SNAPSHOT}/install.sh --prefix=3D&quot;${WORKDIR}/${CARGO_SNAPSHOT}&quot; --=
disable-ldconfig<br>
&gt; diff --git a/meta/recipes-extended/acpica/<a href=3D"http://acpica_202=
30628.bb" rel=3D"noreferrer" target=3D"_blank">acpica_20230628.bb</a> b/met=
a/recipes-extended/acpica/<a href=3D"http://acpica_20230628.bb" rel=3D"nore=
ferrer" target=3D"_blank">acpica_20230628.bb</a><br>
&gt; index b7921516a2..8ca1f0892f 100644<br>
&gt; --- a/meta/recipes-extended/acpica/<a href=3D"http://acpica_20230628.b=
b" rel=3D"noreferrer" target=3D"_blank">acpica_20230628.bb</a><br>
&gt; +++ b/meta/recipes-extended/acpica/<a href=3D"http://acpica_20230628.b=
b" rel=3D"noreferrer" target=3D"_blank">acpica_20230628.bb</a><br>
&gt; @@ -36,7 +36,7 @@ EXTRA_OEMAKE =3D &quot;CC=3D&#39;${CC}&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INSTALLD=
IR=3D${bindir} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INSTALLF=
LAGS=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 YACC=3Db=
ison \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 YFLAGS=3D&#39=
;-y --file-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-=
${PR}&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 YFLAGS=3D&#39=
;-y --file-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${PV}&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<b=
r>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install() {<br>
&gt; diff --git a/meta/recipes-graphics/jpeg/<a href=3D"http://libjpeg-turb=
o_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">libjpeg-turbo_3.0.1.bb</a>=
 b/meta/recipes-graphics/jpeg/<a href=3D"http://libjpeg-turbo_3.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libjpeg-turbo_3.0.1.bb</a><br>
&gt; index 99ed82dac4..ca1910966e 100644<br>
&gt; --- a/meta/recipes-graphics/jpeg/<a href=3D"http://libjpeg-turbo_3.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libjpeg-turbo_3.0.1.bb</a><br>
&gt; +++ b/meta/recipes-graphics/jpeg/<a href=3D"http://libjpeg-turbo_3.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libjpeg-turbo_3.0.1.bb</a><br>
&gt; @@ -24,7 +24,7 @@ RCONFLICTS:${PN} +=3D &quot;jpeg&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit cmake pkgconfig<br>
&gt;=C2=A0 <br>
&gt; -export NASMENV =3D &quot;--reproducible --debug-prefix-map=3D${WORKDI=
R}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}&quot;<br>
&gt; +export NASMENV =3D &quot;--reproducible --debug-prefix-map=3D${WORKDI=
R}=3D/usr/src/debug/${PN}/${PV}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Add nasm-native dependency consistently for all build arches i=
s hard<br>
&gt;=C2=A0 EXTRA_OECMAKE:append:class-native =3D &quot; -DWITH_SIMD=3DFalse=
&quot;<br>
&gt; diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=
=3D"noreferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a=
 href=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><b=
r>
&gt; index a90acd55ef..dee8b50b31 100644<br>
&gt; --- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">perf.bb</a><br>
&gt; +++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">perf.bb</a><br>
&gt; @@ -98,7 +98,7 @@ EXTRA_OEMAKE =3D &#39;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 AR=3D&quot;${AR}&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 LD=3D&quot;${LD}&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 EXTRA_CFLAGS=3D&quot;-ldw -I${S}&quot; \<br>
&gt; -=C2=A0 =C2=A0 YFLAGS=3D&#39;-y --file-prefix-map=3D${WORKDIR}=3D/usr/=
src/debug/${PN}/${EXTENDPE}${PV}-${PR}&#39; \<br>
&gt; +=C2=A0 =C2=A0 YFLAGS=3D&#39;-y --file-prefix-map=3D${WORKDIR}=3D/usr/=
src/debug/${PN}/${PV}&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 EXTRA_LDFLAGS=3D&quot;${PERF_EXTRA_LDFLAGS}&quot; =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 perfexecdir=3D${libexecdir} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 NO_GTK2=3D1 \<br>
&gt; diff --git a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_6=
.0.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_6.0.bb</a> b/meta/recipe=
s-multimedia/ffmpeg/<a href=3D"http://ffmpeg_6.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">ffmpeg_6.0.bb</a><br>
&gt; index e65f80d64b..0ad2f80217 100644<br>
&gt; --- a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_6.0.bb" =
rel=3D"noreferrer" target=3D"_blank">ffmpeg_6.0.bb</a><br>
&gt; +++ b/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_6.0.bb" =
rel=3D"noreferrer" target=3D"_blank">ffmpeg_6.0.bb</a><br>
&gt; @@ -151,7 +151,7 @@ do_configure() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 export TMPDIR=3D&quot;${B}/tmp&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mkdir -p ${B}/tmp<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${S}/configure ${EXTRA_OECONF}<br>
&gt; -=C2=A0 =C2=A0 sed -i -e &quot;s,^X86ASMFLAGS=3D.*,&amp; --debug-prefi=
x-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} --debug-prefix-m=
ap=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR},g&quot; ${B}/ffbuil=
d/config.mak<br>
&gt; +=C2=A0 =C2=A0 sed -i -e &quot;s,^X86ASMFLAGS=3D.*,&amp; --debug-prefi=
x-map=3D${S}=3D/usr/src/debug/${PN}/${PV} --debug-prefix-map=3D${B}=3D/usr/=
src/debug/${PN}/${PV},g&quot; ${B}/ffbuild/config.mak<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # patch out build host paths for reproducibility<br>
&gt; -- <br>
&gt; 2.42.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#190461): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/190461" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/190461</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10255717=
3/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/102557173/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000001fb72d060a2df1fd--

