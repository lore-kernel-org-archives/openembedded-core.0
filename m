Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF836AC00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 23:53:55 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id 14so7704939ljj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 16:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QDAl2T6zIfhzm2RDyAUgHtl4Hp9ujiHk8Jgs7b0QNu4=;
	b=qZiOa1j6sb+u+V+7xTx5OGTNADkQhlS1sUUw2J7VPP1CmX4eB+jvVY6s8D1aafq9XO
	1FziT4gqn1Owv0+4cUYiUs/tg7jBMWObIIwXOwSfjZogXKNw9QzyQJ8G/fD8z6RVXBPA
	7+qGMg8otkPJCo015v2gpLimK9hFK8WzH4UKY/YkoSoWhm2a2KgF5PIpUjoND2UAGVdW
	x2B5/Mt9koixzZrGxJSEwdgD2kSHzmzZYVZ3u+7JIaYN8JWJ54a/PChhHDRkQnB66Jq0
	NGxN0SDHKA25ZA79UwlJLeLYDNmHh+xNghPbepMsfduE7bROjI9XW7qw249RipV9TlJV
	tU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QDAl2T6zIfhzm2RDyAUgHtl4Hp9ujiHk8Jgs7b0QNu4=;
	b=HSS5+9MjfbANa2UTFlOrgZBK9IbQa7/r3sZ6RCKQzoBp15+PPVoao+nhk3EIlFGhO9
	cvkwcNzKJ9QEHLNUSers0jpnIOXm3qYsoS5WBNsJGMorIHwCu8IEULq4frkgKHCIW1tE
	L1aBSUjmRy81JV3Cp34MBoTfH2nznxORhS7HKLyfHb20h3y4r5s1b5teh/CCT8423P5H
	01cnw3+1wFL8wg7065xzZ45avaWBmYgxd+Ya1wBj9L7h0tbz03FBzGV+mzol/pe9CRj5
	L7va2eRw7zKSeRGvyMrddyS78UkSAFECAcp3iYOdYCAqDpjnB0f9mCD6eiio1cZtd77J
	p1WQ==
X-Gm-Message-State: APjAAAX7C+fo1cI7AA7pbNRTiTA8I3seYhA0/ef15DmyynMD19mkX7ft
	Aq2G2n+mUxcy2MhtQB1Z0KlrT3C3WY3Q/A9fq7M=
X-Google-Smtp-Source: APXvYqwKr80YvTQVAaoefjjUoqqeGC9HUcI0zvqUlDXWErfg36fZkDu/ZbQGZod/mIxFEAx+QnkQYyYIJlqiz9/o6IQ=
X-Received: by 2002:a2e:2b81:: with SMTP id r1mr27588329ljr.138.1558137235871; 
	Fri, 17 May 2019 16:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190513225205.14791-1-alistair.francis@wdc.com>
	<d2813cd316e8c8574f532727cb464d2a6e0bd796.camel@linuxfoundation.org>
	<a0e0cda1-dd25-5347-fcc2-c01a5de3cc04@windriver.com>
In-Reply-To: <a0e0cda1-dd25-5347-fcc2-c01a5de3cc04@windriver.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 May 2019 16:51:42 -0700
Message-ID: <CAKmqyKN4LiW2aS76+19-0oJV1AJJyaaxh1UbpSjZ2PWSccKjDg@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb: Upgrade from 8.2.1 to 8.3
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
X-List-Received-Date: Fri, 17 May 2019 23:53:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 14, 2019 at 11:24 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 5/14/19 1:36 PM, Richard Purdie wrote:
> > On Mon, 2019-05-13 at 22:53 +0000, Alistair Francis wrote:
> >> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >> ---
> >> If there are issues with the patch the branch is avaliable here:
> >> https://github.com/alistair23/openembedded-core/tree/alistair/gdb-8.3
> >
> > Seems there is a problem in oe-selftest:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/174/steps/7/logs/step2d
> >
> > "oe-selftest -r package.PackageTests.test_gdb_hardlink_debug" should
> > reproduce and it seemed to happen on more than one host.
>
> I have some off-list notes, show below, for a bug that I haven't
> gotten to yet.
>
> Alistair,
>
> Could you adjust the oeqa match criteria based on the info below?
>
> ../Randy
>
>
> The oe-selftest:
>     https://bugzilla.yoctoproject.org/show_bug.cgi?id=13123
> is failing because the check at:
>     meta/lib/oeqa/selftest/cases/package.py:
>                 elif "Breakpoint 1, main () at hello.c:4" in l:
> is too precise. (This wasn't obvious to me for quite a
> while based on the defect report!)
>
> Anyway, at times, the test would pass for me other times
> it would not as you may have noticed. For interactive tests, gdb
> always functions properly but the breakpoint doesn't always
> result in the *exact* string:
>     "Breakpoint 1, main () at hello.c:4"
> sometimes (with glibc-dev, iirc) it's:
>     "Breakpoint 1, 0x0804905e in main () at hello.c:4"
> and sometimes it's just:
>     "Breakpoint 1, 0x0804905e: file hello.c, line 4"
>
> so unless Khem or someone knows how to ensure
> 100% consistent behaviour, perhaps we should search for:
>
>     "Breakpoint 1, .* hello.c.*4"   ( I'm not sure of the proper regex.)
> since that will confirm that a breakpoint was hit at the proper file/line.

I am unable to reproduce the failure, so I can't check if this is the
correct fix. I'm going to send a v2 with your fix and hopefully that
fixes the autobuilder failures.

Alistair

>
> >
> > Cheers,
> >
> > Richard
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

