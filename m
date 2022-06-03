Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F989C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 09:57:56 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.5539.1654250270161847012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 02:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hxd2XdLp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id x17so9737580wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 02:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=26eUj7jXWP1MHvN8aywF6VWWSoZKFKiCkR4BTK8bjYg=;
        b=hxd2XdLpkrGeVHYkQ+aBq1kyJI61TEtHE4iw6Kb+Y6Gm0SeurD630E1QfMdi/bBtmT
         4T+mcYqvCHuQZdj6e81mqH2R0+39XJcznBvUYFzi/AAVJWeQYn/bCJWCUwBLDs/31itw
         kPFJclA30XC+K7dVKfLISopeZ8ESNxDjGlsvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=26eUj7jXWP1MHvN8aywF6VWWSoZKFKiCkR4BTK8bjYg=;
        b=f8bQnB+JAZ+Z7UXGP+T05tibFF9+9lgtEWq00QF6Oleq1a/SmmJEwX2w+BANHAP4pq
         E6gMCkcSSQfmLqf/LGu4zS8MRILrYjvz6eMZBTOthhHjVN/gVpubxxILWAAeYHHGWi9b
         XaDWOw8t8v2q3c+DxIJTSebU/KYNEa7uvGrQfHjeKWPEoVZRoBUQYqzZSxJpYanhCv3+
         Uy7fe3F3QCYy9BkkWYk81FOOWJo67h6qH2C8WEb/MqBgErTeaqf+YWZy4+C9ytHHLUQr
         JUP8lHlw4XC+/7pwxURoVaLJVVT3Ia7VkE6p8s4gh0jrCHsuEAvvaPJ2IXfgyjz1Ypm/
         UVzQ==
X-Gm-Message-State: AOAM5326nuF7LJydxURuH4QxoS2HPe8/u92mG6ettnCWXhASt4xRBsRM
	aw/mKWjT1lqJccZAKWpHzOVczg==
X-Google-Smtp-Source: 
 ABdhPJx2r1/hSvtMA9MpvteZOApGPtB8yy8JTBSknsaNjS3umaA4zHqfbBxDJVNZglpu4vptUg04EA==
X-Received: by 2002:a5d:5888:0:b0:20c:9868:9d94 with SMTP id
 n8-20020a5d5888000000b0020c98689d94mr7177958wrf.433.1654250268602;
        Fri, 03 Jun 2022 02:57:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2ef7:d396:b7d3:7f8d?
 ([2001:8b0:aba:5f3c:2ef7:d396:b7d3:7f8d])
        by smtp.gmail.com with ESMTPSA id
 j3-20020adfea43000000b0020d02262664sm6689617wrn.25.2022.06.03.02.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 02:57:47 -0700 (PDT)
Message-ID: 
 <63cc118edf35a358744f08c97f0f1272bbab4c90.camel@linuxfoundation.org>
Subject: Re: [OE-core] [AUH] python3-numpy: upgrading to 1.22.4 SUCCEEDED
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Auto Upgrade Helper <auh@yoctoproject.org>, Oleksandr Kravchuk
	 <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 03 Jun 2022 10:57:47 +0100
In-Reply-To: 
 <01010181200feacd-4006c0ac-b745-4599-9798-cc147f2ef12f-000000@us-west-2.amazonses.com>
References: 
	<01010181200feacd-4006c0ac-b745-4599-9798-cc147f2ef12f-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 09:57:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166516

On Wed, 2022-06-01 at 16:18 +0000, Auto Upgrade Helper wrote:
> Hello,
>=20
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *python3-numpy* to *1.22=
.4* has Succeeded.
>=20
> Next steps:
>     - apply the patch: git am 0001-python3-numpy-upgrade-1.22.3-1.22.4.pa=
tch
>     - check the changes to upstream patches and summarize them in the com=
mit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --ame=
nd
>     - send it to the appropriate mailing list


Has a reproducibility issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/957

Cheers,

Richard


