Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BAEC43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 20:03:56 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web08.2110.1654632229077657008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 13:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lR6ZJley;
 spf=pass (domain: gmail.com, ip: 209.85.219.179,
 mailfrom: ptsneves@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id v22so32930484ybd.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 13:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tQwDbp9W0x53Jus8U47OT7RwKDnxC8u0Aez5cn5Xr9A=;
        b=lR6ZJleyr5kn56C9NJtoRmH4zTXZsaz16BVZCDm4+jX/zZBZ9rQ1NMoKYQHI63EJDL
         1rZIgBvmbHXix+/k58CgoBBeXp+wI6/a8EiQLUen+ZXlAjUnW+fd6inoqsyT7rbWd+M4
         knRFE7+X1j3LjWOXKPERv4IL1S4nxqRnZRaAT2dCDxp1CectpUVQg+xeVuOLUqRywYTO
         4HcO1Howwt3sCK861n3A7UL4JSX1HcVA0K5QW/j6H/djv5PphVikuKNM92p1vpAKwhJ5
         d3fNZFks7Zccn5dclPHPHDrM499heB+xfyOxN7erPAgO4S1q1uf/+ic1c/kGLad9PmfG
         M2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tQwDbp9W0x53Jus8U47OT7RwKDnxC8u0Aez5cn5Xr9A=;
        b=vGQYbnR+rpwfC4wbM2RoGLaimnZllpTUv65EasggfuoqolbZJhETfkbnsqIG0B2ZqA
         OkMN9yaLO5ReNg47v0W0MFUIB2e1IjFf6yfddqXKPgSJ1L8kky6avJzq4MYYxKi2/JWG
         YmNjwvj8AFE8NhzdmW/fpfssKWJxejsFh+84LbHns3rTJvbK+7Ea4llD9ToqWQ2MjQdt
         WknrC29840nBxFfsxyJnDOb53s37Dm5iiIGtnYoIy4AODYw+ulDpvxiLNbn+zyGRktKN
         wLq1r8ZsmFbJjGZ0SiBFr9uS4ZmBx1Lfp+1S1fDOKU2fXaScfBxLpFn2LcoLQzQwm/a1
         vhNg==
X-Gm-Message-State: AOAM5301rSGFGkYkNZvwXbuZhLsNoibIRN9BN1orqbqCLGt4liPT+5K3
	JxmS3m/H1pJTztVVAREmxGS24jtr/YnMFP61tA==
X-Google-Smtp-Source: 
 ABdhPJwiSiR4bn1y8b+XZlRt22ahvciV1GpZLr+0WhM6XiorrbM0HLuF1ngTNYm6hiHr1pyihO1QPf2nXRXguhRKAfU=
X-Received: by 2002:a25:1c84:0:b0:65d:6c6b:25f7 with SMTP id
 c126-20020a251c84000000b0065d6c6b25f7mr32533296ybc.232.1654632228256; Tue, 07
 Jun 2022 13:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220607151123.3588947-1-ptsneves@gmail.com>
 <CANNYZj-YRAU+RJQ8JwqAxgSJto+LAbMQxQ-yOB8c3PBCcsr7OQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-YRAU+RJQ8JwqAxgSJto+LAbMQxQ-yOB8c3PBCcsr7OQ@mail.gmail.com>
From: Paulo Neves <ptsneves@gmail.com>
Date: Tue, 7 Jun 2022 22:03:36 +0200
Message-ID: 
 <CAJO0J4iAAyOPzy+crXQDBO3hqdE9+Pdhu3hheju+QbpH5=vqFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/5] python: Avoid shebang overflow on
 python-config.py
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000033011305e0e116ea"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 20:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166685

--00000000000033011305e0e116ea
Content-Type: text/plain; charset="UTF-8"

I think this patch will never be accepted because it hard-codes and depends
on env. I recall that red hat for example does not accept the use of env,
possibly for security reasons.

Paulo Neves

On Tue, Jun 7, 2022, 18:53 Alexander Kanavin <alex.kanavin@gmail.com> wrote:

> I'm not sure this is Inappropriate. Can you send this to upstream
> nevertheless?
>
> Alex
>
> On Tue, 7 Jun 2022 at 17:11, Paulo Neves <ptsneves@gmail.com> wrote:
> >
> > The native path may be too big, leading to shebang
> > overflow. Just use the #!/usr/bin/env python3.
> >
> > Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> > ---
> >  ...shebang-overflow-on-python-config.py.patch | 29 +++++++++++++++++++
> >  .../recipes-devtools/python/python3_3.10.4.bb |  1 +
> >  2 files changed, 30 insertions(+)
> >  create mode 100644
> meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
> >
> > diff --git
> a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
> b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
> > new file mode 100644
> > index 0000000000..9f23278a30
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
> > @@ -0,0 +1,29 @@
> > +From f0c9dec63d452a7cd1e15ea653f4aced281f021c Mon Sep 17 00:00:00 2001
> > +From: Paulo Neves <ptsneves@gmail.com>
> > +Date: Tue, 7 Jun 2022 16:16:41 +0200
> > +Subject: [PATCH 1/1] Avoid shebang overflow on python-config.py
> > +
> > +The whole native path may be too big, leading to shebang
> > +overflow. Let's just use the env shebang.
> > +
> > +Upstream-Status: Inappropriate [distribution]
> > +---
> > + Makefile.pre.in | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/Makefile.pre.in b/Makefile.pre.in
> > +index
> f0aedb76cb58999427804255da56fa53284d7032..dd88e43114730f7681715777cc76dabb31113176
> 100644
> > +--- a/Makefile.pre.in
> > ++++ b/Makefile.pre.in
> > +@@ -1638,6 +1638,8 @@ python-config: $(srcdir)/Misc/python-config.in
> Misc/python-config.sh
> > +       @ # Substitution happens here, as the completely-expanded BINDIR
> > +       @ # is not available in configure
> > +       sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," <
> $(srcdir)/Misc/python-config.in >python-config.py
> > ++      @ # Otherwise we might get huge shebangs with native paths
> > ++      sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' python-config.py
> > +       @ # Replace makefile compat. variable references with shell
> script compat. ones; $(VAR) -> ${VAR}
> > +       LC_ALL=C sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' <
> Misc/python-config.sh >python-config
> > +       @  # In OpenEmbedded, always use the python version of the
> script, the shell
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb
> b/meta/recipes-devtools/python/python3_3.10.4.bb
> > index 6bd3a6aba8..357025f856 100644
> > --- a/meta/recipes-devtools/python/python3_3.10.4.bb
> > +++ b/meta/recipes-devtools/python/python3_3.10.4.bb
> > @@ -34,6 +34,7 @@ SRC_URI = "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> >
>  file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
> >
>  file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
> >             file://deterministic_imports.patch \
> > +           file://0001-Avoid-shebang-overflow-on-python-config.py.patch
> \
> >             "
> >
> >  SRC_URI:append:class-native = " \
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#166670):
> https://lists.openembedded.org/g/openembedded-core/message/166670
> > Mute This Topic: https://lists.openembedded.org/mt/91602889/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000033011305e0e116ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I think this patch will never be accepted because it hard=
-codes and depends on env. I recall that red hat for example does not accep=
t the use of env, possibly for security reasons.<div dir=3D"auto"><br></div=
><div dir=3D"auto">Paulo Neves=C2=A0</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 7, 2022, 18:53 Alexan=
der Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I&#39;m not su=
re this is Inappropriate. Can you send this to upstream nevertheless?<br>
<br>
Alex<br>
<br>
On Tue, 7 Jun 2022 at 17:11, Paulo Neves &lt;<a href=3D"mailto:ptsneves@gma=
il.com" target=3D"_blank" rel=3D"noreferrer">ptsneves@gmail.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; The native path may be too big, leading to shebang<br>
&gt; overflow. Just use the #!/usr/bin/env python3.<br>
&gt;<br>
&gt; Signed-off-by: Paulo Neves &lt;<a href=3D"mailto:ptsneves@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">ptsneves@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...shebang-overflow-on-python-config.py.patch | 29 +++++++++++++=
++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python3_3.10.4.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">python3_3.10.4.bb</a> |=C2=
=A0 1 +<br>
&gt;=C2=A0 2 files changed, 30 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3/0001-Avo=
id-shebang-overflow-on-python-config.py.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-o=
verflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/00=
01-Avoid-shebang-overflow-on-python-config.py.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..9f23278a30<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow=
-on-python-config.py.patch<br>
&gt; @@ -0,0 +1,29 @@<br>
&gt; +From f0c9dec63d452a7cd1e15ea653f4aced281f021c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Paulo Neves &lt;<a href=3D"mailto:ptsneves@gmail.com" target=3D=
"_blank" rel=3D"noreferrer">ptsneves@gmail.com</a>&gt;<br>
&gt; +Date: Tue, 7 Jun 2022 16:16:41 +0200<br>
&gt; +Subject: [PATCH 1/1] Avoid shebang overflow on python-config.py<br>
&gt; +<br>
&gt; +The whole native path may be too big, leading to shebang<br>
&gt; +overflow. Let&#39;s just use the env shebang.<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [distribution]<br>
&gt; +---<br>
&gt; + <a href=3D"http://Makefile.pre.in" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">Makefile.pre.in</a> | 2 ++<br>
&gt; + 1 file changed, 2 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile=
.pre.in" rel=3D"noreferrer noreferrer" target=3D"_blank">Makefile.pre.in</a=
><br>
&gt; +index f0aedb76cb58999427804255da56fa53284d7032..dd88e43114730f7681715=
777cc76dabb31113176 100644<br>
&gt; +--- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer noreferrer=
" target=3D"_blank">Makefile.pre.in</a><br>
&gt; ++++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer noreferrer=
" target=3D"_blank">Makefile.pre.in</a><br>
&gt; +@@ -1638,6 +1638,8 @@ python-config: $(srcdir)/Misc/<a href=3D"http:/=
/python-config.in" rel=3D"noreferrer noreferrer" target=3D"_blank">python-c=
onfig.in</a> Misc/python-config.sh<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@ # Substitution happens here, as the comp=
letely-expanded BINDIR<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@ # is not available in configure<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &quot;s,@EXENAME@,$(BINDIR)/python$=
(LDVERSION)$(EXE),&quot; &lt; $(srcdir)/Misc/<a href=3D"http://python-confi=
g.in" rel=3D"noreferrer noreferrer" target=3D"_blank">python-config.in</a> =
&gt;python-config.py<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 @ # Otherwise we might get huge shebangs with n=
ative paths<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;1s|^#!.*|#!/usr/bin/env python3|=
&#39; python-config.py<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@ # Replace makefile compat. variable refe=
rences with shell script compat. ones; $(VAR) -&gt; ${VAR}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0LC_ALL=3DC sed -e &#39;s,\$$(\([A-Za-z0-9_=
]*\)),\$$\{\1\},g&#39; &lt; Misc/python-config.sh &gt;python-config<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@=C2=A0 # In OpenEmbedded, always use the =
python version of the script, the shell<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.=
10.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3_3.10.4.bb<=
/a> b/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.4.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">python3_3.10.4.bb</a><br>
&gt; index 6bd3a6aba8..357025f856 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.4.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">python3_3.10.4.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.4.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">python3_3.10.4.bb</a><br>
&gt; @@ -34,6 +34,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/f=
tp/python/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer noreferrer" =
target=3D"_blank">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.x=
z</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Lib-pty.py-=
handle-stdin-I-O-errors-same-way-as-maste.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-setup.py-Do=
-not-detect-multiarch-paths-when-cross-co.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://deterministic_im=
ports.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Avoid-shebang-ov=
erflow-on-python-config.py.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI:append:class-native =3D &quot; \<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#166670): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/166670" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1666=
70</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91602889=
/1686489" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/91602889/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanav=
in@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gmail.com</=
a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000033011305e0e116ea--

