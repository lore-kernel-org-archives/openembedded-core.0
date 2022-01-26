Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2330C2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 12:34:11 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web11.12116.1643200450313839892
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 04:34:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nDhws3At;
 spf=pass (domain: gmail.com, ip: 209.85.221.169,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id w206so14337641vkd.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 04:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fFCyUW4ekqUBXEau+cNWRdkNOZrO3rAKUHB5IJa9+gs=;
        b=nDhws3AtnKKfq2rJbaz4M4FJnTsAOq+OIMxyCraXLJ3t+3XVLeHSibOrZeYnLJ7r3g
         2lDiBCp4zEGl4FlwNTq4eGiXyLnsZ3yAncx1pAIVytx12XwEdG5gLaBp02ql8SVh9/PO
         oKOK0TkuzGBcnXeZZjQB6PEYHOEi8sqLrQg5RLS3CTGBvcqVszPGDKCNdZAiw7/lKGPl
         EtToi6BbjF+QyTRendmxjAcc4fPycQc9sn4myPQTxx2VZA98RVZqgu6UZkHdEXDZItzh
         88eEL3WVlsmXwk0hSecBKZzh0Cm8fPS9x7F+SBTIL0IcrLgjrcmFPW405/auojsGyTqb
         LV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fFCyUW4ekqUBXEau+cNWRdkNOZrO3rAKUHB5IJa9+gs=;
        b=SeRHeRShS3ehP9HYBi8OcEDklaGFJ3G2hoEjwQS1URbzooeV5BZ+6tJ5XRbtVQbAvL
         VQ+YPMax8nR12dOaxtPSM1we/7flQtc8vcNgOzdkJqd/37sQRbOqgpAHicCRpFT8oBeO
         oMmBbxz+lmZ+4u7fYgqLVd0M33Jb1lI4nq5x63cKLnMt2h3wId/F5kpybF7MwqYZUGgc
         sbyuJThaNJrHv6qaE92/cj5Tc1MjRuB6CpLbf07E9InIlFiApUan4dMlEylkV66KVoSQ
         hIwRXbO1R6g/PyjoCqW3ERR3rQRl9vNKgJtLFnZIlqNXX1HUazzlu7PrGFjv/mZMUAKF
         f7nw==
X-Gm-Message-State: AOAM533RREExA7q8bddoioqXONn8AiKAG5nthbUADt9R0JFcsjxjFcP2
	gUKqXqi6b20FUXGNOAWdbgxOFdtycRlek7uqTB4=
X-Google-Smtp-Source: 
 ABdhPJx7/NmNgH4Ba7zHBiLg8G89P2iYgk0P1tUpNanX6EB69kHxICw2ew8pfJK7ZzTpwcBP57JYNB6ft0CHCFokLYk=
X-Received: by 2002:ab0:8b:: with SMTP id 11mr9018119uaj.22.1643200449444;
 Wed, 26 Jan 2022 04:34:09 -0800 (PST)
MIME-Version: 1.0
References: <20220126102814.4173943-1-ch@denx.de>
 <CANPvuR=bCzgv+R3kHQgDOh4CSst7CP0y+uy+9L_my4oVQrdm1A@mail.gmail.com>
 <CANNYZj93yXZHz8Yyobey6srn27h1sLSV+zbXkdsHiZqreE5E+w@mail.gmail.com>
 <d9982093-1923-e9ec-1b7c-5edecdafe1d3@denx.de>
In-Reply-To: <d9982093-1923-e9ec-1b7c-5edecdafe1d3@denx.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Jan 2022 13:33:58 +0100
Message-ID: 
 <CANNYZj8VyC5fsdm09bBNaGLXJKyGMksAMOMfJoKJ_CcC_R6HDA@mail.gmail.com>
Subject: Re: [OE-core][RFC PATCH 00/12] Update to gstreamer 1.20 for kirkstone
To: Claudius Heine <ch@denx.de>
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
 Marek Vasut <marex@denx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000157e3d05d67b6b32"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 12:34:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160986

--000000000000157e3d05d67b6b32
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Jan 2022 at 13:07, Claudius Heine <ch@denx.de> wrote:

> On 2022-01-26 12:36, Alexander Kanavin wrote:
> > Thanks, I guess RP or I should spin this on the autobuilder so you can
> > see where the issues are?
>
> Sure that sounds good.


There you go:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3161

Your choice is to watch the ongoing builds with trepidation, or come back
in 3 hours-ish (most of the builds should be complete by then) and see how
many fails you got :)

Test configurations are defined here:
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json

Alex

--000000000000157e3d05d67b6b32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 26 Jan 2022 at 13:07, Claudius Heine &lt;<a href=3D"mailto:c=
h@denx.de">ch@denx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On 2022-01-26 12:36, Alexander Kanavin wrote:<br>
&gt; Thanks, I guess RP or I should spin this on the autobuilder so you can=
 <br>
&gt; see where the issues are?<br>
<br>
Sure that sounds good.</blockquote></div><div><br></div><div>There you go:<=
/div><div><a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/83/builds/3161">https://autobuilder.yoctoproject.org/typhoon/#/builders/8=
3/builds/3161</a></div><div><br></div><div>Your choice is to watch the ongo=
ing builds with trepidation, or come back in 3 hours-ish (most of the build=
s should be complete by then) and see how many fails you got :)</div><div><=
br></div><div>Test configurations are defined here:</div><div><a href=3D"ht=
tps://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json">https=
://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json</a></div>=
<div><br></div><div>Alex<br></div></div>

--000000000000157e3d05d67b6b32--

