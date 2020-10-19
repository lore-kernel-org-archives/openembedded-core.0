Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.13263.1603113946882450558
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 06:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KvtXZ6/o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id s9so11410763wro.8
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 06:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Ja4apUkq3ogZ6zhQTGfy7cUYhimkzVdY4NSiAHGBwDA=;
        b=KvtXZ6/oUlEhOCbAI8bagWhsk2KYCxLuLWZ1HkgVJgKOy3CcbtOIZV46X2hAshuqmf
         /NiF8LjbDvlEiJNMi4Ygy9Wl8MubMbTivALR6ZVBq8QjIJpxbn3SC7ZlzTbfd48LGavR
         i5c0pUCbo3TkwxaS3tfR3DshrLurdqfiGJhq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Ja4apUkq3ogZ6zhQTGfy7cUYhimkzVdY4NSiAHGBwDA=;
        b=G1f9x4BWDqHGXgykVsINJJ8lEPlCgp7Um7x2oW2cVznQ/NbiKW1SPkuI00tcJgqzpt
         +FU7bz+KduEmf0gMQ4Kk1n+iar6UHUnH1gs0DWwGNJWAMoFlAiKnLFXLzEmPmljjygCH
         DDyGAM2g2kmbAt2/JyCPy8ZI4orRu0rpfSSDDiQWPu/gJ/ZCNXf9iyWinsegddaNunlT
         U7ItXt23k2UupMsXsjfQwPY1aXRKsbVpv6eXzOjhPI3iWQSGMQP9Rd6IK9VLsNaGfAgm
         4iINfjuqx0bYbdo5zz6cZC9suRmc3mUALtNWQ46xj+se14ysr9CW6qzNyCbAKNoLncsF
         A+Pg==
X-Gm-Message-State: AOAM5319vYJOQWdCQiHrKmMq68JeJunmE246qxoZc2SIBxAZNcWWJREf
	pLz07dVOwQeEuKxRIFehJQdlAQ==
X-Google-Smtp-Source: ABdhPJwLRysM6kC/tDBZ2GCC0tXjWVwvLnF0inJSeWOwKgnhnMPiMj5iRywrkQ+lVwpP12hkqAMnSw==
X-Received: by 2002:adf:a551:: with SMTP id j17mr20936481wrb.217.1603113945289;
        Mon, 19 Oct 2020 06:25:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from e.c.4.c.b.d.d.d.d.1.e.7.a.1.c.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (e.c.4.c.b.d.d.d.d.1.e.7.a.1.c.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1c1a:7e1d:dddb:c4ce])
        by smtp.gmail.com with ESMTPSA id z6sm11652wmi.28.2020.10.19.06.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 06:25:44 -0700 (PDT)
Message-ID: <9ea47af9eca270bea1b3e468f530dad782023a44.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] busybox: add rev and pgrep
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Diego Sueiro <diego.sueiro@arm.com>
Date: Mon, 19 Oct 2020 14:25:44 +0100
In-Reply-To: <DB8PR10MB39778008487808091759D8AB92030@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20201015054600.24514-1-akuster808@gmail.com>
	 <27107.1602752871157273119@lists.openembedded.org>
	 <DB8PR10MB39778008487808091759D8AB92030@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-10-16 at 16:48 +0000, Andrej Valek wrote:
> Why are you not enabling these configs correctly via defconfig?

I'd wondered about that. I didn't really want to block the fixes on
that discussion and am trying to pick the best places for discussion
but I'd take patches tweaking this.

Cheers,

Richard

