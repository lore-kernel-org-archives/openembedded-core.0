Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id A54B37843C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 12:08:01 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id r30-v6so2364483otr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 05:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MlpyvVlwdLfOP/jE77/Q1bGdVnkd5I9QQtTE/hE4DhY=;
	b=SKCL3W6BU/oP051m+eIo6diTRNvgLPfKqA/5F+LtGpyFRoNC58KkoHGXWJPzn/9Ofj
	eU79nmaHavxANiLgIP3yjdyjsHWOuSgAeAqSVPcSCJ+22xRYWi94dnqmNC74rZYUuLO2
	K9X6IxDXgcFm3ZarUloeXX2Beq1DuosgClum2RiA1l23VswwUdtQHAhOHoRGwe+scOXu
	B5iRWKZ3cK80KHcHCea2CIrGv+CVFGFb+X5sn+sFvQCuo5C7hMmZjPwmtjqp9qF2ehn+
	zbY+5shBVQNRR2Z4l+1s2qWTEggEW3M7pgmW3Og/THZ3ZQb8DDDd7Taoy2p2UfU0kQg1
	e9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MlpyvVlwdLfOP/jE77/Q1bGdVnkd5I9QQtTE/hE4DhY=;
	b=SIYDKSdX33dfhI+a5utwQ0r+dg81YgDW5X7zA4E2zDCD8TSFdvtVpm+tJrl6ogg8cn
	58x52AYgEGu5Oy2rAWZSPXGDM4ApIWbgz5wxRKbmJl0DIe1cVJ3inrX0sui4je1SCqsx
	hcEe3MV3cmHKfKiGn20SApx9oZ30Gwc2k4I0DcFT08qCK53BQaCzaXo4mDytIuspT9Xi
	mXy0753ZID/5EcBq2pRSn21UBkbRuCbYd3Fk9PrKBp9Xr5FTUhfUySKa7cFpPf6kY+Cx
	HBmvHASqYOIfxKDhgzT5FOhtuoBtDez9j/DEoat5dcHsw1W03VTQFIakcrI5uzs2j4+u
	2RgQ==
X-Gm-Message-State: AElRT7EJAd2bvnDFhkbX9AgM585Av/P4KChUcmmtvhq9IkdsSUz6MjYT
	bGdOjbah7Xf0hMlrXR/7iQGN54keOa/JpuADu+TJ6A==
X-Google-Smtp-Source: AIpwx4+3+Sc6e7YhMmNjSEFb8Hvr5wnX+vgSTn60QOuWFNoL3Xo+cdbKelGN+2Xhlo5QncrPbdKt7ZBoDZwOEzU0WeU=
X-Received: by 2002:a9d:154c:: with SMTP id
	z12-v6mr2133053otz.65.1522238882517; 
	Wed, 28 Mar 2018 05:08:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Wed, 28 Mar 2018 05:07:41 -0700 (PDT)
In-Reply-To: <CADkTA4N2cEtJBZTn+Lo7ZvFPRU3Um1oy+R4DXRQmWR5FF-KnTw@mail.gmail.com>
References: <cover.1522162765.git.bruce.ashfield@windriver.com>
	<CAJTo0Lbv_7wXs1mgoqtBc6zWN_bazjwYpc1FbLzT3-zqUnNUHg@mail.gmail.com>
	<CAJTo0La+oWebhkQXgFvY2yMQdwZzQ=ENbnyx0=5=MuvDiEBqew@mail.gmail.com>
	<CADkTA4N2cEtJBZTn+Lo7ZvFPRU3Um1oy+R4DXRQmWR5FF-KnTw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Mar 2018 13:07:41 +0100
Message-ID: <CAJTo0LbfVW3_hM5z_bZvFn5bk2tr5ed4h0r6kO8o0g9D351kTA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Wed, 28 Mar 2018 12:08:01 -0000
Content-Type: text/plain; charset="UTF-8"

On 28 March 2018 at 13:01, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> On Wed, Mar 28, 2018 at 6:33 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> Also a non-musl target failed like this:
>>
>> | NOTE: FAIL [6.426s]: test_kernel_module (kernelmodule.KernelModuleTest)
>> | NOTE: ----------------------------------------------------------------------
>> | NOTE: Traceback (most recent call last):
>> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
>> line 32, in wrapped_f
>> |     return func(*args, **kwargs)
>> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
>> line 32, in wrapped_f
>> |     return func(*args, **kwargs)
>> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
>> line 32, in wrapped_f
>> |     return func(*args, **kwargs)
>> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta/lib/oeqa/runtime/cases/kernelmodule.py",
>> line 40, in test_kernel_module
>> |     self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
>> | AssertionError: 2 != 0 : cd /tmp && make
>> | make -C /usr/src/kernel M=/tmp modules
>> | make[1]: Entering directory '/usr/src/kernel'
>> | make[2]: *** No rule to make target 'tools/objtool/objtool', needed
>> by '/tmp/hellomod.o'.  Stop.
>> | make[1]: Leaving directory '/usr/src/kernel'
>> | make[1]: *** [Makefile:1519: _module_/tmp] Error 2
>> | make: *** [Makefile:5: all] Error 2
>>
>> Same error but with glibc instead of musl.
>
> That's the annoying new dependency kicking in, it keeps sneaking back
> with -stable updates
> and it is maddening.
>
> What kernel version is this 4.14 ? If so, I'll need to add the
> dependency lines from the 4.15
> to 4.14 as well .. after just doing that for 4.12.

Yes, 4.13.30 on x86-64 only, interestingly.  Not sure if that's the
test matrix being odd, or the kernel.

Ross

