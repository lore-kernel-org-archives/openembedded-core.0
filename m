Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web09.5196.1630050763302446554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 00:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=FYcpRaXR;
 spf=pass (domain: nathanrossi.com, ip: 209.85.222.49, mailfrom: nathan@nathanrossi.com)
Received: by mail-ua1-f49.google.com with SMTP id j31so2961779uad.10
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 00:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4UVWEL6J3d8h8eKH+16xhR+dk+KyQ2FLZeJW50DzIVQ=;
        b=FYcpRaXR0lo12z/aZX9djkVKORWzp2FHRrHggUzpU26NuKFsHNcnlzbcHIg9TiXexo
         F+dXyxhoWemq6xeeGq/m7pC0xCywh//bUNeiOUWwKcyefyCNUNmqNWf5Suo/ZylhURuO
         8Bbqn+na4lmSYSS5F7B/+jb87HtscKrYWtVLzWDD3bjS/zpxbhlljrlA9LX6Merkdtkb
         EwLdBfUN117iZOmZcV8pwVbiJr3z3z3TOBEn0NEFvsjx1ba4Nu6CGO7p1OlewdAQt4OR
         X8C3+ziv6huo7RSJpm0jGZemNRTOrMGn7RlEVg3SnRQdVdC33p1174oL876BYn5rPiOd
         qKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4UVWEL6J3d8h8eKH+16xhR+dk+KyQ2FLZeJW50DzIVQ=;
        b=LOGs1pLH4lO/iRh99JvyRVI8AwdWBwApLQWuHl/rkV//RKGVYaekAvIvQFI8JQvO0g
         CAiVT21/otVkDQ4oFF+7xsxOGNFTpYlBPSyOyk8BEH5kRE2fKtG6w9yiy/YLz/u7zt4v
         W+6TLnW3gkqQ5CRtndJt6yczsYvkW4g+JFMjnL0D30nUXqARLaRZ6pEnnIRG1optGqqd
         vF2pG1FhqsS0SYz5ORhM1pov0Duie2cW/P4PMPd6c7j603fcfCYtCCfvXr8ORHjsy81H
         MwXqwEnsX3cHynunVSNtPt6xdaF7yBAiXSyz9XPW6g9N4j6s2JncLG4riYqwCYZwjTI2
         d1/g==
X-Gm-Message-State: AOAM532CPbFaZzAyUeR38FIh5fCti/Upcr8t9O2byB8Z6XKzEojyXknM
	FDL6O9tNMFctsu4uKHYK32GA4HkrMJl0yNkaui/n5g==
X-Google-Smtp-Source: ABdhPJycl4NmKLADAGvZFOyL/Fwc0SOljlsyo2p1HjYasSZrhBoBxq7iL/cI+kawZcD5VJKYVMW+GX1Ta9p7yhd5X2A=
X-Received: by 2002:a9f:264b:: with SMTP id 69mr5436479uag.112.1630050762283;
 Fri, 27 Aug 2021 00:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210823150853.2817-1-lukma@denx.de> <20210823150853.2817-2-lukma@denx.de>
 <ada9987d-399b-7a73-2aa5-c09dcca41fb3@gmail.com> <20210823202414.731c6749@ktm>
 <CAMKF1srLFY_R4KX3gG3hZMhZNtjSN8D4mEp0Wwr78Se9RE_20g@mail.gmail.com>
 <20210823220926.37d87121@ktm> <CAMKF1sqKH=RiOn-WVp_=ZQmLnSJ43VUUfKyv+E1KR9bCn01j3Q@mail.gmail.com>
 <20210824093601.768c0c05@ktm> <34041d492af033ff34a273e07057ea9c767cabf7.camel@linuxfoundation.org>
 <20210824104213.6be82b74@ktm> <20210826142749.51466c70@ktm> <2beacaf42a7970cca6fce14c2200184b9d852446.camel@linuxfoundation.org>
In-Reply-To: <2beacaf42a7970cca6fce14c2200184b9d852446.camel@linuxfoundation.org>
From: "Nathan Rossi" <nathan@nathanrossi.com>
Date: Fri, 27 Aug 2021 17:52:30 +1000
Message-ID: <CA+aJhH3c1vtr9euPwFQ3Yn3YNeK3zww+nzfprQWxdfQrOAku0g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] glibc: ptest: Add support for running glibc test suite with ptest
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Lukasz Majewski <lukma@denx.de>, Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Aug 2021 at 23:38, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2021-08-26 at 14:27 +0200, Lukasz Majewski wrote:
> > Hi Richard, Khem,
> >
> > > Hi Richard,
> > >
> > > > On Tue, 2021-08-24 at 09:36 +0200, ?ukasz Majewski wrote:
> > > > > Hi Khem,
> > > > >
> > > > > > On Mon, Aug 23, 2021 at 1:09 PM Lukasz Majewski <lukma@denx.de>
> > > > > > wrote:
> > > > > > >
> > > > > > > On Mon, 23 Aug 2021 12:52:44 -0700
> > > > > > > Khem Raj <raj.khem@gmail.com> wrote:
> > > > > > >
> > > > > > > > On Mon, Aug 23, 2021 at 11:24 AM Lukasz Majewski
> > > > > > > > <lukma@denx.de> wrote:
> > > > > > > >
> > > > > > > > > Hi Khem,
> > > > > > > > >
> > > > > > > > > > On 8/23/21 8:08 AM, ?ukasz Majewski wrote:
> > > > > > > > > > > This patch introduces new recipe - namely
> > > > > > > > > > > 'glibc-tests', which builds and installs glibc test
> > > > > > > > > > > suite to OE/Yocto built image.
> > > > > > > > > > >
> > > > > > > > > > > It reuses code from already available
> > > > > > > > > > > 'glibc-testsuite' recipe, which is run with 'bitbake
> > > > > > > > > > > glibc-testsuite -c check' and uses qemu to execute
> > > > > > > > > > > remotely (via SSH) tests on some emulated machine.
> > > > > > > > > > >
> > > > > > > > > > > This recipe installs eligible tests on some rootfs
> > > > > > > > > > > image. Afterwards, either all of them or only time
> > > > > > > > > > > related subset, those tests can be executed on the
> > > > > > > > > > > real hardware, to facilitate validation of this
> > > > > > > > > > > platform with for example Y2038 problem compliance.
> > > > > > > > > > >
> > > > > > > > > > > By default all tests are executed, with 'ptest-runner
> > > > > > > > > > > glibc-tests'. To test only time related subset - one
> > > > > > > > > > > needs to call: cd /usr/lib/glibc-tests/ptest/; rm
> > > > > > > > > > > run-ptest; \ ln -s run-ptest-time run-ptest; cd -;
> > > > > > > > > > > ptest-runner glibc-tests
> > > > > > > > > > >
> > > > > > > > > > > To facilitate debugging, source files are provided by
> > > > > > > > > > > default with the unstripped debugging symbols. Such
> > > > > > > > > > > approach would reduce the already complex recipe (as
> > > > > > > > > > > it inherits base glibc one), so there is no need to
> > > > > > > > > > > also install *-dbg and *-src packages.
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > does it have to be a separate recipe I wonder if we can
> > > > > > > > > > have it built as part of glibc itself controlled via
> > > > > > > > > > ptest knob
> > > > > > > > >
> > > > > > > > > I've followed the glibc-testsuite recipe to provide tests
> > > > > > > > > for ptest. Test creation is similar to it, but doesn't
> > > > > > > > > require QEMU run (tests are executed on the HW).
> > > > > > > > >
> > > > > > > > > Another rationale was to have some kind of "features"
> > > > > > > > > separation in different file (liked glibc-mtrace), which
> > > > > > > > > is easier to maintain and review.
> > > > > > > > >
> > > > > > > > > Last but not least - separate recipe (and built binaries)
> > > > > > > > > allow some kind of magic with selection of used test
> > > > > > > > > programs (this may be useful if one would like to have
> > > > > > > > > different sets of tests in different packages)
> > > > > > > >
> > > > > > > > That=E2=80=99s seems ok I think the names are quite confusi=
ng now
> > > > > > > > not that it was not so much better before but now we have
> > > > > > > > glibc-tests and glibc-testsuites which do same things but i=
n
> > > > > > > > very different way maybe glibc-testsuite should be renamed
> > > > > > > > to something like glibc-tests-crosd or some such
> > > > > > >
> > > > > > > I think that glibc-testsuite_2.34.bb shall be renamed to
> > > > > > > glibc-tests-qemu_2.34.bb as it is more descriptive.
> > > > > >
> > > > > > is it only runnable in qemu ? I thought we could use a read
> > > > > > board as well with IP address
> > > > >
> > > > > It looks like by default the QEMU is used in this recipe.
> > > > >
> > > > > This recipe provides custom check-test-wrapper, which can log
> > > > > into remote board via ssh (when TOOLCHAIN_TEST_TARGET =3D "ssh").
> > > > >
> > > > > This looks a bit awkward for me, as the goal would be to run buil=
t
> > > > > tests on target (exact) HW without the need of SSH.
> > > > >
> > > > > It is also easier to debug the code with the real HW.
> > > >
> > > > I'm a bit worried we're going around in circles with this. We did
> > > > have a different form of tests a while back but I was told those
> > > > didn't work well and they were replaced with the current setup whic=
h
> > > > worked with the driver in the glibc source code.
> > >
> > > I've looked into the glibc-testing.inc from SHA1:
> > > 0a42ae7f7ca8fcebe4630b701e50e2352f9b7c3b
> > >
> > > There glibc tests were built and copied on the target via NFS.
> > >
> > > > This was done around
> > > > the time we added support for the other toolchain test suites
> > > > (binutils+gcc).
> > >
> > > I'm not familiar with the "binutils+gcc" issue, which was solved in
> > > the past. Could you share any reference?
> > >
> > > > We ended up with options to use full system qemu or
> > > > user mode qemu emulation depending on the speed of the target (e.g.
> > > > with kvm or not).
> > >
> > > From what I see in the recipe - you either run user mode QEMU by
> > > default (at least when I do run it):
> > >
> > > NOTE: make PARALLELMFLAGS=3D-j 8 SHELL=3D/bin/bash -i
> > > QEMU_SYSROOT=3D/home/lukma/work/yocto/y2038/build/tmp/work/armv7at2hf=
-neon-poky-linux-gnueabi/glibc-testsuite/2.34-r0/recipe-sysroot
> > > QEMU_OPTIONS=3Dqemu-arm -r 5.1.0  SSH_HOST=3Dlocalhost SSH_HOS T_USER=
=3Droot
> > > SSH_HOST_PORT=3D2222
> > > test-wrapper=3D/home/lukma/work/yocto/y2038/build/tmp/work/armv7at2hf=
-neon-poky-linux-gnueabi/glibc-testsuite/2.34-r0/check-test-wrapper
> > > user check
> > >
> > > Or you log to the board via SSH (the 'ssh' mode).
> > >
> > > >
> > > > Has this patchset been run with all the tests in glibc or just a
> > > > subset?
> > >
> > > This patch set allows running all tests [*], or (preferably in my use
> > > case) only a time related ones. The latter is to validate Y2038 code,
> > > which testing has two issues:
> > >
> > > 1. It cannot be tested with QEMU user mode [1]. Instead "linux
> > > timespaces" were suggested, but it lacks support for CLOCK_REALTIME
> > > manipulation for those tests [2].

So just a note, the qemu user mode testing is not a complete solution.
There are a number of problems with it, but in general it is still
quite useful for validating general functionally, especially when
implementing a new platform. A big one is due to the ability to run
tests in parallel with user mode, it easily reduces test run times by
an order of magnitude (compared to qemu system, which for some
platforms is faster than real hardware).

The reason why qemu user mode is the default behaviour is because
running "bitbake glibc-testsuite -c check" will work without any
external dependencies (the remote machine, NFS/sshfs, etc.).

> > >
> > > 2. Testing with SSH is possible, but is not as robust as expected
> > > (i.e. imposes SSHD on the target board, and ETH connection).
> > >
> > > >
> > > > I'm always very nervous about having two ways to do similar things.
> > > >
> > >
> > > Technically, I just reuse the glibc-testsuite_2.34.bb to the point
> > > where tests are _only_ built. Then I pack those binaries and install
> > > on the target's rootfs to be run with ptest framework.

So it appears the make variable "run-built-tests" excludes the
building of some tests. So I am not sure if the complete test suite
can be built in this way. Though I can see some value in having the
glibc-testsuite recipe being able to only build the tests for
development purposes (e.g. TOOLCHAIN_TEST_TARGET =3D "build"?).

When I had implemented the testsuite recipe the glibc testsuite relied
quite heavily on the environment it was built and run in, in
particular around configuration. That is probably still an issue.

It would be interesting to know how much of the test suite can be
run/passes and how that compares to the results of existing
system/user emulation with cross execution using the glibc makefile.

> > >
> > > Such approach has several advantages:
> > >
> > > - No need for SSH (which can hang, as you need sshfs in user space fo=
r
> > >   the setup)

I had not tested with sshfs that likely has quite low performance, the
OEQA tests rely on NFS for QEMU system emulation and that is what I
had been using for hardware testing. However it would be interesting
to see if virtiofs could improve the performance for testing with QEMU
system emulation.

> > >
> > > - Run on the real HW (and environment) with the same version of glibc
> > >   on the real target.
> > >
> > > - Sources and debugging symbols available on the target, so easier GD=
B
> > >   debugging.
> > >
> > > - Using ptest framework to execute tests
> > >
> > > - Time related tests are "self contained", so could be executed
> > > without built data.
> > >
> > > At least for Y2038 validation such approach seems more appealing.
> > >
> >
> > Do you have any more feedback regarding this patch?
>
> We're at feature freeze and this wasn't a planned change so it is too lat=
e for
> this release cycle, I'm struggling with the things that were planned.
>
> I need to spend some time looking at what the other code is doing and how=
 we're
> using it on the autobuilder and whether we want to change to use the ptes=
t
> approach or not.
>
> I added Nathan Rossi to cc since he worked on the other code for this and=
 may
> have more insight.

Thanks for cc'ing, I somehow managed to miss the thread.

Regards,
Nathan
