Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id CAC737F17F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 16:19:02 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g17so47651414wrr.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 09:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=NRPpJ6AhKneeiLx/Gq8qo0E0yb5SfFaGnBbbaMtqFGg=;
	b=lcGaxbJRTGfw8q+oqVQrxzJZ5si/GMHnXtFyUj71hQJCWh5pKm/rOXKE2iAnk4SDUH
	pEEJGXz/X3VbNUL5WYyVBWze025kVbZCSZ1XAUYV0Aoz3KYfWQCKRQ7rvIwuxeAKTvq+
	PVhxFnVDg5iUQ86cV2gSX3gvbR91wXMutYf/+ceqRfR7BWlak/rgg5WJrV/o7PNQyLwC
	XNF/zQveO9oAM8XcKx7vLtdJatpbSNGltLUdr06GxgA4ITRpihSIPFDyS1AZudqrOUVM
	CbRqd4H/Cla/DsAMpgOmmwwxs4CAvz3bURHT+l7vYA6JfPl5ab1T3zXH5DM7hMj3qBAg
	4jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=NRPpJ6AhKneeiLx/Gq8qo0E0yb5SfFaGnBbbaMtqFGg=;
	b=WIT+7DINGXvyF/OOouCZoAeeL24IR2DlPHIZElrCXyCqufDAHEkoIBi3YeMS3Mn8a5
	cMrmb3olISx0syTRfDyZilMvhL0441tuKdh+wMCKsuYYMLOmlBWHgWm5ihvvSPnhLJZy
	o/Q7MMagf8GqVZN2X9Df+PHE6Z3k/s0ZzQ0fhVob2OB7xeR5BFY5HCY7PzTakwJAdo2V
	Dcntx3GVqVIzYnfE/Un/t9E/W2pqEj85jlNOBdLyyfQCebt4iY27PExt1n5FP9QdfU3f
	e9mTqP86eoL7GvFKoeRTklPwz3ny7y8RhhYHhG6vU1wxAjVnr2QHtbYNgIgvrqhOK516
	X3Fg==
X-Gm-Message-State: APjAAAW7NR+k6ECSYUSHgTgriUnQeJUyEqEEsuOo442wot22/jTnTR1z
	mTWFBMirmw7nF6lF/kb+A4k=
X-Google-Smtp-Source: APXvYqwwNEzQIH5X2csqLPQXT2ADvQG2+MRUmVPkzq49BlRQ/KoL67wYR8U2A4UydaTQfDMPEVbO3w==
X-Received: by 2002:a5d:540e:: with SMTP id g14mr3437848wrv.346.1563985143273; 
	Wed, 24 Jul 2019 09:19:03 -0700 (PDT)
Received: from [10.206.125.144] (tmo-111-60.customers.d1-online.com.
	[80.187.111.60]) by smtp.gmail.com with ESMTPSA id
	o11sm43381689wmh.37.2019.07.24.09.19.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jul 2019 09:19:02 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16F203)
In-Reply-To: <CA+aJhH3eHJCMs23uTt1sO-cVdPFyUHGyvJfym+KQ67bbRXD6-w@mail.gmail.com>
Date: Wed, 24 Jul 2019 19:18:59 +0300
Message-Id: <2F186A90-FEFC-4A94-BE6D-FEF80766066C@gmail.com>
References: <20190706113909.11836-1-nathan@nathanrossi.com>
	<2305ec57f78c799c2e72273b5e00d5faa4d0cba8.camel@linuxfoundation.org>
	<CA+aJhH2p50Tqyxq0iOLng+i8kgnd3HfFsCoVJCJAPwDY=xCxTA@mail.gmail.com>
	<CA+aJhH1GcWWkD0KVRxG7a8OZRGBZQZWu0-kVHWZjMD2gnxEYzA@mail.gmail.com>
	<692d2a624d62b06c781a0d5bb579a8d14973ddc9.camel@linuxfoundation.org>
	<aa26ad4c-738a-617c-edf9-db2fa453b623@windriver.com>
	<CA+aJhH3eHJCMs23uTt1sO-cVdPFyUHGyvJfym+KQ67bbRXD6-w@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
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
X-List-Received-Date: Wed, 24 Jul 2019 16:19:03 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Does the speed improve if system Qemu is configured to use several cpu cores=
 (I think this doesn=E2=80=99t happen by default in yocto)?

Alex

> On 24 Jul 2019, at 18.23, Nathan Rossi <nathan@nathanrossi.com> wrote:
>=20
>> On Thu, 25 Jul 2019 at 00:06, Mark Hatle <mark.hatle@windriver.com> wrote=
:
>>=20
>>> On 7/24/19 8:55 AM, richard.purdie@linuxfoundation.org wrote:
>>>> On Wed, 2019-07-24 at 22:30 +1000, Nathan Rossi wrote:
>>>> So I only hit one major issue with the oe-core qemu* machines I
>>>> tested on when running under system emulation, specifically with
>>>> aarch64/qemuarm64.
>>>>=20
>>>> One (or more) test in the "c" suite of gcc causes qemu to crash due
>>>> to what appears to be an internal qemu issue.
>>>>=20
>>>> qemu outputted:
>>>> qemu-4.0.0/tcg/tcg.c:3952: tcg_gen_code: Assertion
>>>> `s->gen_insn_end_off[num_insns] =3D=3D off' failed.
>>>>=20
>>>> The test that caused this was:
>>>> gcc.target/aarch64/advsimd-intrinsics/vldX.c   -O2  execution test
>>>=20
>>> Ok, interesting. I'd hope that issue could be resolved if it started
>>> causing problems for us, or we could skip that test as a workaround I
>>> guess.
>>=20
>> When we have done similar testing like this, we have skipped these tests.=
  Much
>> of the time they are in corner case instructions and not something that r=
eally
>> gives relevant results.
>>=20
>> But with that said, we should check if QEMU is already aware of this fail=
ure and
>> if not report it to them.
>=20
> Something I forgot to note was that this specific test runs fine under
> qemu user.
>=20
>>=20
>> (The GNU tests also test various instructions that may not be available o=
n all
>> processors, we've seen this many times on IA32 machines.  They just assum=
e all
>> instructions are available, even if running on an older CPU.  So this is a=
lso
>> something to be aware of when interpreting the results. -- but QEMU shoul=
dn't
>> crash!)
>=20
> Yes this is something I noticed with -mhard-float/-msoft-float on arm.
>=20
>>=20
>> --Mark
>>=20
>>>> Just an update here, managed to get the results for this. As you will
>>>> see below, running some of these tests is very slow on qemu system
>>>> emulation. Though kvm did give a decent boost in performance.
>>>>=20
>>>> Note: qemuarm64 (sys) is missing gcc results because one of the gcc
>>>> tests crashes qemu.
>>>=20
>>> The results were wrapped and hard to read so I unwrapped them (added
>>> here for others):
>=20
> Sorry about that.
>=20
>>>=20
>>>                           | g++          | gcc          | glibc       | l=
ibatomic   | libgomp     | libitm      | libstdc++-v3
>>> qemuarm (usr)              |   365/128416 |   469/123905 |    65/ 5130 |=
     0/   49 |     0/ 2515 |     0/   46 |     23/12782
>>> qemuarm (sys)              |   365/128416 |   468/123874 |    47/ 5130 |=
     0/   49 |     0/ 2515 |    18/   46 |     48/12790
>>> qemux86-64 (usr)           |   457/131913 |   589/135169 |  1423/ 5991 |=
     0/   54 |     0/ 2522 |     0/   46 |      1/13008
>>> qemux86-64 (sys)           |   418/131913 |   519/135221 |  1418/ 5991 |=
     0/   54 |     1/ 2522 |    18/   46 |     51/13010
>>> qemux86-64 (sys+kvm)       |   418/131913 |   519/135415 |    40/ 5991 |=
     0/   54 |     1/ 2522 |    18/   46 |     46/13010
>>> qemuarm64 (usr)            |   364/128977 |   459/130904 |    75/ 5882 |=
     0/   54 |     0/ 2515 |     0/   46 |      1/12789
>>> qemuarm64 (sys)            |   364/128977 |              |    43/ 5882 |=
     0/   54 |     0/ 2515 |    18/   46 |     62/12791
>>> qemuppc (usr)              |  6747/128636 | 18336/116624 |  1220/ 5110 |=
     0/   49 |     2/ 2515 |     0/   46 |     33/12996
>>> qemuppc (sys)              |   383/129056 |   800/119824 |  1188/ 5110 |=
     0/   49 |     2/ 2515 |    18/   46 |     34/12998
>>> qemuriscv64 (usr)          |   376/128427 |   460/106399 |    86/ 5847 |=
     0/   54 |     4/ 2508 |             |      1/12748
>>> qemuriscv64 (sys)          |   376/128427 |   458/106451 |    53/ 5847 |=
     0/   54 |     0/ 2508 |             |     52/12750
>>>=20
>>>                           | g++          | gcc          | glibc       | l=
ibatomic   | libgomp     | libitm      | libstdc++-v3
>>> qemuarm (usr)              |       9m 24s |       15m 3s |     37m 10s |=
          8s |      6m 52s |          8s |       1h 24s
>>> qemuarm (sys)              |   3h 58m 30s |  12h 21m 44s |  5h 36m 53s |=
         55s |     45m 57s |         53s |  12h 16m 11s
>>> qemux86-64 (usr)           |       8m 22s |      15m 48s |     36m 52s |=
          8s |       6m 1s |          8s |      34m 42s
>>> qemux86-64 (sys)           |   5h 38m 27s |  15h 15m 40s |  5h 54m 42s |=
       1m 8s |     45m 52s |         55s |   3h 26m 11s
>>> qemux86-64 (sys+kvm)       |      16m 22s |      56m 44s |  2h 29m 45s |=
         25s |     16m 58s |         21s |      19m 20s
>>> qemuarm64 (usr)            |       8m 34s |      16m 15s |     44m 25s |=
          8s |      6m 23s |          8s |      35m 38s
>>> qemuarm64 (sys)            |    4h 2m 53s |              |   6h 2m 39s |=
       1m 7s |     44m 47s |         53s |    3h 9m 37s
>>> qemuppc (usr)              |       6m 54s |      10m 47s |     32m 50s |=
          6s |      6m 22s |          7s |      34m 25s
>>> qemuppc (sys)              |   5h 46m 23s |  16h 16m 10s |   4h 10m 6s |=
      1m 16s |   1h 3m 11s |      1m 12s |   4h 32m 45s
>>> qemuriscv64 (usr)          |       6m 54s |      10m 23s |     36m 50s |=
          7s |      9m 38s |             |      33m 13s
>>> qemuriscv64 (sys)          |   2h 19m 24s |   6h 27m 37s |  4h 23m 43s |=
         47s |     31m 47s |             |   1h 52m 18s
>>>=20
>>> This makes very interesting reading, thanks!
>>>=20
>>> I'm quite amazed how much faster user mode qemu is at running the tests
>>> against a system kvm qemu. The accuracy of sys, usr and sys+kvm looks
>>> questionable in different places.
>=20
> The speed user mode qemu gets comes from multi-threaded execution.
> Whilst kvm gets better single threaded execution performance over user
> mode qemu, more threads of tests can run with user mode. I probably
> should have mentioned all the above runs were on an 8 thread system.
> So on a bigger build machine user mode qemu probably gets even better
> scaling.
>=20
>>>=20
>>> There isn't a clear answer here although its obvious qemuppc user mode
>>> emulation is bad. The usermode testing is clearly the winner speed wise
>>> by a long margin. I would like to understand why though as KVM should
>>> be reasonable...
>=20
> Just given some inspection of the systems and host while running, it
> appears that two of the major performances hits were the overheads in
> SSH (e.g. encryption, etc) and the use of multiple threads trying to
> run things on the single core target.
>=20
> I will look into the test failures with user mode and try to resolve
> some of them. If its possible to have similar results between usr/sys
> then it would help make the choice between them a lot easier.
> Resolving some of the test failures should also help to bring the
> results in line with expectation.
>=20
> Regards,
> Nathan
>=20
>>>=20
>>> Cheers,
>>>=20
>>> Richard
>>>=20
>>>=20
>>>=20
>>>=20
>>>=20
>>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

