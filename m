Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.8212.1598430314375259944
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 01:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e3dSYKMx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id x7so881865wro.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 01:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=GzN4gn/ozOLAX7mBQlvaRFfoKIOAXMtglhg1vvmXhG0=;
        b=e3dSYKMx1+YrNl1hyLBvS5x2Wm4HCLqC379PdBbup/5PdRv46SWy8lluYaKFHyvXYW
         TLiKghSArtgNg1GehnmuuLFaFSf5fnsX7edK3U3JDZAMqw9Z3R/3T+7pybNkIaknTTSC
         6sDnve5dH1scFUszD/jIow/MhX2TGWx9ZmRko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GzN4gn/ozOLAX7mBQlvaRFfoKIOAXMtglhg1vvmXhG0=;
        b=WkbC7Guu9lZPI3CDcYyE2hqBzSGZG8kz1CRu7EmG2l6ZnpxTvxiaQ4JBFoG34vHu9R
         9hmmgSpOZrGj/eOjlurujL5Mx5Oq85Uor9MXhe+a4C90OLORLLMx9Dg2ajynVU44O5CC
         XSjZWlEOE703C6wpdE8iHCV7/3P68cSoyeWdk9wFlwF3c6cbUqUU0sirDJDEPMufdbqM
         mqCPduyp6CjNWtkSqApqRxhofnFwV2kQ+ptzeqOHkz7YPmoOajC7XwoYlcyVdkoCh2Qk
         vjVsVTABaRWFabyrdcNSk2S8w6lmzoDo+DF/CFJi339Z/5bUYtUwaRYLY6Tyh0NBtJNH
         PV8w==
X-Gm-Message-State: AOAM533IGXexc+No81/fqePFxSvFYYjl9N9nvhlQY4ZxsXG1fEEpHDiC
	+KUZKYTnXU6SDiMYkoiwwJX4LnSXxFjCNTZd
X-Google-Smtp-Source: ABdhPJx7lwj2lke6jtZMUUuqNtryotvcmt4i8fWmhd5oJWF172jxIG0fWMIAHieznDzb0O63Wi7uHA==
X-Received: by 2002:adf:de8d:: with SMTP id w13mr14077897wrl.129.1598430312393;
        Wed, 26 Aug 2020 01:25:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id y24sm3481732wmi.17.2020.08.26.01.25.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 01:25:11 -0700 (PDT)
Message-ID: <1afbc09b96e9a67f0523b58c990db6575efa1aa8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] runqqemu: Show an error for conflicing graphics options
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2020 09:25:09 +0100
In-Reply-To: <162EC39E629DF7EB.27554@lists.openembedded.org>
References: <162EC39E629DF7EB.27554@lists.openembedded.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-26 at 09:19 +0100, Richard Purdie via lists.openembedded.org wrote:
> The autobuilder managed to pass the nographic option with "sdl gl"
> due
> to a problem elsewhere. It would have been useful for runqemu to have
> errored rather than passing conflicting options to qemu. Add an
> error for this invalid usecase.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Two typos in the subject line fixed in -next.

Cheers,

Richard

