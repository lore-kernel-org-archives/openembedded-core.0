Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A08C27C53
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 13:18:17 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.15072.1717593492994355295
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 06:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Wd6/WXrI;
 spf=pass (domain: snapchat.com, ip: 209.85.218.44, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a68b5f18fc5so502232166b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1717593491; x=1718198291; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YUtnhPayKWNefXpNeTbEiT9NGfLIfRGvRQXICdC7Bcw=;
        b=Wd6/WXrIFaekmvIP8UE3/OMl1gulpPuStpza3WfI3Jb35DXBewyu/tnzpYQ2Ou1Bc9
         z4tLsDm9zRranXCMdmZg5qaVHAw6Ps867fxaj0ezBGj4C76yriLVKZBjrEX4FAOKexD8
         cefUC8maTv/ffl5npKJahbHQTStT+mlZ5l2UI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717593491; x=1718198291;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUtnhPayKWNefXpNeTbEiT9NGfLIfRGvRQXICdC7Bcw=;
        b=PMCPGv3kpvm8qVW+S4A4kr9i0StoeR+Q2QUY8cRNSCsdEHZ32/janIhk1u+3m/BEq/
         WfWzf2JphDQB55+ZxpK34mmBcZieHUXF0yBqFsRZYVdvtnpTi+AovGfn7U30JAo/svy6
         3K4zacY9Uk9r2nAL8eQuNXTEeEHA74ET+1EKS7dCeGHEKVRY8CkSjrpPIGvOG6WLubvG
         o8GJVrWl2Ljq4FaKDcXgtKw/0Wz9VY3NgBwHB2MevgXO6mpCYxWkviRZFbKgYRT1Es2I
         Wp0Cja/3E7x8iKViVAnAz+VTC/BHYA048akNlKdhe6w25rqeJsv/CntSYrg/E1hnel0E
         U+zw==
X-Gm-Message-State: AOJu0Yz2DW0SPQ0lb1cE9hgg2Nqpd9VSVVjjTdN0RqNRXtCFO27b6/gD
	4WOSDtcUbSS/k+7BFB9AHj5FB1d4EyYuOI3vGb1cA35ggUuP49pkx9HSyFaP6aDrNxC50SVn3Q9
	MvSaZL/VRyUe+37NeCc8AJZJOAdpH4pip7ad0OtyeDZOyyoMN
X-Google-Smtp-Source: AGHT+IHxbwhmwLkmQHgZWQXZcynOpRrJ6EQYbmbNCX1DbMaY9EacbY2XRTXYjkX2fnwZKHN5x4GURvDpNRnYruldSPE=
X-Received: by 2002:a17:907:60cb:b0:a68:b7bd:dae with SMTP id
 a640c23a62f3a-a699fa9c5fbmr215620066b.19.1717593491075; Wed, 05 Jun 2024
 06:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240605131727.2647983-1-ecordonnier@snap.com>
In-Reply-To: <20240605131727.2647983-1-ecordonnier@snap.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Wed, 5 Jun 2024 15:18:00 +0200
Message-ID: <CAHUKmYYVjv14juwyY8ObHZdpXNmS6FyVpUq-vh0jebvDwfbc+Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] selftests: add test_minidebuginfo_qemu
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e797ae061a2465fb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 13:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200368

--000000000000e797ae061a2465fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

v2 of the patch: fixed the commit message which was referencing the wrong
test-name.

On Wed, Jun 5, 2024 at 3:17=E2=80=AFPM <ecordonnier@snap.com> wrote:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> test_systemd_coredump_minidebuginfo was getting skipped in CI, because th=
e
> minidebuginfo feature isn't enabled per default in any image at the momen=
t.
>
> Add this selftest so that test_systemd_coredump_minidebuginfo gets
> executed in
> CI.
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/lib/oeqa/selftest/cases/minidebuginfo.py | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/minidebuginfo.py
> b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
> index 2919f07939..a64b334d77 100644
> --- a/meta/lib/oeqa/selftest/cases/minidebuginfo.py
> +++ b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
> @@ -8,6 +8,7 @@ import subprocess
>  import tempfile
>  import shutil
>
> +from oeqa.core.decorator import OETestTag
>  from oeqa.selftest.case import OESelftestTestCase
>  from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runCmd
>
> @@ -42,3 +43,20 @@ IMAGE_FSTYPES =3D "tar.bz2"
>                      native_sysroot =3D native_sysroot, target_sys =3D
> target_sys)
>              self.assertIn(".gnu_debugdata", r.output)
>
> +    @OETestTag("runqemu")
> +    def test_minidebuginfo_qemu(self):
> +        """
> +        Test minidebuginfo inside a qemu.
> +        This runs test_systemd_coredump_minidebuginfo and other
> minidebuginfo runtime tests which may be added in the future.
> +        """
> +
> +        self.write_config("""
> +DISTRO_FEATURES:append =3D " minidebuginfo usrmerge systemd"
> +DISTRO_FEATURES_BACKFILL_CONSIDERED =3D "sysvinit"
> +IMAGE_CLASSES +=3D "testimage"
> +TEST_SUITES =3D "ping ssh systemd"
> +VIRTUAL-RUNTIME_init_manager =3D "systemd"
> +VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
> +        """)
> +        bitbake('core-image-minimal')
> +        bitbake('-c testimage core-image-minimal')
> --
> 2.36.1.vfs.0.0
>
>

--000000000000e797ae061a2465fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">v2 of the patch: fixed the commit message which was refere=
ncing the wrong test-name.</div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Wed, Jun 5, 2024 at 3:17=E2=80=AFPM &lt;<a hre=
f=3D"mailto:ecordonnier@snap.com">ecordonnier@snap.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">From: Etienne Cordonn=
ier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ecordonni=
er@snap.com</a>&gt;<br>
<br>
test_systemd_coredump_minidebuginfo was getting skipped in CI, because the<=
br>
minidebuginfo feature isn&#39;t enabled per default in any image at the mom=
ent.<br>
<br>
Add this selftest so that test_systemd_coredump_minidebuginfo gets executed=
 in<br>
CI.<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/minidebuginfo.py | 18 ++++++++++++++++++=
<br>
=C2=A01 file changed, 18 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/minidebuginfo.py b/meta/lib/oeqa/=
selftest/cases/minidebuginfo.py<br>
index 2919f07939..a64b334d77 100644<br>
--- a/meta/lib/oeqa/selftest/cases/minidebuginfo.py<br>
+++ b/meta/lib/oeqa/selftest/cases/minidebuginfo.py<br>
@@ -8,6 +8,7 @@ import subprocess<br>
=C2=A0import tempfile<br>
=C2=A0import shutil<br>
<br>
+from oeqa.core.decorator import OETestTag<br>
=C2=A0from oeqa.selftest.case import OESelftestTestCase<br>
=C2=A0from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, run=
Cmd<br>
<br>
@@ -42,3 +43,20 @@ IMAGE_FSTYPES =3D &quot;tar.bz2&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0native_sysroot =3D native_sysroot, target_sys =3D target_sys)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertIn(&quot;.gnu_de=
bugdata&quot;, r.output)<br>
<br>
+=C2=A0 =C2=A0 @OETestTag(&quot;runqemu&quot;)<br>
+=C2=A0 =C2=A0 def test_minidebuginfo_qemu(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Test minidebuginfo inside a qemu.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 This runs test_systemd_coredump_minidebuginfo =
and other minidebuginfo runtime tests which may be added in the future.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&quot;&quot;&quot;<br>
+DISTRO_FEATURES:append =3D &quot; minidebuginfo usrmerge systemd&quot;<br>
+DISTRO_FEATURES_BACKFILL_CONSIDERED =3D &quot;sysvinit&quot;<br>
+IMAGE_CLASSES +=3D &quot;testimage&quot;<br>
+TEST_SUITES =3D &quot;ping ssh systemd&quot;<br>
+VIRTUAL-RUNTIME_init_manager =3D &quot;systemd&quot;<br>
+VIRTUAL-RUNTIME_initscripts =3D &quot;systemd-compat-units&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;core-image-minimal&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;-c testimage core-image-minimal&#=
39;)<br>
-- <br>
2.36.1.vfs.0.0<br>
<br>
</blockquote></div>

--000000000000e797ae061a2465fb--

