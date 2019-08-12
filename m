Return-Path: <nathan@nathanrossi.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3529E7E6B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 06:41:40 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v19so10731393wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Aug 2019 23:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qhLvSqPa+J1l1P7y5/YvfGVeLFXDYUGh5ZMCtGanp94=;
	b=NpMUiPQjqYu9CdnVuY77jv6bWL2KXUJCjBiMo/nZiNW46tKkywc+r+zJLNU88evGJF
	pj29dlNcms3N4lTxpTBydLidUmXi0giwNzzCfuPqrIbbU/Q0eb22SF8gksG/tPBYDu/H
	q35+SlvXPfpk8WJHIg74cw3SL+yBegd5Zn37vftaP7nzmy5/MEXXmK8/FRhiHIRAq7+I
	FQMKKhVXcYfuj1pVoHBMKh35U8eLBAb2HU+0/2njAfCMXtZ9VNZuZQ+h9xeps7VYqj5n
	jjw+seIHw+RzxlcWYWt2kS8evQuY6R5LTwHfUCVJJi2nmKm/KMN5WbIoE9+/cV2WAWoF
	rA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qhLvSqPa+J1l1P7y5/YvfGVeLFXDYUGh5ZMCtGanp94=;
	b=HiyDLdDWu/aAIR/lDIZ6d+wIA5rygic6tht3g3LzxFVCMiqBaka0TR7OoxtpaZWp8r
	GmVNwNY4wIe3Hz7h/EKELR0BmGfLr8B08VBgQ52gW546DcMvtDRNtfyqs/BulITa+0nK
	NUCjYV/MvpSgwWEEDeQXlzHRqV3VJqCgQhsfF0niZ0nQQP07J4AePNFrQPe/l+VPVbEj
	7nFecxeDoBTtt6dO88j6D+bVcci1nR/Pi+jfgBolZDLQsev3bE2QVt3DuzJx05TKiabV
	x31JFSSq0jUkP9y8/XKpcqFVjXWBL9Kb8N9av/Gdace07xdi71TG7GAasxboUatXqvc2
	I19w==
X-Gm-Message-State: APjAAAVe0oISUQQYq8agFde9wy7pEbRvMtlCZIGqw4rOB3rrqd1tCgRh
	WZLVBMaoYuttcIl0YHW1WGnjzLFl5eeViP9XwXR1XA==
X-Google-Smtp-Source: APXvYqzfCkwy5kBN5YIR/hMfcqmKCdcKvg+zctqNngfDPYyzHfGjUYAta1FT6Xhe2KmFJBB7tmGJwoF/+NqAk8dsFjo=
X-Received: by 2002:a1c:5402:: with SMTP id i2mr25547568wmb.41.1565592100701; 
	Sun, 11 Aug 2019 23:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190706113909.11836-1-nathan@nathanrossi.com>
	<2305ec57f78c799c2e72273b5e00d5faa4d0cba8.camel@linuxfoundation.org>
	<CA+aJhH2p50Tqyxq0iOLng+i8kgnd3HfFsCoVJCJAPwDY=xCxTA@mail.gmail.com>
	<CA+aJhH1GcWWkD0KVRxG7a8OZRGBZQZWu0-kVHWZjMD2gnxEYzA@mail.gmail.com>
	<692d2a624d62b06c781a0d5bb579a8d14973ddc9.camel@linuxfoundation.org>
	<aa26ad4c-738a-617c-edf9-db2fa453b623@windriver.com>
	<CA+aJhH3eHJCMs23uTt1sO-cVdPFyUHGyvJfym+KQ67bbRXD6-w@mail.gmail.com>
	<2F186A90-FEFC-4A94-BE6D-FEF80766066C@gmail.com>
In-Reply-To: <2F186A90-FEFC-4A94-BE6D-FEF80766066C@gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Mon, 12 Aug 2019 16:41:29 +1000
Message-ID: <CA+aJhH0gbiW-JiKTLC4njyodQKwNfX9DYtV7e6u3uXdBfa-8HA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
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
X-List-Received-Date: Mon, 12 Aug 2019 06:41:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Jul 2019 at 02:19, Alexander Kanavin <alex.kanavin@gmail.com> wr=
ote:
>
> Does the speed improve if system Qemu is configured to use several cpu co=
res (I think this doesn=E2=80=99t happen by default in yocto)?

Sorry for the delayed response. I had tested this initially and did
not see any decent scaling but wanted to test it more.

After some further testing and inspection, it still does not scale as
one might expect. Moving from 1 core to 2 provided a small performance
boost, but scaling up to 4 or 8 cores provided very little gain.
Looking at what the host is doing occasionally showed that rngd was
using 125% CPU, but since sshd is supposed to be using /dev/urandom I
am not sure what is limiting the performance.

Regards,
Nathan


>
> Alex
>
> > On 24 Jul 2019, at 18.23, Nathan Rossi <nathan@nathanrossi.com> wrote:
> >
> >> On Thu, 25 Jul 2019 at 00:06, Mark Hatle <mark.hatle@windriver.com> wr=
ote:
> >>
> >>> On 7/24/19 8:55 AM, richard.purdie@linuxfoundation.org wrote:
> >>>> On Wed, 2019-07-24 at 22:30 +1000, Nathan Rossi wrote:
> >>>> So I only hit one major issue with the oe-core qemu* machines I
> >>>> tested on when running under system emulation, specifically with
> >>>> aarch64/qemuarm64.
> >>>>
> >>>> One (or more) test in the "c" suite of gcc causes qemu to crash due
> >>>> to what appears to be an internal qemu issue.
> >>>>
> >>>> qemu outputted:
> >>>> qemu-4.0.0/tcg/tcg.c:3952: tcg_gen_code: Assertion
> >>>> `s->gen_insn_end_off[num_insns] =3D=3D off' failed.
> >>>>
> >>>> The test that caused this was:
> >>>> gcc.target/aarch64/advsimd-intrinsics/vldX.c   -O2  execution test
> >>>
> >>> Ok, interesting. I'd hope that issue could be resolved if it started
> >>> causing problems for us, or we could skip that test as a workaround I
> >>> guess.
> >>
> >> When we have done similar testing like this, we have skipped these tes=
ts.  Much
> >> of the time they are in corner case instructions and not something tha=
t really
> >> gives relevant results.
> >>
> >> But with that said, we should check if QEMU is already aware of this f=
ailure and
> >> if not report it to them.
> >
> > Something I forgot to note was that this specific test runs fine under
> > qemu user.
> >
> >>
> >> (The GNU tests also test various instructions that may not be availabl=
e on all
> >> processors, we've seen this many times on IA32 machines.  They just as=
sume all
> >> instructions are available, even if running on an older CPU.  So this =
is also
> >> something to be aware of when interpreting the results. -- but QEMU sh=
ouldn't
> >> crash!)
> >
> > Yes this is something I noticed with -mhard-float/-msoft-float on arm.
> >
> >>
> >> --Mark
> >>
> >>>> Just an update here, managed to get the results for this. As you wil=
l
> >>>> see below, running some of these tests is very slow on qemu system
> >>>> emulation. Though kvm did give a decent boost in performance.
> >>>>
> >>>> Note: qemuarm64 (sys) is missing gcc results because one of the gcc
> >>>> tests crashes qemu.
> >>>
> >>> The results were wrapped and hard to read so I unwrapped them (added
> >>> here for others):
> >
> > Sorry about that.
> >
> >>>
> >>>                           | g++          | gcc          | glibc      =
 | libatomic   | libgomp     | libitm      | libstdc++-v3
> >>> qemuarm (usr)              |   365/128416 |   469/123905 |    65/ 513=
0 |     0/   49 |     0/ 2515 |     0/   46 |     23/12782
> >>> qemuarm (sys)              |   365/128416 |   468/123874 |    47/ 513=
0 |     0/   49 |     0/ 2515 |    18/   46 |     48/12790
> >>> qemux86-64 (usr)           |   457/131913 |   589/135169 |  1423/ 599=
1 |     0/   54 |     0/ 2522 |     0/   46 |      1/13008
> >>> qemux86-64 (sys)           |   418/131913 |   519/135221 |  1418/ 599=
1 |     0/   54 |     1/ 2522 |    18/   46 |     51/13010
> >>> qemux86-64 (sys+kvm)       |   418/131913 |   519/135415 |    40/ 599=
1 |     0/   54 |     1/ 2522 |    18/   46 |     46/13010
> >>> qemuarm64 (usr)            |   364/128977 |   459/130904 |    75/ 588=
2 |     0/   54 |     0/ 2515 |     0/   46 |      1/12789
> >>> qemuarm64 (sys)            |   364/128977 |              |    43/ 588=
2 |     0/   54 |     0/ 2515 |    18/   46 |     62/12791
> >>> qemuppc (usr)              |  6747/128636 | 18336/116624 |  1220/ 511=
0 |     0/   49 |     2/ 2515 |     0/   46 |     33/12996
> >>> qemuppc (sys)              |   383/129056 |   800/119824 |  1188/ 511=
0 |     0/   49 |     2/ 2515 |    18/   46 |     34/12998
> >>> qemuriscv64 (usr)          |   376/128427 |   460/106399 |    86/ 584=
7 |     0/   54 |     4/ 2508 |             |      1/12748
> >>> qemuriscv64 (sys)          |   376/128427 |   458/106451 |    53/ 584=
7 |     0/   54 |     0/ 2508 |             |     52/12750
> >>>
> >>>                           | g++          | gcc          | glibc      =
 | libatomic   | libgomp     | libitm      | libstdc++-v3
> >>> qemuarm (usr)              |       9m 24s |       15m 3s |     37m 10=
s |          8s |      6m 52s |          8s |       1h 24s
> >>> qemuarm (sys)              |   3h 58m 30s |  12h 21m 44s |  5h 36m 53=
s |         55s |     45m 57s |         53s |  12h 16m 11s
> >>> qemux86-64 (usr)           |       8m 22s |      15m 48s |     36m 52=
s |          8s |       6m 1s |          8s |      34m 42s
> >>> qemux86-64 (sys)           |   5h 38m 27s |  15h 15m 40s |  5h 54m 42=
s |       1m 8s |     45m 52s |         55s |   3h 26m 11s
> >>> qemux86-64 (sys+kvm)       |      16m 22s |      56m 44s |  2h 29m 45=
s |         25s |     16m 58s |         21s |      19m 20s
> >>> qemuarm64 (usr)            |       8m 34s |      16m 15s |     44m 25=
s |          8s |      6m 23s |          8s |      35m 38s
> >>> qemuarm64 (sys)            |    4h 2m 53s |              |   6h 2m 39=
s |       1m 7s |     44m 47s |         53s |    3h 9m 37s
> >>> qemuppc (usr)              |       6m 54s |      10m 47s |     32m 50=
s |          6s |      6m 22s |          7s |      34m 25s
> >>> qemuppc (sys)              |   5h 46m 23s |  16h 16m 10s |   4h 10m 6=
s |      1m 16s |   1h 3m 11s |      1m 12s |   4h 32m 45s
> >>> qemuriscv64 (usr)          |       6m 54s |      10m 23s |     36m 50=
s |          7s |      9m 38s |             |      33m 13s
> >>> qemuriscv64 (sys)          |   2h 19m 24s |   6h 27m 37s |  4h 23m 43=
s |         47s |     31m 47s |             |   1h 52m 18s
> >>>
> >>> This makes very interesting reading, thanks!
> >>>
> >>> I'm quite amazed how much faster user mode qemu is at running the tes=
ts
> >>> against a system kvm qemu. The accuracy of sys, usr and sys+kvm looks
> >>> questionable in different places.
> >
> > The speed user mode qemu gets comes from multi-threaded execution.
> > Whilst kvm gets better single threaded execution performance over user
> > mode qemu, more threads of tests can run with user mode. I probably
> > should have mentioned all the above runs were on an 8 thread system.
> > So on a bigger build machine user mode qemu probably gets even better
> > scaling.
> >
> >>>
> >>> There isn't a clear answer here although its obvious qemuppc user mod=
e
> >>> emulation is bad. The usermode testing is clearly the winner speed wi=
se
> >>> by a long margin. I would like to understand why though as KVM should
> >>> be reasonable...
> >
> > Just given some inspection of the systems and host while running, it
> > appears that two of the major performances hits were the overheads in
> > SSH (e.g. encryption, etc) and the use of multiple threads trying to
> > run things on the single core target.
> >
> > I will look into the test failures with user mode and try to resolve
> > some of them. If its possible to have similar results between usr/sys
> > then it would help make the choice between them a lot easier.
> > Resolving some of the test failures should also help to bring the
> > results in line with expectation.
> >
> > Regards,
> > Nathan
> >
> >>>
> >>> Cheers,
> >>>
> >>> Richard
> >>>
> >>>
> >>>
> >>>
> >>>
> >>
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

