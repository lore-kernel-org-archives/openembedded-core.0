Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7E2C61DA4
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 13:39:21 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.6005.1675517952725612217
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 05:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gREc8jex;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ba1so2765927wrb.5
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 05:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cx2RbtPk5gWWkU1qEWaSZGd0h/VaeifIloHF3vkQRpA=;
        b=gREc8jex9/BtkEmPeumB8+6PxxlLB8P3ZpTk6RW3sUHQrtGNlxzjfx7h72XMv7syeP
         bgk9HSEw1lgg24LJPzEF7Tv5FE9xwIRyWcWNYal8bDkSGsUjpMARVy2mtwZhJ0+NoTHT
         oRCYKwHn0VBR+b/PYc337a6Yhr/+rnJrxbkso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cx2RbtPk5gWWkU1qEWaSZGd0h/VaeifIloHF3vkQRpA=;
        b=7cVTZ3vgqAX6hrTsr3LrBkWvwQmY3cUV0vGAaoCg1FwfJBksbP4mjMPvWOtt504xCz
         lobzecwvcTdZglyPy0f6ZgJT+dh07YgWRa2eSR0wtJtGGwuQstyAdY+4aUFGS4y9dL93
         YXCLv3w1XH+4MQ5szDzIvfKMnA7o2H1rzOuiaqcbrErWPyApjBG8R6ZYLpgk9IPVUQ40
         EPve8d7E2FG4XaMqojjzfOf8G+tqr9uOp6mb/I9cXDWsWzqqmDZ29wUJFyOT1K6OdHoi
         qZ6sfRVpoApVtkY2Zh/oFozvMKuK0Z9LUujuKPrCz2H3bUwJyX/UXvORSb1gADkgbB28
         c4bA==
X-Gm-Message-State: AO0yUKX7IpkkcwLLf2tfAYjQILJiovEfFf+vOUCJGPUdjuBw+1HLsLIZ
	gPDTISWFoU17TCAT+BbJgME+LA==
X-Google-Smtp-Source: AK7set9kjhznWqkn066ls3WswLqorAfjE8Wh9M3E7ZjITU2RHw6qwBJZEdzPZxXpZxZub7fbHQQ0UQ==
X-Received: by 2002:adf:eac5:0:b0:2c3:dc42:524e with SMTP id o5-20020adfeac5000000b002c3dc42524emr2329467wrn.10.1675517950835;
        Sat, 04 Feb 2023 05:39:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b45c:7b35:1c6a:a06d? ([2001:8b0:aba:5f3c:b45c:7b35:1c6a:a06d])
        by smtp.gmail.com with ESMTPSA id n3-20020a5d6b83000000b002366553eca7sm4371446wrx.83.2023.02.04.05.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 05:39:10 -0800 (PST)
Message-ID: <a192a08e154f2f5cdd17bd07e5a447cd24e096c8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] perf: Enable debug/source packaging
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 04 Feb 2023 13:39:09 +0000
In-Reply-To: <Y92KcoU37Jdr33iq@mail.local>
References: <20230203165203.1145313-1-richard.purdie@linuxfoundation.org>
	 <Y92KcoU37Jdr33iq@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 13:39:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176762

On Fri, 2023-02-03 at 23:28 +0100, Alexandre Belloni wrote:
> Hello Richard,
>=20
> This is causing:
> WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/src/debug/perf/1.=
0-r9/util/expr-flex.h in package perf-src contains reference to TMPDIR

Sorry, not sure why my local tests didn't show that up. I've sent a v2.

Cheers,

Richard

