Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web11.34961.1630001443366963706
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 11:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I8n4SFGn;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id m19so2673336vsj.10
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 11:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZX4A17PBrAMCM2d0E17Q7h7taUZu6c62Z5Dc8mYoif8=;
        b=I8n4SFGnLtqyt8QilrSyJoIOuLCpGP9TJMNLRbw6HD/Rj1Soa2ofhzrJ4fAEhMm+cU
         xMujiwq9O9gFUj1zTsXIf5NSN7THoEy8sNw1jZh+yIzqcMsxscYC59ibPQTY3Rkd+DPG
         tDhlKn0XsPymB3hcVvcT3jthcZDrhvS8kCgXHWMHpcvldelcjfCjxVrr1GFkz6PPbldN
         EB7eYH0ItrUxSvkxG9rwcCqkNx7k/ypPzmjajbaqf3cORjHl6ZRMv99OBw7zXiHbjH4F
         FA6ov7tv0xrFCT9YUSUrjP2Qq2u8iIgIy5mcnLrh9t0/61Hf5W1a0otXLbcpwDQxRPBL
         s5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZX4A17PBrAMCM2d0E17Q7h7taUZu6c62Z5Dc8mYoif8=;
        b=O1XTz8LzQ7SNvwv7ElZzi19QVaRiFRWhyv2Gg12CwvA20iVkY0hsRyV38pqgfyvXZe
         ZK2RKpym46cjtrDT1916t7RsP9oO3FrWmG9AG5Z0DNnEsXyuE3+QdeNrJMaNcFkcnP9O
         8dANhbTZ15+a9EVuzPie2W0QNN01wjLik5OD0hcKvRlfS2pvAAYlBTJkwSuEU6fTTC76
         6RHEbQrrhLqstzMM1aSsUbI17mun2vCgu/1sReME1LHj9oNhZkdIjx97OPu2nb3DDf3K
         +jqDUY8aauS0CqhgGG9wflLqGLM9tzNzXnJUGQoTNUUNiJqw/w0/9sXOHsH632u/byJi
         U8ug==
X-Gm-Message-State: AOAM531YDrXhgLe7BBM2Lp/idzjvq2BMc88ZARP/pbCN5OrfULW2ioTU
	6YaBmt74OIFpjcf1CarV/XowzMubJOJOpA82U6Q=
X-Google-Smtp-Source: ABdhPJxICTQj+SZoBNbJRClIwweScn9rLYJGREuZboz0zc4vy4NNXXOH3s/oA5CExWcWAWphVbbLPnoeFMnz5hhGUqQ=
X-Received: by 2002:a67:e243:: with SMTP id w3mr3807936vse.41.1630001442436;
 Thu, 26 Aug 2021 11:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210825113804.779395-1-alex.kanavin@gmail.com>
 <20210825113804.779395-13-alex.kanavin@gmail.com> <CAMKF1sqwfQJiDdWrNJGvXJdHLUi6+rTN-8S_Z0Wq-qA0zDo4-w@mail.gmail.com>
In-Reply-To: <CAMKF1sqwfQJiDdWrNJGvXJdHLUi6+rTN-8S_Z0Wq-qA0zDo4-w@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 26 Aug 2021 20:10:30 +0200
Message-ID: <CANNYZj_U0FtG9omMjEJ31e7rD5GK5QdERFnVsP2RoRviufG6BQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/16] libnsl2: upgrade 1.3.0 -> 2.0.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f5bb2205ca7a48f4"

--000000000000f5bb2205ca7a48f4
Content-Type: text/plain; charset="UTF-8"

nis+ support has been dropped:
https://github.com/thkukuk/libnsl/commits/master

I think you should remove the recipe that uses it :)

Alex

On Thu, 26 Aug 2021 at 19:23, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Aug 25, 2021 at 4:38 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-extended/libnsl/libnsl2_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb
> b/meta/recipes-extended/libnsl/libnsl2_git.bb
> > index badb71d977..53be67fe85 100644
> > --- a/meta/recipes-extended/libnsl/libnsl2_git.bb
> > +++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
> > @@ -10,9 +10,9 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> >  SECTION = "libs"
> >  DEPENDS = "libtirpc"
> >
> > -PV = "1.3.0"
> > +PV = "2.0.0"
> >
> > -SRCREV = "fbad7b36acaa89a54023930af70805649f962999"
> > +SRCREV = "82245c0c58add79a8e34ab0917358217a70e5100"
> >
>
> I am seeing libnssl-nisplus failure
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1484/steps/14/logs/stdio
>
> doesnt look a slam dunk but thats closest I could see a dependency change.
>
> >  SRC_URI = "git://github.com/thkukuk/libnsl \
> >            "
> > --
> > 2.31.1
> >
> >
> > 
> >
>

--000000000000f5bb2205ca7a48f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>nis+ support has been dropped:</div><div><a href=3D"h=
ttps://github.com/thkukuk/libnsl/commits/master">https://github.com/thkukuk=
/libnsl/commits/master</a></div><div><br></div><div>I think you should remo=
ve the recipe that uses it :)</div><div><br></div><div>Alex<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, 26 Aug 2021 at 19:23, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">=
raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Wed, Aug 25, 2021 at 4:38 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/libnsl/<a href=3D"http://libnsl2_git.bb" r=
el=3D"noreferrer" target=3D"_blank">libnsl2_git.bb</a> | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/libnsl/<a href=3D"http://libnsl2_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">libnsl2_git.bb</a> b/meta/recipe=
s-extended/libnsl/<a href=3D"http://libnsl2_git.bb" rel=3D"noreferrer" targ=
et=3D"_blank">libnsl2_git.bb</a><br>
&gt; index badb71d977..53be67fe85 100644<br>
&gt; --- a/meta/recipes-extended/libnsl/<a href=3D"http://libnsl2_git.bb" r=
el=3D"noreferrer" target=3D"_blank">libnsl2_git.bb</a><br>
&gt; +++ b/meta/recipes-extended/libnsl/<a href=3D"http://libnsl2_git.bb" r=
el=3D"noreferrer" target=3D"_blank">libnsl2_git.bb</a><br>
&gt; @@ -10,9 +10,9 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd=
65380cdd255951079008b364516c&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;libs&quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;libtirpc&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;1.3.0&quot;<br>
&gt; +PV =3D &quot;2.0.0&quot;<br>
&gt;<br>
&gt; -SRCREV =3D &quot;fbad7b36acaa89a54023930af70805649f962999&quot;<br>
&gt; +SRCREV =3D &quot;82245c0c58add79a8e34ab0917358217a70e5100&quot;<br>
&gt;<br>
<br>
I am seeing libnssl-nisplus failure<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88/build=
s/1484/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1484/steps/14/logs/=
stdio</a><br>
<br>
doesnt look a slam dunk but thats closest I could see a dependency change.<=
br>
<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/thkukuk/lib=
nsl" rel=3D"noreferrer" target=3D"_blank">github.com/thkukuk/libnsl</a> \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; --<br>
&gt; 2.31.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--000000000000f5bb2205ca7a48f4--
