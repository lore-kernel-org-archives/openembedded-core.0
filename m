Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.30586.1629985136292830675
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 06:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hBRIz2Rm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id q11so5111961wrr.9
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 06:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=2JhakD7n+qrPRX1bhRt+ev6sj7Gy6B/j/srQXJgfOKI=;
        b=hBRIz2RmGsIsEAQ0b9FzyAyZR9lmXehYJncpvKYb4mUk0SZF5bZOLUfImmBECh0/ho
         QWJfEzdidP+EDv0ymdBI8I2tKSEesNIvkGSrpdw7Q36he2UgOG9X3u2fmmzYlmI9W41W
         NjX3YAjve0CU3G7vk3vw4vpkexbsBJfC1us6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2JhakD7n+qrPRX1bhRt+ev6sj7Gy6B/j/srQXJgfOKI=;
        b=pfZwKp/w0pQP7a7rYrIfjTWe/O7IrhogoVHRLM3RdO5PyI8geZOEp9K3fUY/+jV2S4
         L/T7xC4gX6YP0j+dA3rUJdJl0Ix7hyIpgGFxXok6fS9rPLURpbl6hvuKQcPfRucJgcEr
         8H1AiaN0PxlWZyg02xu9L5mO6UPIC3JAlxb4fuPEj+XATUS83urr86ceIfXcFKlEizbc
         ZDPG3Ref9x9MjNemIHgokaAalglhA+lPfEMmVAoTPDrzr+oLk90XoP8YjeIvB16uhLeh
         tnlT8XqG6Tit34oenrqhIhxlo3gLR1XgyOnkI/Cx7z006bDGxK39UIUovwLwqj48ojlc
         lWMg==
X-Gm-Message-State: AOAM533SNaaByCcayPOV+ewsrotOEylkvQeGUMeztlTkc7AU/1Q5O6in
	f+3u3jljCJg9lBPjfDJvpNhXgA==
X-Google-Smtp-Source: ABdhPJzbJZUh/1C9P7hRqzrmqvKtA9+G917sgY+mTZNAw2KhO8eOpKX/zqoiQ5TcsYczMMMJfeBlQg==
X-Received: by 2002:a05:6000:1864:: with SMTP id d4mr4260127wri.250.1629985134470;
        Thu, 26 Aug 2021 06:38:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4? ([2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4])
        by smtp.gmail.com with ESMTPSA id i17sm1412132wrc.38.2021.08.26.06.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 06:38:53 -0700 (PDT)
Message-ID: <2beacaf42a7970cca6fce14c2200184b9d852446.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] glibc: ptest: Add support for running glibc test suite with ptest
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Lukasz Majewski <lukma@denx.de>, Nathan Rossi <nathan@nathanrossi.com>
Cc: Khem Raj <raj.khem@gmail.com>, Patches and discussions about the oe-core
 layer <openembedded-core@lists.openembedded.org>, Adhemerval Zanella
 <adhemerval.zanella@linaro.org>
Date: Thu, 26 Aug 2021 14:38:50 +0100
In-Reply-To: <20210826142749.51466c70@ktm>
References: <20210823150853.2817-1-lukma@denx.de>
	 <20210823150853.2817-2-lukma@denx.de>
	 <ada9987d-399b-7a73-2aa5-c09dcca41fb3@gmail.com>
	 <20210823202414.731c6749@ktm>
	 <CAMKF1srLFY_R4KX3gG3hZMhZNtjSN8D4mEp0Wwr78Se9RE_20g@mail.gmail.com>
	 <20210823220926.37d87121@ktm>
	 <CAMKF1sqKH=RiOn-WVp_=ZQmLnSJ43VUUfKyv+E1KR9bCn01j3Q@mail.gmail.com>
	 <20210824093601.768c0c05@ktm>
	 <34041d492af033ff34a273e07057ea9c767cabf7.camel@linuxfoundation.org>
	 <20210824104213.6be82b74@ktm> <20210826142749.51466c70@ktm>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-08-26 at 14:27 +0200, Lukasz Majewski wrote:
> Hi Richard, Khem,
> 
> > Hi Richard,
> > 
> > > On Tue, 2021-08-24 at 09:36 +0200, ?ukasz Majewski wrote:  
> > > > Hi Khem,
> > > >     
> > > > > On Mon, Aug 23, 2021 at 1:09 PM Lukasz Majewski <lukma@denx.de>
> > > > > wrote:    
> > > > > > 
> > > > > > On Mon, 23 Aug 2021 12:52:44 -0700
> > > > > > Khem Raj <raj.khem@gmail.com> wrote:
> > > > > >      
> > > > > > > On Mon, Aug 23, 2021 at 11:24 AM Lukasz Majewski
> > > > > > > <lukma@denx.de> wrote:
> > > > > > >      
> > > > > > > > Hi Khem,
> > > > > > > >      
> > > > > > > > > On 8/23/21 8:08 AM, ?ukasz Majewski wrote:      
> > > > > > > > > > This patch introduces new recipe - namely
> > > > > > > > > > 'glibc-tests', which builds and installs glibc test
> > > > > > > > > > suite to OE/Yocto built image.
> > > > > > > > > > 
> > > > > > > > > > It reuses code from already available
> > > > > > > > > > 'glibc-testsuite' recipe, which is run with 'bitbake
> > > > > > > > > > glibc-testsuite -c check' and uses qemu to execute
> > > > > > > > > > remotely (via SSH) tests on some emulated machine.
> > > > > > > > > > 
> > > > > > > > > > This recipe installs eligible tests on some rootfs
> > > > > > > > > > image. Afterwards, either all of them or only time
> > > > > > > > > > related subset, those tests can be executed on the
> > > > > > > > > > real hardware, to facilitate validation of this
> > > > > > > > > > platform with for example Y2038 problem compliance.
> > > > > > > > > > 
> > > > > > > > > > By default all tests are executed, with 'ptest-runner
> > > > > > > > > > glibc-tests'. To test only time related subset - one
> > > > > > > > > > needs to call: cd /usr/lib/glibc-tests/ptest/; rm
> > > > > > > > > > run-ptest; \ ln -s run-ptest-time run-ptest; cd -;
> > > > > > > > > > ptest-runner glibc-tests
> > > > > > > > > > 
> > > > > > > > > > To facilitate debugging, source files are provided by
> > > > > > > > > > default with the unstripped debugging symbols. Such
> > > > > > > > > > approach would reduce the already complex recipe (as
> > > > > > > > > > it inherits base glibc one), so there is no need to
> > > > > > > > > > also install *-dbg and *-src packages.      
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > does it have to be a separate recipe I wonder if we can
> > > > > > > > > have it built as part of glibc itself controlled via
> > > > > > > > > ptest knob      
> > > > > > > > 
> > > > > > > > I've followed the glibc-testsuite recipe to provide tests
> > > > > > > > for ptest. Test creation is similar to it, but doesn't
> > > > > > > > require QEMU run (tests are executed on the HW).
> > > > > > > > 
> > > > > > > > Another rationale was to have some kind of "features"
> > > > > > > > separation in different file (liked glibc-mtrace), which
> > > > > > > > is easier to maintain and review.
> > > > > > > > 
> > > > > > > > Last but not least - separate recipe (and built binaries)
> > > > > > > > allow some kind of magic with selection of used test
> > > > > > > > programs (this may be useful if one would like to have
> > > > > > > > different sets of tests in different packages)      
> > > > > > > 
> > > > > > > That’s seems ok I think the names are quite confusing now
> > > > > > > not that it was not so much better before but now we have
> > > > > > > glibc-tests and glibc-testsuites which do same things but in
> > > > > > > very different way maybe glibc-testsuite should be renamed
> > > > > > > to something like glibc-tests-crosd or some such      
> > > > > > 
> > > > > > I think that glibc-testsuite_2.34.bb shall be renamed to
> > > > > > glibc-tests-qemu_2.34.bb as it is more descriptive.      
> > > > > 
> > > > > is it only runnable in qemu ? I thought we could use a read
> > > > > board as well with IP address    
> > > > 
> > > > It looks like by default the QEMU is used in this recipe. 
> > > > 
> > > > This recipe provides custom check-test-wrapper, which can log
> > > > into remote board via ssh (when TOOLCHAIN_TEST_TARGET = "ssh").
> > > > 
> > > > This looks a bit awkward for me, as the goal would be to run built
> > > > tests on target (exact) HW without the need of SSH.
> > > > 
> > > > It is also easier to debug the code with the real HW.    
> > > 
> > > I'm a bit worried we're going around in circles with this. We did
> > > have a different form of tests a while back but I was told those
> > > didn't work well and they were replaced with the current setup which
> > > worked with the driver in the glibc source code.  
> > 
> > I've looked into the glibc-testing.inc from SHA1:
> > 0a42ae7f7ca8fcebe4630b701e50e2352f9b7c3b
> > 
> > There glibc tests were built and copied on the target via NFS.
> > 
> > > This was done around
> > > the time we added support for the other toolchain test suites
> > > (binutils+gcc).  
> > 
> > I'm not familiar with the "binutils+gcc" issue, which was solved in
> > the past. Could you share any reference?
> > 
> > > We ended up with options to use full system qemu or
> > > user mode qemu emulation depending on the speed of the target (e.g.
> > > with kvm or not).  
> > 
> > From what I see in the recipe - you either run user mode QEMU by
> > default (at least when I do run it):
> > 
> > NOTE: make PARALLELMFLAGS=-j 8 SHELL=/bin/bash -i
> > QEMU_SYSROOT=/home/lukma/work/yocto/y2038/build/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/glibc-testsuite/2.34-r0/recipe-sysroot
> > QEMU_OPTIONS=qemu-arm -r 5.1.0  SSH_HOST=localhost SSH_HOS T_USER=root
> > SSH_HOST_PORT=2222
> > test-wrapper=/home/lukma/work/yocto/y2038/build/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/glibc-testsuite/2.34-r0/check-test-wrapper
> > user check
> > 
> > Or you log to the board via SSH (the 'ssh' mode).
> > 
> > > 
> > > Has this patchset been run with all the tests in glibc or just a
> > > subset?  
> > 
> > This patch set allows running all tests [*], or (preferably in my use
> > case) only a time related ones. The latter is to validate Y2038 code,
> > which testing has two issues:
> > 
> > 1. It cannot be tested with QEMU user mode [1]. Instead "linux
> > timespaces" were suggested, but it lacks support for CLOCK_REALTIME
> > manipulation for those tests [2].
> > 
> > 2. Testing with SSH is possible, but is not as robust as expected
> > (i.e. imposes SSHD on the target board, and ETH connection).
> > 
> > > 
> > > I'm always very nervous about having two ways to do similar things.
> > >  
> > 
> > Technically, I just reuse the glibc-testsuite_2.34.bb to the point
> > where tests are _only_ built. Then I pack those binaries and install
> > on the target's rootfs to be run with ptest framework.
> > 
> > Such approach has several advantages:
> > 
> > - No need for SSH (which can hang, as you need sshfs in user space for
> >   the setup)
> > 
> > - Run on the real HW (and environment) with the same version of glibc
> >   on the real target.
> > 
> > - Sources and debugging symbols available on the target, so easier GDB
> >   debugging.
> > 
> > - Using ptest framework to execute tests
> > 
> > - Time related tests are "self contained", so could be executed
> > without built data.
> > 
> > At least for Y2038 validation such approach seems more appealing.
> > 
> 
> Do you have any more feedback regarding this patch?

We're at feature freeze and this wasn't a planned change so it is too late for
this release cycle, I'm struggling with the things that were planned.

I need to spend some time looking at what the other code is doing and how we're
using it on the autobuilder and whether we want to change to use the ptest
approach or not.

I added Nathan Rossi to cc since he worked on the other code for this and may
have more insight.

Cheers,

Richard

