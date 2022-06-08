Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABAEC43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 09:24:47 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web12.4377.1654680278014109245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 02:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BZSNhbRp;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: ernstp@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id h18so16141573ilj.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 02:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uCk6Wk+4XRwcW7qmXSbYbDXZxCxcqrSY/uGAfNnbQB0=;
        b=BZSNhbRpQuZCmZenrzZoEqXeNkKbdjDu31iEM9nLKW/zoUMdL+QrfRQdm5l+26LmIj
         wV5iA5+TE2XnN3R9JMnqAVmWiE+KZmlbKBPzXq10RV/92KNkDBe4MhU0rmqN8NUqX2rY
         vRGXFznZqMIytcfHXySKgtx1N7ZI30pQP+jIwDukzm1nAZiYLg8v5frB8VMzGkmGJ8iw
         p1/KA3z2FG+KMkj5uem6Gq81e/115AD+EYMckqXxlIvSknqUkCyU56jHDoRdk0mQOjcv
         4JvTJqzN0uSTe28WjdSwoXCQPJPUokWCjSyUQrLjndKZB1DoBZV/4ljb+WPQ2aN3UGsl
         Wdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uCk6Wk+4XRwcW7qmXSbYbDXZxCxcqrSY/uGAfNnbQB0=;
        b=knbegtHjsmnfF5rrXlhP9XiHUl5wqyTj4aWPF/AvxvzID1advWN5dNt9DOvnserOGq
         TB96hcWt85CXO4J5PlPrNyF6qPvUmVz7XSXhysvZHrzTRZawvYtotPPxb52c612aqRhD
         12ozi9HwQj/5rQ7G/Fu3g1qGUl5m0XDek1pit0oe7kyoVTctUIiOjjRZeDZHzngNXsHM
         ITVx6X/uInIFBIXETMo6vV1jnVcvQPi6aS5Bqrabyh9fiquPefsSW75NCqaNCB2ahsTe
         cTC+wVHGuNmqnhQeUCNG1+yt07EAgLeAkaDx1QscsGZhuji2zqyQ5IT9/Co2BD7uPANr
         RZGQ==
X-Gm-Message-State: AOAM533tGr9GesklDnlB+ur2Oe47qvPcLwfWocKAhxKVBxbV2v9o0Il5
	J+BHvVFmLtK7sC55aTAy05Yazyh8zUYu4PfL2ak=
X-Google-Smtp-Source: 
 ABdhPJxJvyr23VjRhBDvBk3y2DS+hroSLU0GBmVnwz+IO0+0fuJ/KYHiod9ToFes2GQwTtjh7932UIhLrPVZmmBZadQ=
X-Received: by 2002:a05:6e02:1b04:b0:2d1:af55:eb92 with SMTP id
 i4-20020a056e021b0400b002d1af55eb92mr19298574ilv.227.1654680277257; Wed, 08
 Jun 2022 02:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220603085827.2214734-1-rybczynska@gmail.com>
 <87k09u2ujv.fsf@gentoo.zhukoff.net>
 <CAApg2=Q+2weQLezA040uC=OR1_9ROXYT1iEzwk4Xt1Xf91yLHQ@mail.gmail.com>
In-Reply-To: 
 <CAApg2=Q+2weQLezA040uC=OR1_9ROXYT1iEzwk4Xt1Xf91yLHQ@mail.gmail.com>
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Wed, 8 Jun 2022 11:24:25 +0200
Message-ID: 
 <CAD=4a=VUSsTgW+L561ynDOk0aStHTeVvFXRpWMTjvHS=fmrNJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check: move update_symlinks to a library
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: pavel@zhukoff.net, Marta Rybczynska <marta.rybczynska@huawei.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000024914105e0ec4650"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 09:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166699

--00000000000024914105e0ec4650
Content-Type: text/plain; charset="UTF-8"

There's also a big create_symlinks() in image.bbclass that could use this
(partially).

//E

Den ons 8 juni 2022 kl 09:51 skrev Marta Rybczynska <rybczynska@gmail.com>:

> On Mon, Jun 6, 2022 at 8:08 AM Pavel Zhukov <pavel@zhukoff.net> wrote:
> >
> >
> > Looks like update_symplinks is widely used accros OE. Quick grepping
> gave me this:
> > [1]. I'm sure there're more occurences.
> > This should be somewhere in more accesible place (oe-core libraries).
> >
> >
>
> This is a valid point Pavel and Ernst. The patch has landed in master
> so I will do a followup.
> It seems that this could avoid a number of bugs (see the latest fix
> from Davide).
>
> Regards,
> Marta
>

--00000000000024914105e0ec4650
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">There&#39;s also a big create_symlinks() in image.bbcla=
ss that could use this (partially).</div><div class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_d=
efault" style=3D"font-family:arial,helvetica,sans-serif">//E<br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den o=
ns 8 juni 2022 kl 09:51 skrev Marta Rybczynska &lt;<a href=3D"mailto:rybczy=
nska@gmail.com">rybczynska@gmail.com</a>&gt;:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Mon, Jun 6, 2022 at 8:08 AM Pavel Zhukov &=
lt;<a href=3D"mailto:pavel@zhukoff.net" target=3D"_blank">pavel@zhukoff.net=
</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; Looks like update_symplinks is widely used accros OE. Quick grepping g=
ave me this:<br>
&gt; [1]. I&#39;m sure there&#39;re more occurences.<br>
&gt; This should be somewhere in more accesible place (oe-core libraries).<=
br>
&gt;<br>
&gt;<br>
<br>
This is a valid point Pavel and Ernst. The patch has landed in master<br>
so I will do a followup.<br>
It seems that this could avoid a number of bugs (see the latest fix<br>
from Davide).<br>
<br>
Regards,<br>
Marta<br>
</blockquote></div>

--00000000000024914105e0ec4650--

