Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A259C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 12:18:28 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.9188.1651234705757148798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 05:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e2fV1Mgv;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id z19so8841538edx.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 05:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=U2sq0Oj+SNb42mulPTWw8kTed7xWyYrff8Ir3K0Hn0E=;
        b=e2fV1MgvW5khdTYzpRiQayI8EDIF5tr7nTfGGUzKZ58Yv3a1OJZEc/quMhy52uIXg/
         lueT68kAtKsSdfT/xRoCSVGdUF/b8ApiyhJDRFGvxPF/r+Qqolo2spKgqGeePCmcLFu4
         hJbVy8C6oILNK49+T+6vc7Eu9VrJBXJEF++ncgNzjc4BHYxAKeHoj82kN/dDl623QlBl
         Hx4UrHmdt+99dDb0ByvtuD6jwEzfXTbA616SWcbMtU67qbQIAtrsnxH1uGK9W7v60Alb
         0NhfOJyuGU/t/69Lcir6TNkb5jUD+gT0xj751utmE9m4i/3VRuHFgf9ZRQ95VKmUfv9y
         tzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=U2sq0Oj+SNb42mulPTWw8kTed7xWyYrff8Ir3K0Hn0E=;
        b=IYSKAj564IVp7ZCz0ZPH6LQuWTvZZ1pQzSw4i3TZNNW0/mGz4Z0QgcK8ODdAxTRgx5
         HXraa4f4O4ixlIATRawmJ5JE99JxNOaRSbpA57xblEVC9Jtnr+ihoYB7U4za1Sa5Tf/P
         eX35+LHzTHadgVvTH+A5zmOZi3t6ZK/r0mwB2bkIocxWixGsyUf/4lRB4YL0ZjgrCniG
         TTri7CL83iKBjcwZtwJZSVcnDxtpBqzeU7EcfSk8rti+0G9MQcoociyKSJwrejexqFrx
         rtRmCX2Mar+2vOv8JKvd0StZy8uPEbJSvflaDucRBf1NOLRR7l2NMTRlqXv+lrLqqRJr
         niqA==
X-Gm-Message-State: AOAM533Eshm/8VOLLdHto0hIVFq7wWVnMeWGVCkJIPl6PWBDxlvEFBTs
	aKirSa1e7OO+MfPP3PCbd1ciqjunxZLtVA==
X-Google-Smtp-Source: 
 ABdhPJw8p4OxOyq1WSn778VgNSCkp2czhm5MeL0j3HDeFmRM7OpR6oEL9tFQlbvZGsyk4gRSQ18Tsg==
X-Received: by 2002:a05:6402:4414:b0:419:28bc:55dc with SMTP id
 y20-20020a056402441400b0041928bc55dcmr41232165eda.130.1651234703886;
        Fri, 29 Apr 2022 05:18:23 -0700 (PDT)
Received: from smtpclient.apple (host-82-60-178-66.retail.telecomitalia.it.
 [82.60.178.66])
        by smtp.gmail.com with ESMTPSA id
 i23-20020a0564020f1700b0042617ba6382sm2855461eda.12.2022.04.29.05.18.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2022 05:18:23 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [master][kirkstone][PATCH v2] create-spdx: delete virtual/kernel
 dependency to fix FreeRTOS build
From: Davide Gardenal <davidegarde2000@gmail.com>
In-Reply-To: <20220426134908.520502-1-davide.gardenal@huawei.com>
Date: Fri, 29 Apr 2022 14:18:22 +0200
Cc: Davide Gardenal <davide.gardenal@huawei.com>,
 Steve Sakoman <steve@sakoman.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B1A86329-AB3D-428A-884A-D55028964FFF@gmail.com>
References: <20220426134908.520502-1-davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3696.80.82.1.1)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 12:18:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165007

I saw that this patch was not included in the kirkstone backport list. =
Could you consider to add it please?

Thanks!

Davide

CC: Steve Sakoman

> Il giorno 26 apr 2022, alle ore 15:49, Davide Gardenal =
<davidegarde2000@gmail.com> ha scritto:
>=20
> When building FreeRTOS this dependency generates an error because
> bitbake cannot find any provider for "virtual/kernel".
> =46rom a dependency analysis the task is executed indipendently from
> this so it can be safely removed.
>=20
> This patch has been discussed in this ML thread:
> https://lists.openembedded.org/g/openembedded-core/topic/90602531
>=20
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
> Updates:
> - v2: Reword of the commit message
> ---
> meta/classes/create-spdx.bbclass | 2 --
> 1 file changed, 2 deletions(-)
>=20
> diff --git a/meta/classes/create-spdx.bbclass =
b/meta/classes/create-spdx.bbclass
> index 28fc449636..9979c1d70e 100644
> --- a/meta/classes/create-spdx.bbclass
> +++ b/meta/classes/create-spdx.bbclass
> @@ -35,8 +35,6 @@ SPDX_SUPPLIER[doc] =3D "The SPDX PackageSupplier =
field for SPDX packages created f
>     is the contact information for the person or organization who is =
doing the \
>     build."
>=20
> -do_image_complete[depends] =3D "virtual/kernel:do_create_spdx"
> -
> def extract_licenses(filename):
>     import re
>=20
> --=20
> 2.32.0
>=20


