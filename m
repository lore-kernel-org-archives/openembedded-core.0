Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8AA3C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 00:29:23 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.4953.1645144162027835740
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 16:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Uxv2YRHH;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id n24so1886764ljj.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 16:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RcGAXwBGk6cj6PnNa1yEbdUzOdE2IZ4EG1igB7+8yRg=;
        b=Uxv2YRHH2gulug9FMF4M5NdgcLH23cLTN2df9w+2luVVugyyZ4lHm30CPiEWLyzjxF
         uN8zrdOfo++msQFEi5dwH5zC2n5cK+URwf233qpqG37TfNuouyVm1gz9m0fMxz5UMwJk
         FtkUicLcBwT4V3IZsuVm/VcjYKOUS79AH5DGIaa8XWZjePOU1eLiqhzIKm1TZfH6Gj2c
         7DW+8631wDUVykfnItXStNKIW3qw6oeJEJv+ZOmkIVHRWXu7JnpxvWW/yWvZ97+ZEuQF
         juJEMJ30rZYtYVVcLG98f7NzVzl++RdCGovtSv78Byz4FlGZnrXc5lBJB4ePSEaVW6jF
         vEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RcGAXwBGk6cj6PnNa1yEbdUzOdE2IZ4EG1igB7+8yRg=;
        b=sbmdwS3UAG38gCGiA3uvTP5+EBldZJfM8EVqi379USz6I+PSu27JE3D2H80/jyKuvN
         YyVUZYlJTETQA++0mHs0zoTovOOlE/0xUj9x5y3btXBri2uO+03Z8v1uS2FS9HwJqDR7
         CX3hpMMD/ZjSZde3mMKkoJCqmc5uleTqNrnu5GVV55CLQiKXDBpwdn4K6sjhqvg4WQIX
         7ZMxAaIk5YUUeYru2eg/Uqim/8sFeIvL6znrTWqE8XcubVtq0AlHLJwESGbOVT2WOQD1
         fuYG7k3O/Ku4187YuHJkOUux3GEfdMAZgNto4lL6hHDE/t+jzXSEcIK3LvjGrE12WL6T
         UeDg==
X-Gm-Message-State: AOAM5320llVYGraxAd2KIZuB9eyq26lxSZ9Ka66WhAuQ2Nsd3zOrlMCj
	MUJBbDgG9FXcL5ZS4IhKRIH7ksdPp3U21oHEJpA=
X-Google-Smtp-Source: 
 ABdhPJzDlweB0tdga3aKJ8OzbgQLWIx3yt7GDaC3BLONX/lcyKaVIGQTloM7kMI4Adu+uxi80obK7DwxxK3PqHBOfS0=
X-Received: by 2002:a2e:9b8c:0:b0:246:1378:89cb with SMTP id
 z12-20020a2e9b8c000000b00246137889cbmr4054876lji.28.1645144160172; Thu, 17
 Feb 2022 16:29:20 -0800 (PST)
MIME-Version: 1.0
References: <20220216232803.1868265-1-quaresma.jose@gmail.com>
 <705135fb77074d9c9ac87d0d060592e1@axis.com>
 <CANPvuRkQiwKXTB-6SXD4sf1vtBWH7DQEG-Q_M+tXo1N6S1QNYw@mail.gmail.com>
 <c017f7a95fa977fd113892c8d4f2b0882b410df8.camel@linuxfoundation.org>
In-Reply-To: 
 <c017f7a95fa977fd113892c8d4f2b0882b410df8.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 18 Feb 2022 00:29:08 +0000
Message-ID: 
 <CANPvuR=qn+Ee9rJw_fmL83bVO+GAK1_3m8MHK=FkX0TvouzCwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0: update licences of all modules
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000457f3b05d83ff961"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 00:29:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161877

--000000000000457f3b05d83ff961
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quinta,
17/02/2022 =C3=A0(s) 23:50:

> On Thu, 2022-02-17 at 23:08 +0000, Jose Quaresma wrote:
> > It's not as simple as I was thinking, I'll need more time.
>
> Perhaps split the patch so the main change to LICENSE can be resolved,
> then the
> remaining later patches focus on the harder bit?
>

I sent a v2 with that.

Jose


> Cheers,
>
> Richard
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000457f3b05d83ff961
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia quinta, 17/02/2022 =C3=A0(s) 23:50:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Thu, 2022-02-17 at 23:08 +0000, =
Jose Quaresma wrote:<br>
&gt; It&#39;s not as simple as I was thinking, I&#39;ll need more time.<br>
<br>
Perhaps split the patch so the main change to LICENSE can be resolved, then=
 the<br>
remaining later patches focus on the harder bit?<br></blockquote><div><br><=
/div><div>I sent a v2 with that.</div><div><br></div><div>Jose</div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000457f3b05d83ff961--

