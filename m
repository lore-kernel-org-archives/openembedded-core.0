Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.6299.1615470364863073043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 05:46:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aUe4ckOY;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id w11so1914209wrr.10
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 05:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=rveybxz9HL0eWCj3HcNkCXL+WeJQXtdyQmqXG1Apn1I=;
        b=aUe4ckOYuIoO8JZ2DXeP2y6tXn3uA4CzHRHUspJMV2UVoYCvl9rZ4OFIt3kWYdYaxV
         rhitE5MOaSCmACB/r61H12A8dTXyrkuSVJxrI1aVsyOa/QaeX3bKijSuOGwIk0L0FQWF
         n3mo3Gk+dgzV+ZZkXc5E05t8CkA08Ft9idENp2G4EDVjzABNQ37bMhF4dUKTQviIHGdE
         Ky9iu0orT3rNaNKgDf87Gvo3L7yOlsc+JpdX4TLJfVRoVBYp/HI938QuKTrYPMpjm6bi
         wHAAnZzsgCxGXbA615ZnfgkzCPohynhVgGkh29svmEsX4OImI+DEayXKXuLvHMGJKKcX
         wZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rveybxz9HL0eWCj3HcNkCXL+WeJQXtdyQmqXG1Apn1I=;
        b=kb5/PZPS5DKezbJgSNpnXXn/h0HpFgAc9sKgOPb0KbD+NnZDohjLDtOi9Ao/YYYKDv
         na6hrd30QqZD9MA1TBQYFK2wfKP66z9un1OujTt0oogz2k6dh9cudI79zmnR89JR1mSp
         ar/qUYqJFLSEFp1MeuaZVmBlzl98c6/3jefr4qp66ps63HDS2Fac8anxTWrklgxjM3Tp
         Tm0T8dx9j8NjtW2K1muaGF6iO1BoInL+r+DsAXmDqw5dNrH5tD1OMUWOkmR6077Ka/lI
         XzdVuK9VmmOZr+efrbTsqJW5UbjocZdF8pPaCszvpj7hBGJxJiXySSg1tEDxcRPTA+Eu
         6IKw==
X-Gm-Message-State: AOAM531iSPW6+S6E2bpaTrUhnUrqHfSXCmy38Z5kXxAgoBdcizUOtZH0
	mcyd2h+tKp6GasCVM9ihmvM=
X-Google-Smtp-Source: ABdhPJwB+FNK6Y0GechmVGbqmvzOu/0MyfqYXSJyplF8ZQWXo9afd2WdizS6uV6UfWKLtLF4z3PD8A==
X-Received: by 2002:adf:e84f:: with SMTP id d15mr8849835wrn.394.1615470362862;
        Thu, 11 Mar 2021 05:46:02 -0800 (PST)
Return-Path: <max.oss.09@gmail.com>
Received: from Saturn.fritz.box ([81.221.211.103])
        by smtp.googlemail.com with ESMTPSA id p27sm4103660wmi.12.2021.03.11.05.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 05:46:02 -0800 (PST)
Message-ID: <bb16f37aed05ab72e4ed8a3b68f0d68671c14a22.camel@gmail.com>
Subject: Re: [OE-core] GCC crashes on aarch64 since gatesgarth
From: "Max Krummenacher" <max.oss.09@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>, Randy MacLeod
	 <randy.macleod@windriver.com>, openembedded-core@lists.openembedded.org
Date: Thu, 11 Mar 2021 14:46:01 +0100
In-Reply-To: <4a1bc66d-f5d1-a781-3488-32da37f503de@topic.nl>
References: 
	<1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.443c6779-935d-4b0c-bd2a-e7ccda1d0c4a@emailsignatures365.codetwo.com>
	 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1d651819-d3eb-4e73-bb7d-d97ad0bed5fe@emailsignatures365.codetwo.com>
	 <165E1F647C435468.32571@lists.openembedded.org>
	 <cf285d04-d8e1-e3a2-25de-9c3f02ad0678@topic.nl>
	 <086cde14-14c7-0c28-1cc4-33156b45bf0a@windriver.com>
	 <4a1bc66d-f5d1-a781-3488-32da37f503de@topic.nl>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Mike

Am Donnerstag, den 11.03.2021, 10:43 +0100 schrieb Mike Looijmans:
> Met vriendelijke groet / kind regards,
> 
> Mike Looijmans
> System Expert
> 
> 
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
> 
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topicproducts.com
> W: www.topicproducts.com
> 
> Please consider the environment before printing this e-mail
> On 05-03-2021 00:32, Randy MacLeod wrote:
> > On 2021-02-05 2:49 a.m., Mike Looijmans wrote:
> > > I've been doing quite some tests and things last week, my conclusion so far 
> > > is that the latest gcc seems to trigger a bug particular to this CPU. Maybe 
> > > even this particular batch.
> > > 
> > > Hours of testing found no issues with RAM.
> > > 
> > > I've also done huge amounts of builds with zeus, no problems.
> > > 
> > > Then googling for "illegal instruction gcc ryzen 1700" reveals quite a few 
> > > threads on something that sounds suspiciously similar. Though it makes me 
> > > wonder why I never encountered it before, since these are all many years 
> > > old. I did try a bunch of the suggestions done there, but so far no luck.
> > > 
> > > 
> > 
> > Any update on this bug Mike?
> > Have you opened a YP bug? If not please do.
> > I'd like to see if the problem still happens on master.
> 
> So far I've discovered that this only happens when compiling for an aarch64. 
> When targetting 32-bit ARM the compiler crash does not occur.
> 
> I've contacted AMD for an RMA for my CPU, but it's out of warranty now. I plan 
> to borrow a compatible CPU to see if that makes the problem go away. If it 
> does I'll just buy a new CPU...
> 
> As an example, if I take the current gatesgarth branch and meta-raspberrypi, 
> then building for "raspberrypi4" runs without a hitch. If I chose 
> "raspberrypi4-64" as MACHINE, the build will crash multiple times, typically 
> on large components like the linux kernel, qt and boost. It happens on both 
> plain C (kernel, u-boot) and on C++ code (boost, Qt). The same applies to e.g. 
> the Xilinx Zynq, building for the 7-series (cortex A9) is fine but building 
> for the MPSoC (cortex A53) will crash.
> 
> A silly workaround is to run "while ! bitbake ... ; do echo again; done" which 
> will retry until it succeeds.
> 
> I'd be very interested if there's anyone with Ryzen setup who can reproduce 
> this, or fail to, which is also interesting to know.
> 
> I also tried building in tmpfs and on a different SSD to rule out the NVME as 
> a cause.
> 
> I'll try the master branch too, and report back on that (tomorrow probably).
> 
> 
> > ../Randy
> > 
> > 
> > > Met vriendelijke groet / kind regards,
> > > 
> > > Mike Looijmans
> > > System Expert
> > > 
> > > 
> > > TOPIC Embedded Products B.V.
> > > Materiaalweg 4, 5681 RJ Best
> > > The Netherlands
> > > 
> > > T: +31 (0) 499 33 69 69
> > > E: mike.looijmans@topicproducts.com
> > > W: www.topicproducts.com
> > > 
> > > Please consider the environment before printing this e-mail
> > > On 27-01-2021 16:10, Mike Looijmans via lists.openembedded.org wrote:
> > > > When doing large builds, the GCC compiler tends to crash on random spots in 
> > > > the code. There are a few common denominators though.
> > > > 
> > > > It only happens when compiling for aarch64 (cortex-A53), not for 32-bit arm 
> > > > (cortex-A9)
> > > > 
> > > > It's random and usually happens on "big" sets like kernel, openssl, boost, 
> > > > u-boot etc.
> > > > 
> > > > It always reports "during GIMPLE pass: ealias" in the error, for example:
> > > > 
> > > > > during GIMPLE pass: ealias
> > > > > ../openssl-1.1.1i/crypto/x509v3/v3_utl.c: In function 'do_x509_check':
> > > > > ../openssl-1.1.1i/crypto/x509v3/v3_utl.c:1239:1: internal compiler error: 
> > > > Illegal instruction
> > > > > 1239 | }
> > > > 
> > > > Compiling the same thing again usually goes fine.
> > > > 
> > > > I've never experienced this with the zeus and older branches of OE.
> > > > 
> > > > 
> > > > I've already tried upgrading to the latest gatesgarth status, and cleaning 
> > > > out everything and start from scratch. I've also run "mprime" test on my 
> > > > machine (over one hour) just to be confident that the system itself is 
> > > > really okay.
> > > > 
> > > > 
> > > > Ideas to diagnose, fix or reliably reprodruce are more than welcome. 
> > > 
> > > 

For me a build of core-image-weston on a AMD Ryzen 7 3700X succeeded. The build run trough without
any hick-ups. openssl-1.1.1i is built as part of that image.
I used HEAD of today's gatesgarth.
So the issue seems to not affect all Ryzen CPUs.

Max


MACHINE=raspberrypi4-64 bitbake core-image-weston
WARNING: Host distribution "opensuseleap-15.2" has not been validated with this version of the build
system; you may possibly experience unexpected failures. It is recommended that you use a tested
distribution.
Loading cache: 100%
|                                                                                                   
                                                                            | ETA:  --:--:--
Loaded 0 entries from dependency cache.
Parsing recipes: 100% |#####################################################| Time: 0:00:43
Parsing of 2884 .bb files complete (0 cached, 2884 parsed). 4160 targets, 288 skipped, 0 masked, 0
errors.
WARNING: No recipes in default available for:
  /mnt/devel/oe-disk/oe-core_gatesgarth/build/../layers/meta-raspberrypi/recipes-
multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.%.bbappend
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-tdx-linux"
MACHINE              = "raspberrypi4-64"
DISTRO               = "tdx-xwayland"
DISTRO_VERSION       = "0.0.0-devel-20210311125851+build.0"
TUNE_FEATURES        = "aarch64 armv8a crc crypto cortexa72"
TARGET_FPU           = ""
meta-toradex-nxp     = "HEAD:b8187ed55f204f50dea60c27f6cc79e9d2f1081b"
meta-freescale       = "gatesgarth:1acf098972f9f86b26eee815827667dbd2fcdeaf"
meta-freescale-3rdparty = "gatesgarth:efef93a0dc5be90c5bdc81dae252516887c95586"
meta-toradex-tegra   = "HEAD:627949f52b58d54ec2b5992b327bb33123cc53b2"
meta-toradex-bsp-common = "HEAD:e06c552ef433689b12caef0bf1f589d0cab180f9"
meta-raspberrypi     = "master:fdf02accfe3f68d11fa178d72eb377f9ca96411c"
meta-oe              
meta-filesystems     
meta-gnome           
meta-xfce            
meta-initramfs       
meta-networking      
meta-multimedia      
meta-python          = "gatesgarth:945f062ff098dc9c8ba8d22c5eef88adec60730d"
meta-freescale-distro = "gatesgarth:50eb2b32e7702bc435049bfe0a98fc65c864c106"
meta-toradex-demos   = "HEAD:4ffac94ed18c8701511385dcfc363a3051855fd7"
meta-qt5             = "gatesgarth:2b33a5d5e888370bb56685b86aa82b73624f19f0"
meta-toradex-distro  = "HEAD:6ddae219515fda5e6ffb0ad6a2fdc5430d9fa926"
meta-poky            = "gatesgarth:ac4a956f606d9cb4e025af80e6f4dcb74cbfd941"
meta                 = "gatesgarth:6311cb4930bd0add7aec61e5e0df6bb7ae0c4481"

Initialising tasks: 100%
|###########################################################################| Time: 0:00:04
Sstate summary: Wanted 1109 Found 142 Missed 967 Current 702 (12% match, 46% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 5358 tasks of which 2483 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds

Summary: There were 2 WARNING messages shown.



