Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EFCC433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 10:45:29 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web08.11932.1634035528034819292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 03:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fGRm3h/n;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id 64so17729750uab.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 03:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m6mcIgeRAFVisaQ8fUeP1ivhYUhexfN41J5p4cgmTpQ=;
        b=fGRm3h/ngc5BiUbKSi9Zr/zHz4ghMWWmytx7bgJ9jepy/rMg9AfBttVsZTMWqp8ouD
         GGTv/t87AV6jTchM6GjoZkWXp6NPGHt2tkqEzSYEskz+9IisZZLGfDBkj5FGgSsQwnmf
         AdE+YPc3Gbput08P77AIjAvy8ga7x67ONEvKroIui/7NdRu0oblvXICXTFuyvAI9iVHU
         Z4K3TKsvCzGQ0xzxeTwY6Q94hgkWR856ljks/eA0ohBF4nRjoHN+q/2qRYPFAQq3J+tI
         2H8iM592D15lQ0c4BM31rPt0jsKYW+X58PgIzL14mEDGnQa57maMhtem71AWhTQbNbf2
         iqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m6mcIgeRAFVisaQ8fUeP1ivhYUhexfN41J5p4cgmTpQ=;
        b=vpyAJgd5qMklaD3jTJmAFLyAgwl506aZZQjyCpg9a7988f4Uvx0VBMgxt+9wyIB7mq
         308nKCgVSGq0eUF0cDUphytR2dTbC1eqU/S3iYr0gl2bk064f2YMUWM2CpeuLJbtPduh
         wl7yoROtu2kAjEz/6LuyAPXq6iN8qtoHOs3DBzqzNT5/3nIGap5ZJ3tfN4iHtJ3lHvB7
         +78ugD6cwByjGC1AQCvHu3mNh6Y26byEer1q3YaUU1Kuxi4MzDwWJ1kM3RtBe5WEeWsC
         0Eep5DgUU8Pu0scLUcaC8gpihNNnfN2CyY6FRnejFXtjjJIkw0vB/g7Yb162+2lVIp7f
         V4eQ==
X-Gm-Message-State: AOAM5323azvm80n67qSFef/FwPqsp0VR8jV3aGLcKijfkDRYC06MXguu
	i3riBVxt00TlMli0pQKKt8v9zINTNmqLiHKXB48=
X-Google-Smtp-Source: 
 ABdhPJw9NGH79lc7LeAEvrUPuNI34/NRqZTgDyeiNI1yMy97A7qNP24VZZvKyB0Vvgof062Bc4a/S6Y2tyBtD+3+XDM=
X-Received: by 2002:ab0:7c4a:: with SMTP id
 d10mr16362355uaw.100.1634035527100;
 Tue, 12 Oct 2021 03:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211011094059.4184654-1-alex@linutronix.de>
 <20211011094059.4184654-21-alex@linutronix.de>
 <CAAnfSTvdESuiPyKYzVohcF=gAfJjo_GnaZn-c7XJkHCNEbT1_w@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTvdESuiPyKYzVohcF=gAfJjo_GnaZn-c7XJkHCNEbT1_w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Oct 2021 12:45:15 +0200
Message-ID: 
 <CANNYZj9kFHc7XAMPti93rCiy-rLk-aeYTihWNNzvuXUPnCSmVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 21/25] libsoup: add a 3.x recipe
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="00000000000024afea05ce258b81"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 10:45:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156868

--00000000000024afea05ce258b81
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Oct 2021 at 12:08, Ross Burton <ross@burtonini.com> wrote:

>
> As they appear to be continuing the parallel installable theme, should
> we just name the recipe libsoup-3.0 as we did with the 2.4 series?
> Otherwise when a hypothetical 4.0 comes out, what is that called?
>

libsoup, and if existing one needs to be kept, then it is renamed to
libsoup-3.0, with consumer adjustment where needed. I do not like those
never-ending version suffixes at all, and want to have them only for legacy
stuff.

gtk 4 recipe will be named simply gtk :)

Alex

--00000000000024afea05ce258b81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 12 Oct 2021 at 12:08, Ross Burton &lt;<a href=3D"mailto:ross=
@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><br>
As they appear to be continuing the parallel installable theme, should<br>
we just name the recipe libsoup-3.0 as we did with the 2.4 series?<br>
Otherwise when a hypothetical 4.0 comes out, what is that called?<br></bloc=
kquote><div><br></div><div>libsoup, and if existing one needs to be kept, t=
hen it is renamed to libsoup-3.0, with consumer adjustment where needed. I =
do not like those never-ending version suffixes at all, and want to have th=
em only for legacy stuff.</div><div><br></div><div>gtk 4 recipe will be nam=
ed simply gtk :)<br></div></div><div class=3D"gmail_quote"><br></div><div c=
lass=3D"gmail_quote">Alex<br></div></div>

--00000000000024afea05ce258b81--

