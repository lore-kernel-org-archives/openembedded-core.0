Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2D4C46CD3
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 13:18:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.21274.1703078332738545149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 05:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JIyZR4PN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40c3ceded81so57036155e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 05:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703078331; x=1703683131; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PDHjBOgbkDxXuZ02a5072iLAZFRts7r4AtP9Su101WU=;
        b=JIyZR4PNGyyhpnli2adlkWGyynDfNui0qS9naQlLUxypUZ9/YfYAM/waazvAMSpQqb
         +Z+5sC+fAPAs27yO0nk8ZD027ZRxgByp4nRBM6YrjNFQ77rqtQCMPbM9TttQwD7xUHzs
         eBCWFvQI/h56tkpNClfxcS3Vlwl10uKKMO148=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703078331; x=1703683131;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PDHjBOgbkDxXuZ02a5072iLAZFRts7r4AtP9Su101WU=;
        b=cRM3d1waqbiyRMs40n8Ylz7zaYkU/9N9x7geHQ+Dzzpa5cZpMY8crIzPwqdEolWl1I
         nPAPk0hqaYzDsLfo9zyf3Yw3WJ7qEv7O25sa0yLAEdiGwL5BKzh6qvJ81+VUJzhV7UnJ
         Z/PebTNMmU9WkAYgKPmbw9E1vY3qgot5njV68VOxD7eSmrKxWLmpf4SF34vEkvwQ9wIb
         2n7w4ERm1VgNJWJi5UyJya2mvLVzSacL7a+R+8vHUJ/yt0NlxItmK12KQ6azf3PwQ+zH
         DQWi9OZj4Gq3L50kCh7gy84dwjHX3CvjosiCD+hrBkN2q5tKekfEFNJmR0Zq19G+xCz4
         laqg==
X-Gm-Message-State: AOJu0YzrYrGoPdjgWejVgsNpQOKmJkC1WDr0fGxFCkX2zATJeZfa9NzI
	bhIxP1qXeya/CtKfQhsNivVlNqKBOKufWrDA4ns=
X-Google-Smtp-Source: AGHT+IFrafNpxNO3yY/WFPUNBmG2S9AceunujOVniXyLF+sGNuWJTaj4NDI3qngoUSEVFKPpZts09g==
X-Received: by 2002:a05:600c:600d:b0:40d:2f6f:8f09 with SMTP id az13-20020a05600c600d00b0040d2f6f8f09mr1008921wmb.80.1703078331071;
        Wed, 20 Dec 2023 05:18:51 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c9b9:95cc:382c:f70c? ([2001:8b0:aba:5f3c:c9b9:95cc:382c:f70c])
        by smtp.gmail.com with ESMTPSA id p4-20020a05600c468400b0040c3dcc36e6sm7319617wmo.47.2023.12.20.05.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 05:18:50 -0800 (PST)
Message-ID: <8aa05aac901871cd1fea247670af35ed462f35bf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [kirkstone][PATCH] nativesdk-sdk-provides-dummy.bb:
 Update host tools for rust-cross-canadian
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Deepthi.Hemraj@windriver.com, "MacLeod, Randy"
 <Randy.MacLeod@windriver.com>,  "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "Gowda, Naveen" <Naveen.Gowda@windriver.com>, "Moodalappa, Shivaprasad"
	 <Shivaprasad.Moodalappa@windriver.com>, "Kokkonda, Sundeep"
	 <Sundeep.Kokkonda@windriver.com>
Date: Wed, 20 Dec 2023 13:18:49 +0000
In-Reply-To: <PH7PR11MB644963CE328B3CAE639127BA8D96A@PH7PR11MB6449.namprd11.prod.outlook.com>
References: <20231211122613.2429111-1-Deepthi.Hemraj@windriver.com>
	 <cd25a9d6-8422-4539-82a0-1418ffc6b52a@windriver.com>
	 <PH7PR11MB644963CE328B3CAE639127BA8D96A@PH7PR11MB6449.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 13:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192800

On Wed, 2023-12-20 at 13:13 +0000, Hemraj, Deepthi via lists.openembedded.o=
rg wrote:
> I tried adding nativesdk-libstdc++ to DEPENDS:append:class-nativesdk
> =3D " nativesdk-libstdc++" but the issue is still reproducing.
> =C2=A0
> The nativesdk-libstdc++ is not having the GLIBCXX_3.4.30 symbols.
> Below cmd shows only GLIBCXX_3.4.29.
> "strings /ala-
> lpggp31/dhemraj/kirkstone/5082/poky/build/tmp/work/x86_64-nativesdk-
> pokysdk-linux/rust-cross-canadian-x86-64/1.59.0-r0/recipe-
> sysroot/usr/lib/libstdc++.so.6 | grep GLIBCXX"
> =C2=A0
> So, I added libstdc++.so.6 as dummy in <<meta/recipes-
> core/meta/nativesdk-sdk-provides-dummy.bb>>
> =C2=A0
> Also in the gcc documentation
> (https://gcc.gnu.org/onlinedocs/libstdc++/manual/abi.html) I see
> that, libstdc++.so.6.0.30 is provided by GCC 12.1.0 but on kirkstone
> the gcc version is 11.4. I think libstdc++.so.6.0.30 is not
> supported.

That suggests that rust-cross-canadian isn't building against our own
libstdc++ but against the one from the host instead. nativesdk-gcc-
runtime (which from memory contains libstdc++) should be being used
rather than any host dependencies.

Cheers,

Richard


