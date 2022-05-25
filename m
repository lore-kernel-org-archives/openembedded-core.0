Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B718EC433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 11:01:45 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web12.5343.1653476496352086823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 04:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XGf6iSAB;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id c19so22328138lfv.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 04:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jw4k40BLx3mgUtMVPBR082sIolHghTtnu4NdvxHRA6s=;
        b=XGf6iSABkRrcgcoWA4dOpkFju9POA+Wn9ZNmqMTrDCKJXzrjGD6QAVMtB58bBS8an3
         3nARSKUQ52adDncf6WgBz9LF0o5K90JRMNx5jMeQIjLtW03meEn8YZOYqMud9+uuTYeJ
         hJQYo8lCWYYYxOTfsAArxNqOEoeinYllsNAZ8WV4HHSBS6b36Gx+bAYVhVPbCbMguim8
         b+xKTAATNJTHVVdWvrJs0lIjdsPbNssv4qJy+pBgcWHNzk2xxcJ6EuD50cE1NxB5fIOX
         jr8RxCHOs3cI+rMt7q7euDV4irFbRZAYlG6y14A0r6lEM2AT6DX7768G2IDouebJ/bZq
         1MyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jw4k40BLx3mgUtMVPBR082sIolHghTtnu4NdvxHRA6s=;
        b=geB31tN1rgEb/dvsfeOdTg5LfzAJmyE0AjdQVjbjm1PUZIGw/v4xlseLbceNzVK/Xl
         W67oLebeO5+Z1bdmdqvsdRYBju9nJRw/fwS3tyCditRssww9DSJt0XBlP55518H3Wku8
         aW8KFCfGMuIuksf1DE/YTUJ5rh+LyeTLHBThyYvYUaMh3N/Ynct1VJbwciuHBiC+xT5+
         cbYR65JTib8zj0Cub51+nLFA3rDyX1RCc/fWvfEYREIOZgcdhAyi4vGRbAsg/zh9AUO1
         34hJsgzQ545+gpH5t/j0NO+pTOBFpAgJsNvWdyNQ+4fpKG/eK8oAYwt2rGKJCw5ueIkv
         /QkQ==
X-Gm-Message-State: AOAM531tnIvkscmcSKWCrgmnIjIa7KZ8tZKdoQH/+qNap4QfuU/8PEy/
	W+CpODI01Sv1uj3diJI80G6sFOs2sbuRHOj9gks=
X-Google-Smtp-Source: 
 ABdhPJzVXTOsVyGEJeV6aaBk+Sx3oNEG1XZzcfeThCEhPL9qu0ye26BbIq1394TEanbDCE1hGGLKH2WfjsCx/b5luzQ=
X-Received: by 2002:a05:6512:2348:b0:478:5ad6:af37 with SMTP id
 p8-20020a056512234800b004785ad6af37mr16633030lfu.26.1653476494513; Wed, 25
 May 2022 04:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220524173622.4033177-1-alex@linutronix.de>
 <20220525102904.016e5c61@melee>
In-Reply-To: <20220525102904.016e5c61@melee>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 May 2022 13:01:23 +0200
Message-ID: 
 <CANNYZj-1wyTZH5Qk3jNHvuH=qWne9MML712sCTvCwg+J0ubcUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] apt: fix upstream version check
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
 openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000199b3205dfd3ffa2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 11:01:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166116

--000000000000199b3205dfd3ffa2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I haven=E2=80=99t seen it written explicitly, it comes from what stable Deb=
ian
releases actually carry. There=E2=80=99s no harm in having a check that=E2=
=80=99s too
strict, but there is harm in updating to versions that are actually
intended for testing or unstable (and that=E2=80=99s what 2.4 is).

Alex

On Wed 25. May 2022 at 10.29, Luca Ceresoli <luca.ceresoli@bootlin.com>
wrote:

> Hi Alex,
>
> Il giorno Tue, 24 May 2022 19:36:22 +0200
> "Alexander Kanavin" <alex.kanavin@gmail.com> ha scritto:
>
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/recipes-devtools/apt/apt_2.4.5.bb | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb
> b/meta/recipes-devtools/apt/apt_2.4.5.bb
> > index 95c25e3036..1d94dd118c 100644
> > --- a/meta/recipes-devtools/apt/apt_2.4.5.bb
> > +++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
> > @@ -31,8 +31,14 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING.GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> >  # the package is taken from snapshots.debian.org; that source is
> static and goes stale
> >  # so we check the latest upstream from a directory that does get updat=
ed
> >  UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/a/apt/"
> > -
> > -inherit cmake perlnative bash-completion upstream-version-is-even
> useradd
> > +# apt seems to follow a peculiar version policy, where every *other*
> even version
> > +# is considered stable, e.g. 1.0, 1.4, 1.8, 2.2, 2.6, etc. As there is
> no way
> > +# to express 'divisible by 4 plus 2' in regex (that I know of), let's
> hardcode a few.
>
> Or, "how to reinvent the wheel in order to uselessly complicate other
> people's lives".
>
> I'm taking your patch for testing, but I have a question.
>
> Is this  policy documented? If so, IMO a URL here would be nice.
> Otherwise, is it wise to encode future stable releases here without
> really knowing whether the practice seen so far will go on in the
> future?
>
> > +UPSTREAM_CHECK_REGEX =3D
> "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.ta=
r"
>
> Maybe this would be more generic (untested):
>
>   (([2468\.[26])|([3579]\.[048]))
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000199b3205dfd3ffa2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I haven=E2=80=99t seen it written explicitly, it comes fr=
om what stable Debian releases actually carry. There=E2=80=99s no harm in h=
aving a check that=E2=80=99s too strict, but there is harm in updating to v=
ersions that are actually intended for testing or unstable (and that=E2=80=
=99s what 2.4 is).</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex<=
/div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed 25. May 2022 at 10.29, Luca Ceresoli &lt;<a href=3D"mailto:luca.=
ceresoli@bootlin.com">luca.ceresoli@bootlin.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(=
204,204,204)">Hi Alex,<br>
<br>
Il giorno Tue, 24 May 2022 19:36:22 +0200<br>
&quot;Alexander Kanavin&quot; &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt; ha scritto:<br>
<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/apt/<a href=3D"http://apt_2.4.5.bb" rel=3D=
"noreferrer" target=3D"_blank">apt_2.4.5.bb</a> | 10 ++++++++--<br>
&gt;=C2=A0 1 file changed, 8 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/apt/<a href=3D"http://apt_2.4.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">apt_2.4.5.bb</a> b/meta/recipes-devto=
ols/apt/<a href=3D"http://apt_2.4.5.bb" rel=3D"noreferrer" target=3D"_blank=
">apt_2.4.5.bb</a><br>
&gt; index 95c25e3036..1d94dd118c 100644<br>
&gt; --- a/meta/recipes-devtools/apt/<a href=3D"http://apt_2.4.5.bb" rel=3D=
"noreferrer" target=3D"_blank">apt_2.4.5.bb</a><br>
&gt; +++ b/meta/recipes-devtools/apt/<a href=3D"http://apt_2.4.5.bb" rel=3D=
"noreferrer" target=3D"_blank">apt_2.4.5.bb</a><br>
&gt; @@ -31,8 +31,14 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING.GPL;md5=
=3Db234ee4d69f5fce4486a80fdaf4a4263&quot;<br>
&gt;=C2=A0 # the package is taken from <a href=3D"http://snapshots.debian.o=
rg" rel=3D"noreferrer" target=3D"_blank">snapshots.debian.org</a>; that sou=
rce is static and goes stale<br>
&gt;=C2=A0 # so we check the latest upstream from a directory that does get=
 updated<br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;${DEBIAN_MIRROR}/main/a/apt/&quot;<=
br>
&gt; -<br>
&gt; -inherit cmake perlnative bash-completion upstream-version-is-even use=
radd<br>
&gt; +# apt seems to follow a peculiar version policy, where every *other* =
even version<br>
&gt; +# is considered stable, e.g. 1.0, 1.4, 1.8, 2.2, 2.6, etc. As there i=
s no way<br>
&gt; +# to express &#39;divisible by 4 plus 2&#39; in regex (that I know of=
), let&#39;s hardcode a few.<br>
<br>
Or, &quot;how to reinvent the wheel in order to uselessly complicate other<=
br>
people&#39;s lives&quot;.<br>
<br>
I&#39;m taking your patch for testing, but I have a question.<br>
<br>
Is this=C2=A0 policy documented? If so, IMO a URL here would be nice.<br>
Otherwise, is it wise to encode future stable releases here without<br>
really knowing whether the practice seen so far will go on in the<br>
future?<br>
<br>
&gt; +UPSTREAM_CHECK_REGEX =3D &quot;[^\d\.](?P&lt;pver&gt;((2\.2)|(2\.6)|(=
3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.tar&quot;<br>
<br>
Maybe this would be more generic (untested):<br>
<br>
=C2=A0 (([2468\.[26])|([3579]\.[048]))<br>
<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000199b3205dfd3ffa2--

