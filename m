Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65AECD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 16:25:26 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46400.1781886323658342502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 09:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uWmL/4xI;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so1884340f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 09:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781886322; x=1782491122; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+G64I5rAuHaZSnaTL+X6ybz8BRk8lRD21jGRBGEe/wg=;
        b=uWmL/4xIhQfj5y2FLNiiuWHx5nxfTmvBbRFkHZzJDXBjsRvu+e89s5u2VIjh58I8xo
         O8w+6gLg6+XxBK87NwxXsX03faYR0iB6xU5oeRGggx2mhg4S3TgQccNVf3ilIfpwVGYc
         Ge7pUoM5ntRroReXQdwduCw5ScBliVYMuKEFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781886322; x=1782491122;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+G64I5rAuHaZSnaTL+X6ybz8BRk8lRD21jGRBGEe/wg=;
        b=VUg/y1vcZwL7XcYVaxLRDgjDC3/GRcMLk+ZCO5zXzCOF2+JByoVTQlNujAqjOcDaYA
         71S/f9XI93FZ2xkRpe2AMOMInD16nTGqCHyFGrQ43LAkxpR3PKy3Ox+JH1jjBUoXENhC
         QylWTLvoOnLX8EMmvJOM1/jw0giOIZI3nDG5+7gJnJ86tqgg4YN2VgYoSSU2gMBmxmw+
         8r1viGZsdplMgyKU6skr7AbfBEqgLmFh1mLBtDftnLZCsXaGid2kxgXbfOmv0Qu4R3iQ
         hxASWf6HJFQ/ie1WtlsImzM0AGo2zNK+ETP8RWIchE8q3Yn9nj4lA9zrV9HKnIOw8Bu/
         KNmw==
X-Forwarded-Encrypted: i=1; AFNElJ+e0773n8pS78j2/efemYEx4jnMs2APRXyODGDWS9G0KF05fq3teHxTCD0Tu+I1sX/KcjoPjlTI+tnry3FrgafMdw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxhX9e4KcnHGTwCNTxfq3AhreWp5e1/En6XgAKQvIIcH7PDjPRe
	7ebFvO3prYm9Jtrc38xikES0zhqIRpTmNrmNRH2VXgKOz/7Lc3FDSxvyqthNojNNOe4=
X-Gm-Gg: AfdE7cmAqeIQc3EDFsOSdZZtHg2rBA1We4Z5ryhk/a1xcAiupiS51GqHjCkLLL3OdRC
	yZ3LNHwbW/UoBwWASrrncKjgMpwbZccj/7MVORf3lsmHkaPhU7oxAtQmjwzqoJtzBaQvPn+6yHe
	ms45YSSR54X0cvBJ0vRPRsT5wD7CWv5iVUylwcOp2XObG3w8GkGbmM+uOwY6Ubmmh6hjYNHEn1b
	BYbOEl+wuMuZAFOdMAT9SajHkCa/REjbjh/g5vSIc7sWN3N2B1ik3W+W5bOSChhKVOqm4n9LooT
	ZCgPa+l4OOzkBapKDrclWSHxkZCMXVQ2fhTnTwCbGSAivRU6xy2fofzFnwtCkBWg7hlp0rx628I
	V8KU0XUnr8X6Fmr5ZQ0f7ZC36QxtoHOZFTlp4Bl/AQ/S/D/IVJAlvmAO1xx+yvrUcq92u/6rGh7
	WCyu6OmCuo277nUHQvc28McG7/pCF8E+EaDSW2/tzZ+XBmnpLW2wC9mT4azvmP41Uq9cCuBAcww
	U/1
X-Received: by 2002:a05:6000:491c:b0:465:d0f9:95e3 with SMTP id ffacd0b85a97d-465d0f99801mr3802833f8f.19.1781886321828;
        Fri, 19 Jun 2026 09:25:21 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5397sm243665f8f.13.2026.06.19.09.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 09:25:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Jun 2026 18:25:20 +0200
Message-Id: <DJD5ZEXDH14I.2NULXG8ZSG3H5@smile.fr>
Subject: Re: [scarthgap] SPDX3, lz4 and avahi: Patches status
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Joao Costa" <joaomarcos.costa@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
To: "Benjamin Robin" <benjamin.robin@bootlin.com>
X-Mailer: aerc 0.20.0
References: <Mj30OkfVRxGpGbLR46KjAA@bootlin.com>
 <DILSUWH1SPZX.1OX8ZCTTGJJ7X@smile.fr> <hcX_7KWCTw2Sqh-NXl1vRw@bootlin.com>
In-Reply-To: <hcX_7KWCTw2Sqh-NXl1vRw@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 16:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239181

On Sun Jun 14, 2026 at 12:37 PM CEST, Benjamin Robin wrote:
> Hello Yoann,
>
> On Monday, May 18, 2026 at 2:26=E2=80=AFPM, Yoann Congal wrote:
>> On Fri May 8, 2026 at 2:57 PM CEST, Benjamin Robin wrote:
>> > Hello Yoann,
>> >
>> > Today I checked the status on patchwork of all the patches that I sent=
.
>> > I noticed that 3 patches, which I forgot to monitor, are currently stu=
ck in
>> > the following state: Awaiting Upstream.
>> >
>> > Do you have any information about it?
>>=20
>> Hello,
>>=20
>> When I received them, I couldn't use these patches because they where
>> missing for whinlatter (This is why I use the "Awaiting Upstream" status
>> for).
>>=20
>> I must admit that I have lost track of those since then, but following
>> this mail I've added them to my branch under review. You can expect them
>> in the next patch review series.
>
> I noticed that these fixes still hadn't been merged.
> Did I miss something?

Hello,

Those patch should be merged now:
https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=3D9=
9706716626324605c049a9130f705f2090a9f91
https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=3D2=
2e8bc2bcfe762c83c00b73a33384e63548e82c0
https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=3D1=
28af716be75ec76203f1d34a8448741e6573d9e
The last 2 were merged this week.

>
>> > meta: fix generation of kernel CONFIG_ in SPDX3
>> >  - https://patchwork.yoctoproject.org/project/oe-core/patch/20260303-b=
ackport-fixes-scarthgap-v1-3-2dc803f921a9@bootlin.com/
>> >  - https://lore.kernel.org/all/20260303-backport-fixes-scarthgap-v1-3-=
2dc803f921a9@bootlin.com/
>
> This patch is only in Wrynose since the following commit was never backpo=
rted
> to others Yocto branches:
> "kernel.bbclass: Add task to export kernel configuration to SPDX".
>
> So this patch cannot be backported to whinlatter.
>
>> > lz4: Remove a reference to the rejected CVE-2025-62813
>> >  - https://patchwork.yoctoproject.org/project/oe-core/patch/20260303-b=
ackport-fixes-scarthgap-v1-2-2dc803f921a9@bootlin.com/
>> >  - https://lore.kernel.org/all/20260303-backport-fixes-scarthgap-v1-2-=
2dc803f921a9@bootlin.com/
>
> This patch is in whinlatter: 958ec6a496b4652a774e7bef58c052ebe40c704a
>
>> > avahi: Remove a reference to the rejected CVE-2021-36217
>> >  - https://patchwork.yoctoproject.org/project/oe-core/patch/20260303-b=
ackport-fixes-scarthgap-v1-1-2dc803f921a9@bootlin.com/
>> >  - https://lore.kernel.org/all/20260303-backport-fixes-scarthgap-v1-1-=
2dc803f921a9@bootlin.com/
>
> This patch is in whinlatter: d6d36ee66aa69440e83f037863a4e747bf9693d1


--=20
Yoann Congal
Smile ECS


