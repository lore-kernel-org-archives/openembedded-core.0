Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.45.1591129070669619912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 13:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BlrPHIKZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id j10so4671835wrw.8
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 13:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VaznlOFG0ZctBaWvSyM3TkkCN3OAwSaTS+XU2poKTjM=;
        b=BlrPHIKZeq4zEEm0LvxYTtmzpP9D34jTm14yT5uTALWqEazlLkXMWLbnLwiz0LwByk
         lh4a/lY5KVmIiEBVlj++1J/FC6w4YK8GG8pD8hEgg5t/HCr4ukQ7ST3hSLVrGUMwCbmF
         coWG6i54cZg7ujuPkouoi6uD/dlYG85X0Z2r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VaznlOFG0ZctBaWvSyM3TkkCN3OAwSaTS+XU2poKTjM=;
        b=WPK0gbc4BjTZYdY4kuxsrWefdo9nWgdVuqwsx4LjclCOh/8wgCrv3bRBCYttJHE7bR
         KFmfLuMhPC9SfFACa7wyJDv24kzL0JdJ7XEPFmudbRydT2XYEtrzh0CKFRK+QGzQfOTy
         4T2ottof/tuo+jZJtVLaJ56MaENMbFR2O5lER+HOGZJ7hkmkq7VqQi/Qrn8/6a5YV2zP
         PJKmwdEd/VpK2AZ0nflSQ8F9JuQPNIAAZpnMx5ph+ayP4ZQ3cMQ/AIcE/p1OG4gI7wFS
         rnw2WmfPCVwUIbvoU8Rb/o+mDhcQXS0QK2Kcj2TTtofnY9kB+PXodZXnmcFvSC753B+5
         I7kQ==
X-Gm-Message-State: AOAM532HsgfLWStwAmwnRsQPBUoeWe8xVnXxScFcF9LHsii324RoP3Os
	3Al8+GZZznVVc+5m5WmgQGfd2w==
X-Google-Smtp-Source: ABdhPJyUA2VycswmUqibIySsPlWoCv/r4Ry4kVCSAO7uSNk3GNg3gjn5okvNYU67mswM9S713RSotw==
X-Received: by 2002:adf:e544:: with SMTP id z4mr10180768wrm.317.1591129069159;
        Tue, 02 Jun 2020 13:17:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d24sm1027589wmb.45.2020.06.02.13.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 13:17:48 -0700 (PDT)
Message-ID: <24a52dc42bb9eb49e2f8802a3c7558859160de18.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] glibc: move ld.so.conf back to main package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>, Rasmus Villemoes
 <rasmus.villemoes@prevas.dk>
Cc: openembedded-core@lists.openembedded.org, Martin Jansa
 <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>, Andreas Oberritter
 <obi@opendreambox.org>
Date: Tue, 02 Jun 2020 21:17:44 +0100
In-Reply-To: <20200602200008.GB2207@pbcl.net>
References: <1614B0E5E96C4272.14405@lists.openembedded.org>
	 <20200602121722.32623-1-rasmus.villemoes@prevas.dk>
	 <20200602200008.GB2207@pbcl.net>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-02 at 22:00 +0200, Phil Blundell wrote:
> On Tue, Jun 02, 2020 at 02:17:22PM +0200, Rasmus Villemoes wrote:
> > In case of a read-only rootfs, one could add some logic to remove
> > them
> > if one really wants to shave those few dozens of bytes off.
> 
> Note that there's also a slight runtime performance penalty
> associated
> with having these files in place if they're not doing anything
> useful.
> It'd be nice to try to make sure that nothing regresses in that area.

I understand the concern, I am a little torn on this as adding in too
many different controls and options complicates the test matrix and
makes things harder for users.

You're effectively suggesting a new DISTRO_FEATURE to control this? or
maybe better, perhaps a glibc PACKAGECONFIG?

Cheers,

Richard

