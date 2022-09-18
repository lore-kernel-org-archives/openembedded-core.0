Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD641C54EE9
	for <webhook@archiver.kernel.org>; Sun, 18 Sep 2022 10:15:20 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.7353.1663496119696925184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Sep 2022 03:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TjFCC9v1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id bq9so42778743wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Sep 2022 03:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=d3w21Euojxa1F+AET/iNpX3/dRk36GchqF2LC/vpKq4=;
        b=TjFCC9v1rDmK2cDwlaicZWlKs9Q2KOdURSssGGOHHNvig6lc1guFCWjNN8P8RmjSEv
         vIOGg7CPy4bpbom4jZpnMgYvO+7nyx0RqbYEQDN8vuGhDzuPV89mMojF0h3vYIt3TubS
         uPaz74xSg5a3IpQho1XixAxe23bKwxCCJ8djQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=d3w21Euojxa1F+AET/iNpX3/dRk36GchqF2LC/vpKq4=;
        b=q81FN5WDicpDG+hoVMimoyOGnDnUk1kGVwG4dLCAvem9dW50RMie1n+De4rYhooDia
         sMvQQ1HVWRzGDukGMh+1XTKLrq+lvVOaPzt5WXrU8csLPerXKYeHpRf1WFxpZc55F0vC
         /Wso3Sdi8G30rdF1EHFWOI8gYRYqfxkwXQW6qWfiCpX2OvbrQjFmTFRvpuGBkgVks02q
         iYmbgoxfWC073GnSj1w3dd5LLsy6DDdC39LYEAqqJvXTb5nj86XwJBMoLh2qtA5sAw5G
         PGwwoU49gkMJZZ1Y9Qm8wyHygmncqYDGQwapwj3GFyQKR5Xjw5mLR6PWZD1OyExUXbGM
         HHxg==
X-Gm-Message-State: ACrzQf3AoRjNOstqHf2yqxQ4PKMHNq0hikqPh86jFqMf/RR7TFHgCCZD
	Dq8TQ/25ldGMdUFIFyqJAYanwPBj6xiQqg==
X-Google-Smtp-Source: 
 AMsMyM5LXMREeI90mnAkVeJr7BubL9u8r0EcG6AiT+bxWcNg1XuGKvsby47jl1jno6mCsCMdkkW46Q==
X-Received: by 2002:a5d:5846:0:b0:22a:f7d2:9045 with SMTP id
 i6-20020a5d5846000000b0022af7d29045mr1704992wrf.250.1663496117713;
        Sun, 18 Sep 2022 03:15:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2ac4:7676:6c59:33f0?
 ([2001:8b0:aba:5f3c:2ac4:7676:6c59:33f0])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a5d6ad0000000b0022a3517d3besm10346064wrw.5.2022.09.18.03.15.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 03:15:16 -0700 (PDT)
Message-ID: 
 <4509b1f970eb8a6561f60f752d64105a1d4d5e7e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] rpm: Upgrade 4.17.1 -> 4.18rc1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Sep 2022 11:15:15 +0100
In-Reply-To: <1715AA01EDB7F002.25944@lists.openembedded.org>
References: <20220917134914.1299532-1-richard.purdie@linuxfoundation.org>
	 <1715AA01EDB7F002.25944@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Sep 2022 10:15:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170844

On Sat, 2022-09-17 at 14:49 +0100, Richard Purdie via
lists.openembedded.org wrote:
> rpm is close to release and give our release timings, update to the
> rc1 of 4.18.
>=20
> Includes fixes for CVE-2021-35937, CVE-2021-35938 and CVE-2021-35939
> which can't be easily backported.
>=20
> Refresh patches and drop the error.h patch as error() no longer used.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Looks like the changes upstream (probably related to the security fixes
) lock up during do_rootfs and do_populate_sdk in
rpmPackageFilesInstall() which calls into pseudo's openat64.

Cheers,

Richard

