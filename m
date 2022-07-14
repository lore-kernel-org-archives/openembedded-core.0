Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B61C43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 14:06:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.7970.1657807608803377755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 07:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LTfSNsLs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id b26so2741273wrc.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 07:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:content-transfer-encoding
         :user-agent:mime-version;
        bh=cPNZxKgvQ9JyEuIgUcabCtISjbIjz5suZPZgrFx1fnI=;
        b=LTfSNsLsNRelLwn36OV75gBLFBHWd/DvlrT3sxZ+DNMUo9ShpDepzOfrjH91H+7apB
         ApEFZJogZOIpeJZCPvWUMdVUvtBmMeB2K5fwNzlj5ag/fNcrfkoJTdAWpyjiOUy2sgZG
         XpH0tcGSBSKC5RuRNjTrx65bE9/SbtGnbCrs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date
         :content-transfer-encoding:user-agent:mime-version;
        bh=cPNZxKgvQ9JyEuIgUcabCtISjbIjz5suZPZgrFx1fnI=;
        b=hPgLJOFdR08ZlTmGtWcbaHuDWCUYTGw93MLZJ5EZ6ird0G24mH+ddI8RADyMyTTxaj
         T0Hf447ZFuJQeE7iAjWTPVosGXnHQP4Tg+8k3tHBgIlw74u4QZXc5fDleiXGYhGBsROG
         0WGFn3/9g6XN4PhyKrMALZyhq8Y7Nq33ykX9WCcT17dwqDufrJaGA/SyOqjvOmc+K8q7
         g8rQCz6VAAHz/j5irMi3xbADKkwyf1bjvMiqdxJ6ytL9y3Ee6zl4qtPTFVaw7Fpz9q4P
         szYC0CkmwvVYALuYhco3gfrQ9l6t692+ncG40F8PA8jbcT8bYL1s15XsTQqKwoDdboKt
         EHFQ==
X-Gm-Message-State: AJIora9x7CV558cbHINDMJTJZr5VcaFy0mGyjKJJc1oDAzT/WuyRE/N/
	+9r4boennASE6tNyp0C8GTHjsA==
X-Google-Smtp-Source: 
 AGRyM1voT0xrHL4JDJY7qp/FOzqG0C2KpiQBdofbHSDSHy+etufUgspCi32CL6yUGKYL4QP4bqLElA==
X-Received: by 2002:a05:6000:1acf:b0:21d:b410:59b2 with SMTP id
 i15-20020a0560001acf00b0021db41059b2mr8772927wry.31.1657807607181;
        Thu, 14 Jul 2022 07:06:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c037:3be3:5ea0:9a64?
 ([2001:8b0:aba:5f3c:c037:3be3:5ea0:9a64])
        by smtp.gmail.com with ESMTPSA id
 az4-20020a05600c600400b003a2ebb087fbsm2217587wmb.0.2022.07.14.07.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 07:06:46 -0700 (PDT)
Message-ID: 
 <10766d9396872f030fdd47440d4089956d951bb7.camel@linuxfoundation.org>
Subject: Kernel debug info
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Alejandro Hernandez Samaniego
	 <Alejandro.Hernandez@microsoft.com>, Ross Burton <ross.burton@arm.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jul 2022 15:06:45 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 14:06:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168034

Hi Bruce,

I've been wondering why some kernels show up the source files issues
and some don't.

In order for it to happen it seems we need CONFIG_DEBUG_INFO set. That
appears to be set by default for beaglebone but not for qemux86-64. I
wasn't sure where/how that is getting pulled into the BSPs, qemu or
otherwise. It is more important now that create-spdx relies upon it. I
know you can manually do it with something like:

KERNEL_EXTRA_FEATURES:append =3D " features/debug/debug-kernel.scc"

So just to be clear, to reproduce the kernel warnings I think you need
a build which:

a) has CONFIG_DEBUG_INFO set (e.g. beaglebone-yocto)

b) has buildpaths in WARN_QA:
https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D8c5ac30a987c=
40c41df8a483f353a22fe487789e

c) reverts the package.bbclass change:
https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D02b811eba6e2=
8e940b1e219709c2be82ce047fbb

d) doesn't build from existing sstate as you wouldn't get warnings
shown so a "bitbake linux-yocto -C package_qa"

at least based on my current understanding anyway.

Cheers,

Richard

