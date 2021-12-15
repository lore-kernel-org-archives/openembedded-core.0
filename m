Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C8CC433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 08:14:59 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web09.37856.1639556098345323417
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 00:14:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VazVIw9n;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id p2so39479953uad.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 00:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tId7q6Tn1/Dy86aifBbQyLYq6yIcCOAeu9Y/eocw2tU=;
        b=VazVIw9ngyDn12QviH6QbJrpj0YxcF/ZVY2LnV6W+02NZq80RMzp3jswLRLXbnqAiS
         GFw3LbhUuGy4GUvaceXm3scqvA8DSadMHyRg90FGunSxOToittohUQWuOEay/qH2pcfn
         Rm595Q5kkgF06E7bRrf/fWu8ym13ckFsy+jBQYPr4t0obTTI7auAMN6ZFXWaGfWRLsP8
         h4zz29UGx5/AxbfWRGSUyopknweecgbWQS15oVyjCecT7lX5HP7bM5zAMXfLSDOS8F7n
         gQSK+AbzGBF4f+OsOMTSbW63s5qgj5NeMIZsiyPbwEJl+6xGR2SpvMhlveSCPZa2SD8o
         mZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tId7q6Tn1/Dy86aifBbQyLYq6yIcCOAeu9Y/eocw2tU=;
        b=jND2J1ksLe0MrWr0R3motn3ewuTS65dUnioQemk/G2GieqUjV1NOt/J1j4kB8FnbzX
         cZq2Ix5nc4Pk+SFSwGV9FoK6ZsNAx78yLi5tiuSrpM9lkQR1S0wHMnc0LAEXLyiWBTDo
         qgNmfNWNJuCy01vmEBw41+1zuROoK2eCOm646cfb6nNk2dXyzUIoBRk/PTY6+wbHq/UR
         S3187hZNNtEChXIUoBBW/9vDvN5fWX8IXHwgCUhHeAm8MCzX1wn4xmVUi216CJnRX2mb
         DafRq+0/eL2pvy0fsJhwpjx1X7Jlvf3YTzYmuGLFzlA8eygOMRkA9at+vorLgFSNA07N
         yNHw==
X-Gm-Message-State: AOAM530/qOgN91Pw/rJY4YBDzQcYZIujq/SSGrdbeXGYL5mEhsOjm8tn
	ssriWp7Ozo5V04MxWCnzdxeUNgC/UtWXsT5Dk2I=
X-Google-Smtp-Source: 
 ABdhPJx4cEOWF0ZZw2JL8y8ixrTPweqJu8F9sX3UqFXJFSmtY62ETlsQ4yrrW5NXq6MI2v1z5vc3m15XZvO8LCBjtLk=
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr8867872uai.89.1639556097443;
 Wed, 15 Dec 2021 00:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20211215071632.11038-1-yongxin.liu@windriver.com>
 <AM9PR09MB464238FBE970773FAD77D126A8769@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <PH0PR11MB5175F1EADC2CD9EE3A711A41E5769@PH0PR11MB5175.namprd11.prod.outlook.com>
In-Reply-To: 
 <PH0PR11MB5175F1EADC2CD9EE3A711A41E5769@PH0PR11MB5175.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Dec 2021 09:14:46 +0100
Message-ID: 
 <CANNYZj8pXg=36BCknUvA4xemPYawzkHwbuUBWi_giqhHY-Cf9A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] meta/recipes-bsp: Add recipe for Slim Bootloader
To: Yongxin Liu <yongxin.liu@windriver.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000c708e005d32ae602"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Dec 2021 08:14:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159716

--000000000000c708e005d32ae602
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Dec 2021 at 08:53, Yongxin Liu <yongxin.liu@windriver.com> wrote:

> > Why is this oe-specific, I'm missing a proper explanation in the commit
> > message
>
> This patch is used for using bitbake only to use proper include and library
> directories in recipe-sysroot-native. It is not needed if building on host
> directly.
>

This in itself does not make the patch unsuitable for merging upstream.
Components should not be overriding settings passed externally, and the
patch is fixing that. At the very least this should be discussed with
upstream, so that we have a link to the reason why they wouldn't want it.
Same for the other patch.

Also, as this item is x86-specific, shouldn't it go to meta-intel to begin
with?

Alex

--000000000000c708e005d32ae602
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 15 Dec 2021 at 08:53, Yongxin Liu &lt;<a href=3D"mailto:yong=
xin.liu@windriver.com">yongxin.liu@windriver.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">&gt; Why is this oe-specifi=
c, I&#39;m missing a proper explanation in the commit<br>
&gt; message<br>
<br>
This patch is used for using bitbake only to use proper include and library=
<br>
directories in recipe-sysroot-native. It is not needed if building on host =
directly.<br></blockquote><div><br></div><div>This in itself does not make =
the patch unsuitable for merging upstream. Components should not be overrid=
ing settings passed externally, and the patch is fixing that. At the very l=
east this should be discussed with upstream, so that we have a link to the =
reason why they wouldn&#39;t want it. Same for the other patch.</div><div><=
br></div><div>Also, as this item is x86-specific, shouldn&#39;t it go to me=
ta-intel to begin with?<br></div><div><br></div><div>Alex<br></div></div></=
div>

--000000000000c708e005d32ae602--

