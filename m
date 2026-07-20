Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E731CC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:08:08 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7501.1784549282155923569
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pyN+juwR;
 spf=pass (domain: smile.fr, ip: 209.85.218.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15d111ca99so1040248466b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 05:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784549280; x=1785154080; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tLDc4EUU+0DA8Hh1vtU18mZsh+91um/tzbdWrMAlqyo=;
        b=pyN+juwRp8vbM59MLUYrzhh90ozNF3O8S7+qBe3fumDXS2iB4ErG0+i3gUIZ20RSdN
         LmybIyFXXkRwaS2ACWpfHJlYh8wp4FoScGMIL8yFzZNEJI2qg4bXSH8hYsV7VuMGFxVb
         uz5wfgP0fgy2eFgBMGazzz3/ljjXjywZYOOYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784549280; x=1785154080;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tLDc4EUU+0DA8Hh1vtU18mZsh+91um/tzbdWrMAlqyo=;
        b=f2XuqYDXAy+9PPayySIl6Q715U9d3lT/nsv/3wf2s3iVVl6EJlwCrkT26wPCywId5X
         UNFi6ts1rTxR+AVJHLPixKA7MvJQNQ5DBP3Mcvrvk/19dGX/AxJjKh8WrppJlazPRcLP
         MwZtqIWGxFKY+sTAyKw77nUtEYAK2JlMi3E/X9T+EecT/F1NhXNe1M2/qv+ik0+gEKUE
         x1CPHqGwgG10G4W2XPbWxMImMkXX+DQGUdcFbp4oUJcgRMzr9cHV2W/SrTlVhp4uX1T4
         IBAERwNdXE4CNCCvadJ8teU4WvivcYoFqktQky8QQzMq02JU0ZYlw6wRDsbiOJOiak89
         sZfg==
X-Forwarded-Encrypted: i=1; AHgh+Rrp/YpDhQyt+ERHp4H00MxHgjgwPwNEACZLamx+r4mDolsaUAMkrfVqi2WWy/zHKmA4SX6JqTbHiBIQJ8WBSqSwmA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzeQy8hG2hn6xRLssEYguK5V3FUo3hba+gBZsotBj3StdjUQrIO
	KY7JcGIsGE32vDWz4pXyEgc7tZxLZXTVOphpxHjik9NJRldgs7a4LMKFxSgXmz+QM0o=
X-Gm-Gg: AfdE7cn0Oi4PBmFemg07wMUnBi5TRUxTZ7qdlm6VFDYDL2f/QT8/MkJqzeNRw3rYHu6
	lua5+oS6Vl+Y+EZoyEeBKzDlPgtvA6U+7icKBFCvWVCL0Xd+Zr3YoWYz+YFXzW4pSCm7FEFAySq
	0rzSpESAfJl/SjCaJy6DhQUB5HBkSkEg8GvPBSF6Hz3vFe1mJUhcSZ+U+4Kro2fYeEmCjV0YTOo
	8XwkFRTeTdZaw0kF4EPjONoZWgb2edbdYW0DmRYeiUdM/WJgUd4WdrpQ3NEgaLshg2BOhsfviaq
	XNRdbTugqUtES5w4POQKGXS3tSVcH6RgvqexQxc99a0GE1an/8i98xpw13pbWaGADdxN/6BFnGX
	hLqup6Jc2gZOzxGz0bQccCcTZi69fwu0g0vNdnpcaBTR2ftLSYua708sPoYJUCfD4DWeTPuK4qu
	rgX4kl8NWXN8fKbF4QkSZYM/wLHtA5WqTp66WE2DjDeRbl5UsgL22C/vFq0CXrxg==
X-Received: by 2002:a17:907:741:b0:c16:aad4:2d55 with SMTP id a640c23a62f3a-c16b46aa98fmr488695066b.3.1784549280208;
        Mon, 20 Jul 2026 05:08:00 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf3ad3sm455814166b.55.2026.07.20.05.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 05:07:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 14:07:59 +0200
Message-Id: <DK3DX9DMRUHU.MCMI4U96CEPJ@smile.fr>
Subject: Re: [OE-core][wrynose 10/17] u-boot: re-enable RISC-V compressed
 (c) ISA extension
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Gustavo Nihei" <gustavo.nihei@espressif.com>, "Paul Barker"
 <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1784364567.git.yoann.congal@smile.fr>
 <c643e2d8af772182167a4ee2a65d5bcdc469934f.1784364567.git.yoann.congal@smile.fr> <342a1c637da6f078150b43045fdd48c5ae7a7a98.camel@pbarker.dev> <PUZPR04MB54191B12EAA85D1C673596A6EBC32@PUZPR04MB5419.apcprd04.prod.outlook.com>
In-Reply-To: <PUZPR04MB54191B12EAA85D1C673596A6EBC32@PUZPR04MB5419.apcprd04.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241375

On Mon Jul 20, 2026 at 2:05 PM CEST, Gustavo Nihei wrote:
> You're right, that was my mistake.
> Should I send a v2 of this backport with the corrected "Fixes:" tag?=20

Yes, please, send a v2 for wrynose :)

> The already-merged master commit (fef027f2350c) carries the same wrong ta=
g.
> Let me know if you'd like a follow-up fixup there too, or if it's fine to=
 leave as-is.

We won't be able to change the commit in master so nothing to do there.

>
> Best regards,
> Gustavo.
> ________________________________
> From: Paul Barker <paul@pbarker.dev>
> Sent: Monday, July 20, 2026 04:48
> To: yoann.congal@smile.fr <yoann.congal@smile.fr>; openembedded-core@list=
s.openembedded.org <openembedded-core@lists.openembedded.org>
> Cc: Gustavo Nihei <gustavo.nihei@espressif.com>
> Subject: Re: [OE-core][wrynose 10/17] u-boot: re-enable RISC-V compressed=
 (c) ISA extension
>
> [You don't often get email from paul@pbarker.dev. Learn why this is impor=
tant at https://aka.ms/LearnAboutSenderIdentification ]
>
> [External: This email originated outside Espressif]


--=20
Yoann Congal
Smile ECS


