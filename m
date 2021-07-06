Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.11775.1625602357095883561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 13:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TauZw40+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id p8so415992wrr.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 13:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=iq0z74X0ojkf3fomsv0DW5MQDmaXkhYFAYQItUpTp5I=;
        b=TauZw40+5svD/aUxOgmdM0zVXG6KJTryyNXIIY9MMXQEFPj8/AV5jnCM+9i8gYjXlJ
         3g55aJDKz10JZshNdkvjJJyusJyCo+Ygt7qomiHh8frhbNQLI4kUEO22DK9qY70tMUY0
         YmSB0QxNHAPDYTRht57t+SWEE1c9j8ecn0SLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iq0z74X0ojkf3fomsv0DW5MQDmaXkhYFAYQItUpTp5I=;
        b=chpHvKz1nXi9+i+mH7+ZzVIjmdi1KFsD35svSKqk9+JfQ0VR4fGavcDtYSFfmpC5+0
         UZ+mhWEPoE96LDmvsQw3ta5mcmhhfZs9/eq8K8l3Zf3+lG+rWbekLALcfv0oEAxOo22G
         sa6i6KtsjInCFQcrjZVN2ixojdyoj1C+9XM4wEMI3UgioVcPRN9BiwROjPuH9aVilK7W
         +OkyTXWScWzypIr4VqfJO31pDhmsSC0Ma+VrAoGv8AiOchK/+tMDXJlQtCK+E8pl9SQN
         mr+ZvN3lENMPsJqEsJL3ZHwcAKdI2P4l9toFPfOdc3+HUa3xtVsVqhnUpITWSA90pH4V
         eBow==
X-Gm-Message-State: AOAM531O1wMXWec02x/iFG5YeBiywQo92I4Xtug1redVuo+nSjOsbRB7
	Xa5zyPGj1KF9bNDmpEUNFPi6lQ==
X-Google-Smtp-Source: ABdhPJzP503P2+SnoXXR3s80uT/8jW3PHpK21LwLUJn/jUyYqVvgnKNoBeIQyxHZ487OtvDKpj25Sg==
X-Received: by 2002:adf:fc83:: with SMTP id g3mr24298395wrr.154.1625602355391;
        Tue, 06 Jul 2021 13:12:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8f67:c2fd:32f6:7bc5? ([2001:8b0:aba:5f3c:8f67:c2fd:32f6:7bc5])
        by smtp.gmail.com with ESMTPSA id w8sm19175120wrt.83.2021.07.06.13.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 13:12:35 -0700 (PDT)
Message-ID: <fc14cde762af386d38735e97dccb14457b1a044a.camel@linuxfoundation.org>
Subject: Re: [OE-core] RRECOMMENDS "masking" unsatisfiable IMAGE_INSTALL
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alex Stewart <alex.stewart@ni.com>, Rasmus Villemoes
	 <rasmus.villemoes@prevas.dk>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 06 Jul 2021 21:12:34 +0100
In-Reply-To: <2d520cb4-2af1-fa63-1ea2-141f72a7bd80@ni.com>
References: <5d6b6934-bd33-04e5-cf55-ce09895bbd6c@prevas.dk>
	 <599d48303a40d8c4db4d0d380d4cfcc5f0c7acfb.camel@linuxfoundation.org>
	 <6f831e07-bfc3-8803-07a8-39050f92b3f6@prevas.dk>
	 <6413b9648787dc0ba529241cb62bc5e031654d22.camel@linuxfoundation.org>
	 <d2bb69c7-1466-d265-4f81-adbd69ebb512@prevas.dk>
	 <2d520cb4-2af1-fa63-1ea2-141f72a7bd80@ni.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-07-06 at 14:39 -0500, Alex Stewart wrote:
> Hey Rasmus,
> 
> Sorry for the delay; I was OOO for the holidays and I'm just now working 
> through my inbox.
> 
> On 6/28/21 4:17 AM, Rasmus Villemoes wrote:
> > On 25/06/2021 18.13, Richard Purdie wrote:
> > > That is probably a bug that needs opening against opkg in bugzilla then.
> > > Added Alex to Cc: (opkg maintainer).
> > Indeed, thanks. Alex, do you have enough context from the above, or do I
> > need to do anything explicitly to file a bug?
> > 
> > Rasmus
> 
> Could you expand a bit on how OE is supposed to fail when the kernel 
> module package is unsatisfiable? Does it propagate a opkg satisfaction 
> error, or is the misconfiguration caught in the OE python modules?
> 
> I ask because it seems most likely to me that the inconsistency here is 
> in the OE opkg interface modules, rather than opkg itself - which 
> obviously has no concept of IMAGE_INSTALL or the kernel configuration.
> 
> Can you identify the set of packages that OE is requesting opkg to 
> install, with and without the RRECOMMENDS? That would help to 
> distinguish between an inconsistency in the OE PackageManager modules 
> and a bug in opkg itself.

Kernel modules can be:

a) not built at all
b) built into the kernel
c) built as separate packages

For OE, where something needs a kernel module, we suggest people:

RRECOMMEND_XXX += "kernel-module-xxx"

and the kernel recipe has PACKAGES_DYNAMIC = "kernel-module-*".

From bitbake's perspective, it builds the kernel (since the PACKAGES_DYNAMIC 
covers kernel-modules-xxx) and then hands off to the package manager.

In the case it was built in, the Recommends will be passed over by the 
package manager since it is just a suggestion. If the module is present,
it would be included in the image.

The issue as described is that if someone has IMAGE_INSTALL containing
kernel-module-xxx *and* some other package in the image RRECOMMENDS that 
module, it doesn't error if the package doesn't exist.

I have to admit I don't remember how IMAGE_INSTALL is being passed into
opkg but the change in behaviour due to the addition of a RRECOMMENDS does
not sound right to me. The rpm backend does not do that but errors 
consistently.

It sounds like the "Depends" from IMAGE_INSTALL is somehow being overruled
by the Recommends from some sub package dependency.

If we're driving opkg incorrectly, we should fix that but I'm not sure
where the issue is, I suspect opkg...

Cheers,

Richard


