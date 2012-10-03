Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TJQNf-000746-NP
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 16:56:59 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Oct 2012 07:43:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,528,1344236400"; d="scan'208";a="229465171"
Received: from unknown (HELO envy.home) ([10.255.13.153])
	by fmsmga001.fm.intel.com with ESMTP; 03 Oct 2012 07:43:46 -0700
Message-ID: <506C4EF4.10408@linux.intel.com>
Date: Wed, 03 Oct 2012 07:43:00 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Andrea Adami <andrea.adami@gmail.com>
References: <52507f028d9ec0e88078673e15e238d010cfaead.1349239001.git.dvhart@linux.intel.com>
	<506BC13D.9030909@windriver.com>
	<CAAQYJAvNKTTzux33yYq9Vif3+40Cc=B51Wh1usE9vS1kCqQ-sw@mail.gmail.com>
	<CADkTA4Ph1tMSRvk--Hi26+A9ox96f=6OV4Vemrv6hEth67qt7A@mail.gmail.com>
	<CAAQYJAs7br-BfmshALOa238pOZ_fD_21-Nxhr5JpBz70F1s4Sw@mail.gmail.com>
In-Reply-To: <CAAQYJAs7br-BfmshALOa238pOZ_fD_21-Nxhr5JpBz70F1s4Sw@mail.gmail.com>
X-Enigmail-Version: 1.4.4
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 03 Oct 2012 14:56:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 10/03/2012 07:07 AM, Andrea Adami wrote:
> On Wed, Oct 3, 2012 at 2:33 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>> On Wed, Oct 3, 2012 at 8:10 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
>>> On Wed, Oct 3, 2012 at 6:38 AM, Bruce Ashfield
>>> <bruce.ashfield@windriver.com> wrote:
>>>> On 12-10-03 12:36 AM, Darren Hart wrote:
>>>>>
>>>>> It is necessary to supply file://defconfig to the SRC_URI when using
>>>>> a defconfig (it is not implicitly understood as the commentary might
>>>>> currently suggest).
>>>>
>>>>
>>>> Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>>
>>>>
>>>>>
>>>>> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
>>>>> CC: Bruce Ashfield<bruce.ashfield@windriver.com>
>>>>> ---
>>>>>   meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 3 ++-
>>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>>>> b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>>>> index 1f0b3a2..4115d2f 100644
>>>>> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>>>> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>>>> @@ -13,7 +13,8 @@
>>>>>   #
>>>>>   #   You must also provide a Linux kernel configuration. The most direct
>>>>>   #   method is to copy your .config to files/defconfig in your layer,
>>>>> -#   in the same directory as the bbappend.
>>>>> +#   in the same directory as the bbappend and add file://defconfig to
>>>>> +#   your SRC_URI.
>>>>>   #
>>>>>   #   To use the yocto kernel tooling to generate a BSP configuration
>>>>>   #   using modular configuration fragments, see the yocto-bsp and
>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>> Great, this example can be very useful to create custom kernel recipes.
>>>
>>> Just one thing, the comments on the top suggest to set
>>> #     COMPATIBLE_MACHINE_yourmachine = "yourmachine"
>>>
>>> but at the end there is
>>> COMPATIBLE_MACHINE = "(^$)"
>>>
>>> Now, the latter form is what I'm used to see.
>>>
>>> Which kind of advantages using COMPATIBLE_MACHINE_yourmachine ? In
>>> that way you don't mask the recipe for other machines...so I don't see
>>> the purpose and I think should be discouraged. Thus, I'd amend the
>>> example in the comment.
>>
>> I wouldn't call it exactly masking with that syntax. Other machines
>> can still set
>> their compatibility explicitly with their own machine specific
>> override, which is
>> how linux-yocto + linux-yocto-bsp + meta-$semi have been put together for
>> quite some time.
> 
> As long as the layer containing the -custom kernel recipe is not used
> by other machines all is fine.
> But if e.g you build for machine 'foo' and you have set
> COMPATIBLE_MACHINE_foo = "foo" in the .bbappend in your layer that
> does not mask the recipe for the 'bar' machine.
> (Think about including the full meta-intel layer and having a custom
> kernel for say cedartail: the other machines would have now multiple
> kernel providers)
> If you set instead COMPATIBLE_MACHINE = "foo" you are sure this recipe
> will be ignored by other machines.

Are you saying that if users replace:

COMPATIBLE_MACHINE = "(^$)"

with

COMPATIBLE_MACHINE_foo = "foo"

That COMPATIBLE_MACHINE will default to "" for all the other machines
and be implicitly marked as compatible?

If so... I believe you are correct and that is not the desired behavior.
the _machine is appropriate for bbappend files, but for custom bb files
as this is meant to be used, a proper regex should be used.

Care to submit a documentation patch for this?

Thanks for the comments.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


