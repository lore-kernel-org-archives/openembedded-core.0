Return-Path: <nathan@nathanrossi.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 780CD7F0F8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 12:30:18 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v15so41692445wml.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 05:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5AA5XuYPNQth1VJ7/bnQJIy7kqUF2DuhjIqM9idyy/I=;
	b=D5i7jz10/WL4Rp/Rmqv7hqC9SmTWkUrGcxw3s39klm0dl/dIfaxFmYi9coOy1GxYML
	ISt0Oz6EZfbHVJYwiwIt9SrFfiDX/dV95d9ZQScwYjySXAi9+zQchnktUwz5JcLP3MKg
	pYrG6K2hbilB2BpICLaT2VzuqzkIfdpNkO9RTazsumEjQv+XYOpXQebK8kg8+UMgw9+3
	caJ87mKXAXGhfCX9vcjOvd4MZfvZKNBCGAflXuPNV3EuGA3xy0QFaYXRtSaFstQmFBMb
	Dx67S0mjcd+WhApS957e5OEH5fFpI/1DXnwhfH+p5mkg29BSGxLqM8WZbUIgk6yekQjs
	wSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5AA5XuYPNQth1VJ7/bnQJIy7kqUF2DuhjIqM9idyy/I=;
	b=O7FvT6N9Niv+k6F7+89wh4PKYt87YOGMWf3fp9maynHXh/i7MgOxGfy8WwHvixjffO
	amQehtO33WqrHOdZfS/LKqF81gXrXwXmbFqEc3b5Wo+E0pg6NDh/oqZBdSA0FEDw0TXL
	avLhnnOevi6IXG57RDe5yi3jnplkoSc3Vr59oe3lCVO0wl2GJkVPjcOWo7pRtmu25ams
	EJf4QJ2Qlj6PHknFlCeN6wXhIqqk3GSfanyKPvIh/rM6HYWESJFpSm28HAoHMGj+PDuA
	3Z9l47B7udd1TbXwUxSqVsx37pKAAdjPZ3GOTJBhDFXZkE1+0oG6NC49h7fLja0EU3vQ
	v0NA==
X-Gm-Message-State: APjAAAX9fkyJNaMm2nxiBUcTBH6b1/KiDL/F/fFaXOu2bzJZR/Hp1Tv1
	ZlF9x4FYr44Z1RWiKTzG2tVhEwPOR9of9KH1mN4=
X-Google-Smtp-Source: APXvYqxMkcAC0BeMtVYcTQAFOJ/hknKKGul12Cksjnb0ZkKz3Uw3lgXaKJAV7njBm4oJDkP97pxmEp8OIk9Y7iTvmUQ=
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr44051792wmh.141.1563971418938;
	Wed, 24 Jul 2019 05:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190706113909.11836-1-nathan@nathanrossi.com>
	<2305ec57f78c799c2e72273b5e00d5faa4d0cba8.camel@linuxfoundation.org>
	<CA+aJhH2p50Tqyxq0iOLng+i8kgnd3HfFsCoVJCJAPwDY=xCxTA@mail.gmail.com>
In-Reply-To: <CA+aJhH2p50Tqyxq0iOLng+i8kgnd3HfFsCoVJCJAPwDY=xCxTA@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Wed, 24 Jul 2019 22:30:06 +1000
Message-ID: <CA+aJhH1GcWWkD0KVRxG7a8OZRGBZQZWu0-kVHWZjMD2gnxEYzA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] Add gnu testsuite execution for OEQA
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jul 2019 12:30:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jul 2019 at 20:43, Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> On Sat, 6 Jul 2019 at 22:52, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sat, 2019-07-06 at 11:39 +0000, Nathan Rossi wrote:
> > > This patch is an RFC for adding support to execute the gnu test suites for
> > > binutils, gcc and glibc. With the intention for enabling automated test running
> > > of these test suites within the OEQA framework such that they can be executed by
> > > the Yocto Autobuilder.
> > >
> > > Please note that this patch is not a complete implementation and needs
> > > additional work as well as changes based on comments and feedback from this RFC.
> >
> > This is rather cool, thanks!
> >
> > Looking at this was on my todo list once we got the existing OEQA,
> > ptest and ltp setups working well. I'm very happy to have been beaten
> > to it though.
> >
> > > The test suites covered need significant resources or build artifacts such
> > > that running them on the target is undesirable which rules out the use of ptest.
> > > Because of this the test suites can be run on the build host and if necessary
> > > call out to the target.
> > >
> > > The following implementation creates a number of recipes that are used to
> > > build/execute the test suites for the different components. The reason for
> > > creating separate recipes is primarily due to dependencies and the need for
> > > components in the sysroot. For example binutils has tests that use the C
> > > compiler however binutils is a dependency for the C compiler and thus would
> > > cause a dependency loop. The issue with sysroots occurs with dependence on
> > > `*-initial` recipes and the test suites needing the non-initial version.
> >
> > I think this means you're working with something pre-warrior as we got
> > rid of most of the *-initial recipes apart from libgcc-initial.
>
> I have been working against master (maybe a few days old). However I
> hit the sysroot collision in gcc-cross with what I thought was a
> -initial recipe. So I split it out and kept moving ahead.
>
> Turns out it was just one file, specifically an empty limits.h that is
> created by the gcc-cross recipe itself.
> (http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/gcc/gcc-cross.inc#n49)
>
> >
> > > Some issues with splitting the recipes:
> > >  - Rebuilds the recipe
> > >    - Like gcc-cross-testsuite in this patch, could use a stashed builddir
> > >  - Source is duplicated
> > >    - gcc gets around this with shared source
> > >  - Requires having the recipe files and maintaining them
> > >    - Multiple versions of recipes
> > >    - Multiple variants of recipes (-cross, -crosssdk, -native if desired)
> >
> > It might be possible to have multiple tasks in these recipes and have
> > the later tasks depend on other pieces of the system like the C
> > compiler, thereby avoiding the need for splitting if only the later
> > tasks have the dependencies. Not sure if it would work or not but may
> > be worth exploring.
>
> Initially I had started out with binutils having the do_check task
> which depended on the populate_sysroot task of the associated
> dependencies and this was working well for binutils at least. The only
> concern I had with this was whether tainting the recipe sysroots would
> be problematic?
>
> Given the sysroot/-initial issue with gcc was not a dependency problem
> I have tried with the check tasks in gcc-cross and gcc-runtime and
> there does not appear to have any issues. So splitting the recipes for
> binutils, gcc-cross and gcc-runtime is not necessary.
>
> For glibc the sysroot has libgcc-initial, so the sysroot collision is
> still a problem for it.
>
> >
> > > Target execution is another issue with the test suites. Note that binutils
> > > however does not require any target execution. In this patch both
> > > qemu-linux-user and ssh target execution solutions are provided. For the
> > > purposes of OE, qemu-linux-user may suffice as it has great success at executing
> > > gcc and gcc-runtime tests with acceptable success at executing the glibc tests.
> >
> > I feel fairly strongly that we probably want to execute these kinds of
> > tests under qemu system mode, not the user mode. The reason is that we
> > want to be as close to the target environment as we can be and that
> > qemu-user testing is at least as much of a test of qemu's emulation
> > that it is the behaviour of the compiler or libc (libc in particular).
> > I was thinking this and then later read you confirmed my suspicions
> > below...
> >
> > > The glibc test suite can be problematic to execute for a few reasons:
> > >  - Requires access to the exact same filesystem as the build host
> > >    - On physical targets and QEMU this requires NFS mounts
> >
> > We do have unfs support already under qemu which might make this
> > possible.
>
> unfs works great and I was using it for testing out the ssh support.
> However I did notice that is does rely on the host having rpcbind
> installed. This does prevent running the tests without root (even if
> using slirp for qemu).
>
> >
> > >  - Relies on exact syscall behaviour
> > >    - Causes some issues where there are differences between qemu-linux-user and
> > >      the target architectures kernel
> >
> > Right, this one worries me and pushes me to want to use qemu system
> > mode.
> >
> > >  - Can consume significant resources (e.g. OOM, or worse trigger bugs/panics in
> > >    kernel drivers)
> >
> > Any rough guide to what significant is here? ptest needs 1GB memory for
> > example. qemu-system mode should limit that to the VMs at least?
>
> This is a tricky one, and my comment is mostly based on prior
> experience with running glibc tests on less common targets (like
> microblaze). Where the stability of the kernel when handling large
> amount of NFS traffic alongside cpu/memory heavy tasks would cause
> panics and some times kernel hangs. I am not sure how generally this
> applies though, will report on this once I have some tests results
> with more of the qemu machines running via system emulation/ssh.

So I only hit one major issue with the oe-core qemu* machines I tested
on when running under system emulation, specifically with
aarch64/qemuarm64.

One (or more) test in the "c" suite of gcc causes qemu to crash due to
what appears to be an internal qemu issue.

qemu outputted:
qemu-4.0.0/tcg/tcg.c:3952: tcg_gen_code: Assertion
`s->gen_insn_end_off[num_insns] == off' failed.

The test that caused this was:
gcc.target/aarch64/advsimd-intrinsics/vldX.c   -O2  execution test

>
> >
> > >  - Slow to execute
> > >    - With QEMU system emulation it can take many hours
> >
> > We do have KVM acceleration for x86 and arm FWIW which is probably
> > where we'd start testing this on the autobuilder.
> >
> > >    - With some physical target architectures it can take days (e.g. microblaze)
> > >
> > > The significantly increased execution speed of qemu-linux-user vs qemu system
> > > with glibc, and the ability for qemu-linux-user to be executed in parallel with
> > > the gcc test suite makes it a strong solution for continuous integration
> > > testing.
> >
> > Was that with or without KVM?
>
> Without KVM. I will add KVM testing with the system emulation tests I
> run, to get a better idea on exact performance differences.
>
> >
> > > The following table shows results for the major test suite components running
> > > with qemu-linux-user execution. The numbers represent 'failed tests'/'total
> > > tests'. The machines used to run the tests are the `qemu*` machine for the
> > > associated architecture, not all qemu machines available in oe-core were tested.
> > > It is important to note that these results are only indicative of
> > > qemu-linux-user behaviour and that there are a number of test failures that are
> > > due to issues not specific to qemu-linux-user.
> > >
> > >         | gcc          | g++          | libstdc++   | binutils    | gas         | ld          | glibc
> > > x86-64  |   589/135169 |   457/131913 |     1/13008 |     0/  236 |     0/ 1256 |   166/ 1975 |  1423/ 5991
> > > arm     |   469/123905 |   365/128416 |    19/12788 |     0/  191 |     0/  872 |   155/ 1479 |    64/ 5130
> > > aarch64 |   460/130904 |   364/128977 |     1/12789 |     0/  190 |     0/  442 |   157/ 1474 |    76/ 5882
> > > powerpc | 18336/116624 |  6747/128636 |    33/12996 |     0/  187 |     1/  265 |   157/ 1352 |  1218/ 5110
> > > mips64  |  1174/134744 |   401/130195 |    22/12780 |     0/  213 |    43/ 7245 |   803/ 1634 |  2032/ 5847
> > > riscv64 |   456/106399 |   376/128427 |     1/12748 |     0/  185 |     0/  257 |   152/ 1062 |    88/ 5847
> >
> > I'd be interested to know how these numbers compare to the ssh
> > execution...
>
> I will setup some OEQA automation to get results for this. It might
> take me a little bit since they can be slow to run.

Just an update here, managed to get the results for this. As you will
see below, running some of these tests is very slow on qemu system
emulation. Though kvm did give a decent boost in performance.

Note: qemuarm64 (sys) is missing gcc results because one of the gcc
tests crashes qemu.

                           | g++          | gcc          | glibc
| libatomic   | libgomp     | libitm      | libstdc++-v3
qemuarm (usr)              |   365/128416 |   469/123905 |    65/ 5130
|     0/   49 |     0/ 2515 |     0/   46 |     23/12782
qemuarm (sys)              |   365/128416 |   468/123874 |    47/ 5130
|     0/   49 |     0/ 2515 |    18/   46 |     48/12790
qemux86-64 (usr)           |   457/131913 |   589/135169 |  1423/ 5991
|     0/   54 |     0/ 2522 |     0/   46 |      1/13008
qemux86-64 (sys)           |   418/131913 |   519/135221 |  1418/ 5991
|     0/   54 |     1/ 2522 |    18/   46 |     51/13010
qemux86-64 (sys+kvm)       |   418/131913 |   519/135415 |    40/ 5991
|     0/   54 |     1/ 2522 |    18/   46 |     46/13010
qemuarm64 (usr)            |   364/128977 |   459/130904 |    75/ 5882
|     0/   54 |     0/ 2515 |     0/   46 |      1/12789
qemuarm64 (sys)            |   364/128977 |              |    43/ 5882
|     0/   54 |     0/ 2515 |    18/   46 |     62/12791
qemuppc (usr)              |  6747/128636 | 18336/116624 |  1220/ 5110
|     0/   49 |     2/ 2515 |     0/   46 |     33/12996
qemuppc (sys)              |   383/129056 |   800/119824 |  1188/ 5110
|     0/   49 |     2/ 2515 |    18/   46 |     34/12998
qemuriscv64 (usr)          |   376/128427 |   460/106399 |    86/ 5847
|     0/   54 |     4/ 2508 |             |      1/12748
qemuriscv64 (sys)          |   376/128427 |   458/106451 |    53/ 5847
|     0/   54 |     0/ 2508 |             |     52/12750
                           | g++          | gcc          | glibc
| libatomic   | libgomp     | libitm      | libstdc++-v3
qemuarm (usr)              |       9m 24s |       15m 3s |     37m 10s
|          8s |      6m 52s |          8s |       1h 24s
qemuarm (sys)              |   3h 58m 30s |  12h 21m 44s |  5h 36m 53s
|         55s |     45m 57s |         53s |  12h 16m 11s
qemux86-64 (usr)           |       8m 22s |      15m 48s |     36m 52s
|          8s |       6m 1s |          8s |      34m 42s
qemux86-64 (sys)           |   5h 38m 27s |  15h 15m 40s |  5h 54m 42s
|       1m 8s |     45m 52s |         55s |   3h 26m 11s
qemux86-64 (sys+kvm)       |      16m 22s |      56m 44s |  2h 29m 45s
|         25s |     16m 58s |         21s |      19m 20s
qemuarm64 (usr)            |       8m 34s |      16m 15s |     44m 25s
|          8s |      6m 23s |          8s |      35m 38s
qemuarm64 (sys)            |    4h 2m 53s |              |   6h 2m 39s
|       1m 7s |     44m 47s |         53s |    3h 9m 37s
qemuppc (usr)              |       6m 54s |      10m 47s |     32m 50s
|          6s |      6m 22s |          7s |      34m 25s
qemuppc (sys)              |   5h 46m 23s |  16h 16m 10s |   4h 10m 6s
|      1m 16s |   1h 3m 11s |      1m 12s |   4h 32m 45s
qemuriscv64 (usr)          |       6m 54s |      10m 23s |     36m 50s
|          7s |      9m 38s |             |      33m 13s
qemuriscv64 (sys)          |   2h 19m 24s |   6h 27m 37s |  4h 23m 43s
|         47s |     31m 47s |             |   1h 52m 18s

Regards,
Nathan


>
> >
> > The binutils results look good! :)
> >
> > > This patch also introduces some OEQA test cases which cover running the test
> > > suites. However in this specific patch it does not include any implementation
> > > for the automated setup of qemu system emulation testing with runqemu and NFS
> > > mounting for glibc tests. Also not included in these test cases is any known
> > > test failure filtering.
> >
> > The known test failure filtering is something we can use the OEQA
> > backend for, I'd envisage this being intergrated in a similar way to
> > the way we added ptest/ltp/ltp-posix there.
>
> I am not very familiar with the OEQA backend, and was not able to find
> anything about test filtering in lib/oeqa (just searching). Maybe I am
> looking in the wrong place, any pointers for where this part of the
> backend is located?
>
> Thanks,
> Nathan
>
>
>
> >
> > > I would also be interested in the opinion with regards to whether these test
> > > suites should be executed as part of the existing Yocto Autobuilder instance.
> >
> > Short answer is yes. We won't run them all the time but when it makes
> > sense and I'd happily see the autobuilder apart to be able to trigger
> > these appropriately. We can probably run the KVM accelerated arches
> > more often than the others.
> >
> > Plenty of implementation details to further discuss but this is great
> > to see!
> >
> > Cheers,
> >
> > Richard
> >

