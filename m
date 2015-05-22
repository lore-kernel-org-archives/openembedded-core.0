Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8AE4B609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 01:19:13 +0000 (UTC)
Received: by oiww2 with SMTP id w2so3340986oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 18:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XVYj9U/CeymjVZgU+2X5t2ALKTRlkQCO1FMUK6ZSYFM=;
	b=QzH7fhq6rxV4B1YQzuF2AAxgScxmZZqYckbvXzwaSQg6ZIy5dVLL6d+db1pBjtrO0g
	RmYMEK/FN3OMBW2Fv41RPU9UlHpZxZuWkOV9k7JjCjfq5O8OdTr3EojgH9/x1d5chMRJ
	EIxGn147RXBEkvT6I58B2TMd1/M2dOWvrJl2LFP7s+clPeR/gE2D7XJedUwCwFvs+wek
	KI+C7X60hOrjv3c5KPEydb1ZlYRRXnxfwD3ODnd5EpX7u9aP0IAa1Og0cKci+w1bQLvP
	T3cAdAbp9/FkDIu69QJjUwHjQDS6M+Ah1fINTuLHkUGG67chZfZ6+A9Axu5nMtm6rdiW
	Y4GA==
MIME-Version: 1.0
X-Received: by 10.202.81.201 with SMTP id f192mr4391807oib.29.1432257555168;
	Thu, 21 May 2015 18:19:15 -0700 (PDT)
Received: by 10.202.44.196 with HTTP; Thu, 21 May 2015 18:19:15 -0700 (PDT)
In-Reply-To: <555E7F62.8070107@windriver.com>
References: <cover.1432235097.git.bruce.ashfield@windriver.com>
	<8d68ee8847de2535cb31b5941da95adf4862e977.1432235097.git.bruce.ashfield@windriver.com>
	<CAJ86T=X9o3vCfuDx6V1_TJOMhObHVPX-NkpdcGgqijuvT8f7Uw@mail.gmail.com>
	<555E7F62.8070107@windriver.com>
Date: Thu, 21 May 2015 18:19:15 -0700
Message-ID: <CAJ86T=WHysoCS-fZWYqSwDfGXjjotuFx20Qa=MPMcg4qM8F8-g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] linux-yocto-custom: clarify bbappend versus copy in comments
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
X-List-Received-Date: Fri, 22 May 2015 01:19:19 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 21, 2015 at 5:59 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 2015-05-21 5:55 PM, Andre McCurdy wrote:
>>
>> On Thu, May 21, 2015 at 12:08 PM, Bruce Ashfield
>> <bruce.ashfield@windriver.com> wrote:
>>>
>>> The kernel development manual recommends making a copy of
>>> linux-yocto-custom, while the comments in the recipe talk about
>>> bbappends.
>>>
>>> To synchronize the two, we remove the bbappend references from the
>>> recipe and instead indicate that a copy should be updated.
>>>
>>> [YOCTO: #6925]
>>>
>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>> ---
>>>   meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 10
>>> +++++-----
>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>> b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>> index 05463c026304..e38af19f827b 100644
>>> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>> @@ -11,8 +11,8 @@
>>>   #
>>>   #   You must also provide a Linux kernel configuration. The most direct
>>>   #   method is to copy your .config to files/defconfig in your layer,
>>> -#   in the same directory as the bbappend and add file://defconfig to
>>> -#   your SRC_URI.
>>> +#   in the same directory as the copy (and rename) of this recipe and
>>> +#   add file://defconfig to your SRC_URI.
>>>   #
>>>   #   To use the yocto kernel tooling to generate a BSP configuration
>>>   #   using modular configuration fragments, see the yocto-bsp and
>>> @@ -52,14 +52,14 @@
>>>   inherit kernel
>>>   require recipes-kernel/linux/linux-yocto.inc
>>>
>>> -# Override SRC_URI in a bbappend file to point at a different source
>>> +# Override SRC_URI in a copy of this recipe to point at a different
>>> source
>>>   # tree if you do not want to build from Linus' tree.
>>
>> Would "Update SRC_URI in your copy of this recipe..." make more sense
>> here?
>
> I avoided possessives on purpose, this could be one of many copies,
> most may not be 'yours'.

There's already mention of "your layer", "your .config" and "your
machine", so I don't think "your copy of this recipe" is out of place,
but "a copy of this recipe" is clear too.

>>>   SRC_URI =
>>> "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1;name=machine"
>>>
>>>   LINUX_VERSION ?= "3.4"
>>>   LINUX_VERSION_EXTENSION ?= "-custom"
>>>
>>> -# Override SRCREV to point to a different commit in a bbappend file to
>>> +# Override SRCREV to point to a different commit in a copy of this
>>> recipe
>>>   # build a different release of the Linux kernel.
>>>   # tag: v3.4 76e10d158efb6d4516018846f60c2ab5501900bc
>>
>>
>> Same comment, "Override" -> "Update" and "a copy" -> "your copy".
>
>
> There's a default SRCREV in many configs, that's why I say override,
> but update works too.
>>
>> Also, the word "to" seems to have gone missing from the end of the line.
>
>
> Indeed. I'll add that back.
>
> Bruce
>
>
>>
>>>   SRCREV_machine="76e10d158efb6d4516018846f60c2ab5501900bc"
>>> @@ -67,6 +67,6 @@
>>> SRCREV_machine="76e10d158efb6d4516018846f60c2ab5501900bc"
>>>   PR = "r1"
>>>   PV = "${LINUX_VERSION}+git${SRCPV}"
>>>
>>> -# Override COMPATIBLE_MACHINE to include your machine in a bbappend
>>> +# Override COMPATIBLE_MACHINE to include your machine in a copy of this
>>> recipe
>>>   # file. Leaving it empty here ensures an early explicit build failure.
>>>   COMPATIBLE_MACHINE = "(^$)"
>>> --
>>> 2.1.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

