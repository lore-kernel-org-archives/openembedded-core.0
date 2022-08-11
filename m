Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB0FC19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 16:04:30 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.8354.1660233860234665983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 09:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SxM7GUFZ;
 spf=pass (domain: konsulko.com, ip: 209.85.222.172,
 mailfrom: trini@konsulko.com)
Received: by mail-qk1-f172.google.com with SMTP id i13so5942879qkm.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 09:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=1Pj3jMgYcKyzHs7eHz2WwoanOjrwImvtNUCQvCGnlos=;
        b=SxM7GUFZPzn+/HS9JWbVtEvWcZYF0ygJjTJAyJ+af/jSDp/vb4YYnU+PiDVsrdJyEN
         J7P+wf+BhVJey01UtB7pC0fwWnonha04hNzEcygyPmpE9LqD2/1LEki9xyXOykHmEl0P
         6KBkWNLgQ2QhoN8nH97P+2ksukOIog6JylMdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=1Pj3jMgYcKyzHs7eHz2WwoanOjrwImvtNUCQvCGnlos=;
        b=qmFA3riZjI2TNJBuCDMVfznxTAWra2b7V9PlUFmSEWh44QJ1Edfh3y4gPQo8pUmvBG
         HoCUbHMx/ZGv6Nkv9OPtUoVR7AMMWoiOjcvJVkSlpd/XDp2LjiDfs8OgefxVCxU7WbNg
         V+R9qv98JMCYs6k/SGuek/xG+JLtamkDnQyfTD+GcIFhyN9GsTgRuA247Jx/QeKH33Xg
         6AiPRFMbtBNeOOhrB3q9pkHKH/aWavqBM7mRnYGY9I4Q+lmBD2sqviXxbGcYX2CIQVsk
         aBP4xl2g7sGNTom40j0YXOZMXJHqkKsOfOqlXQBVVh1wy84JWd/EAACLy+U2LlOronLZ
         T1sg==
X-Gm-Message-State: ACgBeo1LLu69KeH7j1p/svsVo6FFEGojjngdiilVXBMPYoJAPEb7o4QD
	J64Vunn6WfrBNd4tHsol6u7OCQ==
X-Google-Smtp-Source: 
 AA6agR6Ls842zbje6Y4/+WnoPvLdL8DUAjZjVUfnZaxoIUHrYEnVbVB537Nql10+WX8mFV4aQGeFkQ==
X-Received: by 2002:a05:620a:2587:b0:6a7:ee6f:bf2a with SMTP id
 x7-20020a05620a258700b006a7ee6fbf2amr24850186qko.542.1660233859031;
        Thu, 11 Aug 2022 09:04:19 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139])
        by smtp.gmail.com with ESMTPSA id
 y17-20020a05620a44d100b006b8fb2a1145sm2504181qkp.124.2022.08.11.09.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 09:04:18 -0700 (PDT)
Date: Thu, 11 Aug 2022 12:04:16 -0400
From: Tom Rini <trini@konsulko.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemux86-64: Allow higher tunes
Message-ID: <20220811160416.GW1146598@bill-the-cat>
References: <20220811154005.4084669-1-trini@konsulko.com>
 <CANNYZj82WqbCr2MktnE8GrowoRiXL=W2GGOVpgzgi9Ud9YJJOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CANNYZj82WqbCr2MktnE8GrowoRiXL=W2GGOVpgzgi9Ud9YJJOg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 16:04:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169251

On Thu, Aug 11, 2022 at 05:51:52PM +0200, Alexander Kanavin wrote:

> This is less useful than it may seem, and merely moves the supported
> CPU from circa-2006 core 2 to circa-2008 core i7. You won't get AVX or
> anything newer, which requires adding these instructions to qemu
> usermode (a project I'd like to do if I had the time).

True but it's also the case that tune-corei7.conf is the newest one in
oe-core, yes? I had previously peeked in meta-intel which has a
skylake tune, but bringing that in is something I'd leave to Intel/WR
folks to take care of.

-- 
Tom

