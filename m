Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0D8C52D7C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 07:08:52 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.14444.1724224129601664102
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 00:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AsV6Wmyk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42816ca782dso53423935e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 00:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724224128; x=1724828928; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KVRatUifxTWXqMTcgKfy/KEzKGaO3dl9gfqtXTH8rc=;
        b=AsV6WmykUsxU0PwqyKFacJZjXO8FzEYtYjsf+kNi3ada2bgjAQxkUUWJc5mCjHD1Ts
         Px42DUoDXLR1Vs8xNgcHQVDxjw+XbjNtP8x78jD3JEvZYnOvIA/3ioG2OJ2I30VxF9XP
         9X5v+0ypxUa2ma4TtnnforX8UK6DIOOd+etAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724224128; x=1724828928;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4KVRatUifxTWXqMTcgKfy/KEzKGaO3dl9gfqtXTH8rc=;
        b=f1+UmwgCBKbSf9YHWGPBXEeu7e7XUJwZFZjxZUzrC2ASCMTPxnJfJmnR3k3mV5hXXd
         NOBNgS5OCjSZExUOi2rhTo0apDPPpfToQeGV0pVBmVq7Rz/bUu9T1HdMHSzSCttrsvZB
         ugsSFYUpJfTrj5ofaxPlZcSFAERy9YYhhdnonmbWWwcpF+4LY7d1mJuF+ovXQ/bB9MnW
         lB4lcN24dO6ZmF3VFqzaHzSncnV6JwNz8AIEye+T2a+92XPgd7yw2OYnJnoU1uoh5G8g
         O/w+FkJRAtT+eaGwT039qDwIHBwIRVmr145XMdg6WiUSfg8qJaRvkqMxIWRh7HBHjv4g
         CQ4g==
X-Forwarded-Encrypted: i=1; AJvYcCUQE0Js56mMz5MXCeoVUOYeXY4IIgbOoHwK5iuvnkzS4JKdNd0hFTsV2M0RmdIC4/f3d4hdhSZpcedTWFqYhmpOIw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzwCIz7grOwqjzZkhrgjQlJ9Mz/JAcIwFCJxChKMqsC+j0hkWsD
	CJTjFjx07eNnxhaNHMl7OrunXN4EzVIfHL8SKbI2A/BIJgk1UWNy0q9oyh+WBRU=
X-Google-Smtp-Source: AGHT+IHj+vvX7bZ37zlNQnj+URU2uhyLrCSPXQ72BXPowjDFvg2nHKxeaqcrShZ3rSmYGJAEGCOyDw==
X-Received: by 2002:a05:600c:1e1d:b0:426:6220:cb57 with SMTP id 5b1f17b1804b1-42abd25de1emr9428565e9.25.1724224127853;
        Wed, 21 Aug 2024 00:08:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:91ef:3f82:9d0e:a987? ([2001:8b0:aba:5f3c:91ef:3f82:9d0e:a987])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718989708esm15068428f8f.70.2024.08.21.00.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 00:08:47 -0700 (PDT)
Message-ID: <710ec238fc73efaedfbdb3a06c4c57214b6d926b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] kmod: upgrade 32 -> 33
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2024 08:08:46 +0100
In-Reply-To: <1724142644-20746-1-git-send-email-wangmy@fujitsu.com>
References: <1724142644-20746-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 07:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203575

On Tue, 2024-08-20 at 16:30 +0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> 0001-Use-portable-implementation-for-basename-API.patch
> removed since it's included in 33
>=20
> avoid_parallel_tests.patch
> gtkdocdir.patch
> refreshed for 33
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
> =C2=A0...able-implementation-for-basename-API.patch | 136 ---------------=
---
> =C2=A0.../kmod/kmod/avoid_parallel_tests.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 10 +-
> =C2=A0meta/recipes-kernel/kmod/kmod/gtkdocdir.patch |=C2=A0=C2=A0 9 +-
> =C2=A0.../kmod/{kmod_32.bb =3D> kmod_33.bb}=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A04 files changed, 8 insertions(+), 150 deletions(-)
> =C2=A0delete mode 100644 meta/recipes-kernel/kmod/kmod/0001-Use-portable-=
implementation-for-basename-API.patch
> =C2=A0rename meta/recipes-kernel/kmod/{kmod_32.bb =3D> kmod_33.bb} (96%)

It looks like this has failures when manpages are enabled:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/7027/step=
s/14/logs/stdio

(selftest)

| checking for scdoc... no
| configure: error: *** scdoc needed for building manpages. Either install =
it or pass --disable-manpages

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6302/ste=
ps/11/logs/stdio

(docs world build)

Cheers,

Richard



