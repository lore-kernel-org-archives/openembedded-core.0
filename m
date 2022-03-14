Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B09C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 08:28:06 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web09.24237.1647246485494854963
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 01:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CsdNHkWk;
 spf=pass (domain: gmail.com, ip: 209.85.217.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id b190so16192188vsc.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 01:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t5cwr8qr7dO7dHqQNaIW2w/FvPzwJf6q7fmREeHjMGI=;
        b=CsdNHkWkW6CYjPJO3thWAKwLghSjA/sXIEbnuBMcDKkRknxWnyCNiZ3jLFbSqyHIfx
         zjoIZ4AFOudQiUG39yCjILK4xiySV98sVaMg94aNSblm0AEXsF9KjUKJ2wTzA8wBLVQW
         k03my0tEcW0XxPoWI2VqcIVb+aSAD3+SP5kDEtNXPiSDPOCsXRgoRyxj949RjQsZszjs
         alps4FSxU+FxvjuOrqctuXRrYDZq6tyRf4P1a55NDAZmKWfuvWjfXmawxRJzxirUVxil
         1V/M6gT9cRq8gBSPZi1DCjDAi15XX9ZTDrtK6bxRVItbLseim+2KbY0O01i0td/nczTc
         YAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t5cwr8qr7dO7dHqQNaIW2w/FvPzwJf6q7fmREeHjMGI=;
        b=LHWjKvZT45+2ylfAgEYaieghnp5WYmm+Cdycfso4ApxUDM4GaRs4Vv0RQpRGPGyEFF
         G1tpRUbetMyjrLbo7yavFD3YXAS0CARV+T0qbs5CdKJfPn3xyF0EblxAEtUYnpy+9chd
         iXdB6lwgPFNfZJ/eIIhC7U7cPHMGzvvBmU+sUIkCBr4KimobR9V34H4F8WewgMWG+etb
         VCetW8pFi59CAEa3L5KV0iaS3GRStihu/sEq58GjqI5ImzLAkMjpjgu1VljcyvUIYAcp
         qOewQR+Imv0MlXeivLA4+gg08vM7Wy1XnJxEmoc+6+mXMtaHv0chO6LINqd9JOOtz+m4
         HZJg==
X-Gm-Message-State: AOAM533u1lnT5cniwzR/pOkfDeCkQrJY9Dl3MY6MEBRgc9XcH8WLJQDl
	E3L49lXgi/HmldDrfN/FJKPcM3/MV04CJJvoyCc=
X-Google-Smtp-Source: 
 ABdhPJz3WOb3jKEAVN8BiRDOdo7fLFIVbIlk3NzivULClzPPh53NnmitcVPjku0iT6ZLtYGC0z8uVefu6CFdS7riaQ4=
X-Received: by 2002:a05:6102:4405:b0:320:a07a:1c4c with SMTP id
 df5-20020a056102440500b00320a07a1c4cmr8379697vsb.42.1647246484654; Mon, 14
 Mar 2022 01:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220314071037.3702941-1-f_l_k@t-online.de>
 <CANNYZj98CMmxXUKXhGboOfK_9WTu499GL=EomTpw9Y3SWS3oaA@mail.gmail.com>
 <74c5d185-8abe-6afe-724c-8cc7b6529997@t-online.de>
In-Reply-To: <74c5d185-8abe-6afe-724c-8cc7b6529997@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Mar 2022 09:27:53 +0100
Message-ID: 
 <CANNYZj9wcs9-XFD_zXob3i6WiwqMedeaC9qu7cuhGBcaqLyeGw@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] cairo: update to v1.17.4
To: Markus Volk <f_l_k@t-online.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 08:28:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163132

On Mon, 14 Mar 2022 at 09:21, Markus Volk <f_l_k@t-online.de> wrote:
> https://gitlab.freedesktop.org/cairo/cairo/-/tags
>
> https://www.cairographics.org/news/
>
> That was not mentioned here. I just thought because 16.0.0 is from 2018
> and some things might have been improved since then.

The SRC_URI prefix changed from http://cairographics.org/releases/ to
http://cairographics.org/snapshots/, that should've given you pause.

Also:
note 'inherit upstream-version-is-even' in the recipe
check what's written here https://www.cairographics.org/snapshots/
check what debian is carrying
https://packages.debian.org/search?searchon=sourcenames&keywords=cairo

Alex

