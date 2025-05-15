Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5DEC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 16:07:15 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.16528.1747325231384463838
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 09:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rpi+Ymtu;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: festevam@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-326ca53a7f1so11401291fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 09:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747325229; x=1747930029; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHmZLoTP1AFZouxgwZs2V/ZmodaT+icPInkoySl97io=;
        b=Rpi+YmtuE9viJEmx6OuVRliW/B2wzuZLFZ2nBwrArQ116N4WlI2jCLAV9w7LPTwN46
         R3Rwhwnn3lSA5az6T154664K3hdp6vGTWf2kp8wAytalcZW+X5gUgFaQH/6srP/avRLy
         HOrSKFoL6KkDucND9L8mslyRg8XMm+oJLsJ8kinY7dayOM2aER2zlZCnWC2uJBJQqZbl
         QNDEAe3QKP+NXa2YW30QZ/0l+M7mOAHfO6GKlhbBs5fKhgWX5KrS7QjeOK1v+xN94N7w
         6aXfMm3OY08BFV8MoJD2y/AaXmwMuDGsVHmWmVdgfMMB6qdtqbE2T38X0wP3G5030SGr
         7rZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747325229; x=1747930029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHmZLoTP1AFZouxgwZs2V/ZmodaT+icPInkoySl97io=;
        b=fZF6+G2u+9bgNfICsAqG4vCc1TjQFhCvL+vXlNLSjy60+1Aeua6jbhDrZURfulI9YX
         gySMNeUtys4SPNY/Nu/Jha9rYFVpaW7O0OnU4RSSuwo9Zjkw9B2nKhH85dKFsQH6W+21
         H11W2807lGMVklAxBDPFkD6nyZl3746710k5GdyhpZF0/tjPUz/Sq5aCdiSO9slQpbtf
         h4rZmuTmThcfLNoxWlVtgU8PEYO3LFfFGOxS/BdX3tEVRoUn0CS1c0Am85kJ8hcMDgIp
         1i1ctQelhNtvcdB0Ab9enYie8X9/DtDTffzTlMdZ5wHxc/kTmc+b7cfrXHHkrh5n5rVK
         kjNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8DZ2u82XfvqQ/EN+jXAEokQsRr4K1MkPcnMQjjyVtsgTkpsQ78ZWFOVCrLMp64d+1fsTT7kERNYuCf8YOwy0Jbw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzgaKVvw9GazewY6xiZD0qDE+YPR5cUSL97xly+tj2+qosUs4Pp
	0G82IEsQ3tR/3/qfNCTsWco9zw841z1PIM7UwncNqUE27dBQZ6hOjnYOr4fna5b7aHzJpP1I6u1
	xScYctfHTdXoj0SLEbkuw2+RtGJZ1txo=
X-Gm-Gg: ASbGncvObItJHyCBKbgCBf25b6KUtKiOsq1BqSB0NlF0w2Ra2ITPKPDlXjQet/cTtSm
	AY+zjwiQsKi5O9CJzJ40aB+KB/MzaEfe7ffWG7/n93MxbtOLuKmWwkhF4c9/asFWUhd8ZOXCuwK
	MeT1iJIGTHo+qo5xbNGHHL64gMtAwMpTsiYxsJdbn5iODnavrNhWp2PLIeerB0rwE=
X-Google-Smtp-Source: AGHT+IG1phNi1Wgft6UZAKttYXUCDdvjgUWt5gH2J+bhJiSU/QLmfYgEQwDZmySnMCaTp6/VAMsbUe4mbU5OkJlxkOw=
X-Received: by 2002:a05:651c:2229:b0:31e:9d54:62ec with SMTP id
 38308e7fff4ca-328077c40abmr721551fa.31.1747325229094; Thu, 15 May 2025
 09:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1746548780.git.bruce.ashfield@gmail.com>
 <D9PRCP2WLN68.1VIO3IX3SQ7IH@bootlin.com> <183D2FC291E34522.16348@lists.openembedded.org>
 <161efc5b043277d6ca648087f9e6fcab9f72981d.camel@linuxfoundation.org> <aBtGeJH-y1Je42G0@nuoska>
In-Reply-To: <aBtGeJH-y1Je42G0@nuoska>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 15 May 2025 13:06:57 -0300
X-Gm-Features: AX0GCFthTGhc4MohaHTrFWawOtqQLh32MUqqxwyyDVJfFmKqImEqcy6mafIAGuk
Message-ID: <CAOMZO5CNcJmHZ3t5f2jeH1G-huzqsaUgDkYBu4WRKTBo_7BKQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/6] kernel-yocto: consolidated pull request
To: mikko.rapeli@linaro.org
Cc: richard.purdie@linuxfoundation.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, bruce.ashfield@gmail.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216692

Hi Mikko,

On Wed, May 7, 2025 at 8:39=E2=80=AFAM Mikko Rapeli via lists.openembedded.=
org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:

> So it looks like missing CRYPTO_LIB_CHACHA_INTERNAL=3Dm with
> CRYPTO_CHACHA20_NEON=3Dm is the only problem on qemuarm
> and genericarm64
>
> I can send a patch if Bruce doesn't already have this.
> I wonder where this came from since I did not see this before.
> Maybe in the point release updates?

This is caused by commit 67727c5764a8 ("crypto: lib/Kconfig - Hide
arch options from user"), which landed in 6.12.26.

I have submitted a fix for it:

https://lore.kernel.org/linux-arm-kernel/20250515154136.435685-1-festevam@g=
mail.com/

