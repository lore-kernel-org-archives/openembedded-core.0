Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.9631.1624878042273018426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 04:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G+jzV5Gj;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id x12so9776118vsp.4
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 04:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PDt4r2mLCtRPWLH99cmCGKMt5vcKZV9fbbj2A2/QivM=;
        b=G+jzV5GjK6IwgvkJ2hFMHLVea2uKndaOUUmqysciAFQS1bnr815H6zVDbkmQvmRTal
         QDXHa/EQPEWcy2TlpWxFsXyGNvmihR8UDmyFgAtFMRsNnR9jxVxpokXDDZpOzhV1hwQv
         GG3bZcp54OJwrrMIxFnoYmyFtfZBgU+FfY05tudzeuxTSr+RKYJo/x2aecVpbpDOIVN7
         WPHogyk6LWqMJWrvoeIj1v+VMq/cGuwMMcxptCmY2hAhjD8N1Cma2uSA+JT9L0HUNG5W
         AYLLxaZDDWvXF36u9xeB6oS63Rkl8fc3Wl2M2F/Y1htvNQY8ImqLUE8hY1JT5M7QmV7S
         v4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PDt4r2mLCtRPWLH99cmCGKMt5vcKZV9fbbj2A2/QivM=;
        b=HbkUJfNav8lAXWRCXR4y6Uv14wCkyl+wOhJb+E7RD/3UzKO0N3Y48cpP0P7BJWExM2
         9tNYsZptS5WWgEQlmBW4DqzR+jxggP++A6jCiapZv0XHBakBQlM4ANAovQbi+4h2gR1Y
         QqJ6vdyJIn9wgoYz6U82xobo35wA3Sr3PMYgoay3SjXgu3GG1sB0HTcwUI/a0cOkXyho
         kpjqdk8L0fdqSD9uDfKFTk21hPYFnsCowh+stfLAqlFT+HaAhgzCf30mMClKYb8yIiXO
         Hh98JDiiPuWLLsNbNU8XiCBxhktjqpLJQyVKRyjV5CgGKQDqTQqaddvQHo8ziWVxX64I
         KDsw==
X-Gm-Message-State: AOAM530Zk76Cl+Nm2UTNTrH8U960NsN/ozy6w22XM22TDkWZGHzDbuaI
	5WROIhQAnhJ9tXph0f2pZ4B3Z7hkVOtPFQigIpK4WcKsJfg=
X-Google-Smtp-Source: ABdhPJyGGkC01r7YfJ8t8odXKJgB7tFT7zSDPL/M4AWpgAj1KpmAym2mFAst7hgBEIZTxB40hTqs8byeKpHCct52D1E=
X-Received: by 2002:a05:6102:3a09:: with SMTP id b9mr462479vsu.51.1624878041444;
 Mon, 28 Jun 2021 04:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <1624868106-101368-1-git-send-email-zangrc.fnst@fujitsu.com> <4e0756103e5453a65b763d7a458b4576a97ad5ae.camel@linuxfoundation.org>
In-Reply-To: <4e0756103e5453a65b763d7a458b4576a97ad5ae.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 28 Jun 2021 13:00:29 +0200
Message-ID: <CANNYZj8jgxj0=_viyHE7_=XqAkvYKc3JAphrS094j_uASZRihg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-pip: upgrade 21.1.2 -> 21.1.3
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: zangrc <zangrc.fnst@fujitsu.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000076b68405c5d166bc"

--00000000000076b68405c5d166bc
Content-Type: text/plain; charset="UTF-8"

I have to once again stress that you (zangrc) should learn the devtool
workflow as it handles this too.

Alex

On Mon, 28 Jun 2021 at 11:47, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2021-06-28 at 16:15 +0800, zangrc wrote:
> > Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> > ---
> >  .../python/{python3-pip_21.1.2.bb => python3-pip_21.1.3.bb}   | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-devtools/python/{python3-pip_21.1.2.bb =>
> python3-pip_21.1.3.bb} (83%)
> >
> > diff --git a/meta/recipes-devtools/python/python3-pip_21.1.2.bb
> b/meta/recipes-devtools/python/python3-pip_21.1.3.bb
> > similarity index 83%
> > rename from meta/recipes-devtools/python/python3-pip_21.1.2.bb
> > rename to meta/recipes-devtools/python/python3-pip_21.1.3.bb
> > index 04c6bb587c..239e83fced 100644
> > --- a/meta/recipes-devtools/python/python3-pip_21.1.2.bb
> > +++ b/meta/recipes-devtools/python/python3-pip_21.1.3.bb
> > @@ -10,8 +10,8 @@ inherit pypi distutils3
> >
> >
> >  SRC_URI += "file://0001-change-shebang-to-python3.patch"
> >
> >
> > -SRC_URI[md5sum] = "a867fd51eacfd5293f5b7e0c2e7867a7"
> > -SRC_URI[sha256sum] =
> "eb5df6b9ab0af50fe1098a52fd439b04730b6e066887ff7497357b9ebd19f79b"
> > +SRC_URI[md5sum] = "e459d41a10ce33688b5d389216a8876f"
> > +SRC_URI[sha256sum] =
> "b5b1eb91b36894bd01b8e5a56a422c2f3838573da0b0a1c63a096bb454e3b23f"
> >
> >
>
> Could you drop the md5sum lines in future please rather than update them
> as we no longer keep those?
>
> Cheers,
>
> Richard
>
>
> 
>
>

--00000000000076b68405c5d166bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have to once again stress that you (zangrc) should =
learn the devtool workflow as it handles this too.</div><div><br></div><div=
>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, 28 Jun 2021 at 11:47, Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundat=
ion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Mon, 2021-06-28 at 16:15 +0800, zangrc wrote:<br>
&gt; Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@fujitsu=
.com" target=3D"_blank">zangrc.fnst@fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../python/{<a href=3D"http://python3-pip_21.1.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-pip_21.1.2.bb</a> =3D&gt; <a href=3D"htt=
p://python3-pip_21.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pip=
_21.1.3.bb</a>}=C2=A0 =C2=A0| 4 ++--<br>
&gt; =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; =C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-=
pip_21.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pip_21.1.2.bb</=
a> =3D&gt; <a href=3D"http://python3-pip_21.1.3.bb" rel=3D"noreferrer" targ=
et=3D"_blank">python3-pip_21.1.3.bb</a>} (83%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-p=
ip_21.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pip_21.1.2.bb</a=
> b/meta/recipes-devtools/python/<a href=3D"http://python3-pip_21.1.3.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-pip_21.1.3.bb</a><br>
&gt; similarity index 83%<br>
&gt; rename from meta/recipes-devtools/python/<a href=3D"http://python3-pi=
p_21.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pip_21.1.2.bb</a>=
<br>
&gt; rename to meta/recipes-devtools/python/<a href=3D"http://python3-pip_=
21.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pip_21.1.3.bb</a><b=
r>
&gt; index 04c6bb587c..239e83fced 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-pip_21.1=
.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pip_21.1.2.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-pip_21.1=
.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pip_21.1.3.bb</a><br>
&gt; @@ -10,8 +10,8 @@ inherit pypi distutils3<br>
&gt; =C2=A0<br>
&gt; <br>
&gt; =C2=A0SRC_URI +=3D &quot;file://0001-change-shebang-to-python3.patch&=
quot;<br>
&gt; =C2=A0<br>
&gt; <br>
&gt; -SRC_URI[md5sum] =3D &quot;a867fd51eacfd5293f5b7e0c2e7867a7&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;eb5df6b9ab0af50fe1098a52fd439b04730b6e0=
66887ff7497357b9ebd19f79b&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;e459d41a10ce33688b5d389216a8876f&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;b5b1eb91b36894bd01b8e5a56a422c2f3838573=
da0b0a1c63a096bb454e3b23f&quot;<br>
&gt; =C2=A0<br>
&gt; <br>
<br>
Could you drop the md5sum lines in future please rather than update them<b=
r>
as we no longer keep those?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000076b68405c5d166bc--
