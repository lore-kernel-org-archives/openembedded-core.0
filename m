Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.7.1590614734998836029
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 14:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HQb6Um8m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id u12so1034785wmd.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 14:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=FYGDXAAxMqumErvrYlgYyXz3trff9AuZCC+of6kdq8U=;
        b=HQb6Um8mGiE62RHaCCiQWFIeMu3z8VWMEuvySStbP0QJsm06xc6N0o9arQrfKm6Bh4
         qXmhCX/znyEqSWrYVJWJNALtRdkxvtiHfCH7ibRsqkxBaZtAlpPNk/LI7YKqZU3Kyo3X
         aKgGFPEzcO+f4Z7lROwEU834wC7uzxREtBWYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FYGDXAAxMqumErvrYlgYyXz3trff9AuZCC+of6kdq8U=;
        b=fIarQVZEhfnxJusMgtDiTb+XJM2OFQhpD4rLSEqi6lX7Bqxs3QXKYcd68y81vtyIe1
         Eo6BDEp9NUYemHAwvPghDmGM7qw5zjNudzl24QAM2cheHtcx+RbJGJDgrrih9QGkxOs/
         vjaVsK9CqVlNFGgF/dLQWsvJiJKC9VeKgNcOco1CQHKWQSO9v3ZuMNeHwNL2Kv43SRzL
         EB6lXTMGTwPa2sfnQEd0VCCBdD1wxPWbbkENHtL7avphMAlR0GGfFeQ8VPgSE4yJ2yUW
         ZmE6bQEXtRNqnka+/ooC4jRNE1NpUDEsOOC6WDW98TLbN9dYq8arbhEtYb3aYNDvhqHA
         Scgw==
X-Gm-Message-State: AOAM531uiTm4vt8sQKF6KBGtcBgWo6nkjsgNp9MJVl4uhPNgX9dyzwky
	l2XcifIEaHqGWO9J7UAk/B1/mQ==
X-Google-Smtp-Source: ABdhPJwSbXZcVtZbZPlS/V78etjITIKjde9shqXjxKQbTPoBFm4OUXBaIrUxvE9JescoL1fjqTzRyg==
X-Received: by 2002:a1c:f202:: with SMTP id s2mr94082wmc.98.1590614732976;
        Wed, 27 May 2020 14:25:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id k12sm1863458wrn.42.2020.05.27.14.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 14:25:32 -0700 (PDT)
Message-ID: <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2020 22:25:31 +0100
In-Reply-To: <20200527155957.GK17660@denix.org>
References: <20200527155011.3165976-1-raj.khem@gmail.com>
	 <20200527155957.GK17660@denix.org>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-27 at 11:59 -0400, Denys Dmytriyenko wrote:
> On Wed, May 27, 2020 at 08:50:11AM -0700, Khem Raj wrote:
> > asm/bpf_perf_event.h does not exist in older kernels e.g. ( 4.1 )
> > this helps in using common header across multiple versions of
> > kernel
> > going back
> 
> This check should have been there from the beginning and for every
> header 
> file. It's big PITA to sync this list up, especially when dealing
> with 
> different glibc or kernel than OE-Core, e.g. external toolchains,
> etc.
> 
> Any objections to making this check more generic for every entry in
> the list?

Yes, a strong objection. We don't want to support or encourage every
kernel version out there. 

I also don't understand why people need to change the libc-headers
anyway :(

Cheers,

Richard

