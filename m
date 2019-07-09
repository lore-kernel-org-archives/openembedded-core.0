Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9CC7ED59
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 20:12:39 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id g18so125898qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 13:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0rybT6pk4KzhUJXyxYMoguz6+AtK2VnJHpUDxeK6b1w=;
	b=YtbYXxR+KMbPVrVJfbtsVzo/Kz7tuNrjS750zeBDQGsE8qiZIa3ihmbaHaao4XntHg
	ZjffOq7dUUPYw13rP7QjeTkEmM2g7ijT+n+CQdU1aDtf3Q8ppZlVxQuRgBXRGTGntrDC
	T/lNgnid7DPRKAWoMVr0epFvTjyc7/ava5EMmHok1QgQJOa3jpOAf+wgpwC6zrWfkiPA
	0Gt6H4go1opsJ4hb/1IYx3u6ZN/Vqb7mMlZ6cd96Y9RDi4j+Qj7VjSgk8bOkZfPHdOF5
	MD7igi8jBnqPsw/9B/EYRRyEd9k3aEy+odkFqqm+n5ey9FvPPlIKT7g/OF1eNiHkMPcv
	3K+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0rybT6pk4KzhUJXyxYMoguz6+AtK2VnJHpUDxeK6b1w=;
	b=a1KiwoB1K57qt+YEhqK3RJU2/vDh2S9EbkVdTZzg9nCnzLFzkw5Z/rr6P8b+d7c++G
	rrTwevzJtFJAcxroKXY8zNFO0vRJcRvCHQXjB6/4/pUL6Zh2bRqd2u13+KwG77VlUxHG
	HJ4fTDTxH8BQv0PK5mUFNovHZseNQ/QTuzMzWdoq3ZLHnb1Uxwzg8crnwosrX1QFnZbB
	eCZFG6jMJj8cMxry/KYbv8Y8Ibpf3NrwFhbWumasArSTVI9hn9DFgSSTP/VDPlJYj2AK
	QlHebTKYSK7ZWM6hZDYK+hycC+JAftsBrSW0KziNV2TEeRQuJav0e8+YuI2mA6y/JSFN
	LUKw==
X-Gm-Message-State: APjAAAWWDqVjeBal0XKwT81OI+8Zi9roDN5jPTk430NQZWlRqhIsgZM+
	V8ZETYNGfG1jZndmaVdOvQ6CQX1HF5ttOXmmPi0=
X-Google-Smtp-Source: APXvYqzwtolb/lk62Jmxf6X2f2NI3OYJJvPuJ5SsJ9FMmgu+ph154AUrjRTrY4NU2YtUnUrJ5z8MvG/tZzFrwwDpZvY=
X-Received: by 2002:a37:7083:: with SMTP id l125mr19749928qkc.71.1562703160546;
	Tue, 09 Jul 2019 13:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190706113909.11836-1-nathan@nathanrossi.com>
	<CAJTo0LadJjwL+NN+09uWCcgYpGa-2Kggx_wPWkXejA2AmU=B9g@mail.gmail.com>
	<CA+aJhH0W6EAkbuhUG0Xmuy6OhgwLja_ZNHW+O6QW9EK_E4vYDw@mail.gmail.com>
In-Reply-To: <CA+aJhH0W6EAkbuhUG0Xmuy6OhgwLja_ZNHW+O6QW9EK_E4vYDw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jul 2019 13:12:14 -0700
Message-ID: <CAMKF1spmMJAMuRmJThr07P4wWc4yUWVdCQwpNKRjg9vt_o=AoA@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
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
X-List-Received-Date: Tue, 09 Jul 2019 20:12:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 9, 2019 at 4:48 AM Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> On Tue, 9 Jul 2019 at 21:16, Burton, Ross <ross.burton@intel.com> wrote:
> >
> > This is awesome!
> >
> > On Sat, 6 Jul 2019 at 12:39, Nathan Rossi <nathan@nathanrossi.com> wrote:
> > >         | gcc          | g++          | libstdc++   | binutils    | gas         | ld          | glibc
> > > x86-64  |   589/135169 |   457/131913 |     1/13008 |     0/  236 |     0/ 1256 |   166/ 1975 |  1423/ 5991
> > > arm     |   469/123905 |   365/128416 |    19/12788 |     0/  191 |     0/  872 |   155/ 1479 |    64/ 5130
> > > aarch64 |   460/130904 |   364/128977 |     1/12789 |     0/  190 |     0/  442 |   157/ 1474 |    76/ 5882
> > > powerpc | 18336/116624 |  6747/128636 |    33/12996 |     0/  187 |     1/  265 |   157/ 1352 |  1218/ 5110
> > > mips64  |  1174/134744 |   401/130195 |    22/12780 |     0/  213 |    43/ 7245 |   803/ 1634 |  2032/ 5847
> > > riscv64 |   456/106399 |   376/128427 |     1/12748 |     0/  185 |     0/  257 |   152/ 1062 |    88/ 5847
> >
> > So what I'm really interested in is what those numbers look like for
> > e.g. x86-64 on real hardware: are the test suites always failing a
> > bit, or are these indicative of problems we've introduced?
>

these numbers id PASS/FAIL are not usual, usually it should be only
handful of failures, but this could be
some simple basic missing piece, since dejaGNU is quite picky at times.

> Just to clarify, by real hardware are you interested in the tests
> running against a system running with a oe distro + kernel. Or just
> running on e.g. the build host?
>
> As for the failing tests, do not put to much emphasis on the values
> provided. I am sure there are a number of tests that are failing due
> to minor configuration issues that simply need a deeper look at the
> test result and output to fix the issue. And the large number of
> failures for powerpc are due to qemu user failing due to illegal
> instruction.
>
> The goal would be to get the results similar to what other
> users/distro get, by reviewing results posted here:
> https://gcc.gnu.org/ml/gcc-testresults/.
> And for glibc the results from: https://sourceware.org/glibc/wiki/Release/2.29
>
> Thanks,
> Nathan
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

