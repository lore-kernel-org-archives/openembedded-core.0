Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2ADC19F2D
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 11:58:34 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.3841.1659614308662669534
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 04:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d+HFZTyB;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso2230558wmq.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 04:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc;
        bh=rX7DT5qhYan1bCzXnSHhG4ez5N4Dzjv6EKxxc80u28k=;
        b=d+HFZTyBKcu+OKuEULnYOgRSKKfaNYrkKVzbYT6A4Im+W2jhYSDNbkp2cN6QBoeI3n
         hVEQk0wHWGCIA9dXyscLuWLXZqXxJZ86+MoUt+Y3Zk3zFEOEZhbuMWXFchiHD6XMx5ib
         rG/Gnp+Asb3RI7h8XcBEzqJMtmHB1IFJXKyc9XMAkl5PAV9Mey6ijNic7zw0MPYmKw2O
         GmKTOULoNimLgFkmGf6adJCeqYpQ3kLGbGHigrrbE0C+4usqP+7M+I5K+vrPya8h8j/b
         qTfiWYdy73xkKtJ11EVOku7GmaLVOnQex9hFyhBl3KFEyuYEpIm0KXOUiLWMx7WEkbP4
         NnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc;
        bh=rX7DT5qhYan1bCzXnSHhG4ez5N4Dzjv6EKxxc80u28k=;
        b=UIKcRpqXYCe5y0/VMNTYLdCT033GKMkokahv6B8C0ziD2UxQGAwRRl/oOfFbaILgZO
         qNQiP2QbOVjGuTJyw2z6sYSD4n4qWUOPG6OvprsARwEs7u+I4GsmVJ8dmBMtT4gIpBkz
         0aBE/eds0ShX2kQwX3bdOor2QPsN3WScOVOhrw0QB7ImFJhPL1KycbyKxG8CySG2NrUu
         j2JKGZoNXJKFiBgol1FE2UJmGEW9/QSZexr+KKGyMtt5eU1nTAdALl2q3i1YuC/WBhjg
         kf5pdRslLgi+OpLRl1Gsk9DOZgY17QJ20T/mlGK6mGEiAm+32Iu98PIsGmgibEg1kTrz
         cxHw==
X-Gm-Message-State: ACgBeo372K4F1ZS2ch6axrlTG5huUPq3PGmtlm4t2fz/e5xJVUqEAYt7
	RVnNcHt8KH/RdXdJ/56tuOg=
X-Google-Smtp-Source: 
 AA6agR5FXsY8KGMq/lFWv/FuCldX5qbpFxABTw+FGfkw6oH7DYHl7HYkzP2BmcCsgKTb5kJYVhWFHA==
X-Received: by 2002:a05:600c:49a9:b0:3a4:fbad:ebcd with SMTP id
 h41-20020a05600c49a900b003a4fbadebcdmr5017271wmp.120.1659614306958;
        Thu, 04 Aug 2022 04:58:26 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 q25-20020a1ce919000000b003a32251c3f0sm1078598wmc.33.2022.08.04.04.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 04:58:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Aug 2022 13:57:56 +0200
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [kirkstone] glibc : stable 2.35 branch updates
Message-ID: <Yuu0RAEKrQp7uD/M@jama>
References: 
 <CA+chaQf5nGwAaLifnZxghK2dHiesGo6mpcFpb_PR=fFgp-7vsA@mail.gmail.com>
 <19859.1659612044516984045@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19859.1659612044516984045@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 11:58:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168846

On Thu, Aug 04, 2022 at 04:20:44AM -0700, Sundeep KOKKONDA wrote:
> Is there a fix available for this issue and was it taken to glibc branches? I checked glibc 2.35 branch now could not see any new commits available.
> If there is any fix/workaround required then it should be patched in ' meta/recipes-core/glibc/ ' OR if it is a bug in glibc then it should be corrected by glibc. It seems the mentioned issue is still on-going and no fix is available yet.

Then maybe we should hold on more "stable" updates for kirkstone, before
the DEBUG_BUILD regression from the previous upgrade is fixed? The
regression tests are great, but they don't help to detect issues like
the DEBUG_BUILD.

This change also seems to target kirkstone directly without being tested
in master first. I know Khem has a change for 2.36 glibc for master, but
maybe merging this update in master first (and resolving the DEBUG_BUILD
issue even with that revert I've sent earlier) could be merged before
that.

