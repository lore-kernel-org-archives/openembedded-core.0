Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5210C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 14:07:02 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.36400.1702476413052350582
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 06:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bAtgTRl0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-336166b8143so4256959f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 06:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702476411; x=1703081211; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17VdC4ubDLGzIMx2wzgpGH+QlPeRGgaUGM5KFZpZ52M=;
        b=bAtgTRl0+ef0+w/lx/I9LX9K+8TER6f9OBrNlc4U44VhthsnMGZafb8DVxeAxK9Y9S
         qIl3DJoqP02VEwYCYkr6L7GklLB2UIZjcW/zyLaSILZenFn9y3g3P7yGCcYb9o2BGW4T
         lrk+KF0YgCt6Mm5vFGQAAkHIPwCqPHDHJs88o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702476411; x=1703081211;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=17VdC4ubDLGzIMx2wzgpGH+QlPeRGgaUGM5KFZpZ52M=;
        b=vfVa+np6jHW3vD3ldm2VT8PwJMjxI71OKdHuiubB3mUa+1EdO7OewrCNngiWY/8tSf
         DneAPvaa8n8dT6Msh9tZh+8fNHKcbGiNisdlOBdP3DGngPsHhWQYAmi6exUTidiGOgKt
         MyEayf5JiZknLZDStYdKBYhyrVqZeu830tCZcw7ZYbgZlJP6JAjTnK8PbMIWUJMgszWQ
         1XbgStPzoBlOh9o3nWPLU5q4mDMIV4mBu2fxGVPTCdx6Tq9/uavkEjvdeE7WMFcQ0myX
         hcWgBzkOb+rgNZizZYPoskaM1n9YdhGVQ1gYzerACyaPI+wXXoglo5L5J3FCs1xlZe7e
         lQ+A==
X-Gm-Message-State: AOJu0Yw3sCzhVvA/faWnQkbQ+KKE5GhrYNQ7EOT6eIivBaQex6Qw6M1t
	92S+o4NhtI+V89PrQuH8nKC4uw==
X-Google-Smtp-Source: AGHT+IG4E/oeXCXdsa98JBWhtxIKtvd2wL+pt6dQHky/u8+am10C5qszI17w4YqlFks81V2uu9f3FQ==
X-Received: by 2002:adf:fd46:0:b0:333:40e9:40e3 with SMTP id h6-20020adffd46000000b0033340e940e3mr4267644wrs.29.1702476411381;
        Wed, 13 Dec 2023 06:06:51 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7173:bb34:6d69:83d3? ([2001:8b0:aba:5f3c:7173:bb34:6d69:83d3])
        by smtp.gmail.com with ESMTPSA id c1-20020a5d4cc1000000b0033350f5f94dsm13361599wrt.101.2023.12.13.06.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:06:51 -0800 (PST)
Message-ID: <bdd89f1893f33e2d19db0367fb1544b36ee49cf9.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.71.1 -> 1.74.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2023 14:06:50 +0000
In-Reply-To: <20231213094113.3981-1-alex.kiernan@gmail.com>
References: <20231213094113.3981-1-alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 14:07:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192291

On Wed, 2023-12-13 at 09:41 +0000, Alex Kiernan wrote:
> Drop getrandom-open64.patch (merged upstream), replace musl fixes with
> backports from upstream.
>=20
> Add sysconfdir to config.toml to fix:
>=20
> > thread 'main' panicked at install.rs:92:9:
> > User doesn't have write access on `install.sysconfdir` path in `config.=
toml`.
>=20
> https://blog.rust-lang.org/2023/08/24/Rust-1.72.0.html
> https://blog.rust-lang.org/2023/09/19/Rust-1.72.1.html
> https://blog.rust-lang.org/2023/10/05/Rust-1.73.0.html
> https://blog.rust-lang.org/2023/11/16/Rust-1.74.0.html
> https://blog.rust-lang.org/2023/12/07/Rust-1.74.1.html
>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> Short of trying this through the autobuilders, I don't think I've any
> real way of understanding whether 1.74.1 is actually any better from a
> reproducibility point of view. This is basically my previous series
> squashed with the 1.74.1 patch rebased on top of master-next.

I've run this with this patch included:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4082

Cheers,

Richard

