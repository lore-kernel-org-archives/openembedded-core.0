Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id C6EBD70688
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 13:36:12 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id e16so3021971lan.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 06:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bqoqoNTz9zFWdV2Obvc0Ck3JRvy7hLHYHWjKyfXVHX0=;
	b=FmUnlIkoY5Y5sx/4yJLP+wxrXNfT2ddpepd8cjpU/MrSNMIzc4h+PjKZ8QYkGp6J5V
	cd1r1VAOk2mNSaIstRl0Hg/vz1O1q+Obb4vXJ1B1rGits7pX2suAupAQh1selpvjcMWM
	gI1sWI83GWSde0SjlmGOPpeCGfWOot5AVK8Ay+0SjVLMSYVP32BLlfMU2HKGtvAM3iNZ
	W6JwUG5nXWiYhJCH9Ib9+hJC7I5U/FLEUGohR0jvNnejcLyBRBpY0DxXIjLnrOm3xguF
	UrChd6SIaJySVPnGrNFDnhcmJ8I+x4A0bJEDP/VR24+KLk1cJtnbdmEioo9FbUmlQQR6
	BWyw==
MIME-Version: 1.0
X-Received: by 10.112.132.39 with SMTP id or7mr15504437lbb.45.1406295373006;
	Fri, 25 Jul 2014 06:36:13 -0700 (PDT)
Received: by 10.112.124.137 with HTTP; Fri, 25 Jul 2014 06:36:12 -0700 (PDT)
In-Reply-To: <CADkTA4PP26gr6PozfYFM3Z6-FB2g+EUsUGXQQ46VCjd6xkG4qA@mail.gmail.com>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
	<48ca1900cd8400421948c4a2c33c722b979f3292.1406234258.git.bruce.ashfield@windriver.com>
	<20140725132158.GU2492@jama>
	<CADkTA4PP26gr6PozfYFM3Z6-FB2g+EUsUGXQQ46VCjd6xkG4qA@mail.gmail.com>
Date: Fri, 25 Jul 2014 09:36:12 -0400
Message-ID: <CADkTA4OG_ddsMBzo54kH_FXRo7bNCL+ZQsTHBhdVcYrBLDGX1Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] lttng-modules: update to 2.5.0
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
X-List-Received-Date: Fri, 25 Jul 2014 13:36:20 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 25, 2014 at 9:23 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Fri, Jul 25, 2014 at 9:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Thu, Jul 24, 2014 at 04:41:48PM -0400, Bruce Ashfield wrote:
>>> During the uprev of the yocto kernel to 3.16, lttng-modules failed to build.
>>> To grab the latest stable content, we update to 2.5.0, and add two patches
>>> to also make it build against 3.16+.
>>>
>>> We also drop the older 2.3.3 lttng-modules, since it is no longer required
>>> to support ARM builds.
>>>
>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>> ---
>>>  ...compaction-instrumentation-to-3.16-kernel.patch | 83 ++++++++++++++++++++++
>>>  ...ate-vmscan-instrumentation-to-3.16-kernel.patch | 70 ++++++++++++++++++
>>>  meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb   | 36 ----------
>>>  ...tng-modules_2.4.1.bb => lttng-modules_2.5.0.bb} |  7 +-
>>>  4 files changed, 157 insertions(+), 39 deletions(-)
>>>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-compaction-instrumentation-to-3.16-kernel.patch
>>>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-vmscan-instrumentation-to-3.16-kernel.patch
>>>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
>>>  rename meta/recipes-kernel/lttng/{lttng-modules_2.4.1.bb => lttng-modules_2.5.0.bb} (85%)
>>>
>>
>> ...
>>
>>> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
>>> similarity index 85%
>>> rename from meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
>>> rename to meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
>>> index 5e05ffc69853..5a99a5adae8b 100644
>>> --- a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
>>> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
>>> @@ -10,14 +10,15 @@ DEPENDS = "virtual/kernel"
>>
>> Is the LICENSE = "LGPLv2.1 & GPLv2" correct?
>
> Let me double check. I was doing an update and test, and didn't notice if
> this had changed.
>
> Even if it did change, and I'm just uprev'ing .. I'll fix it, since it
> being wrong
> in the past doesn't give me a free pass to keep it wrong in an update :)

Too funny. There have been the three MIT licence files since 2011 .. so I agree
that the recipe's summary is long.  I'll tack a patch onto the end of the series
and wait to hear from RP/Saul about anything else I may have broken.

Bruce

>
> Cheers,
>
> Bruce
>
>>
>> git/LICENSE says:
>>
>> * MIT-style license
>>
>> These files are licensed under an MIT-style license. See mit-license.txt
>> for details.
>>
>> lib/prio_heap/lttng_prio_heap.h
>> lib/prio_heap/lttng_prio_heap.c
>> lib/bitfield.h
>>
>>
>>>
>>>  inherit module
>>>
>>> -SRCREV = "a0383def517e3aebbbcebae61fe2bcfb50d31e71"
>>> -PV = "2.4.1"
>>> +SRCREV = "789fd1d06d07aeb9a403bdce1b3318560cfc6eca"
>>>
>>>  # lttng currently blacklists arm with gcc-4.8
>>>  COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
>>>
>>> -SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.4 \
>>> +SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.5 \
>>>             file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
>>> +           file://Update-compaction-instrumentation-to-3.16-kernel.patch \
>>> +           file://Update-vmscan-instrumentation-to-3.16-kernel.patch \
>>>             "
>>>
>>>  export INSTALL_MOD_DIR="kernel/lttng-modules"
>>> --
>>> 1.8.1.2
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

