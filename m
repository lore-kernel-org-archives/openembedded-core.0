Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93A5C32771
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 11:27:51 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.5199.1663759670693012064
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 04:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YOcEa/Gm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 d12-20020a05600c3acc00b003b4c12e47f3so3562248wms.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 04:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=vBha124l0FnOVmcGU4DUzdbcDCWUdVOque6psRQ/Jpc=;
        b=YOcEa/GmGXA2e9i8Iu0aAb1FuZL2k3/01zTWX0ctDgj+fKVp+DAPx+kZjgijjpe6IP
         sQ3wUOvz/TzLxXkOU7c0j1yS1RVAgPOWUS5FQEIuJIUjB1q9ViKIkF4BSWJ8hHTS/h2b
         Ev6SVl+rM2bY5I99Knv7eLntYBFhGI3AiUApM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=vBha124l0FnOVmcGU4DUzdbcDCWUdVOque6psRQ/Jpc=;
        b=NYJohFGR+J0G9RKonNgRAZSv6mrSNs3HhBvg0an50z8aMSXyArVffuixlJVzHunEbg
         QKNkvPsCU4lCzyaujJXsdWjJbRwLMG2xOHRAgKqpUs1qRNUCEWuuSFfdRcErL+eQlkGc
         JUBMMMLU2gh+X+ZmvETWxG0pfn3L50r/GOY/lHGUGaO88swGHpHI2z/e40I0fZMcSzNg
         6R9GBdRJPURyRfEJyo/8cRM6bf91tAue2lAeclHumDPjta8oevoCrnYFq4LR9Yjh/Yde
         Zws2rKz/awGyXte0K+4/evcUzxLrZFOVteEaIfpIjUQ1avlTVXIus/N1P6JcXMSBTtuk
         aKIw==
X-Gm-Message-State: ACrzQf136w4ytH5q4zzrWtmgWNkYacyx04U1Eg4RK05T7wGISLG9qyKd
	JXLkUClLAivzJs0aZ9E3R4BlLA==
X-Google-Smtp-Source: 
 AMsMyM53qAQN8eOfJik+UvAtTq9XSzNEATMYcOzDJx1UdvSO065VWKksAoyUpMLItaKrpl5fgGLFGQ==
X-Received: by 2002:a05:600c:3595:b0:3b4:8378:98d2 with SMTP id
 p21-20020a05600c359500b003b4837898d2mr5785937wmq.64.1663759669012;
        Wed, 21 Sep 2022 04:27:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b663:b06:b4c5:e314?
 ([2001:8b0:aba:5f3c:b663:b06:b4c5:e314])
        by smtp.gmail.com with ESMTPSA id
 c17-20020a7bc851000000b003b47575d304sm2968971wml.32.2022.09.21.04.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 04:27:48 -0700 (PDT)
Message-ID: 
 <a44dfb281cdc1993d5ebe0bfa4cfe5ab915a0b41.camel@linuxfoundation.org>
Subject: Re: [OE-core] [oe] [meta-oe][PATCH] bc: Add ptest.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yanxinkuan.FNST" <yanxk.fnst@fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Sep 2022 12:27:47 +0100
In-Reply-To: 
 <TY2PR01MB415557D074E6D1FF5A605BC8934D9@TY2PR01MB4155.jpnprd01.prod.outlook.com>
References: 
	<TY2PR01MB415557D074E6D1FF5A605BC8934D9@TY2PR01MB4155.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 11:27:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170946

On Mon, 2022-09-19 at 06:44 +0000, Yanxinkuan.FNST wrote:
> Provide a patch to enable the ptest function of
> the OSS 'bc' by reusing the original test of the OSS
> itself with small adjustment in the 'timetest' script.
> =C2=A0
> This ptest was placed in the PTEST_SLOW queue since it
> takes upto 48s to execute on the qemuarm.
> =C2=A0
> Signed-off-by: Yan Xinkuan <yanxk.fnst@fujitsu.com>
> ---
> .../distro/include/ptest-packagelists.inc=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 1 +
> meta/recipes-extended/bc/bc/run-ptest=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 8 ++++++
> meta/recipes-extended/bc/bc_1.07.1.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 28 +++++++++++++++++-
> -
> 3 files changed, 35 insertions(+), 2 deletions(-)
> create mode 100644 meta/recipes-extended/bc/bc/run-ptest

Unfortunately the encoding on this patch was problematic and all the
leading whitespace was removed meaning it could be applied. Could you
check your email configuration please and resend?

Thanks,

Richard

