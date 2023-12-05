Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617E2C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 13:40:40 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.100591.1701783637615106605
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 05:40:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=f/QMUugK;
 spf=pass (domain: snapchat.com, ip: 209.85.218.44, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a00f67f120aso746483166b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 05:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1701783636; x=1702388436; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRUtpAOq4cUM4s+EkFztMOcODbfLq7i6eBfnAZ11mn8=;
        b=f/QMUugKQUENxgDBtttgX/ovPuRBbFG7JKv9ATKlOBzE1hGrz0Tlgs4x1B+QhCoBf2
         uiZH4UFotMCyENMtcDclD3dVUgDzZVNGDGMwaG1vcHRExab6vn8ETHstNqqqS71fgfYZ
         HkD/xKe4wyk5hLsIo5AcvHX2Uxznq9xvVHwrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701783636; x=1702388436;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRUtpAOq4cUM4s+EkFztMOcODbfLq7i6eBfnAZ11mn8=;
        b=Na8xSs2jCW9whS51Zz+10Sk3DXVaPIiBJdzs35ql3qtuuEKTNDxqZ6luQRTcrdLmNR
         43FumYVkThe/mINW7ZV7Gbpu+LYFz4M3EWZwpWg32oHmBjMgSBGbGSlwujePACJ0Q0rm
         8dxSkKJYrJOwXpBcq6XE3+LrJDhufBUiyPRnd2v+Zwm67ukc60FELyIoJ1hIEjf+Gslc
         o859QkHIEXnAopEj/MBBE2RgW39y8gR+k+tamKF7fBcaKp0lA8jZ+d/1p1fhyVq2zJT5
         IYJ+3cKCGDsEMI6i9XVbRCNhWUDnmgctoNeBQSdg7x4gZns5XAM7uYW4Y9JHvkMPGC63
         h7dA==
X-Gm-Message-State: AOJu0YxIKuyH9kL7mQEiUrdQysqP+dqjc/XHtWws9PmgGkgC3HY9b+KT
	jrlrfeYcKGb8zHqrG2CJLe4W4/EAJc7aYPXIgqEQVeRcTeVybAa1tinsxw==
X-Google-Smtp-Source: AGHT+IEGIHlWYT4KYoghQ1SMSi946cwhINGx2bQmQoGaGZ9drXll1zhyayceidfFhcoTsou4XxALpA0gsfpo5xzLYAI=
X-Received: by 2002:a17:907:7ea4:b0:a19:a19b:55f0 with SMTP id
 qb36-20020a1709077ea400b00a19a19b55f0mr513750ejc.128.1701783635548; Tue, 05
 Dec 2023 05:40:35 -0800 (PST)
MIME-Version: 1.0
References: <20231205133754.906479-1-ecordonnier@snap.com>
In-Reply-To: <20231205133754.906479-1-ecordonnier@snap.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Tue, 5 Dec 2023 14:40:24 +0100
Message-ID: <CAHUKmYadu+En7cuLZ4J_5en8ihaaafxobFEd2egR_wz4OxtO6w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] gdb/systemd: enable minidebuginfo support conditionally
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000015e310060bc361a3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 13:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191821

--00000000000015e310060bc361a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Version 2 of the patch: I implemented the feedback of Richard (convert
PACKAGE_MINIDEBUGINFO to a DISTRO_FEATURES), and added a runtime test.
This was my local.conf used for testing (with "bitbake -v -c testimage
core-image-sato"):

DISTRO_FEATURES:append =3D " minidebuginfo"
IMAGE_CLASSES +=3D "testimage"
TEST_SUITES +=3D "ping ssh systemd"

DISTRO_FEATURES:append =3D " systemd usrmerge"
DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
VIRTUAL-RUNTIME_init_manager =3D "systemd"
VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"

Etienne

On Tue, Dec 5, 2023 at 2:38=E2=80=AFPM <ecordonnier@snap.com> wrote:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> Enabling minidebuginfo is not useful if gdb and systemd-coredump
> are unable to parse it.
>
> In order to parse it, gdb needs xz support. Systemd needs coredump
> enabled, as
> well as elfutil enabled as well (systemd-coredump loads libdw which is
> part of elfutils using dlopen).
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/classes-global/package.bbclass           |  2 +-
>  meta/lib/oe/package.py                        |  2 +-
>  meta/lib/oeqa/runtime/cases/systemd.py        | 21 +++++++++++++++++++
>  meta/lib/oeqa/selftest/cases/minidebuginfo.py |  2 +-
>  meta/recipes-core/systemd/systemd_254.4.bb    |  1 +
>  .../elfutils/elfutils_0.189.bb                |  4 +++-
>  meta/recipes-devtools/gdb/gdb-common.inc      |  4 +++-
>  7 files changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes-global/package.bbclass
> b/meta/classes-global/package.bbclass
> index 2ad820a81f..f56bca3542 100644
> --- a/meta/classes-global/package.bbclass
> +++ b/meta/classes-global/package.bbclass
> @@ -234,7 +234,7 @@ python () {
>          deps =3D ""
>          for dep in (d.getVar('PACKAGE_DEPENDS') or "").split():
>              deps +=3D " %s:do_populate_sysroot" % dep
> -        if d.getVar('PACKAGE_MINIDEBUGINFO') =3D=3D '1':
> +        if bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', True,
> False, d):
>              deps +=3D ' xz-native:do_populate_sysroot'
>          d.appendVarFlag('do_package', 'depends', deps)
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index f69bf9c353..9a465eaa09 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -1239,7 +1239,7 @@ def process_split_and_strip_files(d):
>          oe.utils.multiprocess_launch(oe.package.runstrip, sfiles, d)
>
>      # Build "minidebuginfo" and reinject it back into the stripped
> binaries
> -    if d.getVar('PACKAGE_MINIDEBUGINFO') =3D=3D '1':
> +    if bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', True, False=
,
> d):
>          oe.utils.multiprocess_launch(inject_minidebuginfo,
> list(elffiles), d,
>                                       extraargs=3D(dvar, dv, d))
>
> diff --git a/meta/lib/oeqa/runtime/cases/systemd.py
> b/meta/lib/oeqa/runtime/cases/systemd.py
> index 37f295492d..4c581ba396 100644
> --- a/meta/lib/oeqa/runtime/cases/systemd.py
> +++ b/meta/lib/oeqa/runtime/cases/systemd.py
> @@ -5,6 +5,7 @@
>  #
>
>  import re
> +import threading
>  import time
>
>  from oeqa.runtime.case import OERuntimeTestCase
> @@ -136,6 +137,26 @@ class SystemdServiceTests(SystemdTest):
>              status =3D self.target.run('mount -oro,remount /')[0]
>              self.assertTrue(status =3D=3D 0, msg=3D'Remounting / as r/o =
failed')
>
> +    @skipIfNotFeature('minidebuginfo', 'Test requires minidebuginfo to b=
e
> in DISTRO_FEATURES')
> +    @OEHasPackage(['busybox'])
> +    def test_systemd_coredump_minidebuginfo(self):
> +        """
> +        Verify that call-stacks generated by systemd-coredump contain
> symbolicated call-stacks,
> +        extracted from the minidebuginfo metadata (.gnu_debugdata elf
> section).
> +        """
> +        t_thread =3D threading.Thread(target=3Dself.target.run, args=3D(=
"ulimit
> -c unlimited && sleep 1000",))
> +        t_thread.start()
> +        time.sleep(1)
> +
> +        status, output =3D self.target.run('pidof sleep')
> +        # cause segfault on purpose
> +        self.target.run('kill -SEGV %s' % output)
> +        self.assertEqual(status, 0, msg =3D 'Not able to find process th=
at
> runs sleep, output : %s' % output)
> +
> +        (status, output) =3D self.target.run('coredumpctl info')
> +        self.assertEqual(status, 0, msg=3D'MiniDebugInfo Test failed: %s=
' %
> output)
> +        self.assertEqual('sleep_for_duration (busybox.nosuid' in output,
> True, msg=3D'Call stack is missing minidebuginfo symbols (functions shown=
 as
> "n/a"): %s' % output)
> +
>  class SystemdJournalTests(SystemdTest):
>
>      @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
> diff --git a/meta/lib/oeqa/selftest/cases/minidebuginfo.py
> b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
> index aa1f9fa1f7..2919f07939 100644
> --- a/meta/lib/oeqa/selftest/cases/minidebuginfo.py
> +++ b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
> @@ -21,7 +21,7 @@ class Minidebuginfo(OESelftestTestCase):
>          bb_vars =3D get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME',
> 'READELF'], image)
>
>          self.write_config("""
> -PACKAGE_MINIDEBUGINFO =3D "1"
> +DISTRO_FEATURES:append =3D " minidebuginfo"
>  IMAGE_FSTYPES =3D "tar.bz2"
>  """)
>          bitbake("{} {}:do_addto_recipe_sysroot".format(image, binutils))
> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb
> b/meta/recipes-core/systemd/systemd_254.4.bb
> index 4d68a3266a..0c12926bef 100644
> --- a/meta/recipes-core/systemd/systemd_254.4.bb
> +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> @@ -67,6 +67,7 @@ PAM_PLUGINS =3D " \
>
>  PACKAGECONFIG ??=3D " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam
> selinux smack usrmerge polkit seccomp', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump
> elfutils', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} =
\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '',
> 'link-udev-shared', d)} \
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
> b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
> index d8bf82b022..d69828131e 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
> @@ -39,7 +39,9 @@ BUILD_CFLAGS +=3D "-Wno-error=3Dstringop-overflow"
>  DEPENDS_BZIP2 =3D "bzip2-replacement-native"
>  DEPENDS_BZIP2:class-target =3D "bzip2"
>
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'debuginfod=
',
> 'debuginfod libdebuginfod', '', d)}"
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'debuginfod=
',
> 'debuginfod libdebuginfod', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES',
> 'minidebuginfo', 'xz', '', d)} \
> +                  "
>  PACKAGECONFIG[bzip2] =3D "--with-bzlib,--without-bzlib,${DEPENDS_BZIP2}"
>  PACKAGECONFIG[xz] =3D "--with-lzma,--without-lzma,xz"
>  PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,zstd"
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc
> b/meta/recipes-devtools/gdb/gdb-common.inc
> index 3349719a6b..48dbb91463 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -30,7 +30,9 @@ EXTRA_OECONF =3D "--disable-gdbtk --disable-x
> --disable-werror \
>                  --with-libgmp-prefix=3D${STAGING_EXECPREFIXDIR} \
>  "
>
> -PACKAGECONFIG ??=3D "readline ${@bb.utils.filter('DISTRO_FEATURES',
> 'debuginfod', d)} python"
> +PACKAGECONFIG ??=3D "readline ${@bb.utils.filter('DISTRO_FEATURES',
> 'debuginfod', d)} python \
> +                   ${@bb.utils.contains('DISTRO_FEATURES',
> 'minidebuginfo', 'xz', '', d)} \
> +                  "
>  # Use --without-system-readline to compile with readline 5.
>  PACKAGECONFIG[readline] =3D
> "--with-system-readline,--without-system-readline,readline"
>  PACKAGECONFIG[python] =3D
> "--with-python=3D${WORKDIR}/python,--without-python,python3,python3-codec=
s"
> --
> 2.34.1
>
>

--00000000000015e310060bc361a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Version 2 of the patch: I implemented the feedback of Rich=
ard (convert PACKAGE_MINIDEBUGINFO to a DISTRO_FEATURES), and added a runti=
me test.<br>This was my local.conf used for testing (with &quot;bitbake -v =
-c testimage core-image-sato&quot;):<br><br>DISTRO_FEATURES:append =3D &quo=
t; minidebuginfo&quot;<br>IMAGE_CLASSES +=3D &quot;testimage&quot;<br>TEST_=
SUITES +=3D &quot;ping ssh systemd&quot;<br><br>DISTRO_FEATURES:append =3D =
&quot; systemd usrmerge&quot;<br>DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D &=
quot;sysvinit&quot;<br>VIRTUAL-RUNTIME_init_manager =3D &quot;systemd&quot;=
<br>VIRTUAL-RUNTIME_initscripts =3D &quot;systemd-compat-units&quot;<br><br=
>Etienne</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, Dec 5, 2023 at 2:38=E2=80=AFPM &lt;<a href=3D"mailto:ecordo=
nnier@snap.com">ecordonnier@snap.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">From: Etienne Cordonnier &lt;<a href=3D=
"mailto:ecordonnier@snap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt=
;<br>
<br>
Enabling minidebuginfo is not useful if gdb and systemd-coredump<br>
are unable to parse it.<br>
<br>
In order to parse it, gdb needs xz support. Systemd needs coredump enabled,=
 as<br>
well as elfutil enabled as well (systemd-coredump loads libdw which is part=
 of elfutils using dlopen).<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-global/package.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/lib/oe/package.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/lib/oeqa/runtime/cases/systemd.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
1 +++++++++++++++++++<br>
=C2=A0meta/lib/oeqa/selftest/cases/minidebuginfo.py |=C2=A0 2 +-<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_254.4.bb</a>=C2=A0 =C2=A0 |=C2=A0 1 +=
<br>
=C2=A0.../elfutils/<a href=3D"http://elfutils_0.189.bb" rel=3D"noreferrer" =
target=3D"_blank">elfutils_0.189.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++-<br>
=C2=A0meta/recipes-devtools/gdb/gdb-common.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
4 +++-<br>
=C2=A07 files changed, 31 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass<br>
index 2ad820a81f..f56bca3542 100644<br>
--- a/meta/classes-global/package.bbclass<br>
+++ b/meta/classes-global/package.bbclass<br>
@@ -234,7 +234,7 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps =3D &quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for dep in (d.getVar(&#39;PACKAGE_DEPENDS=
&#39;) or &quot;&quot;).split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps +=3D &quot; %s:do_popu=
late_sysroot&quot; % dep<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&#39;PACKAGE_MINIDEBUGINFO&#39;) =
=3D=3D &#39;1&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.utils.contains(&#39;DISTRO_FEATURES&#39;=
, &#39;minidebuginfo&#39;, True, False, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps +=3D &#39; xz-native:d=
o_populate_sysroot&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_package&#39;, &#3=
9;depends&#39;, deps)<br>
<br>
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py<br>
index f69bf9c353..9a465eaa09 100644<br>
--- a/meta/lib/oe/package.py<br>
+++ b/meta/lib/oe/package.py<br>
@@ -1239,7 +1239,7 @@ def process_split_and_strip_files(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe.utils.multiprocess_launch(oe.package.r=
unstrip, sfiles, d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Build &quot;minidebuginfo&quot; and reinject it back =
into the stripped binaries<br>
-=C2=A0 =C2=A0 if d.getVar(&#39;PACKAGE_MINIDEBUGINFO&#39;) =3D=3D &#39;1&#=
39;:<br>
+=C2=A0 =C2=A0 if bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;minideb=
uginfo&#39;, True, False, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe.utils.multiprocess_launch(inject_minid=
ebuginfo, list(elffiles), d,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extraargs=3D(dv=
ar, dv, d))<br>
<br>
diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime=
/cases/systemd.py<br>
index 37f295492d..4c581ba396 100644<br>
--- a/meta/lib/oeqa/runtime/cases/systemd.py<br>
+++ b/meta/lib/oeqa/runtime/cases/systemd.py<br>
@@ -5,6 +5,7 @@<br>
=C2=A0#<br>
<br>
=C2=A0import re<br>
+import threading<br>
=C2=A0import time<br>
<br>
=C2=A0from oeqa.runtime.case import OERuntimeTestCase<br>
@@ -136,6 +137,26 @@ class SystemdServiceTests(SystemdTest):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D self.target.run(=
&#39;mount -oro,remount /&#39;)[0]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(status =3D=
=3D 0, msg=3D&#39;Remounting / as r/o failed&#39;)<br>
<br>
+=C2=A0 =C2=A0 @skipIfNotFeature(&#39;minidebuginfo&#39;, &#39;Test require=
s minidebuginfo to be in DISTRO_FEATURES&#39;)<br>
+=C2=A0 =C2=A0 @OEHasPackage([&#39;busybox&#39;])<br>
+=C2=A0 =C2=A0 def test_systemd_coredump_minidebuginfo(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Verify that call-stacks generated by systemd-c=
oredump contain symbolicated call-stacks,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 extracted from the minidebuginfo metadata (.gn=
u_debugdata elf section).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 t_thread =3D threading.Thread(target=3Dself.ta=
rget.run, args=3D(&quot;ulimit -c unlimited &amp;&amp; sleep 1000&quot;,))<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 t_thread.start()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(1)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.target.run(&#39;pidof =
sleep&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # cause segfault on purpose<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.target.run(&#39;kill -SEGV %s&#39; % outp=
ut)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(status, 0, msg =3D &#39;Not a=
ble to find process that runs sleep, output : %s&#39; % output)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target.run(&#39;core=
dumpctl info&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(status, 0, msg=3D&#39;MiniDeb=
ugInfo Test failed: %s&#39; % output)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(&#39;sleep_for_duration (busy=
box.nosuid&#39; in output, True, msg=3D&#39;Call stack is missing minidebug=
info symbols (functions shown as &quot;n/a&quot;): %s&#39; % output)<br>
+<br>
=C2=A0class SystemdJournalTests(SystemdTest):<br>
<br>
=C2=A0 =C2=A0 =C2=A0@OETestDepends([&#39;systemd.SystemdBasicTests.test_sys=
temd_basic&#39;])<br>
diff --git a/meta/lib/oeqa/selftest/cases/minidebuginfo.py b/meta/lib/oeqa/=
selftest/cases/minidebuginfo.py<br>
index aa1f9fa1f7..2919f07939 100644<br>
--- a/meta/lib/oeqa/selftest/cases/minidebuginfo.py<br>
+++ b/meta/lib/oeqa/selftest/cases/minidebuginfo.py<br>
@@ -21,7 +21,7 @@ class Minidebuginfo(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb_vars =3D get_bb_vars([&#39;DEPLOY_DIR_=
IMAGE&#39;, &#39;IMAGE_LINK_NAME&#39;, &#39;READELF&#39;], image)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.write_config(&quot;&quot;&quot;<br>
-PACKAGE_MINIDEBUGINFO =3D &quot;1&quot;<br>
+DISTRO_FEATURES:append =3D &quot; minidebuginfo&quot;<br>
=C2=A0IMAGE_FSTYPES =3D &quot;tar.bz2&quot;<br>
=C2=A0&quot;&quot;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&quot;{} {}:do_addto_recipe_sysro=
ot&quot;.format(image, binutils))<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_254.4.bb</a><br>
index 4d68a3266a..0c12926bef 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
@@ -67,6 +67,7 @@ PAM_PLUGINS =3D &quot; \<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;acl =
audit efi ldconfig pam selinux smack usrmerge polkit seccomp&#39;, d)} \<br=
>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;minideb=
uginfo&#39;, &#39;coredump elfutils&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;wi=
fi&#39;, &#39;rfkill&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x1=
1&#39;, &#39;xkbcommon&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sy=
svinit&#39;, &#39;&#39;, &#39;link-udev-shared&#39;, d)} \<br>
diff --git a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.18=
9.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.189.bb</a> b/meta/rec=
ipes-devtools/elfutils/<a href=3D"http://elfutils_0.189.bb" rel=3D"noreferr=
er" target=3D"_blank">elfutils_0.189.bb</a><br>
index d8bf82b022..d69828131e 100644<br>
--- a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.189.bb" r=
el=3D"noreferrer" target=3D"_blank">elfutils_0.189.bb</a><br>
+++ b/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.189.bb" r=
el=3D"noreferrer" target=3D"_blank">elfutils_0.189.bb</a><br>
@@ -39,7 +39,9 @@ BUILD_CFLAGS +=3D &quot;-Wno-error=3Dstringop-overflow&qu=
ot;<br>
=C2=A0DEPENDS_BZIP2 =3D &quot;bzip2-replacement-native&quot;<br>
=C2=A0DEPENDS_BZIP2:class-target =3D &quot;bzip2&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, =
&#39;debuginfod&#39;, &#39;debuginfod libdebuginfod&#39;, &#39;&#39;, d)}&q=
uot;<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, =
&#39;debuginfod&#39;, &#39;debuginfod libdebuginfod&#39;, &#39;&#39;, d)} \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;minidebuginfo&#39;, &#39;xz=
&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0PACKAGECONFIG[bzip2] =3D &quot;--with-bzlib,--without-bzlib,${DEPENDS=
_BZIP2}&quot;<br>
=C2=A0PACKAGECONFIG[xz] =3D &quot;--with-lzma,--without-lzma,xz&quot;<br>
=C2=A0PACKAGECONFIG[zstd] =3D &quot;--with-zstd,--without-zstd,zstd&quot;<b=
r>
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtoo=
ls/gdb/gdb-common.inc<br>
index 3349719a6b..48dbb91463 100644<br>
--- a/meta/recipes-devtools/gdb/gdb-common.inc<br>
+++ b/meta/recipes-devtools/gdb/gdb-common.inc<br>
@@ -30,7 +30,9 @@ EXTRA_OECONF =3D &quot;--disable-gdbtk --disable-x --disa=
ble-werror \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-libgmp=
-prefix=3D${STAGING_EXECPREFIXDIR} \<br>
=C2=A0&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;readline ${@bb.utils.filter(&#39;DISTRO_FEATURES=
&#39;, &#39;debuginfod&#39;, d)} python&quot;<br>
+PACKAGECONFIG ??=3D &quot;readline ${@bb.utils.filter(&#39;DISTRO_FEATURES=
&#39;, &#39;debuginfod&#39;, d)} python \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;minidebuginfo&#39;, &#39;xz=
&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0# Use --without-system-readline to compile with readline 5.<br>
=C2=A0PACKAGECONFIG[readline] =3D &quot;--with-system-readline,--without-sy=
stem-readline,readline&quot;<br>
=C2=A0PACKAGECONFIG[python] =3D &quot;--with-python=3D${WORKDIR}/python,--w=
ithout-python,python3,python3-codecs&quot;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--00000000000015e310060bc361a3--

