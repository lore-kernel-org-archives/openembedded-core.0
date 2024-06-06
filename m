Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830A5C27C54
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 12:08:02 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.12610.1717675674183531388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 05:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=RPeMVzu/;
 spf=pass (domain: snapchat.com, ip: 209.85.218.51, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a69607c6ccaso94099366b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 05:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1717675672; x=1718280472; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8qI+NbDwNWIgNK+j5OKBrUeFXCPVZ1IzVLfXuzsfb8=;
        b=RPeMVzu/ljpf1aK8njSosOSwSdgpj7At6VapE/CmOojvQBNYw8MBgJEfynYf4M/LgF
         wuk1A9ed5akbSzJB6y+nQk661An2lxbg8+lMBqoD6B03HLWf8/Bp7+GQbFgllwWyVNsj
         DHnMqXg+28hpPz+2K3XJdUtZ3HLBfczUnRinI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717675672; x=1718280472;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8qI+NbDwNWIgNK+j5OKBrUeFXCPVZ1IzVLfXuzsfb8=;
        b=EvK2YNJyT+Leq/6O+Rk0wPMMiixGx9zDd6TnzxiNpXQDmCD5rtmYoEuABAcQt1hoc5
         XT+C99SUS9YQshuUDfOqacKhGz6D+4QFTZb3fRB0KeIiVvyH5baOUhpiItqhVbtRFLdH
         MqQzCliJMmaMapvBEhlEijRQY5kSHWqBOOQtnMbzeSK+s2CXX3lu1HzgO8fWyQP3xMwY
         MB57ho1uNhX91zSodTjRabN0qnGWNRXoXCCDXC3JgqHTgE+jKIXLTWDGeRK6WHniavuX
         HptMEmRGfWEjwGAlOg2krojpuajCk1X2xNCGCygIvhEJVBDYgkz0bRg1g+pNLUnkeNP2
         prmw==
X-Gm-Message-State: AOJu0YxX5hnqy+0kYTqqNNvWIhrvq1nDngMfoDsJ1o5S5pd8cJ859BL3
	YghCIjYgv41KEMLkoD+G0i6DNogGSMYcEobLpNA1xzpUMX/I7Nq2sl4IN1CnrHonW7SWzx1qy7f
	epTYFfju9rbPCXdWL/FE8pEx/dtzKaOZ8Z4nY9VKvNuLtDeVp
X-Google-Smtp-Source: AGHT+IE5h5Guzk0vtCOWkge/liL/vP8XN7Yw6ZlPV7hwvWYPDukC5HHxf9flpzg1Di+bCfY9sYYTDn7qqxN1wjxTmvc=
X-Received: by 2002:a17:906:a407:b0:a65:4268:dfca with SMTP id
 a640c23a62f3a-a69a028ed52mr334231766b.65.1717675672251; Thu, 06 Jun 2024
 05:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240606120651.1158780-1-ecordonnier@snap.com>
In-Reply-To: <20240606120651.1158780-1-ecordonnier@snap.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 6 Jun 2024 14:07:41 +0200
Message-ID: <CAHUKmYZ_D=SJ2sE9BosXptE-Mf4QRTesFJiogQ5=6hq+goXb4g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] selftests: add test_minidebuginfo_qemu
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004910de061a3788c5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 12:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200397

--0000000000004910de061a3788c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

v3 of the patch: use INIT_MANAGER=3D"systemd" instead of multiple other
variables.

On Thu, Jun 6, 2024 at 2:06=E2=80=AFPM <ecordonnier@snap.com> wrote:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> test_systemd_coredump_minidebuginfo was getting skipped in CI, because th=
e
> feature isn't enabled per default in any image at the moment.
> Add this selftest so that test_systemd_coredump_minidebuginfo gets
> executed in CI.
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/lib/oeqa/selftest/cases/minidebuginfo.py | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/minidebuginfo.py
> b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
> index 2919f07939..a8923460f9 100644
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
> @@ -42,3 +43,18 @@ IMAGE_FSTYPES =3D "tar.bz2"
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
> +DISTRO_FEATURES:append =3D " minidebuginfo"
> +INIT_MANAGER =3D "systemd"
> +IMAGE_CLASSES +=3D "testimage"
> +TEST_SUITES =3D "ping ssh systemd"
> +        """)
> +        bitbake('core-image-minimal')
> +        bitbake('-c testimage core-image-minimal')
> --
> 2.36.1.vfs.0.0
>
>

--0000000000004910de061a3788c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">v3 of the patch: use INIT_MANAGER=3D&quot;systemd&quot; in=
stead of multiple other variables.</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 6, 2024 at 2:06=E2=80=AFPM &l=
t;<a href=3D"mailto:ecordonnier@snap.com">ecordonnier@snap.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Etienne=
 Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">e=
cordonnier@snap.com</a>&gt;<br>
<br>
test_systemd_coredump_minidebuginfo was getting skipped in CI, because the =
feature isn&#39;t enabled per default in any image at the moment.<br>
Add this selftest so that test_systemd_coredump_minidebuginfo gets executed=
 in CI.<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/minidebuginfo.py | 16 ++++++++++++++++<b=
r>
=C2=A01 file changed, 16 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/minidebuginfo.py b/meta/lib/oeqa/=
selftest/cases/minidebuginfo.py<br>
index 2919f07939..a8923460f9 100644<br>
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
@@ -42,3 +43,18 @@ IMAGE_FSTYPES =3D &quot;tar.bz2&quot;<br>
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
+DISTRO_FEATURES:append =3D &quot; minidebuginfo&quot;<br>
+INIT_MANAGER =3D &quot;systemd&quot;<br>
+IMAGE_CLASSES +=3D &quot;testimage&quot;<br>
+TEST_SUITES =3D &quot;ping ssh systemd&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;core-image-minimal&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;-c testimage core-image-minimal&#=
39;)<br>
-- <br>
2.36.1.vfs.0.0<br>
<br>
</blockquote></div>

--0000000000004910de061a3788c5--

