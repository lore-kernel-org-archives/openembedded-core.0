Return-Path: <nathan@nathanrossi.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id C36527E417
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 11:00:07 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a15so2582267wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 04:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jotqKy2b4M2hUUSLr4KHuti4BBvK0ugjHl4rgEU5u84=;
	b=cpGfTeW5KArNtu1RAUwNJH+B0/lVrClosJtCx1Va0keaDOj5Ya6n+9zsoYVFYgiMfE
	e4P5hCE1QiI2KGWTcRcIwPz9mi/4i1iOg3evt/9AnS3ujLQCzfIWMnMuqglH7nc8cDd2
	OSgSdPVKO0JS1kpNyJVaZ3kRA5m5dJ+Rq04KdySsMYNBV2JgR2jIwSKkgBjQMUBPOxj+
	rRCPyi3zC5KBqnIpejBAEdvd7+onYpFNF5uyTQ5hwukNQ9Hjjl3gjS5XouSNUH7HCPyu
	PgxdY5auTfFBdfME2665/0qrSh8Eh40+XLMZa/0Al/otwpBd41pKz6OYCHYFBaDubkQ4
	ahvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jotqKy2b4M2hUUSLr4KHuti4BBvK0ugjHl4rgEU5u84=;
	b=ubmEiPGB8a53H8YAJ6YwYEq/wJV+E5YmeuG8XmoUIEKQR75b5N1XyoVpzhbfpG7b4E
	vnlTbnFlr5kidobPeUdW0LN7llFxzKiV2rnKrn6Zh6jNQ3tnaBKwwWItug/p3+KM/d/Q
	rWYRLWQoFW18g/Lj1z/9pQaICcL/nMnFB+JeFa5bKNTY5J6xNyd1ZnHoJMs9RBirPbOZ
	WSkenoK6DNeaEMZI2qPX/Lhbo00+Ugfk7vxkHXbESFdQmEB55UjsDs813KfsZIKjkKHo
	Pg3ez75cCJiP2gdTUOmVxjZCBBlYpThWf47gEwkjtoI3x/55tS0HmdYPDv6f8dtBuQkz
	/YTw==
X-Gm-Message-State: APjAAAWBfmEDUL/zt+qRAwsj/A4FtAQMUeI7nuhZghU/M5MMUCanmnf+
	K1fBYTLJ0VT1HYtDXoTBd/j+LpFhBYHMSEYk4FbIZw==
X-Google-Smtp-Source: APXvYqwOtEvt5+vuvg5f7vFEpHGD57w3COeTCBMHlNYE3S03/rs71CVAKa9P3aRu9tJl4Vq/J5q538zmD5hh+ZQAAyg=
X-Received: by 2002:a1c:7e14:: with SMTP id z20mr21360205wmc.83.1562670008290; 
	Tue, 09 Jul 2019 04:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190706113909.11836-1-nathan@nathanrossi.com>
	<2305ec57f78c799c2e72273b5e00d5faa4d0cba8.camel@linuxfoundation.org>
	<CAHMutrZycSEeLODmPeFaa4Lf9+pgh6owRBV8iKAfN1yGjwknwg@mail.gmail.com>
In-Reply-To: <CAHMutrZycSEeLODmPeFaa4Lf9+pgh6owRBV8iKAfN1yGjwknwg@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Tue, 9 Jul 2019 20:59:56 +1000
Message-ID: <CA+aJhH3wTpB460KjR7jiHkOEXz9FNvpfPscdmtN_VXssL5C_8w@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 09 Jul 2019 11:00:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jul 2019 at 06:55, Alejandro Enedino Hernandez Samaniego
<aehs29@gmail.com> wrote:
>
> Hey guys,
>
> On Sat, Jul 6, 2019 at 5:52 AM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Sat, 2019-07-06 at 11:39 +0000, Nathan Rossi wrote:
>> > This patch is an RFC for adding support to execute the gnu test suites for
>> > binutils, gcc and glibc. With the intention for enabling automated test running
>> > of these test suites within the OEQA framework such that they can be executed by
>> > the Yocto Autobuilder.
>> >
>> > Please note that this patch is not a complete implementation and needs
>> > additional work as well as changes based on comments and feedback from this RFC.
>>
>> This is rather cool, thanks!
>>
>> Looking at this was on my todo list once we got the existing OEQA,
>> ptest and ltp setups working well. I'm very happy to have been beaten
>> to it though.
>>
>> > The test suites covered need significant resources or build artifacts such
>> > that running them on the target is undesirable which rules out the use of ptest.
>> > Because of this the test suites can be run on the build host and if necessary
>> > call out to the target.
>> >
>> > The following implementation creates a number of recipes that are used to
>> > build/execute the test suites for the different components. The reason for
>> > creating separate recipes is primarily due to dependencies and the need for
>> > components in the sysroot. For example binutils has tests that use the C
>> > compiler however binutils is a dependency for the C compiler and thus would
>> > cause a dependency loop. The issue with sysroots occurs with dependence on
>> > `*-initial` recipes and the test suites needing the non-initial version.
>>
>> I think this means you're working with something pre-warrior as we got
>> rid of most of the *-initial recipes apart from libgcc-initial.
>
>
>  Yup, I agree with this, and yes, we still have initial recipes, which is in what Nathan based his work.
>
>>
>> > Some issues with splitting the recipes:
>> >  - Rebuilds the recipe
>> >    - Like gcc-cross-testsuite in this patch, could use a stashed builddir
>> >  - Source is duplicated
>> >    - gcc gets around this with shared source
>> >  - Requires having the recipe files and maintaining them
>> >    - Multiple versions of recipes
>> >    - Multiple variants of recipes (-cross, -crosssdk, -native if desired)
>>
>> It might be possible to have multiple tasks in these recipes and have
>> the later tasks depend on other pieces of the system like the C
>> compiler, thereby avoiding the need for splitting if only the later
>> tasks have the dependencies. Not sure if it would work or not but may
>> be worth exploring.
>
>
> Worth exploring but might end up being more convoluted than necessary IMO.
> Benefit vs Complication issue.
>
>
>>
>> > Target execution is another issue with the test suites. Note that binutils
>> > however does not require any target execution. In this patch both
>> > qemu-linux-user and ssh target execution solutions are provided. For the
>> > purposes of OE, qemu-linux-user may suffice as it has great success at executing
>> > gcc and gcc-runtime tests with acceptable success at executing the glibc tests.
>>
>> I feel fairly strongly that we probably want to execute these kinds of
>> tests under qemu system mode, not the user mode. The reason is that we
>> want to be as close to the target environment as we can be and that
>> qemu-user testing is at least as much of a test of qemu's emulation
>> that it is the behaviour of the compiler or libc (libc in particular).
>> I was thinking this and then later read you confirmed my suspicions
>> below...
>
>
> I believe the QEMU recipe splitting is also new in the tree, and Nathan isn't basing his work on that,
> so there might be some issues there.

I have been working against a relatively recent master, and have been
rebasing every now and again. The qemu system/user split likely will
not be a big problem, since at least at this point I have kept all the
qemu system tooling as runqemu setup in OEQA. So would work fine on
master/warrior/thud.

>
>>
>>
>> > The glibc test suite can be problematic to execute for a few reasons:
>> >  - Requires access to the exact same filesystem as the build host
>> >    - On physical targets and QEMU this requires NFS mounts
>>
>> We do have unfs support already under qemu which might make this
>> possible.
>>
>> >  - Relies on exact syscall behaviour
>> >    - Causes some issues where there are differences between qemu-linux-user and
>> >      the target architectures kernel
>>
>> Right, this one worries me and pushes me to want to use qemu system
>> mode.
>>
>> >  - Can consume significant resources (e.g. OOM, or worse trigger bugs/panics in
>> >    kernel drivers)
>>
>> Any rough guide to what significant is here? ptest needs 1GB memory for
>> example. qemu-system mode should limit that to the VMs at least?
>>
>> >  - Slow to execute
>> >    - With QEMU system emulation it can take many hours
>>
>> We do have KVM acceleration for x86 and arm FWIW which is probably
>> where we'd start testing this on the autobuilder.
>
>
> Excuse me if I'm mistaken, but would this be something similar to what
> we did for python3 optimization?
>
>>
>>
>> >    - With some physical target architectures it can take days (e.g. microblaze)
>> >
>> > The significantly increased execution speed of qemu-linux-user vs qemu system
>> > with glibc, and the ability for qemu-linux-user to be executed in parallel with
>> > the gcc test suite makes it a strong solution for continuous integration
>> > testing.
>>
>> Was that with or without KVM?
>>
>> > The following table shows results for the major test suite components running
>> > with qemu-linux-user execution. The numbers represent 'failed tests'/'total
>> > tests'. The machines used to run the tests are the `qemu*` machine for the
>> > associated architecture, not all qemu machines available in oe-core were tested.
>> > It is important to note that these results are only indicative of
>> > qemu-linux-user behaviour and that there are a number of test failures that are
>> > due to issues not specific to qemu-linux-user.
>> >
>> >         | gcc          | g++          | libstdc++   | binutils    | gas         | ld          | glibc
>> > x86-64  |   589/135169 |   457/131913 |     1/13008 |     0/  236 |     0/ 1256 |   166/ 1975 |  1423/ 5991
>> > arm     |   469/123905 |   365/128416 |    19/12788 |     0/  191 |     0/  872 |   155/ 1479 |    64/ 5130
>> > aarch64 |   460/130904 |   364/128977 |     1/12789 |     0/  190 |     0/  442 |   157/ 1474 |    76/ 5882
>> > powerpc | 18336/116624 |  6747/128636 |    33/12996 |     0/  187 |     1/  265 |   157/ 1352 |  1218/ 5110
>> > mips64  |  1174/134744 |   401/130195 |    22/12780 |     0/  213 |    43/ 7245 |   803/ 1634 |  2032/ 5847
>> > riscv64 |   456/106399 |   376/128427 |     1/12748 |     0/  185 |     0/  257 |   152/ 1062 |    88/ 5847
>>
>> I'd be interested to know how these numbers compare to the ssh
>> execution...
>>
>> The binutils results look good! :)
>>
>
> This is awesome!, some are a little scary though (percentage wise)
>
>>
>> > This patch also introduces some OEQA test cases which cover running the test
>> > suites. However in this specific patch it does not include any implementation
>> > for the automated setup of qemu system emulation testing with runqemu and NFS
>> > mounting for glibc tests. Also not included in these test cases is any known
>> > test failure filtering.
>>
>> The known test failure filtering is something we can use the OEQA
>> backend for, I'd envisage this being intergrated in a similar way to
>> the way we added ptest/ltp/ltp-posix there.
>>
>> > I would also be interested in the opinion with regards to whether these test
>> > suites should be executed as part of the existing Yocto Autobuilder instance.
>>
>> Short answer is yes. We won't run them all the time but when it makes
>> sense and I'd happily see the autobuilder apart to be able to trigger
>> these appropriately. We can probably run the KVM accelerated arches
>> more often than the others.
>
>
> Would we separate test cases into different sets/suites based on importance?, and yes
> I'd love to see this in the Yocto AB.

It might be worth splitting out the sub component test suites, e.g.
check-gcc and check-g++ as separate OEQA test cases. Which would
probably help to run parallel system qemu instances. However it would
be more complicated to split further.

>
>>
>> Plenty of implementation details to further discuss but this is great
>> to see!
>>
>> Cheers,
>>
>> Richard
>>
>
> This looks good, great work Nathan!, my only other comment would be that we would
> probably need two versions of the patches (one for thud) and one for master/warrior where
> some of the changes to *-initial recipes and qemu- system/user have happened already.

Certainly possible to make a thud version, but best to do that once a
version for master is completed.

Thanks,
Nathan

>
> Regards,
>
> Alejandro
>
>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> M.S. Alejandro Enedino Hernandez Samaniego

