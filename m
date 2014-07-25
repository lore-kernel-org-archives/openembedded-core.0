Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9A22F65CAD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 03:44:19 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gl10so2578699lab.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 20:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QtIp3ZJxSYglGoE2zzO1x9YbCZmStdABOX/eqyd2lII=;
	b=HSGR1tMpmYETv6ZaIld1PrY7rapuswoXk7pV+TarT/PhmbTgIUmF8QUHmqfV2l+fHW
	EZ4AbkTNIpJcwWowmbAtiJZIKVFnGLI2SlW1rnoxj5WNIzwOMdIKerXfAab8gcBcp7Yh
	xfVNAiGTrk5JtygiHhdhhuxgg5c3QxzqkRnQIKIaXlSr0xFkwfl73msARp8Fi9L7IUFW
	VE1sW69UXVtBR3eXmc6z6a8EEtU6onT0S0JPKQcp4wrw/ZJQ7l7cgANWIApHDyGy9asY
	wxFqfXmggQh0+ndyoAibhCASRTpZxYmuEpsjx6jCaimMWT4wLj0iCehEIcEJAOApBQw9
	zH1g==
MIME-Version: 1.0
X-Received: by 10.152.29.137 with SMTP id k9mr13398521lah.27.1406259859871;
	Thu, 24 Jul 2014 20:44:19 -0700 (PDT)
Received: by 10.112.124.137 with HTTP; Thu, 24 Jul 2014 20:44:19 -0700 (PDT)
In-Reply-To: <53D1D0A6.6050201@windriver.com>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
	<a2203c27a84c25e8e62fde8b24e5c829ca212fe2.1406234258.git.bruce.ashfield@windriver.com>
	<53D1D077.5020009@linux.intel.com> <53D1D0A6.6050201@windriver.com>
Date: Thu, 24 Jul 2014 23:44:19 -0400
Message-ID: <CADkTA4P99e=wNjs1a+t3NPH1upKHyFZqGep4wrtQvVVkO-TL9g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Saul Wold <sgw@linux.intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] linux-yocto-dev: bump to v3.16+
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
X-List-Received-Date: Fri, 25 Jul 2014 03:44:27 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 24, 2014 at 11:36 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 2014-07-24, 11:35 PM, Saul Wold wrote:
>>
>> On 07/24/2014 01:41 PM, Bruce Ashfield wrote:
>>>
>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>> ---
>>>   meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb
>>> b/meta/recipes-kernel/linux/linux-yocto-dev.bb
>>> index 9b49eee87651..10f3d234ed25 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
>>> @@ -36,7 +36,7 @@ SRC_URI =
>>> "git://git.yoctoproject.org/linux-yocto-dev.git;bareclone=1;branch=${K
>>>   SRCREV_machine ?=
>>> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
>>> "linux-yocto-dev", "${AUTOREV}",
>>> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>>>   SRCREV_meta ?=
>>> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
>>> "linux-yocto-dev", "${AUTOREV}",
>>> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>>>
>>> -LINUX_VERSION ?= "3.14+"
>>> +LINUX_VERSION ?= "3.16+"
>>>   LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
>>>   PV = "${LINUX_VERSION}+git${SRCPV}"
>>>
>>>
>>
>> So far the Autobuilder has found 1 issue with this and the x32 build
>>
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/182/steps/BuildImages/logs/stdio
>>
>
> Adding Tom, Darren and Nitin .. since this is something they need to handle

I retract my overly quick analysis.

I dropped this by mistake in 3.14, and didn't make the same change in my master
meta data repository .. hence it also dropped in 3.16. I've restored
this in both
locations now.

Bruce

>
> Bruce
>
>
>>
>> I will send more failures as I see them.
>>
>> Sau!
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

