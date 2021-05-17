Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web08.17450.1621249237133954735
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 04:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k5GCXu0h;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id z14so854640uan.7
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 04:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hzbZ0A8Wt3MXVMfGdOCZZXUXOZZpXECc+l1sFvocuCk=;
        b=k5GCXu0hifRTNYAh354Nq/ASyNtLBFo8flmCrZXxy85fxEHNW6Fy08cajAbxT8ns+J
         0T0sxgcDiz0c5QIpP6UVoitYqD4UcFg8yW1zmuRi8fSSso3AR88LbE15iOSrcPSFqFHS
         R/ohSVp+YcacBPMejaVxItdaIU77YBS3g4qA3OBjBjL0ae8KrhUPmv9Hi/463IsugAK0
         TYXbI/0yQ4OWSslzY+4CpSYsPWvsJW83NZVaHcLFBvljQGYmptQ9FkNSux1v3P2RCC+3
         Tidvff2P2U/YMrctZPtnCSk6UorkJul8Y73fqwOhGhAoK4MPgawdKsapEKQINPqOvCkL
         lXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hzbZ0A8Wt3MXVMfGdOCZZXUXOZZpXECc+l1sFvocuCk=;
        b=SRRJHIUASOX9OOv/fUhFEAt28ZceYfkX5eztfkf4Ts0Vp7xhhELPib5jbcxGN81Fra
         qeFtRzT7h8k3ltAYGOoDSiRRtV0p6w2JIG2mV5Lz7OTidyrZojDeR+pGx7/IvzaA5/Pu
         KeIm/hW0QeWDHyXedO1yk7+RLIf1VbTxxl2EtTe3lQvnx3yMp15/DZh9utiLBczrHm7f
         RW/k2NQM8iiJh7usxTfwthhakqOxELJ2JU9qQFDYxfxyIKwoTvSXE/2TdYEVv9LwaITq
         V+X2+R6G0/7wFzOF3rCVWCqQ5ztn+9YiNpzVPBfzaBcyWawElp7WKNfMB7SSnwGH5bPl
         xYdQ==
X-Gm-Message-State: AOAM532NWrb6WwcZKxEBN3oIVfwH/w5e/p0FsTeHAtjT6ZUjMMkDcflr
	R4YSAYv8jrMSfImA9K9mIn0IVo0Fzr08fpW/CVGZ5IH0
X-Google-Smtp-Source: ABdhPJzTokn7OZgp8mQdx94BN4iL5YKLaXK2C95uVqpwcBCIAh3DxLFHX2QHE1lcSj52u4ALIpLpUmNPhJTH7NWL70Q=
X-Received: by 2002:ab0:59cb:: with SMTP id k11mr38648409uad.100.1621249236212;
 Mon, 17 May 2021 04:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com> <20210517103528.24434-6-vinay.m.engg@gmail.com>
In-Reply-To: <20210517103528.24434-6-vinay.m.engg@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 17 May 2021 13:00:24 +0200
Message-ID: <CANNYZj8jNE92Ct9541GmLzmmNwgrJ2UOEC4=jQstwyi12PBMpw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="000000000000d11ffb05c28480fb"

--000000000000d11ffb05c28480fb
Content-Type: text/plain; charset="UTF-8"

Is slirp really required? Is it possible to use the standard tap setup
instead?

Alex

On Mon, 17 May 2021 at 12:35, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> The rust test involves qemuimage for testing, so
> "run_check_emulated" involves building of "remote-test-server",
> qemuimage and test execution.
>
> We are booting qemuimage in "nographic" and "slirp" mode along with
> additional qemuparams,
> '-monitor telnet:127.0.0.1:1234,server,nowait -serial mon:stdio -serial
> null'
>
> Note:
> '-serial mon:stdio -serial' :  To fix below run-time errors while testing
> "failed with Connection reset by peer"
>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/rust.py | 32 ++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
>
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py
> b/meta/lib/oeqa/selftest/cases/rust.py
> new file mode 100644
> index 0000000000..4efbf9306f
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: MIT
> +import os
> +from oeqa.core.decorator import OETestTag
> +from oeqa.core.case import OEPTestResultTestCase
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars,
> runqemu, Command
> +
> +class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
> +
> +       def run_check_emulated(self, *args, **kwargs):
> +               # build remote-test-server before image build
> +               recipe = "rust-testsuite"
> +               bitbake("{} -c compile".format(recipe))
> +
> +               # build core-image-minimal with required packages
> +               default_installed_packages = ["libgcc", "libstdc++",
> "libatomic", "libgomp"]
> +               features = []
> +               features.append('IMAGE_FEATURES += "ssh-server-openssh"')
> +               features.append('CORE_IMAGE_EXTRA_INSTALL +=
> "{0}"'.format(" ".join(default_installed_packages)))
> +               self.write_config("\n".join(features))
> +               bitbake("core-image-minimal")
> +               # wrap the execution with a qemu instance
> +               with runqemu("core-image-minimal", runqemuparams =
> "nographic slirp", qemuparams= " -monitor \
> +                        telnet:127.0.0.1:1234,server,nowait -serial
> mon:stdio -serial null") as qemu:
> +                       recipe = "rust-testsuite"
> +                       bitbake("{} -c check".format(recipe))
> +
> +
> +@OETestTag("toolchain-system")
> +class RustSelfTestSystemEmulated(RustSelfTestBase):
> +       def test_rust(self):
> +               self.run_check_emulated("rust")
> --
> 2.17.1
>
>

--000000000000d11ffb05c28480fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Is slirp really required? Is it possible to use the s=
tandard tap setup instead?</div><div><br></div><div>Alex<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 1=
7 May 2021 at 12:35, Vinay Kumar &lt;<a href=3D"mailto:vinay.m.engg@gmail.c=
om">vinay.m.engg@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">The rust test involves qemuimage for testing, so<=
br>
&quot;run_check_emulated&quot; involves building of &quot;remote-test-serve=
r&quot;,<br>
qemuimage and test execution.<br>
<br>
We are booting qemuimage in &quot;nographic&quot; and &quot;slirp&quot; mod=
e along with<br>
additional qemuparams,<br>
&#39;-monitor telnet:<a href=3D"http://127.0.0.1:1234" rel=3D"noreferrer" t=
arget=3D"_blank">127.0.0.1:1234</a>,server,nowait -serial mon:stdio -serial=
 null&#39;<br>
<br>
Note:<br>
&#39;-serial mon:stdio -serial&#39; :=C2=A0 To fix below run-time errors wh=
ile testing<br>
&quot;failed with Connection reset by peer&quot;<br>
<br>
Signed-off-by: Vinay Kumar &lt;<a href=3D"mailto:vinay.m.engg@gmail.com" ta=
rget=3D"_blank">vinay.m.engg@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/rust.py | 32 +++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 32 insertions(+)<br>
=C2=A0create mode 100644 meta/lib/oeqa/selftest/cases/rust.py<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/=
cases/rust.py<br>
new file mode 100644<br>
index 0000000000..4efbf9306f<br>
--- /dev/null<br>
+++ b/meta/lib/oeqa/selftest/cases/rust.py<br>
@@ -0,0 +1,32 @@<br>
+# SPDX-License-Identifier: MIT<br>
+import os<br>
+from oeqa.core.decorator import OETestTag<br>
+from oeqa.core.case import OEPTestResultTestCase<br>
+from oeqa.selftest.case import OESelftestTestCase<br>
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqemu,=
 Command<br>
+<br>
+class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0def run_check_emulated(self, *args, **kwargs):<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# build remote-test=
-server before image build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recipe =3D &quot;ru=
st-testsuite&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&quot;{} -c=
 compile&quot;.format(recipe))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# build core-image-=
minimal with required packages<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default_installed_p=
ackages =3D [&quot;libgcc&quot;, &quot;libstdc++&quot;, &quot;libatomic&quo=
t;, &quot;libgomp&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features.append(&#3=
9;IMAGE_FEATURES +=3D &quot;ssh-server-openssh&quot;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features.append(&#3=
9;CORE_IMAGE_EXTRA_INSTALL +=3D &quot;{0}&quot;&#39;.format(&quot; &quot;.j=
oin(default_installed_packages)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.write_config(&=
quot;\n&quot;.join(features))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&quot;core-=
image-minimal&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# wrap the executio=
n with a qemu instance<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with runqemu(&quot;=
core-image-minimal&quot;, runqemuparams =3D &quot;nographic slirp&quot;, qe=
muparams=3D &quot; -monitor \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 telnet:<a href=3D"http://127.0.0.1:1234" rel=3D"noreferrer" targ=
et=3D"_blank">127.0.0.1:1234</a>,server,nowait -serial mon:stdio -serial nu=
ll&quot;) as qemu:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0recipe =3D &quot;rust-testsuite&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bitbake(&quot;{} -c check&quot;.format(recipe))<br>
+<br>
+<br>
+@OETestTag(&quot;toolchain-system&quot;)<br>
+class RustSelfTestSystemEmulated(RustSelfTestBase):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0def test_rust(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.run_check_emul=
ated(&quot;rust&quot;)<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--000000000000d11ffb05c28480fb--
