Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CBEC4167D
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 15:55:48 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.2467.1698767739799010657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 08:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LnRFKpFU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40839807e82so35057245e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 08:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698767738; x=1699372538; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUo49M9eo65mqsQLH5D/Wzdj1b3+11RjSaYu2tZcscg=;
        b=LnRFKpFU8xOsV50csZoCC0KIOS3d8oucTJ3xJzAOLY/7RycAT7ymQWYs3B67eirGD/
         YYfL6moUjj3Sy1Xdw1LzwokNG8Xe00YFTKbvqsQBIsLVMtRdSPnHnIRHslEgZMKgvvqz
         WiGBlIXtbQbxRhAZY6XjiV0HyP+lR8omGVwVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698767738; x=1699372538;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kUo49M9eo65mqsQLH5D/Wzdj1b3+11RjSaYu2tZcscg=;
        b=Dbwucu5z2Qwjnbj1RX30p3vU3OtmWjui+5jEoYdCnStvMYj8gPgr2ZDUKW7Cy0I5P8
         OXVqTVyzAGbqu+DoK2fV561fwpLH8H54zlPgC0WLWV6HpMzfnz5ZI0cGIh+aoiFAdguR
         yr2qP6rQojo5Ro5BZ53B6UfTxI1a8kong2NX0joMYW06wmRNL8NwlgBRaEbvqw5zr1vA
         Qd3m+4+eE2NTSUhA2v1v0P8FdNy0ZLbO7TJwg4ePw7dRPbsiqrxCHnIp67f0gQKb7fZg
         JQ3zN7hhq8GyANjw4Ag4IcDlAsEOUFAfM9tB6JfCyzCr/m/YfNnsjgHwk5SBbqZj/yPk
         dVeA==
X-Gm-Message-State: AOJu0YwvWmULT+N10cEQGdNmARLEHRk9xYophdhs1cwRyT6QYnw4UHg+
	08ypp2+bQcc4PGOyuenDx9BLxQ==
X-Google-Smtp-Source: AGHT+IGKqHOsf7t7TB9WkkSzkZTzDbhHrWMqFtZKXwGkZyZqS+oZoA9UMeRYUPsj2NwT8l6EUDe9wQ==
X-Received: by 2002:a05:600c:4e92:b0:406:51a0:17ea with SMTP id f18-20020a05600c4e9200b0040651a017eamr3387404wmq.10.1698767738176;
        Tue, 31 Oct 2023 08:55:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9850:4974:d357:58d5? ([2001:8b0:aba:5f3c:9850:4974:d357:58d5])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c248800b004060f0a0fdbsm2059318wms.41.2023.10.31.08.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 08:55:37 -0700 (PDT)
Message-ID: <b547b30fb6a4cf5c2cf8f31e34802cc154560980.camel@linuxfoundation.org>
Subject: Re: [OE-core][mickledore 0/5] Patch review
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 31 Oct 2023 15:55:37 +0000
In-Reply-To: <cover.1698766338.git.steve@sakoman.com>
References: <cover.1698766338.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 15:55:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189863

On Tue, 2023-10-31 at 05:35 -1000, Steve Sakoman wrote:
> Please review this set of patches for mickledore and have comments back b=
y
> end of day Thursday, November 2
>=20
> Passed a-full on autobuilder:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6123
>=20
> The following changes since commit e9ca1405b732720ff72d379e0262a78bfd2e7d=
53:
>=20
>   busybox: Set PATH in syslog initscript (2023-10-19 04:34:38 -1000)
>=20
> are available in the Git repository at:
>=20
>   https://git.openembedded.org/openembedded-core-contrib stable/mickledor=
e-nut
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
mickledore-nut
>=20
> Peter Marko (1):
>   openssl: Upgrade 3.1.3 -> 3.1.4
>=20
> Xiangyu Chen (4):
>   grub2: fix CVE-2023-4692
>   grub2: fix CVE-2023-4693
>   shadow: Fix CVE-2023-4641
>   linux-yocto: make sure the pahole-native available before
>     do_kernel_configme
>=20

Some of these are not in nanbield :/

Cheers,

Richard


