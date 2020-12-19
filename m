Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.10781.1608393128341331842
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 07:52:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eWBc4ixQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id a12so6238499wrv.8
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 07:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=62kLOWWoFN/hSAGp+oyyNvD+XexHL9Iupw0BAo1E/fM=;
        b=eWBc4ixQ14zOQIuwEz3fbcLrH6nBblousNTewY4R22+R1xTkrvGvlRrSg+7cFZ0CEj
         QKEuScicBrgj114+/5ioS8FFACjoSqCQUnBqh1ItPbJSA4HGqbI8ep1be5k3lSMTYuyq
         QoArgRIqYsbf+2HqldoEQJ8tsAv3GVtpQyFDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=62kLOWWoFN/hSAGp+oyyNvD+XexHL9Iupw0BAo1E/fM=;
        b=g3m8O3M3zC2IEsvpKqehKnlsIASJnSZnjyadW4sF95GNcSGzPs87msbLlPeR10Y7ec
         oCx/OJyEl5Sux0KfVL/pEhLinb4ymSBNbFe8TtSEkJQdu/GGNIxgvGbLyFNDM/U7x2E4
         AGm/ZAWBFGRZ+o5pJLtuMV+1RAhNztX3mdpbdwkRMDCjOZx8n2Mv3hnC2DjbagKVA7xc
         JfEzeOBcz59k3pGYb8vElEGtlsNbhhc3d2W22CiNYuXDsdp0JhUwp+G4aQpy+3qPK0bD
         KCYsl0KkzuBfGMVAchL3tZD2lcGcN23rZ/a8wN8DvngxwoFtTUY2gbwrWA47TIu8wDJv
         HK2Q==
X-Gm-Message-State: AOAM530dWM3iIsotJb12hXuQYIYZGWA0XcZIq3+3zV3WmSMwpNu7ctdZ
	NPYXMhoHj0wfoQfvaMzwLuDnfw==
X-Google-Smtp-Source: ABdhPJwkKztxOpnuf5N2VfkzyFVKJTDPfwiQBVIAA9DYGOCGdzcNKYeF7Z1l4610siLGn7cJA5nFAQ==
X-Received: by 2002:adf:eec7:: with SMTP id a7mr10008854wrp.45.1608393127007;
        Sat, 19 Dec 2020 07:52:07 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:912:b4c7:177d:a044])
        by smtp.gmail.com with ESMTPSA id h20sm19446580wrb.21.2020.12.19.07.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 07:52:06 -0800 (PST)
Message-ID: <f213eac0f84b71359c5909a54b45d4783574e836.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/8] linux-yocto: consolidated pull requesrt
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Paul Eggleton
	 <bluelightning@bluelightning.org>
Date: Sat, 19 Dec 2020 15:52:05 +0000
In-Reply-To: <CADkTA4Ou33v4AhB+JTTwxytUr1-UWRrbS8qd562utkiq-a49HQ@mail.gmail.com>
References: <cover.1607958349.git.bruce.ashfield@gmail.com>
	 <faff0743666a4ef199d2902a1611a83ee5c2a4a9.camel@linuxfoundation.org>
	 <CADkTA4Ou33v4AhB+JTTwxytUr1-UWRrbS8qd562utkiq-a49HQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-12-19 at 10:48 -0500, Bruce Ashfield wrote:
> On Sat, Dec 19, 2020 at 6:31 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Hi Bruce,
> > 
> > On Mon, 2020-12-14 at 10:09 -0500, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > 
> > > 5.10 dropped this morning, so I'm switching over to the libc-headers
> > > and reference kernel upgrade (5.4 and 5.10 will be in master, with
> > > 5.8 being dropped).
> > > 
> > > But since that will take a bit to sort out, I wanted to send my queue
> > > of patches for other fixes/versions.
> > > 
> > > I didn't pick up any issues with local testing, so hopefully this
> > > won't
> > > cause any problems.
> > > 
> > > I have the lttng-modules patch from a previous send repeated here,
> > > since
> > > it may be easier to take it as part of the bulk update. I checked
> > > just a few minutes ago, and there isn't a new tagged version of the
> > > modules yet, so we still need the backported patches for 5.10+
> > > builds.
> > 
> > I was able to merge part of the series but there were some warnings
> > that came up:
> > 
> > meta-intel:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/1020
> > poky-tiny:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/3105
> > 
> > so I've deferred the kernel tooling bit until we can figure these out.
> > That means several other patches which depended on that also couldn't
> > make it in.
> 
> Nothing else should have depended on the kern-tools ones, it is independent
> of the rest. Either way, I'll submit next week!

The others don't rebase cleanly without it and I wasn't sure if
resolving the rejects was going to be a good or a bad idea so I replied
on list and asked :)

Its probably easier for us both if I wait but I can rebase if it makes
sense.

Cheers,

Richard

