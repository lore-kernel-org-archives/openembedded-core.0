Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.3207.1630401878163675116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 02:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hk9imxSS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id b6so26535082wrh.10
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 02:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=OD3JrsT7uPJPpAM57+H73Z+JDhIVp/+Y9WX0+epItQU=;
        b=hk9imxSSCqm7Bv44G5pZoPHVAuqVTyK0Lyou72NYF1Ju3sucke2Qhv23y6frGa+goA
         c7BA6gJhIVrCfILvIzSaijZfL8+lYhz4zGI/pZAtB02smbrRNC2esv+aEHrQA2ymOb85
         8NRshZtfyU6MOt3utya7e0E0IZPg49H4V2QQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OD3JrsT7uPJPpAM57+H73Z+JDhIVp/+Y9WX0+epItQU=;
        b=pSULvRRE3p5vM5vnFgswvEDIzp0ApMfftIVv0wFIeOg7AJF7iVWDCiIROjn1Fg/98z
         shkRBPiVkLqYm+9lUtCz9n8aicKd2J2QpmeTY+j48CwC0i8a+IOD4KzUoZ2atw6Qq1Wy
         JzAEftVll6YD+X7vfJR72TZjTUaEuBlzUxvJPg5PtByJVYVQKDoeDUlI6Ve2It1RDlVt
         1ro+/IVCedP1GktB5ygadHdSgy0UVv9X58wAX0NvVtIhPVS68BQZirHZ3FW9iainfPnk
         1KEwBV1bGgM636tqF98/TlKH7kLnZrQWcCqoHOame8/c/aHIeU4awp1YSOA562YW8XRp
         O0HA==
X-Gm-Message-State: AOAM5309GefT8Lna3vXNZcOYPtudPMNktCqkWMtUF2QnYkKHdL1TVCcd
	Ku7NDbnvobSwCM3XPcKXnp+0+A==
X-Google-Smtp-Source: ABdhPJw/dI+de+hPMsnH6DghnLwAnIgSW69yw1f7AV/2Gl1dlZ79LFCLU0jZhfPHrSa2ysxIgG0+4g==
X-Received: by 2002:adf:ba0f:: with SMTP id o15mr29783135wrg.386.1630401876796;
        Tue, 31 Aug 2021 02:24:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e840:dd4f:b947:28bf? ([2001:8b0:aba:5f3c:e840:dd4f:b947:28bf])
        by smtp.gmail.com with ESMTPSA id f3sm1900721wmj.28.2021.08.31.02.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 02:24:36 -0700 (PDT)
Message-ID: <12cae25e667c774400af83ff3a860f7eb88510ac.camel@linuxfoundation.org>
Subject: Re: [OE-core] why "PREFERRED_PROVIDER_udev" and not "PREFERRED_PROVIDER_virtual/udev"?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Aug 2021 10:24:35 +0100
In-Reply-To: <76f5fe9-f9a2-bed4-6cd5-8d5749c95dce@crashcourse.ca>
References: <a9a5b3df-5a2c-c7c-ba3e-9e4ed712cf67@crashcourse.ca>
	 <CAMKF1sqwHvndd5ivxEgk_gV4ou6cwZ1bHhs4T6Czs6omQHYA+A@mail.gmail.com>
	 <76f5fe9-f9a2-bed4-6cd5-8d5749c95dce@crashcourse.ca>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-08-31 at 04:27 -0400, Robert P. J. Day wrote:
> On Mon, 30 Aug 2021, Khem Raj wrote:
> 
> > On Mon, Aug 30, 2021 at 12:52 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > > 
> > > 
> > >   i was going to extend section 3.3.17, "Using Virtual Providers",
> > > with an intro example using "udev" until i realized that that example
> > > doesn't use the "virtual/" notation. so ... why not? is there some
> > > distinction between other components that use the "virtual/" prefix,
> > > but a reason that one does not specify:
> > > 
> > >   PROVIDES = "virtual/udev"
> > > 
> > > rather than just:
> > > 
> > >   PROVIDES = "udev"
> > > 
> > > and then use the corresponding PREFERRED_PROVIDER_virtual/udev
> > > notation?
> > 
> > we also have VIRTUAL-RUNTIME_dev_manager which spans across systemd to mdev
> > so I guess we could but perhaps we already have this functionality
> 
>   a followup, perhaps silly question -- is there anything special
> about the "virtual/" prefix in the sense of being a provider? i mean,
> other than being more aesthetically obvious?

Not really, it just signifies particular groups like the libc example I mention
in another mail.

Cheers,

Richard

