Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73750C74A4B
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 08:54:33 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.15346.1678697669925008164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 01:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ahnFkWZ2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id l12so2217744wrm.10
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 01:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678697668;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m02RajaxZJz0jULZdycd6uDkg5ZYWYOeH9jS6t2e4UE=;
        b=ahnFkWZ2zE1DPkvG3L4gZkE2kkKxK99GPLT8AHraOkBtDO4xmtKH8TPlod6EINhJDK
         LIlCeG6PJPmCnsZP/jL7Hi+EHBTw/QzfE1dZm/sORgopOE1hrQ1rXiIgEFpX3H3+G4ZE
         BgA+7i6hogBlxyo/6RYl1aBjQxditjZH5PB58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678697668;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m02RajaxZJz0jULZdycd6uDkg5ZYWYOeH9jS6t2e4UE=;
        b=HiVbUB7p2vnpwcIGVopdB1y7s1K3vnbXZxl54wUkUhZmsVS1B4xtxY5cHt0VxaFK1y
         RCLy2lDbjpowS5mQ+nt8tG9QMcfPvk0ZFNLA9u1x6JOpd2tTKIFsyMXjdLssWQeum0CX
         ZAOsDkVt/jJ+BhIcsuv/35AacWJdVhHaftKbM80KpSDPEuZLOyyuKqc/2coecOfKvEKc
         vKWAuGjiM+YeK3kaQE3DLjYk6Di3bB3WX5a6xiHOPidh013QPZqe0GBv0WyzzeXy3xVN
         NxwMzkyq9PaALZHYvkyYd3bj9t/QIWJ8OJFq0IKk0/Rrvu774ihGTxLsaUYnq04c4YSF
         S3sw==
X-Gm-Message-State: AO0yUKXuQSBpGXBLm4enDfh/chH0adVaUo6y4JkcLaCzGq5ptIZD9W7m
	sjzGJ6St4vE7I96b5Yr8+VJb+89ZteC4JgtDo/g=
X-Google-Smtp-Source: AK7set/MvVoZeQLo60u0xf61njOslAG68upopUtw1uDj6Mk1wCNF47GC+dmNumovgfMoYdayssvUbA==
X-Received: by 2002:a05:6000:181:b0:2ce:aa2e:b864 with SMTP id p1-20020a056000018100b002ceaa2eb864mr3272348wrx.27.1678697668170;
        Mon, 13 Mar 2023 01:54:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:62e:a5f3:301e:14e1? ([2001:8b0:aba:5f3c:62e:a5f3:301e:14e1])
        by smtp.gmail.com with ESMTPSA id a10-20020adfe5ca000000b002cde25fba30sm7531369wrn.1.2023.03.13.01.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 01:54:27 -0700 (PDT)
Message-ID: <ca4cbe531fc89db118bb6e3b9d0e2be122ec3168.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] oeqa/selftest/sstate: Merge sstate test
 class with tests themselves
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Mar 2023 08:54:27 +0000
In-Reply-To: <174BB12595FFBC4A.32367@lists.openembedded.org>
References: <174BB0E170CBB178.32367@lists.openembedded.org>
	 <174BB12595FFBC4A.32367@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 08:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178416

On Sun, 2023-03-12 at 14:07 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Sun, 2023-03-12 at 14:02 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > Having this base class as a separate file is just confusing. Merge with
> > the rest of the test code.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> Whilst I stand by this series as a set of patches and think it is a
> good idea, it seems to cause failures in the wic tests:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4948
>=20
> That is somewhat worrying. We'll need to work out what is going on
> before it can merge :(

It reproduces with:

oe-selftest -r recipetool.RecipetoolTests.test_recipetool_handle_license_va=
rs wic.Wic2.test_biosplusefi_plugin_qemu -j 1

looks like something tinfoil related. These patches trigger it due to
changing the test order.

Cheers,

Richard



