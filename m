Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.36004.1629790876872053850
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 00:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e6G2OQSs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id i3so1334974wmq.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 00:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qWSbEHMXGdglABIPHYwHXQslhhMTuTzFodJmqoPYcNk=;
        b=e6G2OQSs1HkT8MJRJjtv11RYWkAJjIy8ZtWutlEljXHG2znv3ToW7yQD6m3sD64PQ8
         U1rTA9hMxeT8jIucFDwm/wh1JiAtf7ZNWfnxyc/Xxg9Ah2g9Y3XcL2aEtUmLvXc+C3+5
         AUOmO7iVCkJ4KUnsSXzGAdPrgilobt8Y8LxrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qWSbEHMXGdglABIPHYwHXQslhhMTuTzFodJmqoPYcNk=;
        b=bt2bXsu6m5S9+j0Uc/dENCtD60RfqLcYB18MGdLrZP1Sedr1PajJVZKm/FSRQ5OvGl
         Cf1fYnCVZAPD19IruleUWU0RP1CNPrrEbSA+pi5CGPcpSuoEY6ncqD4nrg5M2ZvxXdm4
         cPu1ABXHNx7CR0fWDp89OEsKKwP9GDSeJbJDbkeOcPFd6QSSgVa2Im4/X4kK7zgbZPAG
         qn0If35RheGmeat4Ofgu3UCUrXH6dfrCgmzguhjtvNj+vi7ZabeodzFUC9QH6jvWKkJ2
         7fOCX6AxzCFajIi4xzLZo96DZCgMqJCzl/DTzzz+VCWYImOu/ea9S9CtHBvSmW6sJUlu
         4dGA==
X-Gm-Message-State: AOAM530rH0VXfOkmyrLT1f7MqCEQYLenvqoxNjZ6LFT/VhTOzlTiPbW+
	G5Y6oISHuCTtqhkid4Bpbabupw==
X-Google-Smtp-Source: ABdhPJy9unmYg8bz+UhF5TEEGnr7biXqKl7o+te9gN+8G90qsjJQqPT5pNgLZnT0VCgUna+WJILQLQ==
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr2677708wmf.132.1629790875296;
        Tue, 24 Aug 2021 00:41:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d23b:eedd:82d9:e12c? ([2001:8b0:aba:5f3c:d23b:eedd:82d9:e12c])
        by smtp.gmail.com with ESMTPSA id n188sm1463346wmn.48.2021.08.24.00.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 00:41:15 -0700 (PDT)
Message-ID: <34041d492af033ff34a273e07057ea9c767cabf7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] glibc: ptest: Add support for running glibc test suite with ptest
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: ?ukasz Majewski <lukma@denx.de>, Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Aug 2021 08:41:14 +0100
In-Reply-To: <20210824093601.768c0c05@ktm>
References: <20210823150853.2817-1-lukma@denx.de>
	 <20210823150853.2817-2-lukma@denx.de>
	 <ada9987d-399b-7a73-2aa5-c09dcca41fb3@gmail.com>
	 <20210823202414.731c6749@ktm>
	 <CAMKF1srLFY_R4KX3gG3hZMhZNtjSN8D4mEp0Wwr78Se9RE_20g@mail.gmail.com>
	 <20210823220926.37d87121@ktm>
	 <CAMKF1sqKH=RiOn-WVp_=ZQmLnSJ43VUUfKyv+E1KR9bCn01j3Q@mail.gmail.com>
	 <20210824093601.768c0c05@ktm>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-08-24 at 09:36 +0200, ?ukasz Majewski wrote:
> Hi Khem,
> 
> > On Mon, Aug 23, 2021 at 1:09 PM Lukasz Majewski <lukma@denx.de> wrote:
> > > 
> > > On Mon, 23 Aug 2021 12:52:44 -0700
> > > Khem Raj <raj.khem@gmail.com> wrote:
> > >  
> > > > On Mon, Aug 23, 2021 at 11:24 AM Lukasz Majewski <lukma@denx.de>
> > > > wrote:
> > > >  
> > > > > Hi Khem,
> > > > >  
> > > > > > On 8/23/21 8:08 AM, ?ukasz Majewski wrote:  
> > > > > > > This patch introduces new recipe - namely 'glibc-tests',
> > > > > > > which builds and installs glibc test suite to OE/Yocto
> > > > > > > built image.
> > > > > > > 
> > > > > > > It reuses code from already available 'glibc-testsuite'
> > > > > > > recipe, which is run with 'bitbake glibc-testsuite -c
> > > > > > > check' and uses qemu to execute remotely (via SSH) tests on
> > > > > > > some emulated machine.
> > > > > > > 
> > > > > > > This recipe installs eligible tests on some rootfs image.
> > > > > > > Afterwards, either all of them or only time related subset,
> > > > > > > those tests can be executed on the real hardware, to
> > > > > > > facilitate validation of this platform with for example
> > > > > > > Y2038 problem compliance.
> > > > > > > 
> > > > > > > By default all tests are executed, with 'ptest-runner
> > > > > > > glibc-tests'. To test only time related subset - one needs
> > > > > > > to call: cd /usr/lib/glibc-tests/ptest/; rm run-ptest; \
> > > > > > > ln -s run-ptest-time run-ptest; cd -; ptest-runner
> > > > > > > glibc-tests
> > > > > > > 
> > > > > > > To facilitate debugging, source files are provided by
> > > > > > > default with the unstripped debugging symbols. Such
> > > > > > > approach would reduce the already complex recipe (as it
> > > > > > > inherits base glibc one), so there is no need to also
> > > > > > > install *-dbg and *-src packages.  
> > > > > > 
> > > > > > 
> > > > > > does it have to be a separate recipe I wonder if we can have
> > > > > > it built as part of glibc itself controlled via ptest knob  
> > > > > 
> > > > > I've followed the glibc-testsuite recipe to provide tests for
> > > > > ptest. Test creation is similar to it, but doesn't require QEMU
> > > > > run (tests are executed on the HW).
> > > > > 
> > > > > Another rationale was to have some kind of "features"
> > > > > separation in different file (liked glibc-mtrace), which is
> > > > > easier to maintain and review.
> > > > > 
> > > > > Last but not least - separate recipe (and built binaries) allow
> > > > > some kind of magic with selection of used test programs (this
> > > > > may be useful if one would like to have different sets of tests
> > > > > in different packages)  
> > > > 
> > > > That’s seems ok I think the names are quite confusing now not
> > > > that it was not so much better before but now we have glibc-tests
> > > > and glibc-testsuites which do same things but in very different
> > > > way maybe glibc-testsuite should be renamed to something like
> > > > glibc-tests-crosd or some such  
> > > 
> > > I think that glibc-testsuite_2.34.bb shall be renamed to
> > > glibc-tests-qemu_2.34.bb as it is more descriptive.  
> > 
> > is it only runnable in qemu ? I thought we could use a read board as
> > well with IP address
> 
> It looks like by default the QEMU is used in this recipe. 
> 
> This recipe provides custom check-test-wrapper, which can log
> into remote board via ssh (when TOOLCHAIN_TEST_TARGET = "ssh").
> 
> This looks a bit awkward for me, as the goal would be to run built
> tests on target (exact) HW without the need of SSH.
> 
> It is also easier to debug the code with the real HW.

I'm a bit worried we're going around in circles with this. We did have a
different form of tests a while back but I was told those didn't work well and
they were replaced with the current setup which worked with the driver in the
glibc source code. This was done around the time we added support for the other
toolchain test suites (binutils+gcc). We ended up with options to use full
system qemu or user mode qemu emulation depending on the speed of the target
(e.g. with kvm or not).

Has this patchset been run with all the tests in glibc or just a subset?

I'm always very nervous about having two ways to do similar things.

Cheers,

Richard

