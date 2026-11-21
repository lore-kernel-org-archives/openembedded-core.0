Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25687.1795301680165259997
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 14:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=JweA1dJp;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-491971ac844so1851186f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 14:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795301678; x=1795906478; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6M4t0bj/Aektibz+LEPK8p5sbFduQXTYZEswoaQ8Eg=;
        b=JweA1dJp92qOItmD8dbsK+HmKfR7CHoEs37wmAWmQYRin0fuda/DE84IsGQKXzSoJs
         NhBi69hOo8NYxtzq7mxOifGtxZoYGpBefSmrgHxltXD23xwxCp1p70oZBPS4UCDYKnG+
         rcEcdk5PgS8t0yhLRs4T6/G1LKUI9LiI2mCggH6m/MSXKHHtqcw3vsCEvF76yR24mVfo
         2KRUtqNs3fyD1w4JaWzYcIIh2mgAQSyv1O1XcxfMHX4BxiKTS3E/bBZZ4aAw1JoBxjxs
         wLTypxOivmsNAF30qmY3M6zfArW01q7T0Np+Xzz341MRv512aQ1EFrQ3YKOjEHPHENCd
         USIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795301678; x=1795906478;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E6M4t0bj/Aektibz+LEPK8p5sbFduQXTYZEswoaQ8Eg=;
        b=mWCeb5aUY0pSY6n3C7uo99g3kVenRnD4kH1+gSeau0zAymiD/4dGOQ1Yo6iMnUYzc6
         BVVCLDTd1jAdGecEeOz3rQcxpqDIVPOB3200tlOZ0qZABKk8ZSzLQHe2v/4qorqK7MSx
         Mh+SxnP9b2ZxjbCbp07ljz6Z6QMW3eSuxtaabTwc7jr533Jo1ZtRo7k8kav6LZlJZ4sQ
         axdoz4C0m5+aiead9XTknGq+FI9ZW81QfBGxzEWlV5GxT9ryRHjOZroWCw2m/A1P1Eqd
         FM029N9B7leBBUYrJtTC3Hc6bAPOo8BFDP7/tDA+gyUEE+kEEkGdlXmGfIbLulttZIeh
         RK4Q==
X-Forwarded-Encrypted: i=1; AL+hErGmTSEXibHV9qjh7yKvbyWke5W/PPif7S5mFeO/gEEXkeMIBRbi554YQ5Tb+G5B0seqjJrkoc+kWjZuIbyKcvA1uA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/K+rbyXkVkAUVDJbauYOeMMhnutCwitsbi6/KZZPeqnPqRy2yB
	GyPOswpIiSY4NAKlQLLxo/r58KToKu8BvEJQmlZxHA+Sdm5OLQzzox0K95UC0SqQn48=
X-Gm-Gg: AZFdTZf1q2n7dVcdJwfIDNbYilKZiIuTgpNTWIvaY5Nv6F/HS2S1tbpRqYGoyf2F34Q
	FI6Vly02Z7Ewjt7a6hMbFMGozJTbmOcjf47Bv+bFVOMNkjPDedfR1z2dPBcATwS7TNuFzVVAYZk
	bv2oHVKrE4wUWPuuU9nSpKLdwptocx39mw3deHgJbngzTLj/8VJQ0OUsFwM5/Lu9LjA4two+4eI
	C45QGt0wQSXKa4nbd66K0A8gbe4+x4BYcsjWLeQsdkK1tCbU/eTZUXwPo9vx+1fYWijjlH5Ah/r
	tdWkB0MosMpVkae/TZOtaJUugPYBsy8mr9kDK5C5IN7YrBbFq3hg4oMyJdttZ0BlidJ8SnjnsNt
	KtO5t13LtS7nNU3qy3vjegucj5k7bo7RPmFgZTMXnVS0UPJSz9kQxx7y/JGQnMT2pN0rmaTKf2K
	3g3/eJhk6fWlOTHzZLSDZlMUXSe9Q9tlw/W70ybqf5GYQV6vWU3Jmo6FGRNFlqxXANjQ18RY6NI
	S5ufYHb/v5uYseZJojBIxpK1h0sKtp/tWhn2QL9nLnaF5iMv/gsDk5sc0/HgezSuRTwwoX3DZW7
	vSNfodw9YrThsH+0y1Hzgrb1e34XNpFd05NVggX6cAb8fLBuQDDclLVlERXkmnLU87sF/BQ9lQm
	LdlANRCQV32hIG0TJ
X-Received: by 2002:a05:6000:46c7:b0:49d:7e8c:e8ad with SMTP id ffacd0b85a97d-4abb272758amr10022222f8f.35.1795301678313;
        Sat, 21 Nov 2026 14:54:38 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa0009d38a8173e0a09d.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:9d3:8a81:73e0:a09d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm13356227f8f.38.2026.11.21.14.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 14:54:37 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Nov 2026 23:54:37 +0100
Message-Id: <DN19BWWOCZOA.13CEH4B1VTDU0@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] bind: Security fix for
 CVE-2026-19666
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <rsangam@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261116175500.328321-1-rsangam@mvista.com>
In-Reply-To: <20261116175500.328321-1-rsangam@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 22:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250856

On Mon Nov 16, 2026 at 6:55 PM CET, Rohini Sangam via openembedded-core wro=
te:
> Pick patch from [1] also mentioned at Debian tracker in [2]
>
> [1] https://github.com/isc-projects/bind9/commit/78175f9749fecdac4eb0d4b0=
8dd064968b4c55f8
> [2] https://security-tracker.debian.org/tracker/CVE-2026-19666
>
> Signed-off-by: Rohini Sangam <rsangam@mvista.com>
> ---
>  .../bind/bind/CVE-2026-19666.patch            | 113 ++++++++++++++++++
>  .../recipes-connectivity/bind/bind_9.18.49.bb |   1 +
>  2 files changed, 114 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-19666.pa=
tch

Hello,

This commit is from the bind-9.18 branch upstream. Instead of
backporting patches one by one, how about we jump to the tip to this
9.18 branch? That would put us at "9.18.50+git".

See: https://lore.kernel.org/all/DM4MPOPTHX9C.2IO3PVJDW950C@smile.fr/

Regards,
--=20
Yoann Congal
Smile ECS

