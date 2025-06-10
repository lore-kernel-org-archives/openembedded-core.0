Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76112C678DA
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 15:13:27 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.89778.1749568399447193670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 08:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OH8zUhOR;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso9227807a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 08:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749568398; x=1750173198; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=65ULjVl4rrJIRz5u9oI0I6n0CZbIzfiAYDmYsXhmoOY=;
        b=OH8zUhORb+F+qOlNQsPlqx4HG43hnmXftDtnXJQNNi4OOHwXpm701KUrCqt+noFrXA
         /SXNCLxO+GX0xdCZ+lIHwN1zpXboV3r6QJ02jhKaV4MTbSfSUut5HOGduYcyP+gIDPOr
         yHq3yL0gbrXhBUTQIa+/a2YtZKDQs09UX1XaiHLMeM/RKDYu86RuTSxCepuXP8Zk/xr9
         o9YSoky7V0OdSqr8dk2pvhrOVrnU1T/5OogufLJeDLIWblHfkt89dWh3eD7yCRI2iOYK
         M6p7YPStjzELln/VpBbTRPnJeRtK9oKBkXCJyFjKgEN5WF5LPmU7bCK1fNfQ+w6qDzY7
         MVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749568398; x=1750173198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=65ULjVl4rrJIRz5u9oI0I6n0CZbIzfiAYDmYsXhmoOY=;
        b=RzUAEt0pTBO0QmrHYgm+WR+fRGM8LsMIjwyGNV6zz4uP8pBvwLPcoorVgYQyj8hZpf
         f7TMeSQEQs3ewxN6g+tbMzi42xYgRG2RRqFDFpcRlVrorxDKUct7VNExPcLOinsqe+Ba
         GqmDbu3hP5kkrh/ylEubZ98Q+v1cDxCYl19DAj6bTRN3vjkuCz9RZbjvwac7oKr38j3A
         vqmlLjb7wxmPRY50RG4iDErLjCCm/OOer2H3nKMuNnAr16NF+59b3Dgzf5M9COoIwPcB
         tY1YIrXFbIsoKlHeJFfMf1uJqUGEJJjTRz3s+SH0pRDU8rYLHNvllHhTAB9Aki2bw3UF
         koDA==
X-Forwarded-Encrypted: i=1; AJvYcCUBs14H58WKZZDkRZNnMm0GxmzGe4rubSGjFa5XVuOdjPajqNQ/YgCLGB2b483HGDshDbl2sDdV9Xlh/l6lrD7mXA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yymt0JsDG2G6yuEY1Pr11KaCQniUr17ViIocA6P6YCfsufK3FxE
	UmahM4ZIOKt9awA5x72U2YKNTT9yPQvPHu5+BWiOwMM1/uSiEnyuFDye
X-Gm-Gg: ASbGncugSUT2DohVAbZgSNHAmlZFeDQIPs16Q97e05D07ipXcUxrJPt9pbYZDBNjGgb
	OBI+EuUz+utLBCA5Hg3k2u+uKFjZDxQhahq5qkXfoHOLZ1bJ/+OS4WoUk0f9NjmrCFZnw6P0zO1
	jm34LQMx8CYBBcWFl19e3vBQFfoNS7U2NCRftAbJOvXP43W0M5JnkQTW3VYk3VikAyBa+g48ZFM
	NERm22sdhb9sh1tAmkF2OBBqzUb2gImN9HxFNii/DabgVfiutfgKD1WCSyJTpJfbVCn/rvIfhB5
	nkEJxvZA6qWrTwgG4ui/fa+bvNuJJmSKwQfA71sejC7lUe1smIM95yszSZVLChi4F+f0Objrjkj
	lzITj
X-Google-Smtp-Source: AGHT+IHWiUrn7j2khrIEwDATop/iOVwHMNpCIttJq5UxOEirZJYWiYXFXEu87FyvHgF3IRoAvBqwug==
X-Received: by 2002:a05:6402:27ca:b0:601:f3f1:f10e with SMTP id 4fb4d7f45d1cf-6077350d9a3mr14878658a12.5.1749568397555;
        Tue, 10 Jun 2025 08:13:17 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607f0847541sm2968276a12.76.2025.06.10.08.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 08:13:17 -0700 (PDT)
Message-ID: <96b1e79c-f5e5-4d5f-b609-3ce89757a7bb@gmail.com>
Date: Tue, 10 Jun 2025 17:13:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [yocto] Yocto Project Status 10 June. 2025 (WW23)
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: yocto@lists.yoctoproject.org, sjolley.yp.pm@gmail.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <CAK5yBb-PRoA1biG6PA_hX_RndM9QqG7G_7ikYFUZE3goEaP-_Q@mail.gmail.com>
 <8ce48df3-b8a2-4b95-96df-bf0fc1ac1eaa@gmail.com>
 <CANNYZj9EQ=xjSXRii-6RYk4uzV6kzztzWCDn1Mo5z8nNyvURhQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANNYZj9EQ=xjSXRii-6RYk4uzV6kzztzWCDn1Mo5z8nNyvURhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 15:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218360

On 6/10/25 17:04, Alexander Kanavin wrote:
> On Tue, 10 Jun 2025 at 16:46, Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>>>     The clang build time and size increases continue to cause
>>>     significant concern.
>>>
>> Is there more info available on this somewhere? I'd be interested if
>> there are any concrete recipes/configurations where this is showing
>> prominently and could be used as a benchmark. Or is it more like an
>> overall "lot of small things add up to a big one" issue?
> Please trim quotation lines when replying.
>
> It's simply the build time of clang-native and clang target recipes. A
> huge pile of c++ code, probably the heaviest recipe to build in
> oe-core. At the same time clang is a critical path item for mesa (and
> thus, anything graphical).
>
> Alex
Ahh, so this is not a regression that could be bisected, but the cost of
the new dependencies.
Thanks.

