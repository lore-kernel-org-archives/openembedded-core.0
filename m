Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.117.1597273395276809229
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 16:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eAzzr8dD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id a5so3523248wrm.6
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 16:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=WZC953k+8s2XBcSu8D5r3tUxWvxrwq3NCMxRpcPewLc=;
        b=eAzzr8dDRyyn8ifPpibhzR2HLDx8rhcvSlEOupbb60mgIJ1riWot/AcvIaSjmKmiwp
         CtBbGxav3ou2m2NONYoh+BoELlmOOX12xnCqUcxMTSlX73iFeAOKKFEEhozj16zlF9nw
         CU8lyVSCAREB99IsnXLGLmR4kHAYS6wazRQvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WZC953k+8s2XBcSu8D5r3tUxWvxrwq3NCMxRpcPewLc=;
        b=q92ZZAU/6B13o4Q1cC8HvbPxz7HvzwytBcV26Ca7CgNwzlLLTSzXTcy8GWNWzulHkZ
         3NkqsAZaHj+F2X5zFYOiuQm4qS+fQozBMzH6tgVCF5HpLCFEWHVb2SKg8WDJsBiedhs6
         ucjZCXWLUZFC4CySo0WiHupmPogQv3Gc4mk/GT8kliHS6XtvivPKTtMNmGUOEBeNiDqC
         HYzI719KXsfXoqZuUwEzUGou/mje23S34dsh8B+0tNi7Fm0peD+1hiwockyMELABT3Oq
         +ljzQ4OwC2A0VuhbiRTZBvk/Efm0tZ4q9Ceb+5dbcuprQU5TYRkEPpFtBQNRU/xi4IeG
         G8oA==
X-Gm-Message-State: AOAM530j0/H+RB7IwngL8zfazM1/qwqLBmzgnc+IHbWGpm6lIpS85KFt
	CVCAuF8B1DKHEHXvD/dHtsggfbwzmhojlA==
X-Google-Smtp-Source: ABdhPJxCaooB6v8nP4OVMdDgFOd3IeskjZB3Zgw2gcDbzl63DPi+fsR+tJV0eq3f3fA/UY4HIJKwuw==
X-Received: by 2002:adf:82f6:: with SMTP id 109mr1325362wrc.25.1597273393875;
        Wed, 12 Aug 2020 16:03:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.4.a.8.2.9.1.2.1.e.3.5.0.0.0.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.4.a.8.2.9.1.2.1.e.3.5.0.0.0.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:3000:53e1:2192:8a43])
        by smtp.gmail.com with ESMTPSA id z15sm6762710wrn.89.2020.08.12.16.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 16:03:13 -0700 (PDT)
Message-ID: <3ea593def41481918f0dd8ebc3713c38f2e55a2f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ethtool: update to 5.8
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 13 Aug 2020 00:03:12 +0100
In-Reply-To: <20200812001338.557467-1-open.source@oleksandr-kravchuk.com>
References: <20200812001338.557467-1-open.source@oleksandr-kravchuk.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-12 at 02:13 +0200, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
>  .../ethtool/{ethtool_5.7.bb => ethtool_5.8.bb}              | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-extended/ethtool/{ethtool_5.7.bb => ethtool_5.8.bb} (93%)

ptest doesn't build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2315

[and many similar failures]

Cheers,

Richard

