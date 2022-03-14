Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43868C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 23:53:00 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web08.4147.1647301979509936549
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B9IpVtr6;
 spf=pass (domain: gmail.com, ip: 209.85.208.172,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id u7so24201855ljk.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zS4F0AxoPPzxyhkzgucIA18YtA5F26gp3GvsPSYRlZk=;
        b=B9IpVtr6WsLncfOoT2whWI9xj+N0kQbzBvORyHy/ZbPEXH8jAyMS72LiupibEZEliK
         EWoIdu7MQ6hAohBuBQrDgy4qVsWEKjgkGhmNN2/Zj3ydhByTkCKvIgY13hqb2whu+U8z
         DxSDiXcVOVhN4AQdYSsjmefKoti82SVgfeSACheIzLPjLCoH9JIvibIqSoWo9ZoosFue
         XdSgqDF0kVbbF31/zP1hgX218X9MTDaJ5ZFa+i55LiTxorRod6Ao2iSIsnIz5l6Bz2Re
         D2eh5MYCAVbPfYG+ILKO4GLdzIDOMAWh3VF72eUa3kwNxQk1owAl3kxfQ5xU0LQ+qucg
         Nf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zS4F0AxoPPzxyhkzgucIA18YtA5F26gp3GvsPSYRlZk=;
        b=ybQg2tWXei27euC21pWVimGDBmpBle8lTgrqDnTqoUVr6FtBrjbpPS5nUlCRlO+AQr
         /66EB47FXIgAbcAHRd2kFc4U2XSMYcTPcTBlM9N3GZG5BXq/M1nCPZOcry/emkSs20m7
         S8aWysIK3bhU296+rBzbWvvest5+Lz/3Gww95SSfiFRb+5J4MyXUmmKDEjEr0XPFVtpo
         OBmBNyWEl6PJc31scF+ctly98aAqoB6zAfVa2aQGHLdqea32YgQ6Whbfd8X8atJfJRbs
         Vz9OpPgLsRDergFFmMYu+85y6ZZELr10KGmoJMZghAen0fLqtIsYjRSiSFN2QPkpsDrh
         GuzQ==
X-Gm-Message-State: AOAM532SUy1eHr0B5aC9n8toLLmnjK3nmZBP9aWGJAJSUXsqB4qcmCEP
	nYUo60XbpQfljuuy22ffJ8YfdCUtxyIQcDqwSo4=
X-Google-Smtp-Source: 
 ABdhPJyhDfZJZbBQh6viuxCONWaAApACcwYqS5OAo29vTfmubKFfwtsKO48h2a/n7hBqTnHFUe79y659ySwI/kx0/vI=
X-Received: by 2002:a2e:2f0e:0:b0:246:1a59:8f04 with SMTP id
 v14-20020a2e2f0e000000b002461a598f04mr16137017ljv.409.1647301977735; Mon, 14
 Mar 2022 16:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220312154011.499012-1-quaresma.jose@gmail.com>
 <c2bf5b0dc76b78ce72d54b8d0a7bee40c0512f4f.camel@linuxfoundation.org>
 <CANPvuRkcqN9XiQRmO=tYh4B_XFgecwU4SQvotOTaAvA+9DzLVg@mail.gmail.com>
 <76692ee072570c7187bacc8751343475baba74b6.camel@linuxfoundation.org>
In-Reply-To: 
 <76692ee072570c7187bacc8751343475baba74b6.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 14 Mar 2022 23:52:46 +0000
Message-ID: 
 <CANPvuRkrKtncQTj=neY0qAFhKuoa6h_kGhJb1kc7b42vDe0s6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meson.bbclass: add exe_wrapper helper
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003883ec05da366168"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 23:53:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163217

--0000000000003883ec05da366168
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
segunda, 14/03/2022 =C3=A0(s) 23:24:

> On Mon, 2022-03-14 at 23:14 +0000, Jose Quaresma wrote:
> >
> >
> > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> s=C3=A1bado,
> > 12/03/2022 =C3=A0(s) 17:11:
> > > On Sat, 2022-03-12 at 15:40 +0000, Jose Quaresma wrote:
> > > >
> > > > +do_write_config:class-target[vardeps] +=3D "MESON_QEMU_WRAPPER_HEL=
PER"
> > >
> > > You can't use overrides with flags like that, I'm surprised that even
> > > parses!
> > >
> >
> >
> > I will drop this line because my intention is to rerun the
> do_write_config
> > when
> > the content of the file changes, which is not possible at all.
> >
> > I will take the opportunity to ask if the following would work?
> > do_write_config[vardeps]:class-target +=3D "MESON_QEMU_WRAPPER_HELPER"
>
> No, that won't work either.
>

Thanks


>
> Cheers,
>
> Richard
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000003883ec05da366168
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia segunda, 14/03/2022 =C3=A0(s) 23:24:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Mon, 2022-03-14 at 23:14 +0000,=
 Jose Quaresma wrote:<br>
&gt; <br>
&gt; <br>
&gt; Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escreveu no=
 dia s=C3=A1bado,<br>
&gt; 12/03/2022 =C3=A0(s) 17:11:<br>
&gt; &gt; On Sat, 2022-03-12 at 15:40 +0000, Jose Quaresma wrote:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; +do_write_config:class-target[vardeps] +=3D &quot;MESON_QEMU=
_WRAPPER_HELPER&quot;<br>
&gt; &gt; <br>
&gt; &gt; You can&#39;t use overrides with flags like that, I&#39;m surpris=
ed that even<br>
&gt; &gt; parses!<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; I will drop this line because my intention is to rerun the do_write_co=
nfig<br>
&gt; when<br>
&gt; the content of the file changes, which is not possible at all.<br>
&gt; <br>
&gt; I will take the opportunity to ask if the following would work?<br>
&gt; do_write_config[vardeps]:class-target=C2=A0+=3D &quot;MESON_QEMU_WRAPP=
ER_HELPER&quot;<br>
<br>
No, that won&#39;t work either.<br></blockquote><div><br></div><div>Thanks<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000003883ec05da366168--

