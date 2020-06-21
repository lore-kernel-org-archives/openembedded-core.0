Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.17598.1592755229166371255
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2020 09:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f8j2Uqqk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id q2so11826860wrv.8
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jun 2020 09:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=vxX2xIWOiZxojL5dSd8gl451DefyfJT3w7G8+I+pX7U=;
        b=f8j2UqqkQlnrtqdhFKNbjVC0D0wGFXCw6OQXRwYDxSApHKGjv5vtbbIj3DagAYzkHc
         8YiPYaJXCLRes2fn/M0FCEQtzfXwTW/3ZTq6M1oBQNYWZTxvO4RHJo9H8HL7+pduvh94
         KNYDsX1sW77x4XSyq/aDx54AbVHDWXZs+DCFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vxX2xIWOiZxojL5dSd8gl451DefyfJT3w7G8+I+pX7U=;
        b=c3qJs1h5nZEEu5PhfBTAjE/PFShJjS05cSP55w1avUqVAT+VYCDJjac3JYiA1FZbxZ
         fn3AwfXmTe3anKpIfq4OE5DWLL3161r9qYUMLML5w2WYRLg3G1uqzCpYTfSzS5HdcZLx
         hDPsRNOpoXf8BVkR8Zgfe2UvFkuv+cfh8WLNH4ospSAVc/mE5DpUIvUXlWaYHO9fArjP
         31wyegfwvxh6eZ0bXxFHQNMr/9Of0877y7ycZHJOEAMH/aBowU9g/vb93zaMYRnXI6nf
         4arPm0km/Uvpcp3krl7vyl4r3UJJdwsP7K4Ec6Gefw/74NiiyWhkc/yzs2sywlzLPG1c
         qZrQ==
X-Gm-Message-State: AOAM532IbSL1+TeoRc2XaWAwfuTyCj5sivEhSB0Q2P16A8t7Rdbw0eBO
	A9KEr0C+IJF0FEWZ+jCz8P7zVw==
X-Google-Smtp-Source: ABdhPJzzVZUyHNNKn5lrDFKSlJtAWlSXHUcJYkPWfNIBIQpFX0pDrRQPs4kRMhQPowAIxmt+SXihRw==
X-Received: by 2002:a5d:468d:: with SMTP id u13mr15429688wrq.73.1592755227630;
        Sun, 21 Jun 2020 09:00:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c25sm1855186wml.46.2020.06.21.09.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 09:00:26 -0700 (PDT)
Message-ID: <964e63ac0bfa723afd2f280b840edcc0340bb442.camel@linuxfoundation.org>
Subject: Re: [OE-core] [OE-Core][PATCH 2/2] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Ross Burton <ross@burtonini.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Jun 2020 17:00:25 +0100
In-Reply-To: <CAO5Uq5Sb37G8zRNPv=Ue3pxYnVPBgkR=XgHRoWCNs0C9iKuRXA@mail.gmail.com>
References: <20191219221748.27079-1-alex.kiernan@gmail.com>
	 <20191219221748.27079-2-alex.kiernan@gmail.com>
	 <902865ec-101f-0e0b-e17c-03c2fa555921@intel.com>
	 <161110ADA6F0224D.21901@lists.openembedded.org>
	 <CAO5Uq5Q1VwSVeVA7gRkjKda1upvD1iAi=Zgj5e1GGFXEHtntrg@mail.gmail.com>
	 <ce0383b221fbe65e28f940b04443cb7c4d93bce9.camel@linuxfoundation.org>
	 <CAO5Uq5Sb37G8zRNPv=Ue3pxYnVPBgkR=XgHRoWCNs0C9iKuRXA@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-06-21 at 16:24 +0100, Alex Kiernan wrote:
> Hi Richard
> 
> On Sat, Jun 20, 2020 at 1:45 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2020-06-09 at 16:08 +0100, Alex Kiernan wrote:
> > > On Thu, May 21, 2020 at 3:14 PM Alex Kiernan via
> > > lists.openembedded.org <
> > > alex.kiernan=gmail.com@lists.openembedded.org
> > > wrote:
> > > > Hi Ross
> > > > 
> > > > On Thu, Jan 2, 2020 at 11:20 PM Ross Burton <
> > > > ross.burton@intel.com>
> > > > wrote:
> > > > > On 19/12/2019 22:17, Alex Kiernan wrote:
> > > > > > Enable rootfs_check_host_user_contaminated by default
> > > > > 
> > > > > Useful check!
> > > > > 
> > > > > WARNING: Paths in the rootfs are owned by the same user or
> > > > > group
> > > > > as the
> > > > > user running bitbake. See the logfile for the specific paths.
> > > > > 
> > > > > /data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-
> > > > > image-
> > > > > sato/1.0-r0/rootfs/usr/share/fonts/.uuid
> > > > > 
> > > > > /data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-
> > > > > image-
> > > > > sato/1.0-r0/rootfs/usr/share/fonts/ttf/.uuid
> > > > > 
> > > > > (patch incoming)
> > > > > 
> > > > 
> > > > Did you manage to get a patch for this out? I've had a couple
> > > > of
> > > > goes
> > > > at reproducing it and failed, but I suspect I'm not including
> > > > the
> > > > right things. It would be good to get this check enabled early
> > > > in
> > > > the
> > > > release cycle, if we can?
> > > > 
> > > 
> > > Ping?
> > 
> > I'm trying to enable this but its triggering warnings on the
> > autobuilder:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/2037
> > 
> > Unfortunately the logs are totally useless. I think we'll have to
> > improve the logging before this can be debugged and fixed which
> > blocks
> > this merging.
> > 
> 
> I've had a couple of goes at reproducing this locally, based on the
> configuration I think it's building and can't get it to fail...
> 
> Presumably we need to expose the failure lines from the supplementary
> log file so that they make it into the autobuilder output?

Yes, we need the output to show which files are affected to have some
chance of figuring out how to fix this. The fact its happening
intermittently is somewhat worrying :/.

Cheers,

Richard

