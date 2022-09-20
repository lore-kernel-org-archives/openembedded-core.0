Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F19EC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 09:39:37 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.9869.1663666775984195233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 02:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ja+pIHIL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id e16so3302245wrx.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 02:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=B5pV9qrTusjLrk39ORo/hC9YuENHJOr/TgZWXMCgf2U=;
        b=Ja+pIHILJBjl4SyB/xdsZalDESnPxMYy5oKoVcin8+vWRR+IsUJt5adZQP2h3BSJSX
         u+0JTQhCd/YuepXz4sZSqXtve0jBLkX2lM8jhHxXdha6NjZ+wHslg8qFQ6GP72S5I7Rx
         ywr9yG6XlSkXBAy42vNmanB9WRfuwuRMNJ3Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=B5pV9qrTusjLrk39ORo/hC9YuENHJOr/TgZWXMCgf2U=;
        b=WVomAFO8dn4vWhtdwDT2BjUJjEQJSUISNtKs6rScEt8uy+z5vQPoy0WLvbGKrBRntJ
         XgDoJMsCKiy4s7CHAU08fUVpHRDDTrYYzd/OVl4nkFcTBjsz7TVSmlZeffUCjKuy5iX5
         +qRSPgs/mwLTx3vygPPBzwqa4jA0FCF6YRSsPBBU2aKD30d6YMJRJtOcKsZlDOF+PAOl
         BqVd5+uH2xSibbF7O7lRufyZY0D8OpSGzd8mwm8srRgj81n4lWZ7socVW9nRLtLPn3ab
         SFWVamCIZtyWuiSHG7T73LUTzPEQSPrhLIbl93wQh8u6aL3ZGYoW50R6tXBTP+mjcJGy
         JWqg==
X-Gm-Message-State: ACrzQf0a2HV10bdYgt7znt6id2NKAmI3exw7/m3ae6mySFVmdbCJIYYT
	3eIDTNjejyXiz4+wysWOQ4Y6UA==
X-Google-Smtp-Source: 
 AMsMyM5YnY//wnA+SrMjV1m2WmMxTWjf/b8g7/3hz68SWMn7o0Y8QZl3GJau6HvpXVn8/X2yq8mfjQ==
X-Received: by 2002:a5d:4887:0:b0:226:ed34:7bbd with SMTP id
 g7-20020a5d4887000000b00226ed347bbdmr12701893wrq.561.1663666774174;
        Tue, 20 Sep 2022 02:39:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d363:331f:b5a4:a50a?
 ([2001:8b0:aba:5f3c:d363:331f:b5a4:a50a])
        by smtp.gmail.com with ESMTPSA id
 n33-20020a05600c3ba100b003b3401f1e24sm1910155wms.28.2022.09.20.02.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 02:39:32 -0700 (PDT)
Message-ID: 
 <66d8e5eed72d41461ea5ca8367480404f26f182b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcompat: Add __getauxval wrapper needed on
 aarch64
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 20 Sep 2022 10:39:30 +0100
In-Reply-To: <20220917211339.2536726-1-raj.khem@gmail.com>
References: <20220917211339.2536726-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 09:39:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170888

On Sat, 2022-09-17 at 14:13 -0700, Khem Raj wrote:
> Update SRCREV to bring in few bug fixes
> Install a .so symlink which could be used during linking
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../musl/gcompat/0001-auxv-new-module.patch   | 59 +++++++++++++++++++
>  meta/recipes-core/musl/gcompat_git.bb         |  6 +-
>  2 files changed, 63 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-core/musl/gcompat/0001-auxv-new-module.p=
atch

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5873
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5890

Cheers,

Richard

