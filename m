Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 11DF37D41C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2019 12:52:05 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f17so12130623wme.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2019 05:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=7MMLZu69N/81SfV3JiHj8wVbZMnoIvwXLi4LjdnEM5k=;
	b=LZ1qCRsLLQq+h6/YViYUsUO75aJb9rqBET3zsskl9plVLmKYGLStANw+w7H4EhSq1n
	MrYIvWllWXPjxrb++1FUzsaBrkc7xGw28qNrglSM+YRSovNUtN9EdKSH1UzUVHy+c9Cl
	R2TCQahk2/vFZ2OwNPzTtHR//5rc9mQSg65ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=7MMLZu69N/81SfV3JiHj8wVbZMnoIvwXLi4LjdnEM5k=;
	b=Iyf2sT9KI29/wMklwVj/CMjGtPrsJCW6VQstYL2gYJmdnaKEel4BFrz9fO5CwrqnsS
	DKXQY2PQJ/gWHCxyYo7SySbjqvjWlte2sHTzXa5NxT5Dm1uN7wsIsNzilTd6ZesdRmT5
	snRSMRBIs3HrY/z3quc5MBZ//85jeiv8ZIL52Ae11jhWmjbsOZmtm1a5Sw/FBQyQSWtl
	IKauSDnKVZNBLAKx8qgsEpmiDN6jstmoK0LoutiW5WOUf38BlBpth0zUPotyLBlQMGgN
	anbyoy6WSFZZlS4NdNCnEd1+wwA5tb7cTpMuNWaPsviyh1KOL3dO01Uhv7+ZEF2fMaZW
	fSHg==
X-Gm-Message-State: APjAAAXjYU8BVZ8E28/yhuvZihiHhIo2O5qjawiTPDvRJH09hVmrT2ya
	iXzaGk2P25anPaxB22EszTsvZw==
X-Google-Smtp-Source: APXvYqwc3TZ4xTiohMFyduR+cxSIuhWEo7WlNv+c69k4WQcDFs5voYcbzYuUB5nWHUEr3n5StQ2ViA==
X-Received: by 2002:a1c:f418:: with SMTP id z24mr3562032wma.80.1562417526516; 
	Sat, 06 Jul 2019 05:52:06 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v15sm8539586wrt.25.2019.07.06.05.52.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 06 Jul 2019 05:52:05 -0700 (PDT)
Message-ID: <2305ec57f78c799c2e72273b5e00d5faa4d0cba8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nathan Rossi <nathan@nathanrossi.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 06 Jul 2019 13:52:04 +0100
In-Reply-To: <20190706113909.11836-1-nathan@nathanrossi.com>
References: <20190706113909.11836-1-nathan@nathanrossi.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
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
X-List-Received-Date: Sat, 06 Jul 2019 12:52:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-07-06 at 11:39 +0000, Nathan Rossi wrote:
> This patch is an RFC for adding support to execute the gnu test suites for
> binutils, gcc and glibc. With the intention for enabling automated test running
> of these test suites within the OEQA framework such that they can be executed by
> the Yocto Autobuilder.
> 
> Please note that this patch is not a complete implementation and needs
> additional work as well as changes based on comments and feedback from this RFC.

This is rather cool, thanks!

Looking at this was on my todo list once we got the existing OEQA,
ptest and ltp setups working well. I'm very happy to have been beaten
to it though.

> The test suites covered need significant resources or build artifacts such
> that running them on the target is undesirable which rules out the use of ptest.
> Because of this the test suites can be run on the build host and if necessary
> call out to the target.
> 
> The following implementation creates a number of recipes that are used to
> build/execute the test suites for the different components. The reason for
> creating separate recipes is primarily due to dependencies and the need for
> components in the sysroot. For example binutils has tests that use the C
> compiler however binutils is a dependency for the C compiler and thus would
> cause a dependency loop. The issue with sysroots occurs with dependence on
> `*-initial` recipes and the test suites needing the non-initial version.

I think this means you're working with something pre-warrior as we got
rid of most of the *-initial recipes apart from libgcc-initial.

> Some issues with splitting the recipes:
>  - Rebuilds the recipe
>    - Like gcc-cross-testsuite in this patch, could use a stashed builddir
>  - Source is duplicated
>    - gcc gets around this with shared source
>  - Requires having the recipe files and maintaining them
>    - Multiple versions of recipes
>    - Multiple variants of recipes (-cross, -crosssdk, -native if desired)

It might be possible to have multiple tasks in these recipes and have
the later tasks depend on other pieces of the system like the C
compiler, thereby avoiding the need for splitting if only the later
tasks have the dependencies. Not sure if it would work or not but may
be worth exploring.

> Target execution is another issue with the test suites. Note that binutils
> however does not require any target execution. In this patch both
> qemu-linux-user and ssh target execution solutions are provided. For the
> purposes of OE, qemu-linux-user may suffice as it has great success at executing
> gcc and gcc-runtime tests with acceptable success at executing the glibc tests.

I feel fairly strongly that we probably want to execute these kinds of
tests under qemu system mode, not the user mode. The reason is that we
want to be as close to the target environment as we can be and that
qemu-user testing is at least as much of a test of qemu's emulation
that it is the behaviour of the compiler or libc (libc in particular).
I was thinking this and then later read you confirmed my suspicions
below...

> The glibc test suite can be problematic to execute for a few reasons:
>  - Requires access to the exact same filesystem as the build host
>    - On physical targets and QEMU this requires NFS mounts

We do have unfs support already under qemu which might make this
possible.

>  - Relies on exact syscall behaviour
>    - Causes some issues where there are differences between qemu-linux-user and
>      the target architectures kernel

Right, this one worries me and pushes me to want to use qemu system
mode.

>  - Can consume significant resources (e.g. OOM, or worse trigger bugs/panics in
>    kernel drivers)

Any rough guide to what significant is here? ptest needs 1GB memory for
example. qemu-system mode should limit that to the VMs at least?

>  - Slow to execute
>    - With QEMU system emulation it can take many hours

We do have KVM acceleration for x86 and arm FWIW which is probably
where we'd start testing this on the autobuilder.

>    - With some physical target architectures it can take days (e.g. microblaze)
> 
> The significantly increased execution speed of qemu-linux-user vs qemu system
> with glibc, and the ability for qemu-linux-user to be executed in parallel with
> the gcc test suite makes it a strong solution for continuous integration
> testing.

Was that with or without KVM?

> The following table shows results for the major test suite components running
> with qemu-linux-user execution. The numbers represent 'failed tests'/'total
> tests'. The machines used to run the tests are the `qemu*` machine for the
> associated architecture, not all qemu machines available in oe-core were tested.
> It is important to note that these results are only indicative of
> qemu-linux-user behaviour and that there are a number of test failures that are
> due to issues not specific to qemu-linux-user.
> 
>         | gcc          | g++          | libstdc++   | binutils    | gas         | ld          | glibc
> x86-64  |   589/135169 |   457/131913 |     1/13008 |     0/  236 |     0/ 1256 |   166/ 1975 |  1423/ 5991
> arm     |   469/123905 |   365/128416 |    19/12788 |     0/  191 |     0/  872 |   155/ 1479 |    64/ 5130
> aarch64 |   460/130904 |   364/128977 |     1/12789 |     0/  190 |     0/  442 |   157/ 1474 |    76/ 5882
> powerpc | 18336/116624 |  6747/128636 |    33/12996 |     0/  187 |     1/  265 |   157/ 1352 |  1218/ 5110
> mips64  |  1174/134744 |   401/130195 |    22/12780 |     0/  213 |    43/ 7245 |   803/ 1634 |  2032/ 5847
> riscv64 |   456/106399 |   376/128427 |     1/12748 |     0/  185 |     0/  257 |   152/ 1062 |    88/ 5847

I'd be interested to know how these numbers compare to the ssh
execution...

The binutils results look good! :)

> This patch also introduces some OEQA test cases which cover running the test
> suites. However in this specific patch it does not include any implementation
> for the automated setup of qemu system emulation testing with runqemu and NFS
> mounting for glibc tests. Also not included in these test cases is any known
> test failure filtering.

The known test failure filtering is something we can use the OEQA
backend for, I'd envisage this being intergrated in a similar way to
the way we added ptest/ltp/ltp-posix there.

> I would also be interested in the opinion with regards to whether these test
> suites should be executed as part of the existing Yocto Autobuilder instance.

Short answer is yes. We won't run them all the time but when it makes
sense and I'd happily see the autobuilder apart to be able to trigger
these appropriately. We can probably run the KVM accelerated arches
more often than the others.

Plenty of implementation details to further discuss but this is great
to see!

Cheers,

Richard


