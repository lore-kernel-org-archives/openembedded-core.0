Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 597747E9FE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 14:13:02 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id h6so37363928ioh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 07:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=jVtATduFzbKQaNywZ4LjxLTawrZeqFWP/AtSS0i+3Es=;
	b=c74A3ubzMzT4Bb3RAehJaOnBgbQ9AhIkkrIbVbH5mbA3AmyU4EZWknC24avbIwgKTn
	Ise1XIDBqFaLgJ6CzlyjOwjOPRkRlh+5FI289C6g/xx25CERccW+PIs+tXADj1JTGfsu
	+md6Xl93PO9rgk6NM8kdC1rqL/QZX31Y7cqZ0OkupJpTo6QYDQ6KZ3D9qGQm0iKgjOrQ
	+MvLszEW2LcT+R9f/fuPYEqkpK8Awv3cqMgG779OBzczj2TBFSZOLZJ5cyIf6KXWxZYa
	/sjJ4C1/QWKRMtjWv19w1in01tQw2Q66kO+U6hsCfHQVEWfaNH0NtdzDGDSBKRp+PFNE
	uSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=jVtATduFzbKQaNywZ4LjxLTawrZeqFWP/AtSS0i+3Es=;
	b=AmyG51GdUHNe+frlYMk26tPFR9mjwGrASZyWaiWkRyL+BLa6Tx/caIeAKTcIk5Syl8
	JsHVBtl9Pj8esWeDajEddjRGOWc2GOFco+kFaQj7hXYB6AtS9RaS77l5MabPjIvYGfzG
	rgDWEJmOwuk2wVgk9+ILY0jOsRqw3Ce9IMNTCCtmvoOuu7li0xH6zDPrLiwioDJF0sqt
	duXBBIguJ6JTqVAPKpBFs8mc4Ng+UpTJEOjfMdi27GziouLfz+PL9bpczQAhbd1iYe8+
	l26jrcZ+0dZVLKYoi/IlKPLLiIW/c8P4bmV6UFe3tGeNIdqaWZYP23/3lZKePAklOcPz
	mGSw==
X-Gm-Message-State: APjAAAUppnd11pGmARTY3/ynJQuqvpmWC74xNRwmdGzK6xfZK1NfEyZI
	32GrOtXa58WYnDJCbjwgvVS/c9Yu
X-Google-Smtp-Source: APXvYqyHQY8lNy97HtXY11HeTSKksj14RGtpwZLDPzm+fgyMUJuL0gHcIluZYvlpmz8zrGpN9B/n+A==
X-Received: by 2002:a6b:2c8:: with SMTP id 191mr18896181ioc.191.1562076782846; 
	Tue, 02 Jul 2019 07:13:02 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	k2sm11884445iom.50.2019.07.02.07.13.01
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Jul 2019 07:13:02 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Adrian Bunk <bunk@stusta.de>
References: <ba3936e9-0582-4187-89d7-0a8f1dd4c550@gmail.com>
	<20190702132640.GA11644@localhost>
Message-ID: <88e4513f-1acd-eec8-5739-33a679471c06@gmail.com>
Date: Tue, 2 Jul 2019 09:13:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190702132640.GA11644@localhost>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: The state of reproducible Builds
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
X-List-Received-Date: Tue, 02 Jul 2019 14:13:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/2/19 8:26 AM, Adrian Bunk wrote:
> On Mon, Jul 01, 2019 at 10:58:04AM -0500, Joshua Watt wrote:
>> ...
>> 1. HOSTTOOLS differences. There are a lot of tools listed in HOSTTOOLS, and
>> unfortunately some of them have version dependent output and are used for
>> target builds (the one I've currently stumbled upon is pod2man, but I'm sure
>> there are others). Unfortunately, one could probably argue that HOSTTOOLS is
>> somewhat antithetical to the above statement, at least in regard to target
>> builds. Any host tool output that "leaks" into the target build output can
>> result in a non-reproducible build across hosts, and possibly should be
>> avoided; the alternative is to use (or mandate) the corresponding -native
>> recipe that provides that tool as a DEPENDS so that the controlled
>> internally built version is used instead. Note that this only really applies
>> target builds, not -native (or nativesdk right now). -native recipes would
>> obviously need more HOSTTOOLS to help bootstrap the system. I suspect this
>> would require reworking how HOSTOOLS works so that they can be split into
>> two categories somehow; the tools that have "ubiquitous and stable"
>> interfaces and are fine for all recipes (e.g. cat, sed, true, rm, etc.) and
>> those that are variable and should only be used for -native builds (e.g.
>> pod2man, rpcgen(?), chrpath(?), tar(?)... others?). Anyone have thoughts on
>> this?
>> ...
> What is the goal?
>
> 1. being able to prove that a given binary has actually been
>     built from the correct sources, or
> 2. builds on all hosts have the same output
I'm not sure there is just one goal...
> With 1. you can just record all host properties like installed packages
> and running kernel, and it isn't a problem if different hosts result in
> different output.

Right... I know that my employer would really like this sort of binary 
reproducibility; that is we should be able to pull some archived code 
out of our salt mine, build it, and know its the same binary that our 
customers have. I think if you combine what we have today and some sort 
of reproducible host image (archived Docker container, virtual machine, 
et al.) we are pretty close to that


>
> With 2. any kind of differences due to host differences is a problem.
> You need -native for nearly everything, and then fix all other kinds of
> differences like the version of the running kernel recorded somewhere.

Yes. I would hope that after using mostly -native tools where 
applicable, the currently running kernel wouldn't figure into the build 
of target packages... if it does I would venture to say that is a 
cross-compiling/reproducibility bug in the package.

Also, to be clear, I'm hoping we don't need to go so far as to say that 
-native recipes need to necessarily be reproducible; as long as they 
always generate reproducible output regardless of which host they were 
built on I suspect they don't need to be.

>
> For detecting malicous binaries not built from the claimed sources 1. is
> sufficient. For distributions like Debian that build natively this is
> even the only option available since the host compiler is used.
>
> Doing 2. would of course be more desirable, but it can also be done in
> a second step after all issues related to building on exactly the same
> host have been sorted out.

I think there are also other use cases for #2 besides detecting 
malicious binaries/source code, such as hash equivalence, or even being 
able use sstate when making a reproducible build. You are correct that 
this can be done in a second step, but I think that everyone needs to be 
aware of the limitations that will present when #2 is not present (the 
main one being that you probably can't make a reproducible build if you 
use sstate).

>
>> Joshua Watt
>> ...
> cu
> Adrian
>

