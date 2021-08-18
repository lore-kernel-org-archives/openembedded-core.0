Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.57691.1629306988303731868
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 10:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hw64GQe0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id q6so4643131wrv.6
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 10:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=lXzeGdb01fQDBa3peTEjY4ip9FvkRo23zb/VSRSWRdc=;
        b=Hw64GQe0Drwk/ZzvKnJpl3Kl2AU+WYpXBZdp5nfFiOV3vefQFvohWsCxkW1uZI2owX
         5QfVAPT7uQSYrItfNoSvXVLttxte/Lbyc6vF8kGz6OfYnqmp+f5cMy11sc9baWPdpVwv
         9f3ZQ1edeW7CgkSNW7yRZM2L9elUsjmvTyYyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lXzeGdb01fQDBa3peTEjY4ip9FvkRo23zb/VSRSWRdc=;
        b=G7rMbU+G8tkou/TcZCTr9+cYLDgp6hkE6hNl+uW2oz0ptRDn9x0LQMqfgo/OBP1m+Q
         nMzlAv+rVLK4F3W9QkrldsfuG5msq0e5Kra+3/4/o8m6A4G4TwZmO6h1776mfwtHU05U
         eXmzxaiVWyZSWkUmLGs8x5FYfsqDJ35td2hezTAAZGCJIIXd2Jgln0zwzWsPVpAIsAZS
         HRdd5NgwsJb6/3ueetqu+iPi2Z7FBmMuclodM8KICPTIpVIiaHSkkO/Ex7kmBsMZpsl3
         c2KV/fQQcX1bzTxY+kqZ7VSqmLXf1AcsWL9avI4kFvnr4M8pBByokEV5ojMU3P4fXL3b
         +J6g==
X-Gm-Message-State: AOAM532nDXoYeXKTt+vugtzXm/iVUyRxBzazRU3WpFfMnVxkJYJDDUQO
	9piV+SsF01VAkxICQobAmbaBrw==
X-Google-Smtp-Source: ABdhPJwlXO6k7eRrry5q3RHlw/UimfKgmMGle1TaR2ySnsir2ThxHIHVGcRCQ/getu8wXjVT0DzMdg==
X-Received: by 2002:a5d:526e:: with SMTP id l14mr12104317wrc.141.1629306986370;
        Wed, 18 Aug 2021 10:16:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:2c5b:67f4:375e:5ae2? ([2001:8b0:aba:5f3c:2c5b:67f4:375e:5ae2])
        by smtp.gmail.com with ESMTPSA id b12sm356512wmd.42.2021.08.18.10.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 10:16:26 -0700 (PDT)
Message-ID: <194b975d80a7dc09f5b1605c5bee0a0cc99397cc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] glibc: package the stub .a libaries into glibc-dev
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Ross Burton <ross@burtonini.com>
Date: Wed, 18 Aug 2021 18:16:23 +0100
In-Reply-To: <CAMKF1sq_A2e2oLeuT9nHRPinUxoHtez0gVe6BL+eYHdtWcykbw@mail.gmail.com>
References: <20210817222919.2170420-1-ross.burton@arm.com>
	 <CAMKF1sp83v6TkKLAAMdDExij9ZceOaCGpSrp=cLPJEkQUCB-pQ@mail.gmail.com>
	 <CAMKF1soAhzSgaYfuJarzoj6VEkAwcm1+51ymGprGwB=Sn53XZw@mail.gmail.com>
	 <fb8ec5484f790866114c755b47f677746e42dab6.camel@linuxfoundation.org>
	 <CAMKF1sq_A2e2oLeuT9nHRPinUxoHtez0gVe6BL+eYHdtWcykbw@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-08-18 at 06:42 -0700, Khem Raj wrote:
> 
> 
> On Wed, Aug 18, 2021 at 12:00 AM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2021-08-17 at 17:40 -0700, Khem Raj wrote:
> > > hmm I am seeing pseudo build failures on master-next on all arches see
> > > [1].  I wonder if this is related
> > > 
> > > https://errors.yoctoproject.org/Errors/Details/601473/
> > 
> > I think that would be an issue with my patch in master-next to try and fix
> > other pseudo issues with 2.34 hosts.
> > 
> > Basically we need pseudo to work with older glibc where the dlsym/dlvsym/dlerror
> > functions are in libdl. This is because libpseudo may be loaded against host binaries
> > which were not linked with glibc 2.34 but something older.
> > 
> > To do that, we need to inject older versioning but the version to use is arch 
> > specific. I have a patch covering 32/64 bit x86 and arm but I haven't got further
> > than that:
> > 
> > 
> > ++#if defined (__aarch64__)
> > ++#define DLSYMVER "2.17"
> > ++#define DLSYMVER2 "2.17"
> > ++#elif defined(__i386__)
> > ++#define DLSYMVER "2.0"
> > ++#define DLSYMVER2 "2.1"
> > ++#else
> > ++#define DLSYMVER "2.2.5"
> > ++#define DLSYMVER2 "2.2.5"
> > ++#endif
> > ++
> > ++__asm__(".symver dlerror,dlerror@GLIBC_" DLSYMVER);
> > ++__asm__(".symver dlvsym,dlvsym@GLIBC_" DLSYMVER2);
> > ++__asm__(".symver dlsym,dlsym@GLIBC_" DLSYMVER);
> > 
> > 
> > I may need help finishing this off for other arches people are building it for. So far
> > I was using this as a test to see if this would even work!
> > 
> 
> 
> I think we should disable building pseudo for targets which are not used as build hosts so essentially your
> patch is good with another addition of compatible host string 

I've improved the patch a bit and I think it should work in most places we build 
things now. Patch is on the list.

Cheers,

Richard


