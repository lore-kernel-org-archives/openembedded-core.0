Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11483.1793805488725100510
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 07:18:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=RPIzO7Qn;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c5358fc28so751075f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793805487; x=1794410287; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5Me/wlpohXgUByXzUSmsDhF+Wt6KwCtNoeNJSPPgKU=;
        b=RPIzO7QnoMxKz/25hUUkTNBjoJt1hUke8XFwSCMxviKKh+QwdAiUmSzZV65+ft3PC7
         4dx3PnQ9PowpQiUlVrMMyo/1tbZg1sEMXjxHHyI1McVm4to+s3MslPKmfxbXMvaWqs/m
         Xw6kCFdfRk8nXL7txezbt9D7TzjkcRvTDfbg1fWKGRMyLuSF3NMYYblEvMm8VCHlHZ97
         GrD0lwDZS9aT9G4bbRgCkDuD0E5kdnOx2Lv1H3N3PB6CCxQgfMs+zW006gYoxWyi+CZL
         noPT5j/3lcVG0bv//oEMrbz0S5wVxa2T/SMzZqfvY3LSNI/450qBuTDjVAJVcW1LnqZG
         fdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805487; x=1794410287;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5Me/wlpohXgUByXzUSmsDhF+Wt6KwCtNoeNJSPPgKU=;
        b=s7KZuDjQJcZw4M/ABzM1p8Ww5JyJt45yiINlWHOgTYFzAYzVcNWLPpvLvMNPZxFZ19
         iEXJw1L6B6pe+Fl/iYLUPFJYt6t3nm0WLa34DQfLpcb1H/UpN2PkETNL1SY134tU3UaW
         87IEkuwaXar/lb86Hauxs0Dt2Ca5Q6aXSZSvKBgFX0+/Js3jJkx7rpuRM9o+hCMomIUV
         tu97SVgjio2Kd+b15x3eg5VnH8YTA6bNtgIZ7GqOCmVc8k2eeja0ujcF0LyNi2fDZGM6
         qJMjIoaorVTolVbbl5tCuwC583K/E+JvA8Q62aQo16S14X39h3sjtP5i+GeNZE7HNerh
         frQg==
X-Forwarded-Encrypted: i=1; AKwUvBxDdYkXBZ6IDnpH1z6YBd7AUqmPLK5fUVb4GMCkBMzAvq3TZoqUO/ErSJmPAeZ4si83UfMAnPsroM223M5CYLRafw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8mDATXapbJp2nko9ieNLZqU50+nbtq+KUGAn/Pnzd/oP8N9sgd
	20PE/gh4VVY6Mb8x3JZhfLEbJfF3rdZpksVa0yxMFxonEIddtYQaITT7BphbDVihzCA=
X-Gm-Gg: AYBFou3NbrzGPbx583amvo5g9KHwxn3IOLRay6wsRSw+9wG4HJ84MsmennXgrQIJQhI
	ZlODT3RpSEnm9mbIWdsRybSRHjxQQoZ70/bZ2wnNDQfMk1cWMLbrSF9gVe/L7pUFvGt5PhJxqeO
	6yCaazDklwxd1SvVsAdndlVAAcRHhIV358m798hlF5jEoQFNhhJvhj2aBNO9FJ5klphOV3WfbDc
	Om0aApohxf+LOZm7TNfbvJi9mLp3eujNbBsdZV9UM/lazuHGCaFR0vZjpIGJWTqMqw09C6GH4BB
	HGAOXL47m3RkBianxb+SzqO4k2q6cRvewDj8xYW3W6Hw924tiVySmgFb50w1jvVT5bmSn9pzuqV
	/9zLm54UE4OOxjqZcPS6gKcQK/USP470Y7/lWRGnQRT0aqj9EhSiVV9Le42qvCSWpLW+8rTe/pK
	eOoCxELrsReXaxVs70tOUFhDLpC2LKJs1H8MB3GxjjtrLvnCq6u7nQRSGYrJDnmd6mF/59EHQRk
	R7qsSt7opv2V1rJmd74LHWX4BEmr32g9f1ZwJJZuSbWlRjcB/NzjWnnJ2VkWVk+1S7g8YNOwwzq
	LsmCT65l+KWiadhCDq8NPjDoYVs4n9icK8bU8F85SulmN/Z4WlJdoGR++//O1VTE7ItkB41ASHr
	/cHACOhxqwbBf5CctTyWzKGuPRarPxUVIosqFBw==
X-Received: by 2002:a05:600c:354a:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4ac181e759dmr395448075e9.31.1793805486711;
        Wed, 04 Nov 2026 07:18:06 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4532916f2sm62996335e9.5.2026.11.04.07.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 07:18:05 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 16:18:05 +0100
Message-Id: <DMMIZ3O9KTWK.2CL9GKA6APZ73@smile.fr>
Subject: Re: [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Abinivesh G A" <Abinivesh.GA@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261104095328.2295613-1-Abinivesh.GA@windriver.com>
In-Reply-To: <20261104095328.2295613-1-Abinivesh.GA@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 15:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249391

Hello,

On Wed Nov 4, 2026 at 10:53 AM CET, Abinivesh G A wrote:
> FFmpeg before commit 1c10bcc contains a heap buffer overflow in the RIST
> protocol reader (libavformat/librist.c). librist_read() ignored its size
> argument and copied the full payload length into the caller-provided
> buffer, overflowing it when the payload exceeds the destination size.
>
> Backport the upstream fix that clamps the copy to the caller buffer size.

We usually omit info about upstream code in our commit message.
We are more interested in integration information: patch provenance,
proof that this is indeed the right patch to fix this CVE.
Look at recent CVE patches to see what we expect.

> Upstream fix:
> https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/1c10bcc2e17255dacb717a25ab3d=
b142ce390602
>
> CVE: CVE-2026-75143
>
> Signed-off-by: Abinivesh G A <Abinivesh.GA@windriver.com>
> ---
>  .../ffmpeg/ffmpeg/CVE-2026-75143.patch        | 32 +++++++++++++++++++
>  .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-75143.=
patch

Also, please check if this patch is needed for other maintained stable
branches. I can't merge it on scarthgap if it is needed for wrynose (for
exemple).

Regards,
--=20
Yoann Congal
Smile ECS

