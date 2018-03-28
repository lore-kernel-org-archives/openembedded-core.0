Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 631E87847B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 12:01:13 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id z143-v6so3115794lff.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 05:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=adrnb1O83jTl7BaGFJ4PAmQTVtW0KSytylCEygQDc1c=;
	b=M8nec6ta+QPOpPp5OHNwSalhIwBKQoykhBJCq4lMvBGHcwUONo56rIVSYOIfvVudSd
	xa6AV9K1+yEE+KUhUJdsZCTc+hJyOoyib1Q1wvd7nL6fjS/8Ru78F/7MHCHwxGCVt++o
	UQ9PkoxCC1HCxLQCZys6FxnAsvSEpoJcAfylToGXfbQx6LgBDyOkh91mtulF4AwJta30
	OiI7AwN2HMLI8zpejmD6XKkgLVgN6F2FhdyppE9uEbE0n2z2glJUYsl+1kQ5ja3Xgip4
	+eRy+2sX5ovIsfgmSPxkbFgjpm65azgchmyLmFtmpK2a8PgTYykedKb1bcK4sgc4/6q7
	Dyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=adrnb1O83jTl7BaGFJ4PAmQTVtW0KSytylCEygQDc1c=;
	b=RnoJhFnWN8BeoMn7F6S9o2lSPgaDtu4RDBnrkVqlZ9uoBondRQWyboSIiPm/GWa1ru
	EnDkNiV58PVoIqMdtvr9Ynb7cdogdobVjBR0SCXhu/YC0WRNjV+wYEKeBNW/2vCqqEGK
	s+nHYqHBCIkOkFBaC/abwaCPATMNvahKiNJpnfuDoWY5RBJ5EtVcdclBLPkRfe9uisCr
	S/xSZaVo0gIvj5wAadllMiBbGh0W833ZiXuHTlF76x/uoP/Mxyq8Htit7Lp1QF1EDoJo
	+ps+SsFzfXP8lbYOCf1r1MQaVl+n1zC4OM6k3jbJ3uWNNVhU84yz/SGfu3n9FAl5OUr8
	XAzA==
X-Gm-Message-State: AElRT7GEJy9RFNm8zHLgFL2QyCFEj/tBriAga8JABPYNBh/kgtIltZsu
	m8VDUdJh8EcC2lNsrYAdDJDvzncFgqNHMS2zDL8=
X-Google-Smtp-Source: AIpwx49TcsXnDhEIYnvOa/2jv7qJxQRRIiHqFRlAdCnbZjadqiatijqNhXMLWtUeSkjqOky9gb7luAIITLg53FFx8Gc=
X-Received: by 10.46.83.71 with SMTP id t7mr2329170ljd.129.1522238473803; Wed,
	28 Mar 2018 05:01:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Wed, 28 Mar 2018 05:01:13 -0700 (PDT)
In-Reply-To: <CAJTo0La+oWebhkQXgFvY2yMQdwZzQ=ENbnyx0=5=MuvDiEBqew@mail.gmail.com>
References: <cover.1522162765.git.bruce.ashfield@windriver.com>
	<CAJTo0Lbv_7wXs1mgoqtBc6zWN_bazjwYpc1FbLzT3-zqUnNUHg@mail.gmail.com>
	<CAJTo0La+oWebhkQXgFvY2yMQdwZzQ=ENbnyx0=5=MuvDiEBqew@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 28 Mar 2018 08:01:13 -0400
Message-ID: <CADkTA4N2cEtJBZTn+Lo7ZvFPRU3Um1oy+R4DXRQmWR5FF-KnTw@mail.gmail.com>
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
X-List-Received-Date: Wed, 28 Mar 2018 12:01:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 28, 2018 at 6:33 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Also a non-musl target failed like this:
>
> | NOTE: FAIL [6.426s]: test_kernel_module (kernelmodule.KernelModuleTest)
> | NOTE: ----------------------------------------------------------------------
> | NOTE: Traceback (most recent call last):
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
> line 32, in wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
> line 32, in wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
> line 32, in wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta/lib/oeqa/runtime/cases/kernelmodule.py",
> line 40, in test_kernel_module
> |     self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
> | AssertionError: 2 != 0 : cd /tmp && make
> | make -C /usr/src/kernel M=/tmp modules
> | make[1]: Entering directory '/usr/src/kernel'
> | make[2]: *** No rule to make target 'tools/objtool/objtool', needed
> by '/tmp/hellomod.o'.  Stop.
> | make[1]: Leaving directory '/usr/src/kernel'
> | make[1]: *** [Makefile:1519: _module_/tmp] Error 2
> | make: *** [Makefile:5: all] Error 2
>
> Same error but with glibc instead of musl.

That's the annoying new dependency kicking in, it keeps sneaking back
with -stable updates
and it is maddening.

What kernel version is this 4.14 ? If so, I'll need to add the
dependency lines from the 4.15
to 4.14 as well .. after just doing that for 4.12.

Bruce

>
> Ross
>
> On 28 March 2018 at 11:31, Burton, Ross <ross.burton@intel.com> wrote:
>> I think it was this pull but musl builds are now failing like this in selftest:
>>
>> | NOTE: FAIL: test_kernel_module (kernelmodule.KernelModuleTest)
>> | NOTE: ----------------------------------------------------------------------
>> | NOTE: Traceback (most recent call last):
>> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
>> line 32, in wrapped_f
>> |     return func(*args, **kwargs)
>> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
>> line 32, in wrapped_f
>> |     return func(*args, **kwargs)
>> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
>> line 32, in wrapped_f
>> |     return func(*args, **kwargs)
>> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/meta/lib/oeqa/runtime/cases/kernelmodule.py",
>> line 40, in test_kernel_module
>> |     self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
>> | AssertionError: 2 != 0 : cd /tmp && make
>> | make -C /usr/src/kernel M=/tmp modules
>> | make[1]: Entering directory '/usr/src/kernel'
>> | getconf: LFS_CFLAGS: unknown variable
>> | getconf: LFS_LDFLAGS: unknown variable
>> | getconf: LFS_LIBS: unknown variable
>> | make[2]: *** No rule to make target 'tools/objtool/objtool', needed
>> by '/tmp/hellomod.o'.  Stop.
>> | make[1]: Leaving directory '/usr/src/kernel'
>> | make[1]: *** [Makefile:1519: _module_/tmp] Error 2
>> | make: *** [Makefile:5: all] Error 2
>>
>> Ross
>>
>> On 27 March 2018 at 16:03, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
>>> Hi all,
>>>
>>> This pull request is a series of -stable updates (more Spectre/meltdown
>>> included), and some fixes for the fsl_mpc h/w reference board that will
>>> allow us to update the reference to v4.14+.
>>>
>>> We also have a configuration tweak to the wifi fragments, which will
>>> result in more reuse, but won't impact the default configurations.
>>>
>>> Note: I haven't included the re-written kernel-devsrc changes, since
>>> I've never been able to reproduce the multilib issue with the ssl
>>> dependency. The devsrc changes will have to be looked at after the
>>> release.
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>> The following changes since commit 80c7ca2c28959d08a59d960d318d8360392bd488:
>>>
>>>   kernel-dev: Clean up of "bsp_name" placeholder. (2018-03-25 09:41:13 +0100)
>>>
>>> are available in the git repository at:
>>>
>>>   git://git.pokylinux.org/poky-contrib zedd/kernel
>>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>>>
>>> Bruce Ashfield (7):
>>>   linux-yocto/4.12: update to v4.12.21
>>>   mpc8315e-rdb: fix broken ethernet
>>>   linux-yocto/4.12: add ssl and utils native dependencies
>>>   linux-yocto/meta: improve wifi driver granularity
>>>   linux-yocto/4.12: intel-socfpga, intel-pmc-core and ish support for
>>>     CoffeeLake board
>>>   linux-yocto/4.14: update to v4.14.30
>>>   linux-yocto/4.15: update to v4.15.13
>>>
>>>  meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
>>>  meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
>>>  meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  6 +++---
>>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
>>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
>>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  6 +++---
>>>  meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 22 ++++++++++++----------
>>>  meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
>>>  meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 20 ++++++++++----------
>>>  9 files changed, 50 insertions(+), 48 deletions(-)
>>>
>>> --
>>> 2.5.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

