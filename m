Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.10454.1589972756799225102
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 04:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HK/TZdXa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id m185so2406600wme.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2020 04:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=vjoO4aKDsdAGNFJ5VHRPuWScbhdttoi7WNrbI14MNkY=;
        b=HK/TZdXaNJw6z1DKUH888zOgkCI/i3QLIqbHPVkyrfKZ6THxMQYGL+i6WEUmcXOlm4
         vUQpuZc17/FMmX/L6JyJ3nTUdAXYyYu7/lwL8KfeP8MBIJHiRavan9OY493470+5Cj6k
         e9uiBzrh4LaG8hqaUcv+zMhPD7W5Mtl2nmaVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vjoO4aKDsdAGNFJ5VHRPuWScbhdttoi7WNrbI14MNkY=;
        b=JFpaL5kvcvR4XBiOykT6kGeleJzIRe+YEeDmQ4ExExHF+OSWjYQCOjR2Wk9wB22ejf
         i5JT36feyDbHTDWcP5C9m9NSju2ZbpygWps7MEzz6KYQeHW3UNCzAEp99S6RJ0b5InqM
         BAvJtm9Bsw7SDYpx+PfUY1SN0/70qPqZu57ZQRmT9c4Cf5F11kcwpIV0lhPd66BmwvF1
         yITSHQonxqsNWgnoQ0Fp25K3LDCK50hkgyD+oexCbLO/v38ViRv8jxYVm2yXKfO+n3Fs
         GzZUIAos5g6Dt+aAPWPVCHcv8cEhAu7lSJLKJDc5sRro6tGlbPmwovODE174YNRlwHun
         FwEg==
X-Gm-Message-State: AOAM533SWzeShdSeLGFOSXBCJgSX2q1rAA7BQ4RNVB+XAgLPXoxcgiS9
	RxGPnoOiE92LRc49CCdXQ6GITA==
X-Google-Smtp-Source: ABdhPJxhQxb7TckJzvl7oN7H7V2l9TMBXTMgRLgKEI6dKZCxRPyFynflZKJVMvx3XXNOehwH9cF1Lg==
X-Received: by 2002:a1c:3187:: with SMTP id x129mr4095762wmx.27.1589972754964;
        Wed, 20 May 2020 04:05:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d4sm2466891wre.22.2020.05.20.04.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 04:05:54 -0700 (PDT)
Message-ID: <ec08560660c916145ba21e35711d19babad5ae7f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ltp: Fix format security warnings with gcc10
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Petr Vorel <petr.vorel@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Daniel =?ISO-8859-1?Q?D=EDaz?=
	 <daniel.diaz@linaro.org>
Date: Wed, 20 May 2020 12:05:52 +0100
In-Reply-To: <20200520061803.GB7338@dell5510>
References: <20200520052634.3291199-1-raj.khem@gmail.com>
	 <20200520061803.GB7338@dell5510>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-20 at 08:18 +0200, Petr Vorel wrote:
> Hi Khem,
> 
> I see patch has already merged in upstream.
> How about adding Upstream status:
> 58424835952641f4fd60c0ae3ab6c64decca3f8a

I tweaked it to Upstream-Status: backport.

Cheers,

Richard

