Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.10102.1592657137344307311
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2020 05:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=faogDmSA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id r15so11396385wmh.5
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2020 05:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=SPaCjlrlqx9CpQjGtKuNAz0erGas/1rdgeaFcFmNC9U=;
        b=faogDmSAwGiB+JDwOc95908Qzfh4nYignDgs8cmr5vLxl9kbW0uHyGnQu2qwxiYw6L
         vriE8jr+xdNK0GJKCuWE4BYHJBdwDI+rNvmfP4n5X7ttwcduE+A807R4LKtlK1wiXilt
         2C70Vkgwce4dxLDNhmJpEEMR0UZ6OAFuQPKco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SPaCjlrlqx9CpQjGtKuNAz0erGas/1rdgeaFcFmNC9U=;
        b=mEVqR/7Ci3OSPz+2c0iOdisfzzOH8fBeROByvpyUgxN90kUWjsGrpefek7QyU4x+9L
         Il7kZPrAfV7zj+6Silm+D3RIk0rQBC9mTlsOGpA2lHhaJu93ZP0R+s86IHBHcD+gIPyD
         Ufk+/SbqsJIm14z/h6eivVUSzenIJ+wEfZFDm60wglSo/SfR4ss1mjTJ9LLGS/BHbSue
         OI0qVqlDF1erzBg506ZyNh9xr+/ag0MaN4ZiOHDTfxr0v7PJbyPRCifs8HAFM6jkyA5N
         1qsxOakcOAF4sUMuygF/07sCjzlrDF7dzoBjUumdpzbwx6FQWUuZ332jM8NK+aOznOGy
         i3hQ==
X-Gm-Message-State: AOAM5324zycFPXa10otVA+mFhZSgyJEDgc186+4l5QehOWJ8F6DUVjas
	G5xd4Rt/3JJwAK/OFfiBsmluhw==
X-Google-Smtp-Source: ABdhPJzGQQtCmEt4kptcfMsUgu9gPL5lMiVvRbrjeFJhpcGIkskxazC+8acruSy+bJEjLPIM0GvD8g==
X-Received: by 2002:a7b:cc85:: with SMTP id p5mr8318047wma.125.1592657135814;
        Sat, 20 Jun 2020 05:45:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id g19sm9632627wmh.29.2020.06.20.05.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 05:45:35 -0700 (PDT)
Message-ID: <ce0383b221fbe65e28f940b04443cb7c4d93bce9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [OE-Core][PATCH 2/2] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, Ross Burton <ross@burtonini.com>,
  Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Date: Sat, 20 Jun 2020 13:45:33 +0100
In-Reply-To: <CAO5Uq5Q1VwSVeVA7gRkjKda1upvD1iAi=Zgj5e1GGFXEHtntrg@mail.gmail.com>
References: <20191219221748.27079-1-alex.kiernan@gmail.com>
	 <20191219221748.27079-2-alex.kiernan@gmail.com>
	 <902865ec-101f-0e0b-e17c-03c2fa555921@intel.com>
	 <161110ADA6F0224D.21901@lists.openembedded.org>
	 <CAO5Uq5Q1VwSVeVA7gRkjKda1upvD1iAi=Zgj5e1GGFXEHtntrg@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-09 at 16:08 +0100, Alex Kiernan wrote:
> On Thu, May 21, 2020 at 3:14 PM Alex Kiernan via
> lists.openembedded.org <alex.kiernan=gmail.com@lists.openembedded.org
> >
> wrote:
> > Hi Ross
> > 
> > On Thu, Jan 2, 2020 at 11:20 PM Ross Burton <ross.burton@intel.com>
> > wrote:
> > > On 19/12/2019 22:17, Alex Kiernan wrote:
> > > > Enable rootfs_check_host_user_contaminated by default
> > > 
> > > Useful check!
> > > 
> > > WARNING: Paths in the rootfs are owned by the same user or group
> > > as the
> > > user running bitbake. See the logfile for the specific paths.
> > > 
> > > /data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-image-
> > > sato/1.0-r0/rootfs/usr/share/fonts/.uuid
> > > 
> > > /data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-image-
> > > sato/1.0-r0/rootfs/usr/share/fonts/ttf/.uuid
> > > 
> > > (patch incoming)
> > > 
> > 
> > Did you manage to get a patch for this out? I've had a couple of
> > goes
> > at reproducing it and failed, but I suspect I'm not including the
> > right things. It would be good to get this check enabled early in
> > the
> > release cycle, if we can?
> > 
> 
> Ping?

I'm trying to enable this but its triggering warnings on the
autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/2037

Unfortunately the logs are totally useless. I think we'll have to
improve the logging before this can be debugged and fixed which blocks
this merging.

Cheers,

Richard

