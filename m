Return-Path: <matt@madison.systems>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2AA78890
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 12:07:54 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id o145so3166063lff.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 04:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r43LzJxtgxAOZsSnUFrhrt6fF/To2QSDI+s6diRNqSM=;
	b=V0PgzS+TSnr3tQt4zO//RLVFEGaEMvKYJs6lzoJI+dTKBXS6Ao9vGwEvQqVjViZbhC
	EAxuOGbrDVwmUlZ+hBLSAb1KmLCocPSVC4N31ObZBQZp8KBlaSQg7AEJjyRLqMT7mMOO
	eGYbGo0Ar7g3Yhkz90bIWBBj07UcVkzU/2PKxNdkr6rCmi6WjdsDm0Rm9p3+MqdB851Z
	S6n0+7bEuF0btrRrWjeJjsioxlfzh/Wde7y7vo7z2xDi4xEj6BINnI2UNFkaclr2DvDI
	k79N3FFo5euRpSw0pT5eIr681TwHQtZCg3IKmYp9KJ2u0iH3Pa5niclMFfyEV2OHk1jM
	0I2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r43LzJxtgxAOZsSnUFrhrt6fF/To2QSDI+s6diRNqSM=;
	b=q1rVO5Q3NEKAvM4Rn2wOyugY69/LduKyuY9mVdQZRsMt0FsO85ZzUmX4WSjdM4z0hv
	/svDmC6s6ARxKFsktudrqd98JjtPM8GgrEpC1D/tLOSwVCO2psAvh8KMX9dMZLbSGApG
	l4/aSG3FyN8z7GpOcj1QcbfMK/ly2jPrj3MVhDqm4DsdBnfLR2g/Eqhrgz7kRPX7o22V
	4ERujllMkVWZr3oZnUqpKtyntQ/xGIds2GtbFT05A+yDdmksg207VgZowSi5iijetKSG
	FHGui2DsPxHKai/bkS0koW7Y4rr0iJLskOkrXxSvVJdHkHX7zpoqVfsaG4P/vitYjA9l
	P12w==
X-Gm-Message-State: APf1xPD+UaHWonAWqhsmL8h5l6uj0k3iKbTHR3TqL4k+Q7ESZSZwGaga
	/OQz3heH2LcYSJ1oxT/1ZVivYxnaJuz+iiJkG8zXwg==
X-Google-Smtp-Source: AG47ELsvoCOvM1ZyLRHLokwRsNFJkw6BfSF7GJY8JOSYd+lyq46F9nD5/9D4QntE1UdvbDHqCvHEDEL7XzcYFGGgcQc=
X-Received: by 10.25.81.141 with SMTP id g13mr12403519lfl.19.1519819675738;
	Wed, 28 Feb 2018 04:07:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.156.131 with HTTP; Wed, 28 Feb 2018 04:07:54 -0800 (PST)
In-Reply-To: <1519818245.3436.5.camel@linuxfoundation.org>
References: <20180227123634.2812-1-matt@madison.systems>
	<CAP9ODKpB38Kpfj3EUdGNM+dL_A0VM03mP0isV4Vg_0DZ8Jw14w@mail.gmail.com>
	<1519814861.3436.1.camel@linuxfoundation.org>
	<1519817857.3436.4.camel@linuxfoundation.org>
	<CAP9ODKox=QJKUuuvSGb7dRebKG17oFCUVOdQVNQ1vOfm5KxiZQ@mail.gmail.com>
	<1519818245.3436.5.camel@linuxfoundation.org>
From: Matt Madison <matt@madison.systems>
Date: Wed, 28 Feb 2018 04:07:54 -0800
Message-ID: <CAGgRHJrHZCTtg-wNMKJ7JqcwX27AY+C8a70ZKe5RQxt2Fca8Dg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/8] go1.10 update and misc improvements
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
X-List-Received-Date: Wed, 28 Feb 2018 12:07:55 -0000
Content-Type: text/plain; charset="UTF-8"

Looks like a multilib issue.  I'll fix it up and send out a v3.

Thanks,
-Matt

On Wed, Feb 28, 2018 at 3:44 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2018-02-28 at 08:42 -0300, Otavio Salvador wrote:
>> On Wed, Feb 28, 2018 at 8:37 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Wed, 2018-02-28 at 10:47 +0000, Richard Purdie wrote:
>> > >
>> > > On Tue, 2018-02-27 at 14:16 -0300, Otavio Salvador wrote:
>> > > > tested it in -next, one issue:
>> > >
>> > > FAIL: test_go_dep_build (gotoolchain.oeGoToolchainSelfTest)
>> > >
>> > > from https://autobuilder.yocto.io/builders/nightly-oe-selftest/bu
>> > > ilds
>> > > /8
>> > > 57/steps/Running%20oe-selftest/logs/stdio
>> > >
>> > > (can reproduce with oe-selftest -r
>> > > gotoolchain.oeGoToolchainSelfTest.test_go_dep_build)
>> > Also: https://autobuilder.yocto.io/builders/nightly-world-lsb/build
>> > s/791/steps/BuildImages/logs/stdio
>> >
>> >
>> > Summary: 6 tasks failed:
>> >   virtual:multilib:lib32:/home/pokybuild/yocto-autobuilder/yocto-
>> > worker/nightly-world-lsb/build/meta/recipes-extended/go-
>> > examples/go-helloworld_0.1.bb:do_compile
>> >   virtual:multilib:lib32:/home/pokybuild/yocto-autobuilder/yocto-
>> > worker/nightly-world-lsb/build/meta/recipes-
>> > devtools/glide/glide_0.13.1.bb:do_compile
>> >   virtual:multilib:lib32:/home/pokybuild/yocto-autobuilder/yocto-
>> > worker/nightly-world-lsb/build/meta/recipes-devtools/go/go-
>> > dep_0.4.1.bb:do_compile
>> >   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-
>> > lsb/build/meta/recipes-extended/go-examples/go-
>> > helloworld_0.1.bb:do_compile
>> >   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-
>> > lsb/build/meta/recipes-devtools/glide/glide_0.13.1.bb:do_compile
>> >   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-
>> > lsb/build/meta/recipes-devtools/go/go-dep_0.4.1.bb:do_compile
>> Just to confirm, was it using v2? I had problems with v1.
>
> Yes. Not sure it was just world-lsb and not world that failed...
>
> Cheers,
>
> Richard
>

