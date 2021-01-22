Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.6675.1611306527953768652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jan 2021 01:08:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gaoaHuCy;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id bx12so5688743edb.8
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 01:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tl0FullwWyHz4Nq5blFsySrY88/wjFH8N+YO1j7N/Z8=;
        b=gaoaHuCy66iXAkoXr1Dy7vd1P0ibJqJJ1yNUrlsZHtN2UOG4jfFC30ASnbIhZ+FokL
         cWQPgAkX7kWAhkQ8vWCnHL+fCIXeV4V4mdnHQdjCTOwG5j9Qy0inVLct9BgCxw0yi/mQ
         l9pty5x7w/jaPb1byvPkvcXr9nz6M79+1qGgcTIeEcUG2Cj3GPk71tYugBcXbXaqtWZz
         uKp4FxcUE8f1UOqAf+qnEYCfuxm++Xq0zCnw+J1q/BApCx6zKiAqmq14gF5ReUCF1QZF
         Mn3F8gkc2eCkP6c7aSM8P8NdndrKuw2heYdNvY+5as7byTFHrXcnUkUVTlbhIDGN3nvF
         bJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tl0FullwWyHz4Nq5blFsySrY88/wjFH8N+YO1j7N/Z8=;
        b=EUrg7rLTDRoGmjjtrSvPzj1llPb+43gnWnD/vBa1VjxJSUwmAAa3R80JQDUvBB9X2G
         ULZBv9lKu3tSsoZsbVF19TrsRalaxesaX+j4zxcQ03IN/xisO5NqR/TJjOg+8QuyyVev
         DgSAl2LqlDjb4WdGp4Xt8f3X09nPIWB33drnbIia2brGnEjTesfteK8AvrlU76gzfujw
         /6MK+ht9QKcOou/4MkiyLSYNcZq1xOWHZkPUwQc76R6iqRCwSR6oGBwcHY7P5WiYHXp+
         FpbkY4dcdbr3Vi5nbeBzmWwcSCrmcgijxHIrKEneeBGKNNS9D3XhEpVsWiL4/MNaXf0Q
         FUGg==
X-Gm-Message-State: AOAM533PlALGEomtE/mGwRJ5hQzoUOsk8b05j9f+yUjhqbWLTIZ6aqup
	eYlti0kqd0Dm6XUWNBBwvXjgP/bZt1rm1zEuSrQ=
X-Google-Smtp-Source: ABdhPJzLlbyiyzxOa6t8X1uen1r8GgeHu5GRux3KivAePhhyNoSEq3inxdg7vIQPbMMv0qR3G80OlY2bnNAltFhXSvs=
X-Received: by 2002:a05:6402:158:: with SMTP id s24mr2535335edu.19.1611306526499;
 Fri, 22 Jan 2021 01:08:46 -0800 (PST)
MIME-Version: 1.0
References: <20210121152650.618875-1-quaresma.jose@gmail.com> <CAHtQpK6HNN34iJY6aQ9iEcyKRfUC7YF2tsoMcMODA4gKJiOJ_g@mail.gmail.com>
In-Reply-To: <CAHtQpK6HNN34iJY6aQ9iEcyKRfUC7YF2tsoMcMODA4gKJiOJ_g@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Fri, 22 Jan 2021 09:08:46 +0000
Message-ID: <CANPvuRm9nc1r+b5cLvSyyRoCSiPbTWQtfEVx5o0tkdN34RRU9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] glslang: upgrade 8.13.3743 -> 11.1.0
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000022e79305b97989d0"

--00000000000022e79305b97989d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrey,

Thanks for the catch.

Andrey Zhizhikin <andrey.z@gmail.com> escreveu no dia quinta, 21/01/2021
=C3=A0(s) 17:05:

> Hello Jose,
>
> On Thu, Jan 21, 2021 at 4:26 PM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > License-Update: Add additional licenses
> >
> > - [1] BSD-2-Clause & MIT & Apache-2.0
> > - [2] GPL-2-with-bison-exception
>
> This should be rather GPL-3-with-bison-exception, according to the
> commit link you've posted.
>

You are right, I have listed the license folder and add the
GPL-2-with-bison-exception
because the 'with-bison-exception'


>
> As this license does not exist in OE-Core - I'd suggest you introduce
> it as well.
>

I will add it and send a V3 patch.


>
> >
> > [1]
> https://github.com/KhronosGroup/glslang/commit/2962be40baff69848fd786c60=
9289666b60741b8
> > [2]
> https://github.com/KhronosGroup/glslang/commit/14a2cfbc72f2bb2e060fdfe3f=
be6a4d54e3817a8
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  .../glslang/{glslang_8.13.3743.bb =3D> glslang_11.1.0.bb}   | 8 ++++-=
---
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >  rename meta/recipes-graphics/glslang/{glslang_8.13.3743.bb =3D>
> glslang_11.1.0.bb} (75%)
> >
> > diff --git a/meta/recipes-graphics/glslang/glslang_8.13.3743.bb
> b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
> > similarity index 75%
> > rename from meta/recipes-graphics/glslang/glslang_8.13.3743.bb
> > rename to meta/recipes-graphics/glslang/glslang_11.1.0.bb
> > index 2c4f4be5a2..1afa46954c 100644
> > --- a/meta/recipes-graphics/glslang/glslang_8.13.3743.bb
> > +++ b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
> > @@ -5,15 +5,15 @@ of the specifications for these languages. It is ope=
n
> and free for anyone to use
> >  either from a command line or programmatically."
> >  SECTION =3D "graphics"
> >  HOMEPAGE =3D "
> https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
> > -LICENSE =3D "BSD-3-Clause"
> > -LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D918e668376010a04448a312fb37ae69b"
> > +LICENSE =3D "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPLv2"
>

The license needs to be fixed too.

+LICENSE =3D "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 &
GPL-3-with-bison-exception"


> > +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Dc5ce49c0456e9b413b98a4368c378229"
> >
> > -SRCREV =3D "e05cc20ec20a154d94256c744a3837c23719c0f9"
> > +SRCREV =3D "c594de23cdd790d64ad5f9c8b059baae0ee2941d"
> >  SRC_URI =3D "git://github.com/KhronosGroup/glslang.git;protocol=3Dhtt=
ps"
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+(\.\d+)+)$"
> >  S =3D "${WORKDIR}/git"
> >
> > -PV =3D "8.13.3743+git${SRCPV}"
> > +PV =3D "11.1.0"
> >
> >  inherit cmake python3native
> >
> > --
> > 2.30.0
> >
> >
> >=20
> >
>
>
> --
> Regards,
> Andrey.
>


--=20
best regards,
Jos=C3=A9 Quaresma

--00000000000022e79305b97989d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Andrey,</div><div><br></div>Thanks for=
 the catch.<div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">Andrey Zhizhikin &lt;<a href=3D"mailto:andrey.z@gmail.com">andrey=
.z@gmail.com</a>&gt; escreveu no dia quinta, 21/01/2021 =C3=A0(s) 17:05:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Jose,<br>
<br>
On Thu, Jan 21, 2021 at 4:26 PM Jose Quaresma &lt;<a href=3D"mailto:quares=
ma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; License-Update: Add additional licenses<br>
&gt;<br>
&gt; - [1] BSD-2-Clause &amp; MIT &amp; Apache-2.0<br>
&gt; - [2] GPL-2-with-bison-exception<br>
<br>
This should be rather GPL-3-with-bison-exception, according to the<br>
commit link you&#39;ve posted.<br></blockquote><div><br></div><div>You are=
 right, I have listed the=C2=A0license folder and add the GPL-2-with-bison-=
exception</div><div>because the &#39;with-bison-exception&#39;</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
As this license does not exist in OE-Core - I&#39;d suggest you introduce<=
br>
it as well.<br></blockquote><div><br></div><div>I will add it and send a V=
3 patch.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/KhronosGroup/glslang/commit/2962be4=
0baff69848fd786c609289666b60741b8" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/KhronosGroup/glslang/commit/2962be40baff69848fd786c60928966=
6b60741b8</a><br>
&gt; [2] <a href=3D"https://github.com/KhronosGroup/glslang/commit/14a2cfb=
c72f2bb2e060fdfe3fbe6a4d54e3817a8" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/KhronosGroup/glslang/commit/14a2cfbc72f2bb2e060fdfe3fbe6a4d=
54e3817a8</a><br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmai=
l.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../glslang/{<a href=3D"http://glslang_8.13.3743.bb" rel=3D"nor=
eferrer" target=3D"_blank">glslang_8.13.3743.bb</a> =3D&gt; <a href=3D"http=
://glslang_11.1.0.bb" rel=3D"noreferrer" target=3D"_blank">glslang_11.1.0.b=
b</a>}=C2=A0 =C2=A0| 8 ++++----<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-graphics/glslang/{<a href=3D"http://glslang=
_8.13.3743.bb" rel=3D"noreferrer" target=3D"_blank">glslang_8.13.3743.bb</a=
> =3D&gt; <a href=3D"http://glslang_11.1.0.bb" rel=3D"noreferrer" target=3D=
"_blank">glslang_11.1.0.bb</a>} (75%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/glslang/<a href=3D"http://glslang_=
8.13.3743.bb" rel=3D"noreferrer" target=3D"_blank">glslang_8.13.3743.bb</a>=
 b/meta/recipes-graphics/glslang/<a href=3D"http://glslang_11.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">glslang_11.1.0.bb</a><br>
&gt; similarity index 75%<br>
&gt; rename from meta/recipes-graphics/glslang/<a href=3D"http://glslang_8=
.13.3743.bb" rel=3D"noreferrer" target=3D"_blank">glslang_8.13.3743.bb</a><=
br>
&gt; rename to meta/recipes-graphics/glslang/<a href=3D"http://glslang_11.=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">glslang_11.1.0.bb</a><br>
&gt; index 2c4f4be5a2..1afa46954c 100644<br>
&gt; --- a/meta/recipes-graphics/glslang/<a href=3D"http://glslang_8.13.37=
43.bb" rel=3D"noreferrer" target=3D"_blank">glslang_8.13.3743.bb</a><br>
&gt; +++ b/meta/recipes-graphics/glslang/<a href=3D"http://glslang_11.1.0.=
bb" rel=3D"noreferrer" target=3D"_blank">glslang_11.1.0.bb</a><br>
&gt; @@ -5,15 +5,15 @@ of the specifications for these languages. It is op=
en and free for anyone to use<br>
&gt;=C2=A0 either from a command line or programmatically.&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;graphics&quot;<br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"https://www.khronos.org/opengles/=
sdk/tools/Reference-Compiler" rel=3D"noreferrer" target=3D"_blank">https://=
www.khronos.org/opengles/sdk/tools/Reference-Compiler</a>&quot;<br>
&gt; -LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D918e668376010a04=
448a312fb37ae69b&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause &amp; BSD-2-Clause &amp; MIT &amp; Ap=
ache-2.0 &amp; GPLv2&quot;<br></blockquote><div><br></div><div>The license =
needs to be fixed too.</div><div><br></div><div>+LICENSE =3D &quot;BSD-3-Cl=
ause &amp; BSD-2-Clause &amp; MIT &amp; Apache-2.0 &amp; GPL-3-with-bison-e=
xception&quot;<br></div><div></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Dc5ce49c0456e9b41=
3b98a4368c378229&quot;<br>
&gt;<br>
&gt; -SRCREV =3D &quot;e05cc20ec20a154d94256c744a3837c23719c0f9&quot;<br>
&gt; +SRCREV =3D &quot;c594de23cdd790d64ad5f9c8b059baae0ee2941d&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGro=
up/glslang.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/KhronosGroup/glslang.git;protocol=3Dhttps</a>&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D &quot;^(?P&lt;pver&gt;\d+(\.\d+)=
+)$&quot;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;8.13.3743+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;11.1.0&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit cmake python3native<br>
&gt;<br>
&gt; --<br>
&gt; 2.30.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
Regards,<br>
Andrey.<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr">best regards,<br>Jos=C3=A9 Qua=
resma</div></div></div></div>

--00000000000022e79305b97989d0--
