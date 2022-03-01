Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A94BC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 07:51:00 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.5889.1646121059129210181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 23:50:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=apNmhL/A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id n14so19000461wrq.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 23:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Bw3iPf+7t/+Xaqq6gGea9Km87Vml4T+JI8jfuNq3QF8=;
        b=apNmhL/A96UHPIOXfGmc0AUSrME3xXPJR3XQdj6zzGzqcJXotw1QYXiHALS/RYm20s
         1hTiTc6E8/rBQobWsVSj367MCPKRsJzyVRQk5MP3avNu4hOidj0Ksk6AwWDjFfl/TyNT
         erETIom4yj+ISmu8MOANOexFnzl2//dSBfOAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Bw3iPf+7t/+Xaqq6gGea9Km87Vml4T+JI8jfuNq3QF8=;
        b=MhEWxdR+MpZJZh3+ARf7bqrGvr1X+FTEVSiZTaCcl2vZnwUYTTarKDA+Q+gPcQHjE3
         CPWhf6/7HIkZy7uXw0i4RIGqQ3mmxM+8EXfiKeA96w15X8gW570F4mLYgad9pEDFDQXu
         vuPl47kxSvA/hfDok7eD9cfwyEV5Wdi8hIpVLLPhM+Zv36BTDBv56AvBkF2OdVoo+ggd
         cMv9FyMvibE24+vOjc3JXdiG7AYvhAwg5ixLccCimjYsiDJnmypL6LTq6ent425MwY2Z
         cH5uY8nUAifJzi2jftu9PbSGAwgg1pLjFVwDVUnJyTVvvYPIGF7F373ryqljRw9OVSFp
         7ZiA==
X-Gm-Message-State: AOAM533BR8X3dw8zq/SDkHhwDSyGr25UMZAmqNmShIjsu9Re6tryRwVf
	bO/J2n6gy9yvcdrpSnFNTg6EsQ==
X-Google-Smtp-Source: 
 ABdhPJznhKGNQZ6CykbPipvdYRLDvdn0LZuiUvIxmjz39TYTdekk8JPfzHTdFFy48uTJoNuSSGijcA==
X-Received: by 2002:a5d:4a51:0:b0:1ef:6254:8683 with SMTP id
 v17-20020a5d4a51000000b001ef62548683mr14272080wrs.398.1646121057280;
        Mon, 28 Feb 2022 23:50:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f88:ec89:14b:c380?
 ([2001:8b0:aba:5f3c:5f88:ec89:14b:c380])
        by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm12517726wrm.82.2022.02.28.23.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 23:50:56 -0800 (PST)
Message-ID: 
 <963c756b456fa34b7377802f3fd3074f06c69476.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Revert "cmake.bbclass: Set CXXFLAGS and
 CFLAGS"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Jose Quaresma <quaresma.jose@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 01 Mar 2022 07:50:54 +0000
In-Reply-To: 
 <CAMKF1sr60VPL7C-kmroxNs5+d_aEsOn+ZZGZfBB7mwT-NHe3xg@mail.gmail.com>
References: <20220228163710.44361-1-quaresma.jose@gmail.com>
	 <CAMKF1sr60VPL7C-kmroxNs5+d_aEsOn+ZZGZfBB7mwT-NHe3xg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 07:51:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162527

On Mon, 2022-02-28 at 20:17 -0800, Khem Raj wrote:
> this is fixing more than the workaround, e.g. see the patch I sent to
> fix libical, where these flags are not passed to git compiler when
> using cmake
> I am not sure how many such fallouts there will be through out.

The error Khem mentions is here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/4839/steps/11/logs/stdio

with multiple other failures in that build in libical. I'm worried about other
failures resulting from this change.

Cheers,

Richard


