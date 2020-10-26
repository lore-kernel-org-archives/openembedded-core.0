Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.10573.1603708152876324084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 03:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dZKcL8j2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id h5so11755137wrv.7
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 03:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=XIicvdX77JFXoR+q/BZxAUr1bM1QnSKI0pugqXS5WLM=;
        b=dZKcL8j2TD/JZALiFmoX66hq6AShtpFCngRrOzjjSLHXq8BMPjKziEb7d6pJJVAFwd
         Zb3cFQZ62cL53V9Z/Y3rZM3/19FGfMhW1s7BrAoHSnjaRH7KmIDzymDMi1j26xVHZaEN
         qdROIMkaP8gOJwSO9xpmqXfX4bBhjxLXdaMqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XIicvdX77JFXoR+q/BZxAUr1bM1QnSKI0pugqXS5WLM=;
        b=ilWBSTN32Jc2alTy717ddo6gjqH9x0MW8ZVFbIszz/aVSsXN4a3Mb0WicYwOcZRcv9
         QuGulhWsyndUjXVH9Jja+53HZqyVoyw7G29txn5ZuyaUN+vFAllherGNJ7vaNcD9L34s
         L/jVgfQO078HWb03G895dSzqULz8vOEetano9yV81idH4cXlu6pDwyp3DQQ+mQZJoOAE
         2d8FLi6VHjB3eHv8T7ln/TF2pLOadXSoDwx1KcCNeCP17RJTHXUy4GeWYsTK9ADzMrDD
         NsUEeV4zBrMRP1lZt20e5+SbvMc0rlOAhV/qaEstG1Bzp+rLowTGsgQSx2D+E9SfrHmU
         srYw==
X-Gm-Message-State: AOAM531UBGAoyfFNOLMG35IxSViqvmeCxKLpGum0G4TClhK8tjO/5bkr
	PPJ/ZnWOvURA8fO1rEeurBzAFA==
X-Google-Smtp-Source: ABdhPJxhGv7J3QcsDTXd6IM+wQEsClqzc4gOYJnfuNlBuT15rh0FFK0BkAld5MwDFY+vQ/zwlVOZVw==
X-Received: by 2002:adf:e741:: with SMTP id c1mr17842848wrn.16.1603708151244;
        Mon, 26 Oct 2020 03:29:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.f.3.3.a.5.1.9.5.6.b.0.0.2.c.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.f.3.3.a.5.1.9.5.6.b.0.0.2.c.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c20:b65:915a:33ff])
        by smtp.gmail.com with ESMTPSA id n5sm21883900wrm.2.2020.10.26.03.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 03:29:10 -0700 (PDT)
Message-ID: <2ad67eb9e783fa044d4d97f35f93a35014aa73e1.camel@linuxfoundation.org>
Subject: Re: [PATCH v4] Add new recipe for squashfs-tools-ng
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: luca.boccassi@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 26 Oct 2020 10:29:09 +0000
In-Reply-To: <20201026100503.3200192-1-luca.boccassi@gmail.com>
References: <20201022113036.2938947-1-luca.boccassi@gmail.com>
	 <20201026100503.3200192-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-26 at 10:05 +0000, luca.boccassi@gmail.com wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> The main difference with squashfs-tools is the availability
> of a shared library and a programmatic interface, rather
> than just command-line tools.
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v2: added MIT, Zlib and BSD-2-Clause to LICENSE
> v3: fixed CPL-3.0+ tag, removed GPL2 from checksum (not used),
> changed
>     recipe to be versioned, use bb.utils.filter in PACKAGE_CONFIG
> v4: disable zstd support by default, dependency not available in oe-
> core

Sorry, there is one other issue. There is no maintainers entry for this
recipe (see meta/conf/distro/include/maintainers.inc) which would cause
oe-selftest to fail. Can you add an maintainers entry please?

Thanks,
Richard

