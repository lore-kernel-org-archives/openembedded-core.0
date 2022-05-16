Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43FBC433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 07:17:27 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.25969.1652685446260601423
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 00:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IJ3EVD9/;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so12230496pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 00:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dMVwF6ZzMXRYElSsYnw4yiPjBFFzy6B5S8lZ0iAWnOo=;
        b=IJ3EVD9/xnym12S6ppCzMNREVjAq4+QozQigPh8rRpCZ5hDiUXb5g1IowIh/pGatAJ
         1I/Bv0yhtmYxr8tQ042EuQaEA8xoIw3K4pp5VndJlad4GsYZNuju2SGuXoi4IDIngspm
         TJZVh2Xb+X8JMkEe17kFhMmZ3a1qIeR5hhsHdBg8y5nqS19vxnsIlVxdbgdPZyVMY/Cv
         0CAuh2CZJGpUoW/ivB6VA66IIDXV+ZgXKjjYJGHcnk/QTH2IfyUSs/kiwaYKevG6y2bY
         eroSwEIUsMieVBpp8nQwuQeo5BTYguhkEefj1JMM70dc1wAtDcq36y62q6lsJZiGh9fX
         yAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dMVwF6ZzMXRYElSsYnw4yiPjBFFzy6B5S8lZ0iAWnOo=;
        b=FR5SKsSbl+hKcApczfU5OyYNCv7iBnTNR79SEOCnR8pCinLgX6192cTo474+64D3hX
         fyfKh/ZrrjRdjlbPDf9b+r4YhX5z6J9TZT1OLex2cN6Muz5yPW8QVvcs/2oEvpBeuHa1
         c3h6Cq6UyuXvznUkf0nvkkfIMAMV5W6BO2n9uuUzsgvM2a3GPYpMiu8rpiTvTh9unt8Q
         KT18RekcYTp2wpr8yH/m3+VKoCvFhbxTPaVG6uwgW/JUwycy0Y7apYLVowVhHKal0xv0
         JsrHL8Uteryiiww7RhWSGaz97nq35vL290X3TNI0qov4XJof47yBY36F3fUffe07Uvn5
         2wog==
X-Gm-Message-State: AOAM533gdEsFpWZPf0JO8NoVVKh6chkQoce1O9YMxNJPrcLiulM7k/th
	0bRLD+c2mPn9k+qjG0X/E8VQYmLGElVti2losgc=
X-Google-Smtp-Source: 
 ABdhPJxPCwkL3KBaosdpMlqOnejfiTiMPpl3FK1urQvRtALQ4CTTZsjZpeuSctG8vlaDb0FZiodMlWf0Q4hAtcbbR8c=
X-Received: by 2002:a17:903:234e:b0:15e:d63f:973e with SMTP id
 c14-20020a170903234e00b0015ed63f973emr16329218plh.47.1652685445738; Mon, 16
 May 2022 00:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220515124346.8095-1-liu.ming50@gmail.com>
 <20220515124346.8095-2-liu.ming50@gmail.com>
 <4b08ee55f793b321f6d23c207fdb4fb0802297ed.camel@linuxfoundation.org>
In-Reply-To: 
 <4b08ee55f793b321f6d23c207fdb4fb0802297ed.camel@linuxfoundation.org>
From: Ming Liu <liu.ming50@gmail.com>
Date: Mon, 16 May 2022 09:17:15 +0200
Message-ID: 
 <CALatG=6SEmPaOFecWLQ6_hj63VobektQ6tKHZ5MKYExhqEPfAg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] [PATCH 1/1] mmc-utils: upgrade to latest
 revision
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
 Alexander Kanavin <alex@linutronix.de>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000eb351e05df1bd092"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 07:17:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165665

--000000000000eb351e05df1bd092
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Richard:

Our products are based on LTS kirkstone, we found a build issue of
mmc-utils, which has been fixed by
https://kernel.googlesource.com/pub/scm/utils/mmc/mmc-utils/+/0d493fb091b59=
2bde6004a618c28f1c3619af1a4

this uplift only involves in two commits including the above fix:

```
b7e4d5a mmc-utils: Add General command CMD56 read support
0d493fb mmc-utils: Fix build error MMC_BLOCK_MAJOR undeclared
```

considering kirkstone mmc-utils recipe fetches mmc-utils master branch and
does not stick to any release tag, so I think we can uplift mmc-utils to
the latest rather than backport that fix to kirkstone.

//Ming Liu


<richard.purdie@linuxfoundation.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8815=E6=
=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=8811:42=E5=AF=AB=E9=81=93=EF=BC=
=9A

> On Sun, 2022-05-15 at 14:43 +0200, liu.ming50@gmail.com wrote:
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit d98b06c9c6f480de1e5167bfe8392e39300fc02c)
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
>
> Why does kirkstone need this though?
>
> Cheers,
>
> Richard
>

--000000000000eb351e05df1bd092
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, Richard:</div><div><br></div><div>Our products ar=
e based on LTS kirkstone, we found a build issue of mmc-utils, which has be=
en fixed by <a href=3D"https://kernel.googlesource.com/pub/scm/utils/mmc/mm=
c-utils/+/0d493fb091b592bde6004a618c28f1c3619af1a4">https://kernel.googleso=
urce.com/pub/scm/utils/mmc/mmc-utils/+/0d493fb091b592bde6004a618c28f1c3619a=
f1a4</a></div><div><br></div><div>this uplift only involves in two commits =
including the above fix:</div><div><br></div><div>```</div><div>b7e4d5a mmc=
-utils: Add General command CMD56 read support<br>0d493fb mmc-utils: Fix bu=
ild error MMC_BLOCK_MAJOR undeclared</div><div>```</div><div><br></div><div=
>considering kirkstone mmc-utils recipe fetches mmc-utils master branch and=
 does not stick to any release tag, so I think we can uplift mmc-utils to t=
he latest rather than backport that fix to kirkstone.</div><div><br></div><=
div>//Ming Liu<br></div><div><br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">&lt;<a href=3D"mailto:richard.purdie=
@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; =E6=96=BC =
2022=E5=B9=B45=E6=9C=8815=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=8811:=
42=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Sun, 2022-05-15 at 14:43 +0200, <a href=3D"mailto:liu.ming=
50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a> wrote:<br>
&gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; Signed-off-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootl=
in.com" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; (cherry picked from commit d98b06c9c6f480de1e5167bfe8392e39300fc02c)<b=
r>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/mmc/<a href=3D"http://mmc-utils_git.bb" re=
l=3D"noreferrer" target=3D"_blank">mmc-utils_git.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
<br>
Why does kirkstone need this though?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--000000000000eb351e05df1bd092--

