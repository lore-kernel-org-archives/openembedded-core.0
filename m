Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93651C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 07:42:01 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3979.1784533319485563502
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 00:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dgEJf5W+;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso6193085e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 00:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784533318; x=1785138118; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2nP02cEfw053kldLjh05mAD3jDs+QrVxOsTh+YCLCQ=;
        b=dgEJf5W+17957/kVhQRAgeYiZbBFc6Jr7oUaI/T9X+u94SYwwxqOM9eWtF7V08neB0
         A5YGNh4PGIfvGzO9LI4sWAZmihF2wGvnnly6B4WS0HVxu2H3XXhq6i8ulO4/KBPBGxS/
         BJVACKWxHo8CheasIboF4Xgn2FP6VGRxO93FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533318; x=1785138118;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2nP02cEfw053kldLjh05mAD3jDs+QrVxOsTh+YCLCQ=;
        b=rbFAWu2215puX6U2yWUjF5POqCgnT6VESVyoUODGJs3xlCUu0z5kzT//1NvInku4f4
         kfTlfQpUMy7zvmtYNhFFTiqLaGEUG6mLw8YamhIPg/8zNBl3p6o1+YYrZkIeFk1abwEe
         uXIxxhnzYdfuZG31oxY9uWzzbr74mndaeXkp2+f0F4ZGJEFkBe4R5L+dqlhMGchyA21c
         8qWsmHHV9Pi2tfmCZ4VTSRXTkfH4uNssVhcxzJanCblR1OCluMs7XTHAyiuQezgBOFFy
         OSgYcR79dbPrb8uMLMQyH6uv7PvRPAAwJLSqtV91qKppgzQm+Fm1wkaBsWSKsfI0tnIP
         XBBA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9f7ye4gFZrq5ID96oTnG8uu2mO/92ciGeJxWQtMIlqv5w9xveJiTBXyzHXlQUKAVt347v6O0nHldxzqPM5G1uhw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwLh2/0dflQR9hRiz5CSKpV/G/JoKJ8MpQcZlYVTXFcpQ+2+TEl
	ESSLImpBqOIVGcmquQW6KKHJaI9tHYoRCYIUV7AWR4VF6QAgXw2TSd/jYHztExuc0CE=
X-Gm-Gg: AfdE7cm5HkCeCfg5Ybcs9nuNbIORYZLU/95gxIzIuCZ81m6eYbUI8usF/LL/GgkxIH9
	eiHmlb9CVwENHECdBwKqT927XjM/322HbmPPQCRhGHtsgxJBmxI3nWjlQcbePfcVMWM8zDonyIw
	wOHL/G7mZuKpcu+o59FdoALdtg5tyG/SPrv7HRgEw7C9awpN9W+wj7M+KJb0Wm7Dn6/z4zLoZKJ
	k4SkVQmaPB619+hU/hoL9W1vx54tq0+aeTdgqIVvfsjwVhQG9A2SGps48kKa4PN3YFEFsX2ZtrO
	isrACEFejohs9qdLBc8PVodsMObA63HXRr5K69g1kp+g/l4FTzMQ75TWCVDbgUc9dL+98SbKjPx
	OEUAFmX8KZwv6b5wRReudV53WM53Gv5j1YUwPOSpi/dKMu26fsc2s8MtzCZ5XT3Pe4QFXUipEQj
	te37ZlOk61xDI4G22gDUre1feUV7w0DxFZHPo6VUV2Mlb3NnV1m4R9THNH56295g==
X-Received: by 2002:a05:600c:3b0a:b0:495:607e:5ed6 with SMTP id 5b1f17b1804b1-495608bdb42mr17298595e9.31.1784533317550;
        Mon, 20 Jul 2026 00:41:57 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49548e075d4sm187505525e9.1.2026.07.20.00.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 00:41:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 09:41:55 +0200
Message-Id: <DK389JR4BTT8.24WAJUMLMD609@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] gnutls: fix for CVE-2026-42011
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <hprajapati@mvista.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260625125532.185380-1-hprajapati@mvista.com>
 <DJL1BNT9KYBU.18COZC5THH1NW@smile.fr> <DK2N6F9IW3ZG.1J43QNDS99AWQ@smile.fr>
In-Reply-To: <DK2N6F9IW3ZG.1J43QNDS99AWQ@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 07:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241331

On Sun Jul 19, 2026 at 5:10 PM CEST, Yoann Congal wrote:
> On Mon Jun 29, 2026 at 12:27 AM CEST, Yoann Congal wrote:
>> On Thu Jun 25, 2026 at 2:55 PM CEST, Hitendra Prajapati via lists.openem=
bedded.org wrote:
>>> Pick patch from [1] & [2] also mentioned at Debian report in [3]
>>>
>>> [1] https://gitlab.com/gnutls/gnutls/-/commit/1dead2faec6320aaba321eb56=
f20d442df192b83
>>> [2] https://gitlab.com/gnutls/gnutls/-/commit/24713b8c63137ce0665b495d2=
2ccce4f5ce05c84
>>> [3] https://security-tracker.debian.org/tracker/CVE-2026-42011
>>> [4] https://gitlab.com/gnutls/gnutls/-/work_items/1824
>>>
>>> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>>> ---
>>
>> As far as I know, this fix is also needed on wrynose:
>> CVE-2026-42011 is fixed in 3.8.13 per Debian Security Tracker but wrynos=
e has 3.8.12.
>>
>> Can you send a fix for wrynose so I can take this one for scarthgap?
>>
>> Thanks!
>

Hello,

> Here the current state of this series: Hold pending an equivalent merge o=
n wrynose.
> v1 series received here:
> [OE-core] [wrynose] [PATCH 1/6] curl: ignore CVE-2026-4873
> https://lore.kernel.org/all/20260629131453.1077612-1-adongare@cisco.com/
> but had reviews and no v2.
Self-replying: ^ this is wrong. this gnutls scarthgap patch does not
depend on a wrynose curl patch but on this one (received in the
meantime):
https://lore.kernel.org/all/20260720065644.24395-1-hprajapati@mvista.com/

Regards,
--=20
Yoann Congal
Smile ECS


