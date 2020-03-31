Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.6504.1585652672103489817
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 04:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QdqBiWfw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id c195so853235wme.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 04:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=MULNc3MIuK1bxSnDM3lmmrrRunyODvtYJM892xT8yFc=;
        b=QdqBiWfw4OnP1kIuryU9yfVJ7/4SYPhuGeUZ3io09qvn4U4je47ztYtDFMqJfIk7Wj
         z5TMk8JtYuja+aiqAU0Kxtp+2eGvdpfTpt1IcRaOhFdkDSTPlmTCR8zRYf3CsVoDowUd
         udVIj4DjWqZxr1xJA75uUQec/Ia0CG5FcXFFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MULNc3MIuK1bxSnDM3lmmrrRunyODvtYJM892xT8yFc=;
        b=rWazlxJLwJ1d6R42n+v3LH/go2+5wj6rsO9XNrKeyKnEwxc8O/ENvbwqIIOUKe73Aa
         WfphoRDVNEx+rmySABSCSJX0lh2Oqfl3YoEMy818NH8nsnvM5A8pUIcS5cuKwMti3mOi
         tWoELBfAdu8IC5LX7tFLF/6C5if0wlM1kD0yifh39+GxolxKt3cKZQLxV74UMY0pDjjG
         xjZ2BBLqzXUB0sRMJvCERU4nBRXlksJ8PULmQpzaRywui5J/gxPQNoy5P6m9HXN6o/wS
         Oli/uXltYBXF/E0PH/HYGgcDSqbYIxoK4uVHBK0J9KuFRlE9n3KoRsBYmsJfUl1vDARy
         F+6g==
X-Gm-Message-State: ANhLgQ2eADOCR8/tHfeiMz5Fre7e6L8y4HdH5NWsAWGqmxDqd+ph57TM
	zwp7iwlQF3XAtlvauhBDMIhqzQ==
X-Google-Smtp-Source: ADFU+vu1idIYtfsGfGrduvwEvE3SjGrxDKe5naSmWlxN1uH7gYKavr/au2c991chzjybcptd8U1ueQ==
X-Received: by 2002:a1c:f71a:: with SMTP id v26mr2784403wmh.19.1585652670540;
        Tue, 31 Mar 2020 04:04:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s2sm25543556wru.68.2020.03.31.04.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 04:04:29 -0700 (PDT)
Message-ID: <50db175f9fb472af9236d3d915e66cbcadbdb529.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] file: explicitly disable seccomp
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jan Luebbe <jlu@pengutronix.de>, Ross Burton <ross.burton@intel.com>, 
 Khem Raj <raj.khem@gmail.com>, Martin =?ISO-8859-1?Q?Hundeb=F8ll?=
 <martin@geanix.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Enrico Jorns
 <ejo@pengutronix.de>
Date: Tue, 31 Mar 2020 12:04:28 +0100
In-Reply-To: <9464fbdc93aa48aac796a3ea44e04efcd9564963.camel@pengutronix.de>
References: <20191018112819.16210-1-ross.burton@intel.com>
	 <CAMKF1soy5adOpd49H0dTqtwu=vSRc0EPMnXFvD5uQTaJd+JCig@mail.gmail.com>
	 <1615697b554b612f329820f2b3f692011b7722ba.camel@linuxfoundation.org>
	 <9bac0b45-777c-faba-f448-d2d03c7e6fac@geanix.com>
	 <CAMKF1soa5bEfN23uPAhDCk4rfD_OGjaf2xR+m5ET9cLt+kOn0Q@mail.gmail.com>
	 <f6cb669c-d302-c1fa-e2ed-5995b82677ed@intel.com>
	 <9464fbdc93aa48aac796a3ea44e04efcd9564963.camel@pengutronix.de>
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-03-31 at 12:57 +0200, Jan Luebbe wrote:
> Hi,
> 
> On Mon, 2020-01-20 at 17:10 +0000, Ross Burton wrote:
> > On 20/01/2020 15:45, Khem Raj wrote:
> > > pseudo needs some love since it alters syscalls which go out of
> > > bounds
> > > what is allowed by libseccomp until then pin your file version to
> > > 5.37
> > > in arch till a supported distro is affected by same problem. It
> > > wont
> > > be long better option is to fix pseudo
> > 
> > That's not quite right.  pseudo LD_PRELOADs itself into file, and
> > makes 
> > syscalls which are not whitelisted in file's seccomp configuration.
> > 
> > There's nothing pseudo can do to solve this.
> 
> I stumbled across this thread when checking why libseccomp is not in
> oe-core or meta-oe. It seems to me that pseudo could intercept the
> seccomp(2) or libseccomps seccomp_* function calls and report them as
> unsupported to simulate running on a kernel without seccomp support.
> 
> What am I missing? :)

I don't think we'd thought of that, I like the idea in principle...

Cheers,

Richard

