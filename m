Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.7942.1596276761612687969
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2020 03:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HrD3oKVn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id b6so29997175wrs.11
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2020 03:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=AMN3T+aAsqguFfs+rvidhW3c/ZWhuH9LDtJguhBCwmo=;
        b=HrD3oKVnkzmANRVTEgBdtMMh1DRkuREJzYAD44jNV/Q1Nsej3mKTSImVdKYlutRQU4
         X4LNj2pHcjDdxCImQ69LiatRDuVdl9VEVqTV6Bmh14ynqJ+7nlaFCvLY7sG8aYgxPmpF
         CVnt/8DMvWeSkF0FoJwqjxD7IWgJMMOeQ+kSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AMN3T+aAsqguFfs+rvidhW3c/ZWhuH9LDtJguhBCwmo=;
        b=CR1Lo9LrRiNZK761KfjlsqOJKKyaPVQmi1eCnB7MDJ1v3NjtAqEOYKcbs+hQ5kWm3T
         Zb1Tj7z1OYo056fdoLiY0UQVX6e2xOxeSNY2dCq5jNsjeLcblNzkI9Gv3SJdp52YkCED
         mjOfPVaN/9s34sK8TCFO0sIGTFWGhO1JXArYQj8bwJRM4AyhUUztcrUDpi4K2VsRn9Lg
         NPqwNTFMvuKgWnS2swYX2tzP8KbEieSgVOG0tdjZp+m7iyVTMb6By+DicOQ48MPTePo+
         +xPw1F5CKxNiG4NYNwp033nKV3+vLWw0ueHS3PQxgp8NgGjAx3Y1goDfnZvr1wyWBFxJ
         x2xQ==
X-Gm-Message-State: AOAM531qdxAChALo/fUympRI7Lof86+oI2GGqfZWe9kzhcInbRkr0Vax
	TGdKLQc6Q02AA4pjVETaPlBfnA==
X-Google-Smtp-Source: ABdhPJylDLef2bqEj95LAe/CoSDwkE6DvM1DQ1blUtVtRJyy3gn9t2IlqO5qBtry3buY0gPu6DEc9g==
X-Received: by 2002:a5d:6992:: with SMTP id g18mr6871057wru.15.1596276760003;
        Sat, 01 Aug 2020 03:12:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 8.f.6.d.2.8.e.3.0.7.3.6.6.7.c.a.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (8.f.6.d.2.8.e.3.0.7.3.6.6.7.c.a.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:ac76:6370:3e82:d6f8])
        by smtp.gmail.com with ESMTPSA id i6sm15041794wrp.92.2020.08.01.03.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 03:12:39 -0700 (PDT)
Message-ID: <b239d09f8e3d55103fb5aef84b2aebf5b13a8817.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.35 release
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 01 Aug 2020 11:12:36 +0100
In-Reply-To: <20200730075343.2118722-1-raj.khem@gmail.com>
References: <20200730075343.2118722-1-raj.khem@gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-07-30 at 00:53 -0700, Khem Raj wrote:
> assembler supports dwarf-5 format line numbers
> linker has -M -MP gcc-like option
> 
> for detailed release notes see [1]
> 
> [1] https://lists.gnu.org/archive/html/info-gnu/2020-07/msg00008.html
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

This patch looks to be the cause of the perf failures you mentioned to
me on irc:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1225

Cheers,

Richard

