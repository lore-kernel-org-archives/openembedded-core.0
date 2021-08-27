Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web11.6736.1630063756557503294
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 04:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=ESRvx5qB;
 spf=pass (domain: nathanrossi.com, ip: 209.85.222.41, mailfrom: nathan@nathanrossi.com)
Received: by mail-ua1-f41.google.com with SMTP id x6so3229563uai.11
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 04:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Yxr1WsRNIY+PD5b2ab6+4jWZI4NWL3B3BI38C35r7xU=;
        b=ESRvx5qB5tNsQz+mDs2KIAJF5xmuQMJ/utSs0oFPWa7P/sk6QaRM424yw3zDiBaWO8
         8lKe3VWIQIQTQ6jgn89qwLW89TyD5OSkuS2BWibRp2bQUbqnPYU02Ouo+/4z0OFLrFaR
         rJ275s+tgo8F88KuR4lxTQMBbZzXMSI4ARXNKqUDiG6phGlCrBNwaCEinKWbaRy1DA8k
         9QuNu2wf9lKVhQtUkXYoJqsakwucg6MZcMqtHNvaMksNNlPw0oPVe6XjVLubRl5oxE1S
         oA6mRsFv/SYACv6/E97LgkuZy5dVolmJKGTjLWj7173mVai3BPYT1xEB6N9b7jXT6OPK
         ONPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Yxr1WsRNIY+PD5b2ab6+4jWZI4NWL3B3BI38C35r7xU=;
        b=cKU7ldzc7kvN7uhlAZu3rXe9suQRjTGqA/mfxsisRBUclgKngP1XNFCIqnmeZTsYME
         oJvvtn3TmCDWLB1NDTGoHk5+AHnpVNLeQLbQ01BNroPK3HTT3W79pP8w3vj9OXP+KtVz
         vSsZOBJ8KpNnTW9oGBkXXoVzCvi9/V3Zdv4fIhMPiaLA/7nKWVnXkq6a5nLhJ7tIxih4
         iX0GlhbHD//Dqir+HwMBc5BVCPHq39unJuG9DHrOPkVchTHD9qDmDT1Wb9JPm32cysPT
         9GSCO8eYYAGlvZA/GDMuT0VLiHDu9AVxRMEMxIZ9L3+tidIUyfRzcz0PaliyxmlXfMEy
         1/nA==
X-Gm-Message-State: AOAM530uBGakZi0lDLJbkPf4VOTnKwnqip5/lkAVl5gJEjAROCnu17UN
	qp4pOAnbAz1KP4tlObrBWqVwOqp2Jtt+9lN3csHKVg==
X-Google-Smtp-Source: ABdhPJzjSWM6Z18CQA7Fse9PySC3fCPXYJXzHGIJxjfkxhVcdiCgVqWqNKwlkSVjppolK+mCG/CzODsurz0TVM5vb30=
X-Received: by 2002:a9f:264b:: with SMTP id 69mr5887720uag.112.1630063755450;
 Fri, 27 Aug 2021 04:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210823150853.2817-1-lukma@denx.de> <20210823150853.2817-2-lukma@denx.de>
 <ada9987d-399b-7a73-2aa5-c09dcca41fb3@gmail.com> <20210823202414.731c6749@ktm>
 <CAMKF1srLFY_R4KX3gG3hZMhZNtjSN8D4mEp0Wwr78Se9RE_20g@mail.gmail.com>
 <20210823220926.37d87121@ktm> <CAMKF1sqKH=RiOn-WVp_=ZQmLnSJ43VUUfKyv+E1KR9bCn01j3Q@mail.gmail.com>
 <20210824093601.768c0c05@ktm> <34041d492af033ff34a273e07057ea9c767cabf7.camel@linuxfoundation.org>
 <20210824104213.6be82b74@ktm> <20210826142749.51466c70@ktm>
 <2beacaf42a7970cca6fce14c2200184b9d852446.camel@linuxfoundation.org>
 <CA+aJhH3c1vtr9euPwFQ3Yn3YNeK3zww+nzfprQWxdfQrOAku0g@mail.gmail.com> <20210827112033.4822be71@ktm>
In-Reply-To: <20210827112033.4822be71@ktm>
From: "Nathan Rossi" <nathan@nathanrossi.com>
Date: Fri, 27 Aug 2021 21:29:03 +1000
Message-ID: <CA+aJhH1thPb_SuCcQHg3AF3QyaRTPNY=iod-oR0tm_Qta82wuw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] glibc: ptest: Add support for running glibc test suite with ptest
To: Lukasz Majewski <lukma@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 27 Aug 2021 at 19:20, Lukasz Majewski <lukma@denx.de> wrote:
>
> Hi Nathan,
>
> > On Thu, 26 Aug 2021 at 23:38, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Thu, 2021-08-26 at 14:27 +0200, Lukasz Majewski wrote:
> > > > Hi Richard, Khem,
> > > >
> > > > > Hi Richard,
> > > > >
> > > > > > On Tue, 2021-08-24 at 09:36 +0200, ?ukasz Majewski wrote:
> > > > > > > Hi Khem,
> > > > > > >
> > > > > > > > On Mon, Aug 23, 2021 at 1:09 PM Lukasz Majewski
> > > > > > > > <lukma@denx.de> wrote:
> > > > > > > > >
> > > > > > > > > On Mon, 23 Aug 2021 12:52:44 -0700
> > > > > > > > > Khem Raj <raj.khem@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > > On Mon, Aug 23, 2021 at 11:24 AM Lukasz Majewski
> > > > > > > > > > <lukma@denx.de> wrote:
> > > > > > > > > >
> > > > > > > > > > > Hi Khem,
> > > > > > > > > > >
> > > > > > > > > > > > On 8/23/21 8:08 AM, ?ukasz Majewski wrote:
> > > > > > > > > > > > > This patch introduces new recipe - namely
> > > > > > > > > > > > > 'glibc-tests', which builds and installs glibc
> > > > > > > > > > > > > test suite to OE/Yocto built image.
> > > > > > > > > > > > >
> > > > > > > > > > > > > It reuses code from already available
> > > > > > > > > > > > > 'glibc-testsuite' recipe, which is run with
> > > > > > > > > > > > > 'bitbake glibc-testsuite -c check' and uses
> > > > > > > > > > > > > qemu to execute remotely (via SSH) tests on
> > > > > > > > > > > > > some emulated machine.
> > > > > > > > > > > > >
> > > > > > > > > > > > > This recipe installs eligible tests on some
> > > > > > > > > > > > > rootfs image. Afterwards, either all of them or
> > > > > > > > > > > > > only time related subset, those tests can be
> > > > > > > > > > > > > executed on the real hardware, to facilitate
> > > > > > > > > > > > > validation of this platform with for example
> > > > > > > > > > > > > Y2038 problem compliance.
> > > > > > > > > > > > >
> > > > > > > > > > > > > By default all tests are executed, with
> > > > > > > > > > > > > 'ptest-runner glibc-tests'. To test only time
> > > > > > > > > > > > > related subset - one needs to call: cd
> > > > > > > > > > > > > /usr/lib/glibc-tests/ptest/; rm run-ptest; \ ln
> > > > > > > > > > > > > -s run-ptest-time run-ptest; cd -; ptest-runner
> > > > > > > > > > > > > glibc-tests
> > > > > > > > > > > > >
> > > > > > > > > > > > > To facilitate debugging, source files are
> > > > > > > > > > > > > provided by default with the unstripped
> > > > > > > > > > > > > debugging symbols. Such approach would reduce
> > > > > > > > > > > > > the already complex recipe (as it inherits base
> > > > > > > > > > > > > glibc one), so there is no need to also install
> > > > > > > > > > > > > *-dbg and *-src packages.
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > does it have to be a separate recipe I wonder if
> > > > > > > > > > > > we can have it built as part of glibc itself
> > > > > > > > > > > > controlled via ptest knob
> > > > > > > > > > >
> > > > > > > > > > > I've followed the glibc-testsuite recipe to provide
> > > > > > > > > > > tests for ptest. Test creation is similar to it,
> > > > > > > > > > > but doesn't require QEMU run (tests are executed on
> > > > > > > > > > > the HW).
> > > > > > > > > > >
> > > > > > > > > > > Another rationale was to have some kind of
> > > > > > > > > > > "features" separation in different file (liked
> > > > > > > > > > > glibc-mtrace), which is easier to maintain and
> > > > > > > > > > > review.
> > > > > > > > > > >
> > > > > > > > > > > Last but not least - separate recipe (and built
> > > > > > > > > > > binaries) allow some kind of magic with selection
> > > > > > > > > > > of used test programs (this may be useful if one
> > > > > > > > > > > would like to have different sets of tests in
> > > > > > > > > > > different packages)
> > > > > > > > > >
> > > > > > > > > > That=E2=80=99s seems ok I think the names are quite con=
fusing
> > > > > > > > > > now not that it was not so much better before but now
> > > > > > > > > > we have glibc-tests and glibc-testsuites which do
> > > > > > > > > > same things but in very different way maybe
> > > > > > > > > > glibc-testsuite should be renamed to something like
> > > > > > > > > > glibc-tests-crosd or some such
> > > > > > > > >
> > > > > > > > > I think that glibc-testsuite_2.34.bb shall be renamed to
> > > > > > > > > glibc-tests-qemu_2.34.bb as it is more descriptive.
> > > > > > > >
> > > > > > > > is it only runnable in qemu ? I thought we could use a
> > > > > > > > read board as well with IP address
> > > > > > >
> > > > > > > It looks like by default the QEMU is used in this recipe.
> > > > > > >
> > > > > > > This recipe provides custom check-test-wrapper, which can
> > > > > > > log into remote board via ssh (when TOOLCHAIN_TEST_TARGET =3D
> > > > > > > "ssh").
> > > > > > >
> > > > > > > This looks a bit awkward for me, as the goal would be to
> > > > > > > run built tests on target (exact) HW without the need of
> > > > > > > SSH.
> > > > > > >
> > > > > > > It is also easier to debug the code with the real HW.
> > > > > >
> > > > > > I'm a bit worried we're going around in circles with this. We
> > > > > > did have a different form of tests a while back but I was
> > > > > > told those didn't work well and they were replaced with the
> > > > > > current setup which worked with the driver in the glibc
> > > > > > source code.
> > > > >
> > > > > I've looked into the glibc-testing.inc from SHA1:
> > > > > 0a42ae7f7ca8fcebe4630b701e50e2352f9b7c3b
> > > > >
> > > > > There glibc tests were built and copied on the target via NFS.
> > > > >
> > > > > > This was done around
> > > > > > the time we added support for the other toolchain test suites
> > > > > > (binutils+gcc).
> > > > >
> > > > > I'm not familiar with the "binutils+gcc" issue, which was
> > > > > solved in the past. Could you share any reference?
> > > > >
> > > > > > We ended up with options to use full system qemu or
> > > > > > user mode qemu emulation depending on the speed of the target
> > > > > > (e.g. with kvm or not).
> > > > >
> > > > > From what I see in the recipe - you either run user mode QEMU by
> > > > > default (at least when I do run it):
> > > > >
> > > > > NOTE: make PARALLELMFLAGS=3D-j 8 SHELL=3D/bin/bash -i
> > > > > QEMU_SYSROOT=3D/home/lukma/work/yocto/y2038/build/tmp/work/armv7a=
t2hf-neon-poky-linux-gnueabi/glibc-testsuite/2.34-r0/recipe-sysroot
> > > > > QEMU_OPTIONS=3Dqemu-arm -r 5.1.0  SSH_HOST=3Dlocalhost SSH_HOS
> > > > > T_USER=3Droot SSH_HOST_PORT=3D2222
> > > > > test-wrapper=3D/home/lukma/work/yocto/y2038/build/tmp/work/armv7a=
t2hf-neon-poky-linux-gnueabi/glibc-testsuite/2.34-r0/check-test-wrapper
> > > > > user check
> > > > >
> > > > > Or you log to the board via SSH (the 'ssh' mode).
> > > > >
> > > > > >
> > > > > > Has this patchset been run with all the tests in glibc or
> > > > > > just a subset?
> > > > >
> > > > > This patch set allows running all tests [*], or (preferably in
> > > > > my use case) only a time related ones. The latter is to
> > > > > validate Y2038 code, which testing has two issues:
> > > > >
> > > > > 1. It cannot be tested with QEMU user mode [1]. Instead "linux
> > > > > timespaces" were suggested, but it lacks support for
> > > > > CLOCK_REALTIME manipulation for those tests [2].
> >
> > So just a note, the qemu user mode testing is not a complete solution.
> > There are a number of problems with it, but in general it is still
> > quite useful for validating general functionally, especially when
> > implementing a new platform.
>
> +1
>
> > A big one is due to the ability to run
> > tests in parallel with user mode, it easily reduces test run times by
> > an order of magnitude (compared to qemu system, which for some
> > platforms is faster than real hardware).
>
> +1
>
> >
> > The reason why qemu user mode is the default behaviour is because
> > running "bitbake glibc-testsuite -c check" will work without any
> > external dependencies (the remote machine, NFS/sshfs, etc.).
>
> +1
>
> >
> > > > >
> > > > > 2. Testing with SSH is possible, but is not as robust as
> > > > > expected (i.e. imposes SSHD on the target board, and ETH
> > > > > connection).
> > > > > >
> > > > > > I'm always very nervous about having two ways to do similar
> > > > > > things.
> > > > >
> > > > > Technically, I just reuse the glibc-testsuite_2.34.bb to the
> > > > > point where tests are _only_ built. Then I pack those binaries
> > > > > and install on the target's rootfs to be run with ptest
> > > > > framework.
> >
> > So it appears the make variable "run-built-tests" excludes the
> > building of some tests.
>
> As fair as I remember, the 'run-built-tests=3Dno' switch tells the glibc
> build system to not execute built tests.
>
> > So I am not sure if the complete test suite
> > can be built in this way.
>
> I'm pretty sure that all tests required for 'check' are build.

If you look at some of the Makefiles in glibc, it conditionally
includes/excludes some tests from being built based on the value of
run-built-tests. For example:

https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dlocaledata/Makefile;=
h=3Df585e0dd4115a99493e843aeed464090da19665f;hb=3DHEAD#l141

>
> > Though I can see some value in having the
> > glibc-testsuite recipe being able to only build the tests for
> > development purposes (e.g. TOOLCHAIN_TEST_TARGET =3D "build"?).
> >
> > When I had implemented the testsuite recipe the glibc testsuite relied
> > quite heavily on the environment it was built and run in, in
> > particular around configuration. That is probably still an issue.
>
> Indeed, some (a few?) tests rely on the build environment in which they
> were build. I do personally, regard this as a some kind of a bug. I do
> believe, that when you build test for a particular version of glibc
> (2.34 in this case), one shall expect that it can be run only by
> linking the proper library.
>
> This is the case for "time" related tests. On my test system with this
> patch applied, all of them are executed with no errors. Those are self
> contained.
>
> >
> > It would be interesting to know how much of the test suite can be
> > run/passes and how that compares to the results of existing
> > system/user emulation with cross execution using the glibc makefile.
>
> I can provide exact numbers when I finish porting more Y2038 related
> patches to newest glibc -master.

Also something to keep in mind is that sometimes the pass/fail of the
test binary is not what is being validated by the test. For example
this test uses mtrace, and compares the results of the output mtrace
file, not the test itself.

https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dlocaledata/Makefile;=
h=3Df585e0dd4115a99493e843aeed464090da19665f;hb=3DHEAD#l462

Regards,
Nathan

>
> >
> > > > >
> > > > > Such approach has several advantages:
> > > > >
> > > > > - No need for SSH (which can hang, as you need sshfs in user
> > > > > space for the setup)
> >
> > I had not tested with sshfs that likely has quite low performance, the
> > OEQA tests rely on NFS for QEMU system emulation and that is what I
> > had been using for hardware testing.
>
> I had some issues with NFS - either I couldn't place some OE/Yocto
> build directory in it or glibc's build directory was not working with
> it correctly.
>
> That was why I had to use the sshfs instead, which is _really_ slow and
> often breaks.
>
> > However it would be interesting
> > to see if virtiofs could improve the performance for testing with QEMU
> > system emulation.
> >
> > > > >
> > > > > - Run on the real HW (and environment) with the same version of
> > > > > glibc on the real target.
> > > > >
> > > > > - Sources and debugging symbols available on the target, so
> > > > > easier GDB debugging.
> > > > >
> > > > > - Using ptest framework to execute tests
> > > > >
> > > > > - Time related tests are "self contained", so could be executed
> > > > > without built data.
> > > > >
> > > > > At least for Y2038 validation such approach seems more
> > > > > appealing.
> > > >
> > > > Do you have any more feedback regarding this patch?
> > >
> > > We're at feature freeze and this wasn't a planned change so it is
> > > too late for this release cycle, I'm struggling with the things
> > > that were planned.
> > >
> > > I need to spend some time looking at what the other code is doing
> > > and how we're using it on the autobuilder and whether we want to
> > > change to use the ptest approach or not.
> > >
> > > I added Nathan Rossi to cc since he worked on the other code for
> > > this and may have more insight.
> >
> > Thanks for cc'ing, I somehow managed to miss the thread.
> >
> > Regards,
> > Nathan
>
>
> Best regards,
>
> Lukasz Majewski
>
> --
>
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de
