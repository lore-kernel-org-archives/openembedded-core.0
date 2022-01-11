Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4422C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 11:15:57 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.5701.1641899757251408652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 03:15:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eQ54P8Xk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id o3so32255488wrh.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 03:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=JbdB0ys52qKKo5HLzRpiXprHbLP4gpm2f6u3ihzsvYI=;
        b=eQ54P8Xk/cEARp+X0Rdfg6+cHGJk/P97sitClVd+SXEzMfHVyjdWX5XIc9eGJAOsjR
         5Le5jk0b+6hM+t44K4S46KXYIJySy5M8f1wbEWDt0pfY6MeSTSmNQnKY6F1d2HIgT/MU
         MsjVQSOjMXeZ+r25KInxMb/nDB0kh8qlD2cUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JbdB0ys52qKKo5HLzRpiXprHbLP4gpm2f6u3ihzsvYI=;
        b=dXWFMsdr3qb9hVHBDEaqvRnU2F2NKfOHjZLfLI3gSCxyY1c/pLiJ8L+s6UOAZXojwI
         XkqQIF+Ak1KSc/co6zlX50RQ8ico53TlkFuoqjYhEEUg9zAxA6iUVZSqAlIoZWNjW6jX
         LfKZo3fBNCw/fFBxXiyFW9KGAFXGTtBRoE1eECv0wZGSp/yU/HuqhYb52/kUO+HgwX0r
         NFXNYDeyHE3YhQzjSEE82i4bEdo7loDa/qpnpEHNqeVll9x1NVO6sR+hVs6yZ5F05msm
         o7V5T/qGXgG89A9DuvsItkrSoCiH14Zq6cW7qENpuQ/hOItvq5RGDls1kfHSJSohdWSR
         iyqg==
X-Gm-Message-State: AOAM532y+upgaB2X1JKhGHJz/grUhAw2tRmxjmMLZMpteFQ/g4K1GXFJ
	B1i6kZM1xxU+kQnzmd2RkEoYGA==
X-Google-Smtp-Source: 
 ABdhPJyE+OWmUD7dgXkvTDmQMVVY684VWR8xNQtueEAxStkVkiglvX20XRX0f4ogr1qfyqGznwLjFg==
X-Received: by 2002:adf:9d8a:: with SMTP id p10mr3345574wre.351.1641899755721;
        Tue, 11 Jan 2022 03:15:55 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:895c:c4eb:1cfa:d3e4?
 ([2001:8b0:aba:5f3c:895c:c4eb:1cfa:d3e4])
        by smtp.gmail.com with ESMTPSA id
 g12sm5501994wrm.109.2022.01.11.03.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 03:15:55 -0800 (PST)
Message-ID: 
 <52590086d0002815ca1f78ae27e6696a63ffe7d1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 13/14] connman: do nothing in qemu, do not
 touch eth0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>
Date: Tue, 11 Jan 2022 11:15:54 +0000
In-Reply-To: 
 <CANNYZj97rvKykUrrnbuzD8w77-AEo+kaFLdC=HqC0mhLd79krA@mail.gmail.com>
References: <20220109222732.2252416-1-alex@linutronix.de>
	 <20220109222732.2252416-13-alex@linutronix.de>
	 <b13cebc769646dffce33ee9b675375d4c22ef7bc.camel@linuxfoundation.org>
	 <CANNYZj9jRkc32Xm7PevLuFEgLOxTdaq7bYGu9=_gU3PitT7_-A@mail.gmail.com>
	 <8993e498bf8d266832f911b7b2c7263ccaf418e7.camel@linuxfoundation.org>
	 <CANNYZj97rvKykUrrnbuzD8w77-AEo+kaFLdC=HqC0mhLd79krA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 11:15:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160395

On Tue, 2022-01-11 at 12:10 +0100, Alexander Kanavin wrote:
> On Tue, 11 Jan 2022 at 12:08, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > The data above is inserted into /etc/default/connman in the connman package
> > itself. That package is installed into deploy/XXX/<tunearch>/connman.YYY.
> > That
> > is not the machine specific package directory.
> > 
> > Or in different words, if I build connmand for a qemu machine, then build
> > connman for a machine with the same tune that isn't qemu, command rebuilds
> > but
> > installs the package to the same location. This is not allowed.
> > 
> > Machine specific data (in this case qemu specific) shouldn't be in general
> > packages. This goes against yocto-check-layer and YP-Compatibility.
> > 
> 
> 
> Right, I can fix this, but is there a testing gap then? This prompted no
> warnings on either local builds or in a-full.

The autobuilder is not definitive as it does not have 100% test coverage much as
I wish it were.

Yes, there is clearly a gap in testing here :(

We don't really have a machine with an identical tune to a qemu target that
isn't qemu which we run sstate sigs tests against.

Cheers,

Richard


