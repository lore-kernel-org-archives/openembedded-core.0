Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02631C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:16:54 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.13552.1646327812922081404
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:16:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N8YzhF1A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id n14so8888037wrq.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=P0V7m62f69JA4P6gE5bXWQf7Ghh0fbMeulERCIDkdRI=;
        b=N8YzhF1A88kf0r8zfnjKJNSl5rO2JEuvMjiUgyvzPvbN2eRKBgW3bzZeUDwkU8cDhF
         kToQ/dYaWrOP84TqNDexKVytvYkYXK0p3v3+dRQefbDHKpj1y1uB9ZTYdPRzJVAq9rNb
         aRrraQmIOooq8/JYqi38ysAJctVqEU+dsR6jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=P0V7m62f69JA4P6gE5bXWQf7Ghh0fbMeulERCIDkdRI=;
        b=5uSFlslVvPZn4NgJ/fw/a4Kx/tRFzfjAMw+HFvQW16CqXIWHnPv/r4y3OYiYNLrF59
         Ytc/H8RmSGqLjQcZkwNKqvfUnl2nGcTwaAZXbVGDpR/GXuKF+OtCykXaDJk+pGn+TfgM
         sfqDrTeV6/RkvXfcg7ob52u8QfxhN3lReJ1NXKufQqJkOVW/ezKda6/KrqL7XF8C4XyJ
         /J35qBg8hGwmwwShNNQ7ywAA+ncW3ueDCS1EKVgI0QIrSY4xvNywGlUqjJ29co/9suxO
         keSqq8OMK/OABMe5IWvEKBP7UdH1ATJt/nAl+/ZBYFARIoq8u0LfhNSmKAsGt6aKpGi+
         DnDg==
X-Gm-Message-State: AOAM531QtdSFCM+24qiZkJNKCzUpZirfPQHTVuxHru/56BdIAqZSu85G
	B97ucf6zQ9xm4j0QYncRhAXxSA==
X-Google-Smtp-Source: 
 ABdhPJwNUq2u+IUsWaaafnkqV1CTVaYvcoK9LuLhEHn52tdiXsezRWJ5pOeEJALgpkIHCJbjXySzWw==
X-Received: by 2002:adf:f6cf:0:b0:1ea:974c:5872 with SMTP id
 y15-20020adff6cf000000b001ea974c5872mr27556749wrp.137.1646327811232;
        Thu, 03 Mar 2022 09:16:51 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:68d0:4b5c:ced3:87b1?
 ([2001:8b0:aba:5f3c:68d0:4b5c:ced3:87b1])
        by smtp.gmail.com with ESMTPSA id
 m5-20020a05600c3b0500b00380da3ac789sm3296227wms.1.2022.03.03.09.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 09:16:50 -0800 (PST)
Message-ID: 
 <6d880923351fe7e16d4c44d25dd8f43d1de390c6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] python3-native: Remove all pyc files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 03 Mar 2022 17:16:48 +0000
In-Reply-To: 
 <CAAnfSTu78H+UG34pykED6G8M939LLmupEghxaUaz8_mToAwwFg@mail.gmail.com>
References: <20220303163451.336518-1-richard.purdie@linuxfoundation.org>
	 <CAAnfSTu78H+UG34pykED6G8M939LLmupEghxaUaz8_mToAwwFg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:16:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162669

On Thu, 2022-03-03 at 17:14 +0000, Ross Burton wrote:
> On Thu, 3 Mar 2022 at 16:34, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > This removes a further 1600 files from sstate handling and lets python
> > create the ones it wants at runtime which is likely much better overall
> > for performance.
> 
> Playing devil's advocate: doesn't having them in sstate mean they're
> generated once and hardlinked, instead of needing to be generated for
> every recipe which runs pythonnative?
> 
> Whilst I can't disagree that 1600 files being dropped from sstate is
> good, we're just punting the recompile step to every recipe when it
> runs python code.
> 
> I guess the question here is how long does the Python library take to recompile.

Another consideration is that there are many sysroots pulling in python3-native
which don't run python and they're only there as there are python scripts being
added which means python has to come too.

I suspect for that reason it could be a net win but it is a tough call.

Cheers,

Richard


