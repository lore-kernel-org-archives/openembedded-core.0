Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web08.1547.1629570343789547285
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 11:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WP2nAJmZ;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id s19so8327346vsl.11
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 11:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ooumn6e7YcBhKMpJOw/cc5ey4c30tCdXCFfGoVr4Adg=;
        b=WP2nAJmZmV4XlpDOLq3C05r6uqredcE2FhPdetRPHcruI6IOX0TEwRM7vdmltlFgEk
         X2TeWv6vj3TOT6f29hgmVUz9wASrWRH50Qe8Flqj/lPKf3ZtIiiOlc9Lga8oktOshMiy
         0JOw3k4mUTDHR+ptOs16rVGFQJE7j1x3cGQuPabhNIxH3ACmA3ni3eoUsXKO5DfUrGWq
         yC0Rrbgie6n1vwSaoxqkj9FIFdADMYvb+xHa+1lR30vT30RFQ0D/2ej4t9zHlGdgnixa
         UaZydrB2qT7aHlTD1ms3fxI8TnXb8+YVFy3VpLsZiJgcuxAfdKqoX4rUMkZs+HjC9hRb
         5beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ooumn6e7YcBhKMpJOw/cc5ey4c30tCdXCFfGoVr4Adg=;
        b=RmR0o/DyEYsIxAg4PiZRv5yYGDMrCemEusxJAUn/ds5Y9yniB9YEUCP91D9yMmsp4t
         /670E+Wj4sMs9M03dPSYXvEPF3zr6EBCv7sKHOUYXk31TgoNYKcGzgN5ttIMGqNGaoXf
         jaHWo0ReHt6EdKPB8Ja2A3qWCpCWh48REYUn8iI+ZfEoxBEe4C7qGrAsmtx8O3y0QNTT
         yVRNsLTBYQIDS5zBefHAkb4qOO9ul8sd0Lg+/HecwnknM4D/3uuidxB2RjjzzdQkrL+Q
         TDsrwhSbpBvGQPxIcotBsqndr3QRAbIr6Mups3lH1BPeQ8Dm0rfIWFFkM9J2/tPUXTro
         szUg==
X-Gm-Message-State: AOAM5314JvsPU59CMZXw7CKVV34MOqz5pRIbqnZF/9AFplBMKkk9RWZk
	Zom+OfwrS/cP3UhRfIUTEE7DVteUjljP01c96uGpWGve
X-Google-Smtp-Source: ABdhPJzGH4C6R06293ovqX3xVT3lLUtwXuvcGF0rRjSoI4/Cxgjbc7OeQGL7lGUgXl843kbfjaVIzX9pIf8/d/74dIU=
X-Received: by 2002:a05:6102:4af:: with SMTP id r15mr20919551vsa.31.1629570342973;
 Sat, 21 Aug 2021 11:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <169CF3472372B2C5.3513@lists.openembedded.org> <20210820080412.23461-1-mingli.yu@windriver.com>
 <cc50d1bb5964e56cf3c1737cd892d3df36cb4574.camel@linuxfoundation.org>
In-Reply-To: <cc50d1bb5964e56cf3c1737cd892d3df36cb4574.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 21 Aug 2021 20:25:31 +0200
Message-ID: <CANNYZj9-+POyzT09UcO6kbtZCfQN11LJRi3k6hnAqojAbR0FGw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] rng-tools: Upgrade to 6.14
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Yu, Mingli" <mingli.yu@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006df45105ca15e90e"

--0000000000006df45105ca15e90e
Content-Type: text/plain; charset="UTF-8"

I have a patch that does, coming shortly.

Alex

On Sat, 21 Aug 2021 at 18:16, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-08-20 at 16:04 +0800, Yu, Mingli wrote:
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  .../rng-tools/{rng-tools_6.13.bb => rng-tools_6.14.bb}          | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-support/rng-tools/{rng-tools_6.13.bb =>
> rng-tools_6.14.bb} (97%)
> >
> > diff --git a/meta/recipes-support/rng-tools/rng-tools_6.13.bb
> b/meta/recipes-support/rng-tools/rng-tools_6.14.bb
> > similarity index 97%
> > rename from meta/recipes-support/rng-tools/rng-tools_6.13.bb
> > rename to meta/recipes-support/rng-tools/rng-tools_6.14.bb
> > index 84dbc76855..ff6c5e98d7 100644
> > --- a/meta/recipes-support/rng-tools/rng-tools_6.13.bb
> > +++ b/meta/recipes-support/rng-tools/rng-tools_6.14.bb
> > @@ -14,7 +14,7 @@ SRC_URI = "\
> >      file://default \
> >      file://rngd.service \
> >  "
> > -SRCREV = "d8dac0e8bede73e42b3d59f3b48c662ad0032e8c"
> > +SRCREV = "c16176d3800b91f4d016b66733b384493b06f294"
> >
> >  S = "${WORKDIR}/git"
> >
>
> Doesn't work on musl:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/3851
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/3862
>
> Cheers,
>
> Richard
>
>
> 
>
>

--0000000000006df45105ca15e90e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have a patch that does, coming shortly.</div><div><=
br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, 21 Aug 2021 at 18:16, Richard Purdie =
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@li=
nuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Fri, 2021-08-20 at 16:04 +0800, Yu, Mingli wrote:<br>
&gt; From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=
=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com=
" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../rng-tools/{<a href=3D"http://rng-tools_6.13.bb" rel=3D"noref=
errer" target=3D"_blank">rng-tools_6.13.bb</a> =3D&gt; <a href=3D"http://rn=
g-tools_6.14.bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.14.bb</a>=
}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta/recipes-support/rng-tools/{<a href=3D"http://rng-too=
ls_6.13.bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.13.bb</a> =3D&=
gt; <a href=3D"http://rng-tools_6.14.bb" rel=3D"noreferrer" target=3D"_blan=
k">rng-tools_6.14.bb</a>} (97%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/rng-tools/<a href=3D"http://rng-tool=
s_6.13.bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.13.bb</a> b/met=
a/recipes-support/rng-tools/<a href=3D"http://rng-tools_6.14.bb" rel=3D"nor=
eferrer" target=3D"_blank">rng-tools_6.14.bb</a><br>
&gt; similarity index 97%<br>
&gt; rename from meta/recipes-support/rng-tools/<a href=3D"http://rng-tools=
_6.13.bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.13.bb</a><br>
&gt; rename to meta/recipes-support/rng-tools/<a href=3D"http://rng-tools_6=
.14.bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.14.bb</a><br>
&gt; index 84dbc76855..ff6c5e98d7 100644<br>
&gt; --- a/meta/recipes-support/rng-tools/<a href=3D"http://rng-tools_6.13.=
bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.13.bb</a><br>
&gt; +++ b/meta/recipes-support/rng-tools/<a href=3D"http://rng-tools_6.14.=
bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.14.bb</a><br>
&gt; @@ -14,7 +14,7 @@ SRC_URI =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://default \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://rngd.service \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SRCREV =3D &quot;d8dac0e8bede73e42b3d59f3b48c662ad0032e8c&quot;<br>
&gt; +SRCREV =3D &quot;c16176d3800b91f4d016b66733b384493b06f294&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 <br>
<br>
Doesn&#39;t work on musl:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/64/build=
s/3851" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/64/builds/3851</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/45/build=
s/3862" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/45/builds/3862</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000006df45105ca15e90e--
