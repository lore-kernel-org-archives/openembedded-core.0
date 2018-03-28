Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id C8D61785A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 12:57:09 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id c78-v6so3378502lfh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 05:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OlYbGJZgXoCmp1Pco67dDm5yANLCjkwniGVqQN9BCIE=;
	b=nNAlb+3f+3otjNnArPM6o80s97GOP9p3iR6nX9lqJdspkPsmp54ieA9dC1CYlE53K0
	eM7cIiOR/Ng7U9PjD168/ASbvEE4VEcaQGXztWufBAUWX3NCvzedtCSifzXrhQOWNiSy
	SyoWZg1jeOebcq6sapqJIE+YTImOKGmHf13fC/C4s/CxLM6GNwj+3TGRX3rYQrHr4Bzu
	swzsaUOa6aEzwY1U/slPZiy06+bIov7NRVc7ljuxobstYY6MrDcbm5D8un6ffji8G66S
	K8Ei9VhFM9tBE6gyThID8t+BCMXPPEvzOKZpjkEWSwYjD8j7LPdg1PLJueeY8UPKEIlD
	7GvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OlYbGJZgXoCmp1Pco67dDm5yANLCjkwniGVqQN9BCIE=;
	b=awpQ/101bnHXIr8Tmc6KO9boYMFyEQsBriv1Tmh6LrfQMi77P8wZ0hHZGdaG2eRacA
	a4XCxktMLVSvUJ+DHEOdCwhToATfIHJJmwF2HSezlQhPQqIJN5Bs40EPrayzqoNHpaqs
	asUwSjg2LSZk7RQ5hpq2OpHrYF8r4+BgYD7vEwdIcW/hcct0cKQoBXqDryB0xn9RX9HE
	TL/JuhBIPMgH8dOe4LyhijRl4WKbPWC6hKo2GEm2m5VFlK3bvyDFIq2/GNNnW+HSAhiq
	FgsKsDMM+GTwYVByqTJ/YeIbM1rfkEz+j6dw7ujVBOpCC7rLC9BgsKXXMAzahAHLsa/A
	bItQ==
X-Gm-Message-State: AElRT7FnRqWPtv9p/TM6vztueWVEewHEjLWb+aiCXxjORfEBMwFOH1ZM
	pozBdb4AniCyeq4p8f+5y8w2dSEN6fZq2v/iqgE=
X-Google-Smtp-Source: AIpwx4+Z0Y9sqxy1BZANKiYie6RLHcPzwy1siwqUvH6x+esz4E5DocXd28J0HoG5BArNI8pzR/mO0aDgXDmokTL/ZLY=
X-Received: by 2002:a19:511d:: with SMTP id
	f29-v6mr2304733lfb.39.1522241830063; 
	Wed, 28 Mar 2018 05:57:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Wed, 28 Mar 2018 05:57:09 -0700 (PDT)
In-Reply-To: <CAJTo0LbfVW3_hM5z_bZvFn5bk2tr5ed4h0r6kO8o0g9D351kTA@mail.gmail.com>
References: <cover.1522162765.git.bruce.ashfield@windriver.com>
	<CAJTo0Lbv_7wXs1mgoqtBc6zWN_bazjwYpc1FbLzT3-zqUnNUHg@mail.gmail.com>
	<CAJTo0La+oWebhkQXgFvY2yMQdwZzQ=ENbnyx0=5=MuvDiEBqew@mail.gmail.com>
	<CADkTA4N2cEtJBZTn+Lo7ZvFPRU3Um1oy+R4DXRQmWR5FF-KnTw@mail.gmail.com>
	<CAJTo0LbfVW3_hM5z_bZvFn5bk2tr5ed4h0r6kO8o0g9D351kTA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 28 Mar 2018 08:57:09 -0400
Message-ID: <CADkTA4OMuxYLmLN83OUkBoMDy7G00G2iFsUgBbok1V_7Me62Qg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 28 Mar 2018 12:57:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 28, 2018 at 8:07 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 28 March 2018 at 13:01, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>> On Wed, Mar 28, 2018 at 6:33 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>> Also a non-musl target failed like this:
>>>
>>> | NOTE: FAIL [6.426s]: test_kernel_module (kernelmodule.KernelModuleTest)
>>> | NOTE: ----------------------------------------------------------------------
>>> | NOTE: Traceback (most recent call last):
>>> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
>>> line 32, in wrapped_f
>>> |     return func(*args, **kwargs)
>>> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
>>> line 32, in wrapped_f
>>> |     return func(*args, **kwargs)
>>> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
>>> line 32, in wrapped_f
>>> |     return func(*args, **kwargs)
>>> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta/lib/oeqa/runtime/cases/kernelmodule.py",
>>> line 40, in test_kernel_module
>>> |     self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
>>> | AssertionError: 2 != 0 : cd /tmp && make
>>> | make -C /usr/src/kernel M=/tmp modules
>>> | make[1]: Entering directory '/usr/src/kernel'
>>> | make[2]: *** No rule to make target 'tools/objtool/objtool', needed
>>> by '/tmp/hellomod.o'.  Stop.
>>> | make[1]: Leaving directory '/usr/src/kernel'
>>> | make[1]: *** [Makefile:1519: _module_/tmp] Error 2
>>> | make: *** [Makefile:5: all] Error 2
>>>
>>> Same error but with glibc instead of musl.
>>
>> That's the annoying new dependency kicking in, it keeps sneaking back
>> with -stable updates
>> and it is maddening.
>>
>> What kernel version is this 4.14 ? If so, I'll need to add the
>> dependency lines from the 4.15
>> to 4.14 as well .. after just doing that for 4.12.
>
> Yes, 4.13.30 on x86-64 only, interestingly.  Not sure if that's the
> test matrix being odd, or the kernel.

Nope. That's what I expected, for the 4.14+ kernels, I had to add:

DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"

And it has now come back to the -stable kernel to haunt me.

I'll send another patch to add the dependency, and we should be good. If it
doesn't fix the problem, then 4.15 should be blowing up in the same way.

Bruce

>
> Ross



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

