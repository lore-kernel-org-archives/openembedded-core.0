Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8729.1794992685715133855
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 01:04:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=moTRZ9j5;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so411467f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 01:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794992684; x=1795597484; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UexsbpIPqvtxYZABIyNhWSXPmlFp22+dxXSMaWvbStM=;
        b=moTRZ9j5zBBD3nr5mxKRNwkMK+R3bpWND91Et5kt7AbmhFuLbVubjik41Ms5efRx4U
         FtmpvAfg6ZD6urHeKkBuR6VzTUM+q6r8AkGDcgTyxNwWaQuwFM1E3BxpD7M0b/cjDKCI
         uXT1TswvAzqsW8fkiMdDx9YZWZ/OJiD8x/bWf/OTEqXaxEjU+11OUXY0aG2cNagE+7lz
         O8oLETd27/PM0o2buykrF7aHb81u54r2fhKaK6uw2GflHjU356n4HxMDUuDl4Op9E4qI
         ehqywlWwcLPL/N+ABPHBVuh7QQjGwDqROI49gd8fv8M66E2DaxsiBGKm3/3MZsor/JYi
         dHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992684; x=1795597484;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UexsbpIPqvtxYZABIyNhWSXPmlFp22+dxXSMaWvbStM=;
        b=t/Ohom+iHgy9lN3lfjI/D+4haxWVFNNiXCSzidHFeXwhW2xeiruzwL+ZnwY7DPcECX
         P7UKNGnQ97L2f0K43zfaCgFylwyW50TBsBL8zqUxVMc+8BizNvuOzwa6aU16/8tHVZf6
         11sZq8N/nNGnB6nMeLjg858ovBMTSHjv76Ovc5yl26ugmjhNTfMRkB+IHanhgdi1ixVJ
         wBQDG0X18+0+jyq00Mntzewoy+jl6zTRdrpJKgX0C9tfqIBiGv9Pw0Z6cUUwfVlnvvPg
         srwQJ/BMXpqx2xEJHa8Va7KZlK567L1GwmhG4DEOxvh59odvzCPA5Y5QYbHv1RiE2kSa
         ElPg==
X-Gm-Message-State: APuU4Z82Fq6EcnDpTrr/na9zp4B0rm5K2+BosNYGMMoBgH7rsJarJ8+4
	m36cwyE4OT//46FXfs94LuNffV4HHe81YELWcbrjxguy10l5YjJKEJ0Qm0EphtBDeJ8=
X-Gm-Gg: AZFdTZcQ14p9sRn6n9eCK5+5+gKdJfNAO0No88z0GrehaYlAD5qwPH1FpI6pGC3Z7yL
	WHGo32bjL0KOcW0TxLSpXv0b256G6Jvgg32OQo1V86R1ocMZBUkhyYuY/jy+9tO526V2WXFaAP7
	rTcZ/jJL08okhnvtKPw1tOQyMZjvj2Z1wGOGTHTdxIpXK6zqUYY3jpTvjJJ8ognVmWJYAUBNOe8
	AXxaiUsNXSmAS0t5Kr23SMmeutfsfhbc0cnz/4IDjZ2cV4ShtcRfaV5D1o+T/lgyRQ9nomZd9vE
	IoyKw05uY5OdyFSppLuGy0bVgZnRj52SQG6z+TYW2yMtiinWG2atENOc27l3GUxturarLHsrsc4
	tSQmkoBmRglaJVfeDfxGs0DgCa7CVEhoeFxCRVFVqpNe3YxEzVRr3QWUA/Jwbjy3JZ4aqdmm6g4
	Nsa2fQucLwQ++I/rHIr29x8XsU1WLw28GGSAvKCm+iN6OTCw7LEK7FpPcr3PS5GaAxDhHGqlm6S
	gVvAG9aoeMJ7ih68ScpTPRf0GWT/siW9DG7AW1i0yGng0g5McPQyMjz7E2ufIac4xpSeAH8rkRZ
	UFWq7Wuw+/UnzPyvFdY9YMPp1pX2Rg1VPpZzw1QffRQNZ7XB9P3F1Q71cmN281TH27QxSI1u0HJ
	2N+m0A2xh4KxMQzOK
X-Received: by 2002:a05:6000:2681:b0:4a4:9c15:82d0 with SMTP id ffacd0b85a97d-4a63648e177mr4849036f8f.4.1794992683769;
        Wed, 18 Nov 2026 01:04:43 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655f9f53dsm3435892f8f.35.2026.11.18.01.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 01:04:43 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 10:04:42 +0100
Message-Id: <DMY7SUIMH84V.3DI26DWHENG5F@smile.fr>
Subject: Re: [OE-core] [PATCH] pseudo: inherit upstream-stable-release-point
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "OE-core ML" <openembedded-core@lists.openembedded.org>,
 <mark.hatle@amd.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
X-Mailer: aerc 0.20.0
References: <20261117164151.1362220-1-yoann.congal@smile.fr>
 <CANNYZj9Uj5v-Tb1TrA+TrxrdEyjO+qj25byZ0fWtUpiLHKH-DA@mail.gmail.com>
In-Reply-To: <CANNYZj9Uj5v-Tb1TrA+TrxrdEyjO+qj25byZ0fWtUpiLHKH-DA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 09:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250525

On Tue Nov 17, 2026 at 6:13 PM CET, Alexander Kanavin wrote:
> On Tue, 17 Nov 2026 at 17:42, Yoann Congal via openembedded-core
> <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
>
>>
>> Pseudo now has a stable branch pseudo-1.9 with pseudo-1.9.x tags on it.
>
>
> Is this branch collecting only bugfixes (or fixes needed for continuing
> operation of yocto release branches)? Is this going to be a policy for an=
y
> future point releases, or is it a one-off just for 1.9.x? There should be
> confirmation of these questions, in addition to the existence of the bran=
ch.
>
> Alex

Hello,

Good point.

The best we have right now is this:
https://lore.kernel.org/all/1783104055-19005-1-git-send-email-mark.hatle@ke=
rnel.crashing.org/
> (I have already created a pseudo-1.9 branch so we can backport stable
> changes as needed.)

Which is a bit terse...

As nothing about this is urgent nor critical, I've created a bug:
16529 =E2=80=93 Document pseudo stable policy (1.9.x)
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16529
... so it can be treated at the right time.

As for this patch, let's hold it until the policy has been cleared up.

Regards,
--=20
Yoann Congal
Smile ECS

