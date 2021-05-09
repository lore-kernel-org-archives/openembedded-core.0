Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.24159.1620596869196347106
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 May 2021 14:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AcCyQkCS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso8783312wmc.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 May 2021 14:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=io82Eis5+eicwWrkjooRqnSeDKLjsSlFzX4Rp20e4yc=;
        b=AcCyQkCSBxnONwZ3aU7AdL+cZGBkUWXrXFCBnfVd8mYMuM/eq4A17j8ejTxcU3BFlY
         6PqD16QZVrco15vHtlok4zh8pjhAf5ISbOMuO++Rgg9WhSHurrmGhrlA4kYEOKqgYrdB
         tjUK27txSOmROICyk4n6l5xrFsAbUuQ4k96Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=io82Eis5+eicwWrkjooRqnSeDKLjsSlFzX4Rp20e4yc=;
        b=KMmEM4dxrZ7BzDFxBJqlVpumh6u1Hzr9p8IMelm6hBWddA1eOJ671UKlWVMkS90pGS
         Z1SsauWuCG8gLfsSitmFl/t0xLGfAmeJks87VPSMGDXBnrxeM9sRTDH9KAqFddNlMfBF
         M5mcjbGaTQeGQyPY0+UQF8S+S2ctFmCC4Bv5GuRDmLOOWov6BvxBDrpzftOWkwoFZ3sW
         3M1Nkj9yln6acKJeZKv25hzm5pJBA+rUFKftc7E4FAlFlaVNDf3CPYAVe8x9FSJS47Dg
         DB9XYeq4YDOaO6wrTeENG8J77rXsVLbbeFV/U7SfgDuLTHMG7uErfyDqXYq1jAaaAFcb
         QzOg==
X-Gm-Message-State: AOAM530ZTJLEabsin055miBZnnp2Guo1MAkpRpNPINtvmzg94VJa7rX5
	lQPj3ZRnf1Xk/CBjW7YblOQLWg==
X-Google-Smtp-Source: ABdhPJz0theBwSK370vDA5kBOCaCyxWYKtDKVecmkFctmkuujx//bCVGg6UhA+p4qssHTlp2mSHv0Q==
X-Received: by 2002:a1c:4302:: with SMTP id q2mr34011858wma.1.1620596867597;
        Sun, 09 May 2021 14:47:47 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6? ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id 16sm16690524wmi.13.2021.05.09.14.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 14:47:47 -0700 (PDT)
Message-ID: <41f87a4c7e3ac473e163bec0ef0877876a7d8bcb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions.inc: add exclusion list for intractable CVE's
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 09 May 2021 22:47:45 +0100
In-Reply-To: <6a7e59c6-594e-b2c1-9d71-d9976fab4b70@gmail.com>
References: <20210506171232.2832063-1-steve@sakoman.com>
	 <6a7e59c6-594e-b2c1-9d71-d9976fab4b70@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-05-09 at 11:17 -0700, Armin Kuster wrote:
> 
> On 5/6/21 10:12 AM, Steve Sakoman wrote:
> > The preferred methods for CVE resolution are:
> > 
> > 1. Version upgrades where possible
> > 2. Patches where not possible
> > 3. Database updates where version info is incorrect
> > 4. Exclusion from checking where it is determined that the CVE
> >    does not apply to our environment
> I do see the desire of doing this as it is one file to maintain if there
> are multiple packages being updated at once.  This does highlight a few
> things to me:
> 
> 1) We have been dealing with this on a per-recipe basis. This is a shift
> from that. ( Does this need to be documented)
> 2) Recipe Maintainers aren't engage in this area of activity as we had
> original hoped. So we are working around that.
>  
> Reporting a false positive is better than masking an actual issue IMHO. 

Steve has covered most things in his reply but I want to add something on
this last bit.

Right now, multiple people have gone off and looked at some of these CVEs
and all the people I know who have done it concluded they're intractable, 
there is nothing we can do about them.

I'd like to document this somewhere to save people doing the same work over
and over. If someone wants to investigate further and can propose actual 
fixes, great, but it is helpful for them to have what we know so far to start 
from.

This patch is effectively there to start a discussion if necessary. I do
strongly believe we need to do something here though as the false positives 
*are* harmful. Currently, it looks like the project doesn't care about 60 
odd CVEs in master. Anyone wanting to try and improve that has to guess
which ones have been investigated and which haven't.

Cheers,

Richard





