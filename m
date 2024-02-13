Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897A9C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 15:25:45 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.14047.1707837942127986204
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 07:25:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rhBXsraP;
 spf=pass (domain: konsulko.com, ip: 209.85.219.50, mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-68cc9061c73so21730086d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 07:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1707837941; x=1708442741; darn=lists.openembedded.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OoWymj11G182S6n5kx6gJmWhskao5uu66a31Dgm/Yr0=;
        b=rhBXsraP8YoqOI8o/ioBc1xqTnuz5frRt0nInJ4OwKOnxzrAJPDu62oboBMMPu0J+r
         2k1PToksarU4R267lTAAhF/BN7o8v16XP0lcmcuL6K6Mky/FIsS2yX0ROisIwS+2dmjC
         DDZgQZzMIC1LKfz32PiSqonHzZaeBZQyqZ+ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707837941; x=1708442741;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OoWymj11G182S6n5kx6gJmWhskao5uu66a31Dgm/Yr0=;
        b=ai1rKdmrOOMcM4A37D3TRjtOgu1S+CPR+lhtJD3Z8u+KBXO2kzxZ0e9dyE8yNYat6a
         SGlwtINlYAlg4y+pKZECo1flLtm0D92E8WqfXtYUjJXzfs9U3PQx59w+suSaEk/780TJ
         S+B5LD1Qrw3tsk9CB/XcRmEX5vAbwQRqIC+dsn9IZXz/9UOC9uECdpNjLgeH8KifogPD
         sZ326DiGB0W7CihFEbqqd99xMK7xoVao4f4C3rbx7GJHA5k4rboym+SWX+HhqqV84QV8
         TICAWTqEWuGoU63fQNilOJeWSEOMpouWMJ043gCOQmdagQd5pETmHMoknnAAv8l2ArHJ
         1hXQ==
X-Gm-Message-State: AOJu0YzBxTYVBI5e/8YW/hCVn4BPB8eqa2suWnFprPPM2MUU3lNwRz0D
	fxGRrk4bFTEeMEiqvgOuVMrUyclHev8Gbpq4dQmRZrK0mV2I0og6hi0HVFEwvVg=
X-Google-Smtp-Source: AGHT+IGVbgQ9tsUqHAxE9vLAMMu09kXO741UYD6oS6rmzNt6JEJNFkwTeviZj60j+55RoXFbwnaFNQ==
X-Received: by 2002:a0c:d993:0:b0:68c:933c:e7f9 with SMTP id y19-20020a0cd993000000b0068c933ce7f9mr9672500qvj.17.1707837941067;
        Tue, 13 Feb 2024 07:25:41 -0800 (PST)
Received: from godzilla (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id lz9-20020a0562145c4900b0068d1cb18b9bsm1287619qvb.26.2024.02.13.07.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 07:25:40 -0800 (PST)
Date: Tue, 13 Feb 2024 10:25:28 -0500 (EST)
From: Scott Murray <scott.murray@konsulko.com>
To: randy.macleod@windriver.com
cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] rng-tools: move to meta-oe
In-Reply-To: <55fa276d-e6e2-4cc1-b4fa-660356889665@windriver.com>
Message-ID: <277ec088-9dfa-c2c5-b03c-21e03b969ab9@konsulko.com>
References: <20240110202501.1554379-1-Randy.MacLeod@windriver.com> <20240115165859d332c9cb@mail.local> <cfa90344-0753-4ae1-9979-2c0f12a33d50@windriver.com> <b8554634-5da9-9872-660a-5e94a62c765e@konsulko.com>
 <55fa276d-e6e2-4cc1-b4fa-660356889665@windriver.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811583-630062803-1707837940=:4367"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 15:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195413

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811583-630062803-1707837940=:4367
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 8 Feb 2024, Randy MacLeod via lists.openembedded.org wrote:

> On 2024-01-15 4:50 p.m., Scott Murray wrote:
> > On Mon, 15 Jan 2024, Randy MacLeod via lists.openembedded.org wrote:
> >
> >> On 2024-01-15 11:58 a.m., Alexandre Belloni via lists.openembedded.org
> >> wrote:
> >>> This is breaking meta-agl-core until this gets into meta-oe:
> >>>
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/3849/steps/14/logs/stdio
> >> Thanks Alexandre.
> >>
> >>
> >> Stephane, Jan-Simon,
> >>
> >> Is rng-tools actually still a requirement for meta-agl ?
> >> It was added back in 2018 but the kernel algorithm improved as of 5.6:
> >> https://lists.openembedded.org/g/openembedded-core/message/178518
> > The kernel no longer blocking does mean things won't get stuck on boot,
> > but it seems like any distro with an eye towards security still needs
> > either rngd or haveged present to feed in entropy on hardware that does
> > not have a hardware RNG (and potentially even when there is a hardware
> > RNG to improve the quality of the pool).  We definitely support some
> > platforms in AGL that do not have a hardware RNG, so we'll have to work
> > out whether we're going to need to eat making meta-oe a hard requirement
> > for using meta-agl-core or do something else.
>
> For anyone who missed it...
>
> We restored rng-tools in oe-core as described here:
> https://git.openembedded.org/openembedded-core/commit/?id=828afafb3bff54079fcba9bdab2ec87ac13e4ce6
>
>
> Scott,
>
> Any news on a qemu/HW boot test case?

Not really.  Both Jan-Simon and myself have looked into it some, but as
you've seen, characterizing the Linux RNG behavior is not simple, and it
is not obvious that even a particularly convoluted test environment (i.e.
without passing a RNG via QEMU, trying to minimize I/O by avoiding disk
boot, etc.) can yield a simple yes/no without running a perhaps lengthy
test to that tries to quantify the RNG quality with an exhausted entropy
pool.

> Testing randomness is a little different as described in my notes below.
> If anyone has some expertise in this area, please help!
>
>
> There are a few tests in rng-tools, that could be wrapped in ptest:
> ❯ ls tests/
> Makefile.am  rngtestjitter.sh  rngtesturandom.sh  rngtestzero.sh
>
> I haven't played with rngtest much but I was wondering how we'd even construct
> a test of randomness that would *always* pass.
>
> The example below shows that if you run runtest with a blockcount of 10,000,
> and do that 10 times, you get failures some of the time:
>
> ❯ for i in `seq 10`; do cat /dev/urandom | rngtest -c 10000 --pipe 2>&1
> >/dev/null |rg failures; done
> rngtest: FIPS 140-2 failures: 6
> rngtest: FIPS 140-2 failures: 5
> rngtest: FIPS 140-2 failures: 9
> rngtest: FIPS 140-2 failures: 4
> rngtest: FIPS 140-2 failures: 6
> rngtest: FIPS 140-2 failures: 8
> rngtest: FIPS 140-2 failures: 9
> rngtest: FIPS 140-2 failures: 11
> rngtest: FIPS 140-2 failures: 9
> rngtest: FIPS 140-2 failures: 5
>
>
> We could say that we accept up to 20 failures but even then, there would be a
> chance that the YP AB would
> occasionally see that fail due the the inherit randomness being tested.
>
> If I run the test 1000 times  you can see that on my laptop (6.6.10), 20
> failures never happens:
> ❯ cut -d":" -f3 /tmp/rt.log | sort -n | uniq -c
>       3  1
>       7  2
>      34  3
>      54  4
>     101  5
>     131  6
>     138  7
>     124  8
>     114  9
>     101  10
>      75  11
>      48  12
>      36  13
>      16  14
>      10  15
>       6  16
>       1  17
>       1  19
>
> and on an older headless server running 5.15 with fewer process and likely
> less entropy available:
>       2  1
>      12  2
>      29  3
>      60  4
>      95  5
>     117  6
>     133  7
>     121  8
>     139  9
>      99  10
>      81  11
>      50  12
>      28  13
>      14  14
>       9  15
>       5  16
>       4  17
>       2  20
>
>
> I guess we could raise the limit to ~30 (42!) and failures would be extremely
> unlikely.

I have seen anecdotal statements that seeing significantly more than
10 failures from "rngtest -c 1000" is a sign of not enough entropy,
so booting with the QEMU RNG disabled and checking for <= 20 with a
single "rng-test -c 1000" is probably a test that is unlikely to fail.
That's perhaps true even without running rngd since booting from a
disk image is possibly likely to seed the entropy pool enough for it.
That's what I've seen here on the hardware platform's I have that do
not have a h/w RNG.  I did start looking at what the dieharder utility
measures (see https://webhome.phy.duke.edu/~rgb/General/dieharder.php),
but then we're well and truly outside of the realm of a simple ptest.

> We would have a similar problem with measuring the boot time that is dependent
> on the entropy pool not being depleted
> since we can't completely rule out a boot sequence taking 3x as long as the
> average time
> and it would be worse in qemu given that it's competing with other processes
> on the YP AB machines!

I suspect a useful boot time test is infeasible, especially with newer
kernels.  In addition to the non-blocking /dev/random changed in 5.10,
there was a significant redo of the entropy pool mixing scheme in 5.18.
Together, I suspect it's unlikely the entropy pool will be particularly
low on boot without going to significant lengths.  Overall, with modern
kernels the need for running rngd seems to now be more about handling a
quite significant demand for true random numbers in server usecases.
That does circle back around to whether it's worth keeping in oe-core or
not.  Since there still are < 5.10 LTS kernels that have EOLs in the
Scarthgap timeframe (e.g. 5.4 is Dec 2025), it does seem worth keeping it
for users potentially stuck with BSPs with those kernels.  If keeping it
absolutely requires a test, we'll likely have to try to experiment with
what behavior looks like when running inside QEMU on the AB per your
experiments...

> ../Randy "It's a good day because I made some graphs to understand a
> problem."  MacLeod

;)

Scott
---1463811583-630062803-1707837940=:4367--

