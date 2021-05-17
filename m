Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.346.1621270305958289131
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 09:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JBdwlfMO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id u133so3964619wmg.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 09:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Bw1EA3lcUCslTapeABCNo3hSG64K7eZYQQxs/3Uanro=;
        b=JBdwlfMOYQQNpOvpP0ViM9Hdq0RVUqo/XacFBCbJEEC7v+cbSNTEA6bKtlQbQAtCz4
         fcZG7E3yElLpl8+fsG8yA0aPTxfu0hZlpXzzlVB3TZvf2HxMG7S1gBtusTLPps22zgj2
         V6AsBnaIT+y8/ntgR/wRHrhbJ262FUsWnMLyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Bw1EA3lcUCslTapeABCNo3hSG64K7eZYQQxs/3Uanro=;
        b=OFOMDn8bQOY3eKB8Q4vvPq0/j1FwyCZ5mQYmoRWUuDx1bkY4XAh/x56CzRrQ8fsPhx
         wzJxMIqAGuHtPBSjg0wow1zhV/9ash0nVa1viQsxc6R0JOc/duECwgLCe+HhmdL6qnKh
         AmhoZBfVVkv3SvGGuHs9W0iVx9VPsS6objl3QjBjUu/C75LcyGQBsmMGP8/B1JpQpiYr
         KiOXO1lmjt/9qlm0fBkdyg0YpUVBVH0iNn0r5aYOhbtU+Si72pKAieZOabzY0m0/GlQs
         089l0/2D7imf5Ly5J9AVJpBnjPcH/O9OhomBLKDpAqRGA6YVzd7kuN6VSax1wgyYRIp9
         +spA==
X-Gm-Message-State: AOAM530R5PByso4sR3bblKGDz4Icvpu+FtlZY0nAEL8pUvvZImnWPAdH
	jqkhLZg+/tUYpAuyA0QLQGhTSA==
X-Google-Smtp-Source: ABdhPJz8EvwsAkB94ub/xAJSa2JlgZC0gTnic9YJTYi7q0Ny6ghvEJaifmL3P+/ykHIQGOvXPFpk0A==
X-Received: by 2002:a7b:c191:: with SMTP id y17mr46041wmi.19.1621270304461;
        Mon, 17 May 2021 09:51:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc? ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id e20sm39040wme.26.2021.05.17.09.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 09:51:43 -0700 (PDT)
Message-ID: <b4ccd8d3ecb4bcef5a84af4440c16891cddd2ab0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 11/27] python3-setuptools: upgrade 56.0.0 -> 56.2.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 17 May 2021 17:51:39 +0100
In-Reply-To: <CAMKF1spmyAgfPgASqQkU9GhLNdjB2FrGXQFR3bjs2EGHzD_9Cg@mail.gmail.com>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
	 <20210516223247.2401235-11-richard.purdie@linuxfoundation.org>
	 <CAMKF1spmyAgfPgASqQkU9GhLNdjB2FrGXQFR3bjs2EGHzD_9Cg@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-05-17 at 09:26 -0700, Khem Raj wrote:
> Hi Richard
> 
> I am seeing a failure in meta-python with core/master-next
> 
> https://errors.yoctoproject.org/Errors/Details/581298/
> 
> is this related to this upgrade ?

Looks like it could be :(

Cheers,

Richard





