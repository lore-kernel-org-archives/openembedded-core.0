Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC8CC433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 11:02:34 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web12.5502.1641898953145155155
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 03:02:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ars0N/g0;
 spf=pass (domain: gmail.com, ip: 209.85.221.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id 19so2333249vkl.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 03:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qYLIfY/0mQ1en+ef1wU/bjnVGufodLKTHJr1O9qttnM=;
        b=Ars0N/g09f+iYoxpPJaymZAgrAxBAM54K/qBwUmyjXfRty+kOMIW2jc3HO6CVGjC5E
         EiHAYSIn+M+D5/NLRFq33+OEOvJRV97vWvrs6HbhHy7sYVaLx0UwUqhdL+bvx9AYDLyd
         w64gaypCI2GU3SdLYlip5DqXjsxf4c4A/enD5pNRG35s+K136J3E9QsAJ+TpGjlH07WJ
         iCCIwNu0Xtwwir4pqYdAEGyM4+pG8yfu7DBxoTlh4yfoVMzJYXELS4gQAj4AfxrW9wcb
         8NSWSFdNQZO98Ps8kKP98wtNIRr/Zb5fQiKX5A47QTrBl/lZAgNrYz4b98pFa35IFKJH
         Qzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qYLIfY/0mQ1en+ef1wU/bjnVGufodLKTHJr1O9qttnM=;
        b=NACvVe6yMDmRtNF0X28D20rK1ra3i5HlHcUkHT2nHX+wVkl/wQTBg8a7n5QiEBgWoI
         y0rlvoQkYc4HkoNjvcgmA5Rv7pSs+mRyk8bUNmb2ixiFWGmjO2TwtcaBeFQrbAHESfZ5
         sgz/NbnbkOjYD+VJPybaZqJGiXkKcQEc4AWxCkiLpjPDbPox6CA8y1FNwileHec8ipyT
         bdJGyrScjVlzIZLWPBxByxPR0QdUDwF7CamQTYcMPi9twrl6wEF5OflY2sa+itim58r4
         NaKHJVD3gHCHhCB1tEy567w8DLjm6Y3nYE2q2mtT+uovNcqLqJWZfOFxiw9xxHtQtKlF
         reyw==
X-Gm-Message-State: AOAM531HbBIurE81U0Y64nSXvVAeBrKvZLyOJudt93/qADZNKKuFVYIa
	oF6rcu61E85o0OkrTMy52USoFyDfawYN0IcGxqY=
X-Google-Smtp-Source: 
 ABdhPJzKT/LPonUA5Q0srN2cG2b9jTA2+xOEFgxGR+nxWXV44HZPLnvxQjeDaOp42Es9Z16a+uN6kK0+xaKQrI+2HWM=
X-Received: by 2002:a1f:ce41:: with SMTP id e62mr1918849vkg.30.1641898951706;
 Tue, 11 Jan 2022 03:02:31 -0800 (PST)
MIME-Version: 1.0
References: <20220109222732.2252416-1-alex@linutronix.de>
 <20220109222732.2252416-13-alex@linutronix.de>
 <b13cebc769646dffce33ee9b675375d4c22ef7bc.camel@linuxfoundation.org>
In-Reply-To: 
 <b13cebc769646dffce33ee9b675375d4c22ef7bc.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Jan 2022 12:02:20 +0100
Message-ID: 
 <CANNYZj9jRkc32Xm7PevLuFEgLOxTdaq7bYGu9=_gU3PitT7_-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/14] connman: do nothing in qemu,
 do not touch eth0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000c60a8105d54c6340"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 11:02:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160392

--000000000000c60a8105d54c6340
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Jan 2022 at 11:55, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> > +# Kernel IP-Config is perfectly capable of setting up networking passed
> in via ip=
> > +do_install:append:qemuall() {
> > +    mkdir -p ${D}${sysconfdir}/default
> > +    echo "export EXTRA_PARAM=\"-I eth0\"" >
> ${D}${sysconfdir}/default/connman
> > +}
>
> This means connman becomes machine specific, you can't do that. This would
> need
> to be done in the connman-conf recipe.
>

I'm not sure I follow - the above instructs connman to ignore eth0 inside
qemu (and only inside qemu), why is that problematic?

Alex

--000000000000c60a8105d54c6340
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 11 Jan 2022 at 11:55, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; +=
# Kernel IP-Config is perfectly capable of setting up networking passed in =
via ip=3D<br>
&gt; +do_install:append:qemuall() {<br>
&gt; +=C2=A0 =C2=A0 mkdir -p ${D}${sysconfdir}/default<br>
&gt; +=C2=A0 =C2=A0 echo &quot;export EXTRA_PARAM=3D\&quot;-I eth0\&quot;&q=
uot; &gt; ${D}${sysconfdir}/default/connman<br>
&gt; +}<br><br>
This means connman becomes machine specific, you can&#39;t do that. This wo=
uld need<br>
to be done in the connman-conf recipe.<br></blockquote></div><div class=3D"=
gmail_quote"><br></div><div class=3D"gmail_quote">I&#39;m not sure I follow=
 - the above instructs connman to ignore eth0 inside qemu (and only inside =
qemu), why is that problematic?</div><div class=3D"gmail_quote"><br></div><=
div class=3D"gmail_quote">Alex<br></div></div>

--000000000000c60a8105d54c6340--

