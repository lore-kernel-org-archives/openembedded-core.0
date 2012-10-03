Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TJPo5-0006H2-WF
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 16:20:14 +0200
Received: by iebc13 with SMTP id c13so17800433ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 07:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=TnxO0hPvEtA0FYVktjRDzlywudQPzIx2Lm3KcNXElLc=;
	b=dGgcdkg6KGgt1qpQJfOJk7xvzDACqehNUyNApxPiU9SkW+fPZ9Kcw/mNf3slkWJekF
	XDq1Hs6zbJY1vIY0apIxgax3HIiwyPdVKJ78oBXLPj29lNERy8ESsvLcgnIaIoqDKUHf
	uJyivpHIi1VKroK1WM4mx2Hk9GlQZkwH9zhHyudM9RNax4dQY/d6Fwbs5/dWdU4Yxvvh
	EIbxYoYOZmvQFWCoVFi82DjjandzZwizhl/FPv1LqxztJr9G0t1K7XM/AdhTaiApybIt
	AcZ+uL7Zmy4cHqOamFFuhnv6LRYar7A4aMWycw4XAvt3cxGnthP1jm8lLB5wEoOHl8OV
	jJEg==
MIME-Version: 1.0
Received: by 10.50.181.161 with SMTP id dx1mr11882978igc.71.1349273229038;
	Wed, 03 Oct 2012 07:07:09 -0700 (PDT)
Received: by 10.64.99.226 with HTTP; Wed, 3 Oct 2012 07:07:08 -0700 (PDT)
In-Reply-To: <CADkTA4Ph1tMSRvk--Hi26+A9ox96f=6OV4Vemrv6hEth67qt7A@mail.gmail.com>
References: <52507f028d9ec0e88078673e15e238d010cfaead.1349239001.git.dvhart@linux.intel.com>
	<506BC13D.9030909@windriver.com>
	<CAAQYJAvNKTTzux33yYq9Vif3+40Cc=B51Wh1usE9vS1kCqQ-sw@mail.gmail.com>
	<CADkTA4Ph1tMSRvk--Hi26+A9ox96f=6OV4Vemrv6hEth67qt7A@mail.gmail.com>
Date: Wed, 3 Oct 2012 16:07:08 +0200
Message-ID: <CAAQYJAs7br-BfmshALOa238pOZ_fD_21-Nxhr5JpBz70F1s4Sw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-yocto-custom: Clarify defconfig usage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 14:20:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 3, 2012 at 2:33 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> On Wed, Oct 3, 2012 at 8:10 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
>> On Wed, Oct 3, 2012 at 6:38 AM, Bruce Ashfield
>> <bruce.ashfield@windriver.com> wrote:
>>> On 12-10-03 12:36 AM, Darren Hart wrote:
>>>>
>>>> It is necessary to supply file://defconfig to the SRC_URI when using
>>>> a defconfig (it is not implicitly understood as the commentary might
>>>> currently suggest).
>>>
>>>
>>> Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>
>>>
>>>>
>>>> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
>>>> CC: Bruce Ashfield<bruce.ashfield@windriver.com>
>>>> ---
>>>>   meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 3 ++-
>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>>> b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>>> index 1f0b3a2..4115d2f 100644
>>>> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>>> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>>> @@ -13,7 +13,8 @@
>>>>   #
>>>>   #   You must also provide a Linux kernel configuration. The most direct
>>>>   #   method is to copy your .config to files/defconfig in your layer,
>>>> -#   in the same directory as the bbappend.
>>>> +#   in the same directory as the bbappend and add file://defconfig to
>>>> +#   your SRC_URI.
>>>>   #
>>>>   #   To use the yocto kernel tooling to generate a BSP configuration
>>>>   #   using modular configuration fragments, see the yocto-bsp and
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> Great, this example can be very useful to create custom kernel recipes.
>>
>> Just one thing, the comments on the top suggest to set
>> #     COMPATIBLE_MACHINE_yourmachine = "yourmachine"
>>
>> but at the end there is
>> COMPATIBLE_MACHINE = "(^$)"
>>
>> Now, the latter form is what I'm used to see.
>>
>> Which kind of advantages using COMPATIBLE_MACHINE_yourmachine ? In
>> that way you don't mask the recipe for other machines...so I don't see
>> the purpose and I think should be discouraged. Thus, I'd amend the
>> example in the comment.
>
> I wouldn't call it exactly masking with that syntax. Other machines
> can still set
> their compatibility explicitly with their own machine specific
> override, which is
> how linux-yocto + linux-yocto-bsp + meta-$semi have been put together for
> quite some time.

As long as the layer containing the -custom kernel recipe is not used
by other machines all is fine.
But if e.g you build for machine 'foo' and you have set
COMPATIBLE_MACHINE_foo = "foo" in the .bbappend in your layer that
does not mask the recipe for the 'bar' machine.
(Think about including the full meta-intel layer and having a custom
kernel for say cedartail: the other machines would have now multiple
kernel providers)
If you set instead COMPATIBLE_MACHINE = "foo" you are sure this recipe
will be ignored by other machines.

>
> The goal is to set a base which is incompatible with all machines, and then
> suggest that you must have a machine or other layer that adds your
> explicit compatibility (I know I'm stating the obvious) .. and using a machine
> specific override to do that is one good way to be clear and avoid overly long
> and complex series of |'d (is that a word?) machines that can cause append
> problems in their own right.
>
> So I'd think that an update to the comment that included COMPATIBLE_MACHINE
> or COMPATIBLE_MACHINE_append would be a good addition, but I wouldn't
> drop the existing text .. just augment it if we want.

COMPATIBLE_MACHINE_append  is ok, I'm concerned by the _yourmachine scope

>
> Good comment though.
>
> Cheers,
>
> Bruce

BTW, cgit color-syntax dislikes the missing double-quotes in the
coment at #39 :)

Regards

Andrea

>
>>
>> My 2 cents
>>
>> Andrea
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"


