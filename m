Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E7B3D7F166
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 13:55:25 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p17so47078072wrf.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 06:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=9KxF2mymGUzLbMNYVWd5dK5OJ12/J7Jc+NwGI8IOMFE=;
	b=UoML8d2ljfyKiMiR+L5TyiK9EWIxW1aQ5XEO3kaHhOZsoThvDtRiQuoqICKf3CIune
	LMOWaf+N/tw0baxx/gWpMhgI4FCk+w0zPUfcJDXGwwKcCdepmF//HS/hPZj/+KNlfs6O
	Zow91mHn+PzFQnhj9F0HLpLxdFeYSXIh4iExQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=9KxF2mymGUzLbMNYVWd5dK5OJ12/J7Jc+NwGI8IOMFE=;
	b=IFfIJNGyjwQhrzox9q8cx9LJTMSRPfIGdpkuNwcKwrS/vtXN5CQqo9XzNwQRFFkvVa
	/PzeDfoDwjpfNqddCUZDXFcWf1FZKGz8jJhryeKYpltYztdQv2h8Erp3tt/jNGywIh5l
	dKpgmXP9L1lh89o85I2D+3H5ir7/k6m8hHWxYpEbIchaHOdP4JGCuDISSfWOoRBUE3Sd
	aQzpQLkClq781vZ3dYQAJyMcE1ShLp410qLUqqnEgW7uPATIMPRuoZPvBf0+fHXin3Fn
	JaNFk2UkbbYIuDrVOzSHTm0UP3eyBt+cQpAZk89MEG8cJpWrtqDcLOQYKaIUvvY2zGmh
	UbLw==
X-Gm-Message-State: APjAAAXAAeket0m1XOB2wQPIuJc3ME47AYHrAOyaEaLgjJHTI2cRQVZN
	R+CCEpes5sgMOPP29OsYF2NPTPxHmps=
X-Google-Smtp-Source: APXvYqxyh9/XKmPhR32ZJOmc3amdaYt+GqiMxLDUr1SAk9bZx1NrxZZ0svKpHrECAThjllGkk1fC9g==
X-Received: by 2002:adf:f186:: with SMTP id h6mr74950815wro.274.1563976526495; 
	Wed, 24 Jul 2019 06:55:26 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n14sm84656002wra.75.2019.07.24.06.55.24
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 24 Jul 2019 06:55:25 -0700 (PDT)
Message-ID: <692d2a624d62b06c781a0d5bb579a8d14973ddc9.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Nathan Rossi <nathan@nathanrossi.com>
Date: Wed, 24 Jul 2019 14:55:23 +0100
In-Reply-To: <CA+aJhH1GcWWkD0KVRxG7a8OZRGBZQZWu0-kVHWZjMD2gnxEYzA@mail.gmail.com>
References: <20190706113909.11836-1-nathan@nathanrossi.com>
	<2305ec57f78c799c2e72273b5e00d5faa4d0cba8.camel@linuxfoundation.org>
	<CA+aJhH2p50Tqyxq0iOLng+i8kgnd3HfFsCoVJCJAPwDY=xCxTA@mail.gmail.com>
	<CA+aJhH1GcWWkD0KVRxG7a8OZRGBZQZWu0-kVHWZjMD2gnxEYzA@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 24 Jul 2019 13:55:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-07-24 at 22:30 +1000, Nathan Rossi wrote:
> So I only hit one major issue with the oe-core qemu* machines I
> tested on when running under system emulation, specifically with
> aarch64/qemuarm64.
> 
> One (or more) test in the "c" suite of gcc causes qemu to crash due
> to what appears to be an internal qemu issue.
> 
> qemu outputted:
> qemu-4.0.0/tcg/tcg.c:3952: tcg_gen_code: Assertion
> `s->gen_insn_end_off[num_insns] == off' failed.
> 
> The test that caused this was:
> gcc.target/aarch64/advsimd-intrinsics/vldX.c   -O2  execution test

Ok, interesting. I'd hope that issue could be resolved if it started
causing problems for us, or we could skip that test as a workaround I
guess.

> Just an update here, managed to get the results for this. As you will
> see below, running some of these tests is very slow on qemu system
> emulation. Though kvm did give a decent boost in performance.
> 
> Note: qemuarm64 (sys) is missing gcc results because one of the gcc
> tests crashes qemu.

The results were wrapped and hard to read so I unwrapped them (added
here for others):

                           | g++          | gcc          | glibc       | libatomic   | libgomp     | libitm      | libstdc++-v3
qemuarm (usr)              |   365/128416 |   469/123905 |    65/ 5130 |     0/   49 |     0/ 2515 |     0/   46 |     23/12782
qemuarm (sys)              |   365/128416 |   468/123874 |    47/ 5130 |     0/   49 |     0/ 2515 |    18/   46 |     48/12790
qemux86-64 (usr)           |   457/131913 |   589/135169 |  1423/ 5991 |     0/   54 |     0/ 2522 |     0/   46 |      1/13008
qemux86-64 (sys)           |   418/131913 |   519/135221 |  1418/ 5991 |     0/   54 |     1/ 2522 |    18/   46 |     51/13010
qemux86-64 (sys+kvm)       |   418/131913 |   519/135415 |    40/ 5991 |     0/   54 |     1/ 2522 |    18/   46 |     46/13010
qemuarm64 (usr)            |   364/128977 |   459/130904 |    75/ 5882 |     0/   54 |     0/ 2515 |     0/   46 |      1/12789
qemuarm64 (sys)            |   364/128977 |              |    43/ 5882 |     0/   54 |     0/ 2515 |    18/   46 |     62/12791
qemuppc (usr)              |  6747/128636 | 18336/116624 |  1220/ 5110 |     0/   49 |     2/ 2515 |     0/   46 |     33/12996
qemuppc (sys)              |   383/129056 |   800/119824 |  1188/ 5110 |     0/   49 |     2/ 2515 |    18/   46 |     34/12998
qemuriscv64 (usr)          |   376/128427 |   460/106399 |    86/ 5847 |     0/   54 |     4/ 2508 |             |      1/12748
qemuriscv64 (sys)          |   376/128427 |   458/106451 |    53/ 5847 |     0/   54 |     0/ 2508 |             |     52/12750

                           | g++          | gcc          | glibc       | libatomic   | libgomp     | libitm      | libstdc++-v3
qemuarm (usr)              |       9m 24s |       15m 3s |     37m 10s |          8s |      6m 52s |          8s |       1h 24s
qemuarm (sys)              |   3h 58m 30s |  12h 21m 44s |  5h 36m 53s |         55s |     45m 57s |         53s |  12h 16m 11s
qemux86-64 (usr)           |       8m 22s |      15m 48s |     36m 52s |          8s |       6m 1s |          8s |      34m 42s
qemux86-64 (sys)           |   5h 38m 27s |  15h 15m 40s |  5h 54m 42s |       1m 8s |     45m 52s |         55s |   3h 26m 11s
qemux86-64 (sys+kvm)       |      16m 22s |      56m 44s |  2h 29m 45s |         25s |     16m 58s |         21s |      19m 20s
qemuarm64 (usr)            |       8m 34s |      16m 15s |     44m 25s |          8s |      6m 23s |          8s |      35m 38s
qemuarm64 (sys)            |    4h 2m 53s |              |   6h 2m 39s |       1m 7s |     44m 47s |         53s |    3h 9m 37s
qemuppc (usr)              |       6m 54s |      10m 47s |     32m 50s |          6s |      6m 22s |          7s |      34m 25s
qemuppc (sys)              |   5h 46m 23s |  16h 16m 10s |   4h 10m 6s |      1m 16s |   1h 3m 11s |      1m 12s |   4h 32m 45s
qemuriscv64 (usr)          |       6m 54s |      10m 23s |     36m 50s |          7s |      9m 38s |             |      33m 13s
qemuriscv64 (sys)          |   2h 19m 24s |   6h 27m 37s |  4h 23m 43s |         47s |     31m 47s |             |   1h 52m 18s

This makes very interesting reading, thanks!

I'm quite amazed how much faster user mode qemu is at running the tests
against a system kvm qemu. The accuracy of sys, usr and sys+kvm looks
questionable in different places.

There isn't a clear answer here although its obvious qemuppc user mode
emulation is bad. The usermode testing is clearly the winner speed wise
by a long margin. I would like to understand why though as KVM should
be reasonable...

Cheers,

Richard






