Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19CCC369A2
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 16:51:24 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.35903.1744295951544286433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 07:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BE+sqLzp;
 spf=pass (domain: linaro.org, ip: 209.85.219.181, mailfrom: ilias.apalodimas@linaro.org)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e6dd991a0e6so715067276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 07:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744295951; x=1744900751; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WtWYbAriaclMcsZB76wB7OM2/l8tczOR7IK9+UkdNeg=;
        b=BE+sqLzp3LMwDJHKcE8KAwWC8+jAbGyPk1ZrFEYj0kwF9TCIXX7rcdQdr9ZdNImPdD
         NHxotBmf4kJHBRtfe/iJyZKckjfGDh/bVrsLXY8dXOREI27AUmvBkyBA9EOjYt97KMZ6
         Qsz/aJpJpTjTQl0Yw41Rns3WOj792ccIiAXiGN/isqYtbAAvNj5bIlE2xZMboekveXFa
         5zct6Y45jcchuU3+1HgON6zIHI7qUuxZavQntg4/Q8B9PigbMbl7g2tO1fW77nY/xUGu
         ECrBBquHAXJCzBWXZjIF0lBXOEtjSKM20Nsw7MdMuOZeHahI5PInmMa7dR7qrD3Q1QUX
         mkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744295951; x=1744900751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtWYbAriaclMcsZB76wB7OM2/l8tczOR7IK9+UkdNeg=;
        b=UP8tZSPnpyre9Ov0W6Nbd06rS8FTeYOooHZh5N4fPSjfy8ov8WXP7rUQ3DOn7vegm5
         FH2nf9pxLQDrY10VLyJKOCvpSAy2kNkx0EcSOY41SsRh1ee1VyJfNdXVGzYnxOxyioKF
         dfEArZHKpUxCjkON/6tj61+fFl+6PbNjYKMDzuZ9rV3nZ1UxolPnmOkdvkGLYWY4xjPW
         OfyIjjZxRIuf8T48KjlKkxBhUvQs9evS5H+DEhdCk3coO+BdtsL0kVWTRh+fyPMJhChT
         DLdoGmRsJsZRzxKG+GOOaYTx18S4twJFQtd5/ZlVGpEbkit28nq8A18dgEbxvT1vkHsT
         dtCg==
X-Forwarded-Encrypted: i=1; AJvYcCUoLX3xcEtzfx6OG+a0S8yrK7/6L2uuksvVWZGrQwmU8NC4GUhHhB638jrKO3a6PPQktb9wVPwKgpaRhiUlhBXYIQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwPCryVLKyk/6TQLlNWQljNMKQ+gsrwt5xGgUFnSbLKFTYK6HKK
	3flfjfj2R8ET/Yf5Gq5Lek4KJ77U9+nRWTMjDyvKR/95muAxlasaWCKatNFJU7ptMx/G6mxGPkT
	nmrZNZaecGEZvMkiwIltOsO/yYMz1FfiMgxqMow==
X-Gm-Gg: ASbGnctVa3ZsfPW9FDDh6unhseGgl9h+b6s06/97ByLWBsjnGykujD2BFMYuq98cPux
	2EkjnEXq0wRk33tyHEV1Fww0jofpjAabpmt+JvmJymG/5MAl8qgyJupD1EvLndfCF7XnYZ3RIb0
	yBfGD/4zaojeUMwWHH8RgcfXk=
X-Google-Smtp-Source: AGHT+IF9LdTvRAonqzLlOMbBIwQCdnUBwGm0eS7LFNfvHjJvQh7ppMoRX55HCOGPnTBRr43z4AnK+lgCXc/mzzA70GM=
X-Received: by 2002:a05:6902:478c:b0:e65:361d:918b with SMTP id
 3f1490d57ef6-e703e200133mr4946059276.45.1744295950784; Thu, 10 Apr 2025
 07:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org> <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
 <CAC_iWjKTmSEOe6HUcPFUZLaBuA2+6ZwOYaYiqK0_R8KGNPU1Ug@mail.gmail.com>
 <CANNYZj_eA4k+pRLG=8-V4WEmsthkh_o75fZKOcoTf+00QW2x2A@mail.gmail.com>
 <CAC_iWj+80LnSOJ=ZeMos4psFwQ4zqt8fo-e13+8sPuBtsmp5Dw@mail.gmail.com> <CANNYZj8rsSWX7GL_mqQz3h==31wKsA_myVAHbGXdUDv+O7YsXA@mail.gmail.com>
In-Reply-To: <CANNYZj8rsSWX7GL_mqQz3h==31wKsA_myVAHbGXdUDv+O7YsXA@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Thu, 10 Apr 2025 17:38:34 +0300
X-Gm-Features: ATxdqUEMAN7ZKVWkFeTw-VTcbrVQLW3WplJMla9iscVOcyl8mUQUhGLRRZHofXM
Message-ID: <CAC_iWj+vw=wUJYb4MDWJ3KoPrECwzr4wNbrJNpDvC=o=QWFJqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Adrian Freihofer <mikko.rapeli@linaro.org>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 16:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214686

On Thu, 10 Apr 2025 at 17:20, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Thu, 10 Apr 2025 at 14:55, Ilias Apalodimas
> <ilias.apalodimas@linaro.org> wrote:
> > I think you are misinterpreting that. That paragraph says "The file
> > system supported by the Extensible Firmware Interface is based on FAT"
> >  -- IOW your *firmware* must support FAT.
> > It never dictates that the ESP has to be FAT as well. You are free to
> > format your ESP to whatever FS your board supports. For example, x86
> > macs use HFS IIRC.
>
> But are there any actual UEFI boards that support anything other than
> FAT? Or is everyone taking the path of least resistance and cheapest
> R&D costs, implementing only what the spec requires?

I am going to assume that by 'boards' we mostly target embedded ones right?
The majority of those work with U-Boot which has a pretty capable EFI
implementation nowadays and supports a variety of filesystems.

P.S: I am pretty sure that EDK2 and servers support more filesystems
than just FAT, but I can double check.

Regards
/Ilias

>
> Alex

