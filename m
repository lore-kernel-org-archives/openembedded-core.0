Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web11.16063.1592943231847969263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 13:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=arXAOvCp;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id l24so1485030uar.10
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 13:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tIGh7EvkcUROwJHuKKvE8Fa/g8w+JUrE5V2CHpvV0TE=;
        b=arXAOvCpZD0hfaw3wVYp3tSoMGDM4S3ekLOuSS29xUNq1ki+LiLqjF2BQezR1CWkNA
         nv/hnrTmspT+VVoS1DqHbefdb+yDxaSItbEqF2IP2n/34h1UpfSmwHfq3MkwFzLT1xmM
         aaaOKPEihzO0jbV+vJr8Inx4SmWTpUTgtxYN7+i5xfJfaU2Bcg9BOBOHvR2a/be1Du9M
         gSTqPYSQnjP0YPVY1YaDMY5gie9voouZFi0ZjM2awBqM+hS3ZX8BxGSzBS2809UaR1V4
         1dZTzLOballZoeQm0oDXgSPOE243X6QLtvLAA5GVRSsLcN3N/iLC0WNngs4NaQQ2188U
         /hCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tIGh7EvkcUROwJHuKKvE8Fa/g8w+JUrE5V2CHpvV0TE=;
        b=ZrvKd4kRvKSFjnH0c4YBqt+zxiWVD2NYpgC8F3ptGjkyYp6/i6NCMdz/ioS8W41Fkh
         4GUzgHrF+Y66qQ3mKVfwY2EeRKm/b4+TlOzYd5gEFioDPNCBPr6h9I3V9Kiee76QPjLM
         oydYCyh/GoWDYIjxuslu/NFYaKkSCD4I/39w0p7EvcbHBj97D/mYWjiNW/6XN7Xz6opV
         iJCjijMn4D31aq6TgbWfGWMOoiwT7eLx7Ywi7gtIHCJzanacowJ5qpwixzfTBFLNQzJZ
         pMMQxT/JYE6dwQzcyB/yyq/BZtHKEfvxImQU9aGWJo5Ciq29xjLh88x022kdwkXDUSyP
         gJlQ==
X-Gm-Message-State: AOAM530Sq9co+XIsKi9HuP8/oCpl1f4r+9ijXVqZbAk84sjNyQtwGNp9
	EBOSImn8q1F4CBtQARLOGTr3CID8gaJ4tpuNTAI=
X-Google-Smtp-Source: ABdhPJyp0T16pl/rtMuBBmjYqfncBc7B2lVqrowh/SzSBzcW6dAsfP96CyhRqtTRxp2kv1LkxDpA/tZe/GJV/CEM/DA=
X-Received: by 2002:ab0:15ca:: with SMTP id j10mr3026227uae.71.1592943230981;
 Tue, 23 Jun 2020 13:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200623134150.603584-1-richard.purdie@linuxfoundation.org> <a9fe68d2-b2d0-4ba8-dca8-78dca19ebb6d@gmail.com>
In-Reply-To: <a9fe68d2-b2d0-4ba8-dca8-78dca19ebb6d@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 23 Jun 2020 22:13:39 +0200
Message-ID: <CANNYZj834SO=HUDqHw+0JAY4VApZGUa8gXgEX6S0Po5SUNvqqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vulkan-headers: Fix upstream branch deletion issue
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006e1cfd05a8c5ff0c"

--0000000000006e1cfd05a8c5ff0c
Content-Type: text/plain; charset="UTF-8"

Latest released gstreamer will fail to build with the latest vulkan, so we
have to defer that.

Alex

On Tue, 23 Jun 2020 at 21:46, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 6/23/20 6:41 AM, Richard Purdie wrote:
> > The upstream branch was deleted but the commit is in master so reference
> > that instead.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >   meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
> b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
> > index 54cee96cce0..d21c3d62b90 100644
> > --- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
> > +++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
> > @@ -5,7 +5,8 @@ SECTION = "libs"
> >
> >   LICENSE = "Apache-2.0"
> >   LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
> > -SRC_URI = "git://
> github.com/KhronosGroup/Vulkan-Headers.git;branch=sdk-1.2.135"
> > +# was sdk-1.2.135 branch but it was removed upstream, commit is in
> master branch though
> > +SRC_URI = "git://
> github.com/KhronosGroup/Vulkan-Headers.git;branch=master"
> >
>
> perhaps better to update to SHA of latest tag ?
> https://github.com/KhronosGroup/Vulkan-Headers/releases/tag/v1.2.145
>
> >   SRCREV = "fb7f9c9bcd1d1544ea203a1f3d4253d0e90c5a90"
> >
> >
> >
> >
> >
> 
>

--0000000000006e1cfd05a8c5ff0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Latest released gstreamer will fail to build with the=
 latest vulkan, so we have to defer that.</div><div><br></div><div>Alex<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Tue, 23 Jun 2020 at 21:46, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><br>
<br>
On 6/23/20 6:41 AM, Richard Purdie wrote:<br>
&gt; The upstream branch was deleted but the commit is in master so refere=
nce<br>
&gt; that instead.<br>
&gt; <br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-hea=
ders_1.2.135.0.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-headers_1.2.=
135.0.bb</a> | 3 ++-<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-he=
aders_1.2.135.0.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-headers_1.2=
.135.0.bb</a> b/meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-heade=
rs_1.2.135.0.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-headers_1.2.13=
5.0.bb</a><br>
&gt; index 54cee96cce0..d21c3d62b90 100644<br>
&gt; --- a/meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-headers_1=
.2.135.0.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-headers_1.2.135.0.=
bb</a><br>
&gt; +++ b/meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-headers_1=
.2.135.0.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-headers_1.2.135.0.=
bb</a><br>
&gt; @@ -5,7 +5,8 @@ SECTION =3D &quot;libs&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D3b83e=
f96387f14655fc854ddc3c6bd57&quot;<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGroup/Vu=
lkan-Headers.git;branch=3Dsdk-1.2.135" rel=3D"noreferrer" target=3D"_blank"=
>github.com/KhronosGroup/Vulkan-Headers.git;branch=3Dsdk-1.2.135</a>&quot;<=
br>
&gt; +# was sdk-1.2.135 branch but it was removed upstream, commit is in m=
aster branch though<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGroup/Vu=
lkan-Headers.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/KhronosGroup/Vulkan-Headers.git;branch=3Dmaster</a>&quot;<br>
&gt;=C2=A0 =C2=A0<br>
<br>
perhaps better to update to SHA of latest tag ?<br>
<a href=3D"https://github.com/KhronosGroup/Vulkan-Headers/releases/tag/v1.=
2.145" rel=3D"noreferrer" target=3D"_blank">https://github.com/KhronosGroup=
/Vulkan-Headers/releases/tag/v1.2.145</a><br>
<br>
&gt;=C2=A0 =C2=A0SRCREV =3D &quot;fb7f9c9bcd1d1544ea203a1f3d4253d0e90c5a90=
&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div>

--0000000000006e1cfd05a8c5ff0c--
