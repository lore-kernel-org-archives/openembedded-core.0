Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF00C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 07:53:57 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.22902.1659945233103614442
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 00:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f62+H4dh;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 186-20020a1c02c3000000b003a34ac64bdfso4730616wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 00:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=KsqBAv9j9STAhqPu7VuwNMCj9Lk+9IqxRQr48AaAWw8=;
        b=f62+H4dhzvy0oGWrMlMq7Im9RV3JSSmCfNr+VPmym8KTndeCPPpvVarfX9rlUU074X
         c9fj00kqXnG3zjXzGnRINdyellDjvTHPyiQsGjb6B9az0W+qtPx9MXYwe3ymkXA1tItF
         w0buonEwvY1D61m7U9XX6lM+Sym8vTbDMHAiY60Oy4FYf6e/Sl4O8VcGl7GuXGiCjZWs
         ZjzejK3lkq02WmGlvAR3e1PEGW3gXb1+Z9moEEFQZau7rcAAMxnb5McF2uz1CBX3wuU+
         Y0wUY3gi6Z5hfos4E8bML1AjyJbIrzftONkHGnaZf21cv2l9U0xJAtgkx05vPdXJrEUN
         SuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=KsqBAv9j9STAhqPu7VuwNMCj9Lk+9IqxRQr48AaAWw8=;
        b=qjs1ItW+FI6TU+Vf5En3aYZBhWM7WXvSKcZp4zJasAqhZp8ZmLzwTa5K0GvUBQcQzw
         jpy4Mwdp6VGTjaWfN1+0KIj5UfUrcJUZ8xUb6QR7fvJpxnMYLfceCUC67eVQr8vdoYHc
         6fV/D8+1I8X9TyOA3sISmSFaxgN7Fso+nszZ0u+rBM+X+eMqQZsvTjx/MEc/TacuHM4k
         vMB2NNCN5tulLPSJXALedhMe6Cth40CBtGoVQk3Xc0xKHlffHFQtDGYkzUsi0kJfg7Rv
         9cV8TVJXVyNAEpa/jyx7Gv7VJ2Dc7z85FP3CXBrkk9+56z/jV34xT4nZaMu7eW092hFv
         2+nQ==
X-Gm-Message-State: ACgBeo0dnzqUsuIYVqUISEb+hILu0wVBQHmSDK53+9CXdTPM0VOPire7
	ocAcMstY7C2PxCgFeN+WolYljqyRaloWvc/Vez4=
X-Google-Smtp-Source: 
 AA6agR7wxNDRR3AzuU/RpNTXeP7qp4JCmE3NFFsSJLLX1/sXatyRscGAdUKMIfoSgxd1L/mIspr7FZKSqiyNW3WBPgk=
X-Received: by 2002:a7b:cb44:0:b0:3a4:e8c7:59a2 with SMTP id
 v4-20020a7bcb44000000b003a4e8c759a2mr11835042wmj.67.1659945231630; Mon, 08
 Aug 2022 00:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220806120939.3750329-1-Martin.Jansa@gmail.com>
 <a114991e21f7e88229cc67fe7d76f3dcb765184b.camel@linuxfoundation.org>
In-Reply-To: 
 <a114991e21f7e88229cc67fe7d76f3dcb765184b.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 8 Aug 2022 09:53:40 +0200
Message-ID: 
 <CA+chaQcSS46nBBnJ6ePSSLE3qgT5jMy1whMMJALddHaHZTfHyw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] syslinux: Fix build with glibc-2.36
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e0cacf05e5b61d90"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 07:53:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169073

--000000000000e0cacf05e5b61d90
Content-Type: text/plain; charset="UTF-8"

I wasn't testing this with musl, so it is probably this one.

Khem, can you have a look if you have musl build ready?

On Mon, Aug 8, 2022 at 9:40 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2022-08-06 at 14:09 +0200, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  ...binstaller-Fix-build-with-glibc-2.36.patch | 53 +++++++++++++++++++
> >  .../syslinux/syslinux_6.04-pre2.bb            |  1 +
> >  2 files changed, 54 insertions(+)
> >  create mode 100644
> meta/recipes-devtools/syslinux/syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch
>
> I think something in this series is breaking on musl:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5647
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5662
>
> Cheers,
>
> Richard
>

--000000000000e0cacf05e5b61d90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I wasn&#39;t testing this with musl, so it is probably thi=
s one.<div><br></div><div>Khem, can you have a look if you have musl build =
ready?</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Mon, Aug 8, 2022 at 9:40 AM Richard Purdie &lt;<a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Sat, 2022-08-06 at 14:09 +0200, Martin Jansa wrote:<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...binstaller-Fix-build-with-glibc-2.36.patch | 53 +++++++++++++=
++++++<br>
&gt;=C2=A0 .../syslinux/<a href=3D"http://syslinux_6.04-pre2.bb" rel=3D"nor=
eferrer" target=3D"_blank">syslinux_6.04-pre2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 54 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0012-=
libinstaller-Fix-build-with-glibc-2.36.patch<br>
<br>
I think something in this series is breaking on musl:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/64/build=
s/5647" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/64/builds/5647</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/45/build=
s/5662" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/45/builds/5662</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--000000000000e0cacf05e5b61d90--

