Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.7005.1596633977292901077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 06:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Wh9rXhbP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id l2so30161448wrc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 06:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=os3YLVqtDysHIOiDwBdb3bKHA1Otj3Wjh9z+aMADBlU=;
        b=Wh9rXhbPzfZ1W8uwokcMZLMTNw1Au5UgLEH5/Fg9japEgEc2WnkGnNLJhxgaD+Wae0
         O0niMLmL55VNd9sOA8z0M81AnwT2mj35swVwxackVtMbGEcD3XLwK+1bfgVgVFfE3IeI
         zkMoQcGvz8JgYECNYOXA6Q9D7Ni2RA5WVFWdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=os3YLVqtDysHIOiDwBdb3bKHA1Otj3Wjh9z+aMADBlU=;
        b=rv2DuonuiJ0bJegEEpae4DUVSVcatV2yd90LW7SrqtcB+rpxVH5JFCSTBhog/hXtzS
         PTEglR55vnGHm5q6ew7aAs/ujCnMwMyE032vwgbYcj2Gwf3Ct4XcOjg3DU6iwP9YUACy
         38WyF4Z8bi9fzswjdIDombB+w817unqlwuMhymvxzL/z+Y1ttOWwo/Kz6qr/65Y6En+9
         R8tZMNIMQ9r6+tdoR44+Lg/9D+LH7Xqer3D+u3dyVKLjBPyuWJB0YtvxTu3/ZCvPUMNe
         s3gRaIrT6IKypanOv5LCJ6XGaDdGlCgueuv7saJSZddZDnqsuTNRWKN9ujXuFEERXRAz
         j/Cw==
X-Gm-Message-State: AOAM532wAkgSPJ9tN6cgzEA22TDDjX80D5q653H+3lzE+P0jfobZEWDt
	UCn2rqXcQiTLI3HHjwkiF8jGvA==
X-Google-Smtp-Source: ABdhPJxR7mKugei+CX+AyCSz7YJ8XWGpbFI8rpfMP/hej+e/XVsSF92t7wf5gJlTWWmXb9yEKkACTg==
X-Received: by 2002:adf:d08d:: with SMTP id y13mr2988199wrh.313.1596633975713;
        Wed, 05 Aug 2020 06:26:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7059:b67:8944:2881])
        by smtp.gmail.com with ESMTPSA id l10sm2765758wru.3.2020.08.05.06.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 06:26:15 -0700 (PDT)
Message-ID: <a4222506e98bfa3c11f4b14517f4092b951d81a8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 05 Aug 2020 14:26:14 +0100
In-Reply-To: <3237f09f-7b55-97b2-9c39-8bc7bf1a62c9@gmail.com>
References: <20200804082019.76320-1-jacob.kroon@gmail.com>
	 <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
	 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com>
	 <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
	 <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
	 <3237f09f-7b55-97b2-9c39-8bc7bf1a62c9@gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-05 at 15:15 +0200, Jacob Kroon wrote:
> On 8/5/20 8:17 AM, Khem Raj wrote:
> > here is a recent build with clang11 which also switched to using
> > -fno-common and errors are pretty much same you will see with gcc10
> > with this patch to revert the -fcommon defaults.
> > 
> > https://errors.yoctoproject.org/Errors/Build/107234/?limit=100
> > 
> > I was waiting for upstream packages to get fixed before switching
> > the
> > defaults back to -fno-common.
> > 
> 
> Yes I understand, maybe its better to hold this for now.
> 
> Having a list of recipes that needs fixing would probably speed
> things up. I can have a look at some of them.

I ran this through with just OE-Core and the list of failures is:

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/2237

I'm a little frustrated that patches like this get sent and them people
like Khem and I have to spot and avoid the problems as there isn't
testing :/.

I'll drop the patch for now until more of these issues are resolved.

Cheers,

Richard

