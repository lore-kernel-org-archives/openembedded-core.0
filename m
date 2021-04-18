Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.396.1618783806223723139
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 15:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XE8neQJ5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id x7so31967230wrw.10
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 15:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=/kQhWgEdDspn7sV4EwID95h0blb1IAWBvTvvXly07Gs=;
        b=XE8neQJ51IhcZYONrpGTSENGfumgVSxzoDjGmwJfMncOflDKCZ1FB9LmHK02diyTPg
         fHs66mkaJ2ZqPkOiiSChXgqNkDxftQwrIU+91twNWJWvvA6tn2pUM1TJFvGGEJhHYrIY
         KonBc0+etUONe7nrWdI8wI6KXxjeCCVl1YSzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/kQhWgEdDspn7sV4EwID95h0blb1IAWBvTvvXly07Gs=;
        b=SP1HqnIRDcKFXnNHj8mRmOZgo7x43pnXXgg7E3z7O9g9PX8PMqvZTa+q9MctY6VBoo
         /5pcVXZgQDgnOvr5I9mQtGLPOyMiGz0fisLj/F4V9kpCjclnA9ToMUnmpOgiXndsKDuL
         MPLuWNnJUe3u0p93wqDx5IPNeFuTjgB6gY/e7p7g05ONED5jpguMqHzRjrluJEHwckNz
         y6D6GVor3T5LFrqOocoo/RqhJa9PS5Sdg+niDkIHCMGKailCloUm7bzJPCUZgQI3VXgf
         h35Eotc7EQavO5MLzaiIoGKlT5OmiDOyqQPrUakA2bbk2DORqYkB//BWOUgac27VOQ8k
         ij+Q==
X-Gm-Message-State: AOAM532vrVE2jodL5ijRGsm68Cj6W3W/dgm69zaoCwnIAX51SFY5wYih
	r+IA1A4LEjRfRqnv/nvifSeHlA==
X-Google-Smtp-Source: ABdhPJym1xylkLDwImkvmoDJn6216OleTkkOZ7KxiTTqzr8HmWuie+2C3xxj0Og9g8THnTNSXwJ9mA==
X-Received: by 2002:adf:f70f:: with SMTP id r15mr10650222wrp.208.1618783804560;
        Sun, 18 Apr 2021 15:10:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:3b9d:2a57:e60:cfc4? ([2001:8b0:aba:5f3c:3b9d:2a57:e60:cfc4])
        by smtp.gmail.com with ESMTPSA id m67sm20004698wme.27.2021.04.18.15.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 15:10:04 -0700 (PDT)
Message-ID: <15c2ccbe74223d7a106efedf1b8800b5a30f2bc9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/6] wpa-supplicant: Enable openssl
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 18 Apr 2021 23:10:03 +0100
In-Reply-To: <6c865d2c-240d-0fe0-ed32-b8976a792ee2@gmail.com>
References: <20210418081634.3169548-1-raj.khem@gmail.com>
	 <20210418081634.3169548-3-raj.khem@gmail.com>
	 <6c865d2c-240d-0fe0-ed32-b8976a792ee2@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-04-18 at 15:03 -0700, Armin Kuster wrote:
> 
> On 4/18/21 1:16 AM, Khem Raj wrote:
> > Use openSSL for TLS/SSL implementation
> 
> I wonder if leveraging the "virtual" framework might work here so that
> openssl, gnutls or wolfssl (whatever)  would trickle down and use the
> same TLS/SSl package evenly across all recipes in a single image?

The trouble is that each recipe has its own set of PACKAGECONFIG/depends 
changes needed between a differing set of options so its going to be hard 
to make one soultion which fits virutal/XXX as instead there are a list 
of different options with differing priorities. Not sure how best to 
handle it :/

Cheers,

Richard

