Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F4DE9128C
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:32:59 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15749.1770276771450054145
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:32:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xcFRs6UQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-480706554beso5974915e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 23:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770276770; x=1770881570; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhwaGyA/xnaR0MrJ7cvxjKyGinGxN2gKSpuGmLVXqx8=;
        b=xcFRs6UQVBsfHjqps70FPK1TJMMHUbw6JXEzl7F6+yjBWBBGtAsW25Qmm/+3ay7hoy
         rjRyR2MhqZUZ7N5u7WN9wiVm9JsMwZWgOorHQsuMxFYaI+kNdiKGOtIOLYqT/Mq/wC/I
         AN57Mp/hEKBLXzvvRMRVWT4hq/mVCNo/qlscQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770276770; x=1770881570;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rhwaGyA/xnaR0MrJ7cvxjKyGinGxN2gKSpuGmLVXqx8=;
        b=rD0QFQyIZseEyKv55R/OPO2O0atIa+0crncSMUy+aYxIs1xtVru76V8hep1lezEEDw
         kDW9NxpF4a7P+EyRsVVDbYdVkmb8IgQE7A9lRD2w+bpFjm+MiN5BsPjF2gPn+/pk7jGc
         K+R3DzWtyLar8N6va/D2DfZRJUuwzKXoi8uUWaZSFo5pU23MPjlZB2oBJ9zrlrPhV5rc
         v0e/Kokjvg38Ehpq7glEZaUgVRGp1Jp//1+FJbPTDo7dH7ZuVEhmBnpZ7wcO90C49foU
         vxxqjBYqOfkpFmGExn4R62Gs5/FkIQ3qRbP+Zh9ipbwiynlYuq16D6VISIqUFQXu6ngm
         jCSA==
X-Forwarded-Encrypted: i=1; AJvYcCXMBpYXTlTFK+5IUZ1hBqv4SBaP3HtQ9ctx8MFGxmaGDpXNjeQuNWVAZ+wniCQ9FK7QJlnMXGpQ6/UoR7BGu/4B+w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzGZbvHrHSt48Rp5W33rvhdr4AfiEDf2J4sgsU6Rr9ygdw8anbA
	8X7TvOqdkmQh5GqbM2fiatI9HKT5eqNgDbchHttTmK7TyiFmBhUHdn+tvAc7RlkKLgg=
X-Gm-Gg: AZuq6aJdOL/0ljkyC8wgJ2EzanqvmVsPmbL6xUg/ntwHNOyGRd8zYob8ZlgdBybwrLI
	FAeekUEixzP5Ahup30faTJwiYqieR5oz2dZa1mQIWWq3p8TTfkSFzkzuujM1+56gQ0QFZHqwKD9
	cwz9YEMNYDZ+EYYnWGtGnDG8iYVBdeqHil/7wt1lXxYTWWiWuZ1KOHN6MbPX7kZn0M400KwT1Mw
	SHIrzHnd/stMJqJxgPpd6fDpg+GMlZG08DVg8qngmq2U5+Tq1JY4hMuHn2Sdmium43/HJTJdH6P
	LCBqdxwg7BttvM58o/eGDVx/dUETbDhoc5oLrUHnjQYt4WjsNcwsoaxgeAVG0exejgS3YQVe6vy
	q/022H6Xlo+6dYXQTTt7pGRQy9mzCScH7bKt0Cj6gTYbrwU7oOrZMTMgCtM3MWv42Vta0bV8jDB
	A1L/Lw9b/VWW/D22Z9K2Oi6zaHhwCN8mqqDTdq3BwrMABaFo5G3s6e/02v+ioX7yhkje8NbRULP
	gk=
X-Received: by 2002:a05:600c:3b85:b0:477:639d:bca2 with SMTP id 5b1f17b1804b1-4830e92cbcdmr73091885e9.4.1770276769798;
        Wed, 04 Feb 2026 23:32:49 -0800 (PST)
Received: from localhost (2a01cb001331aa008fabb4f40b3eded6.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8fab:b4f4:b3e:ded6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d4d030sm54578915e9.13.2026.02.04.23.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 23:32:49 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 08:32:49 +0100
Message-Id: <DG6UQOMKTMKY.1S0EYKRFU0JM3@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] qemu: fix for CVE-2025-11234
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260123055353.139017-1-hprajapati@mvista.com>
In-Reply-To: <20260123055353.139017-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 07:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230564

On Fri Jan 23, 2026 at 6:53 AM CET, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Upstream-Status: Backport from https://gitlab.com/qemu-project/qemu/-/com=
mit/911c814c8cc5f836286bd96694843036db83e99f && https://gitlab.com/qemu-pro=
ject/qemu/-/commit/cebdbd038e44af56e74272924dc2bf595a51fd8f
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |   2 +
>  .../qemu/qemu/CVE-2025-11234-01.patch         |  72 ++++++++
>  .../qemu/qemu/CVE-2025-11234-02.patch         | 174 ++++++++++++++++++
>  3 files changed, 248 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.pat=
ch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.pat=
ch

Hello,

Could you please check if this fix is needed in whinlatter and master?
I can't take this if it's needed and not present on those branches.

Thanks!

Regards,
--=20
Yoann Congal
Smile ECS


