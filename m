Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TJOLh-00007d-3K
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 14:46:49 +0200
Received: by lbky2 with SMTP id y2so5791287lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 05:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=T3t/GMrjhbrttKqfUTGDb6kzACGd7f3VULWX4OAxWxg=;
	b=LIYAJ+nqU99WS1gHOdRzr/l7f1CAKDoyUsnLdRAJgBL7rG+UR181orleLa4PDzagmM
	2j97CeuIE/wwPgM6RI12HXB486oJKdV5YOb1Sya9o3mYUOiSkpv1rXa66sFkR1Zbva8N
	TTewiKrNq7GvK1/SwB4f+lpYo8VkhS+QAElfsUUHJ/oNjC6kx8RQE09bxZrMYL9Ip/mB
	p1LyXVvWqp6Kyk9w2YGTeP0sUYgSVUJee/YscopWkqfzGFSL3yE3hu1fs3f3Eqi0Ap17
	m+kyy89vzak1eSQys4hun8RexOMQG0vMHlMDPSc3haE+eAsL460aNgOG6BZiZSvIdLDn
	/2cg==
MIME-Version: 1.0
Received: by 10.152.105.135 with SMTP id gm7mr1620765lab.22.1349267629464;
	Wed, 03 Oct 2012 05:33:49 -0700 (PDT)
Received: by 10.114.17.164 with HTTP; Wed, 3 Oct 2012 05:33:49 -0700 (PDT)
In-Reply-To: <CAAQYJAvNKTTzux33yYq9Vif3+40Cc=B51Wh1usE9vS1kCqQ-sw@mail.gmail.com>
References: <52507f028d9ec0e88078673e15e238d010cfaead.1349239001.git.dvhart@linux.intel.com>
	<506BC13D.9030909@windriver.com>
	<CAAQYJAvNKTTzux33yYq9Vif3+40Cc=B51Wh1usE9vS1kCqQ-sw@mail.gmail.com>
Date: Wed, 3 Oct 2012 08:33:49 -0400
Message-ID: <CADkTA4Ph1tMSRvk--Hi26+A9ox96f=6OV4Vemrv6hEth67qt7A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
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
X-List-Received-Date: Wed, 03 Oct 2012 12:46:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 3, 2012 at 8:10 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> On Wed, Oct 3, 2012 at 6:38 AM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>> On 12-10-03 12:36 AM, Darren Hart wrote:
>>>
>>> It is necessary to supply file://defconfig to the SRC_URI when using
>>> a defconfig (it is not implicitly understood as the commentary might
>>> currently suggest).
>>
>>
>> Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>
>>
>>>
>>> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
>>> CC: Bruce Ashfield<bruce.ashfield@windriver.com>
>>> ---
>>>   meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>> b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>> index 1f0b3a2..4115d2f 100644
>>> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>> @@ -13,7 +13,8 @@
>>>   #
>>>   #   You must also provide a Linux kernel configuration. The most direct
>>>   #   method is to copy your .config to files/defconfig in your layer,
>>> -#   in the same directory as the bbappend.
>>> +#   in the same directory as the bbappend and add file://defconfig to
>>> +#   your SRC_URI.
>>>   #
>>>   #   To use the yocto kernel tooling to generate a BSP configuration
>>>   #   using modular configuration fragments, see the yocto-bsp and
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> Great, this example can be very useful to create custom kernel recipes.
>
> Just one thing, the comments on the top suggest to set
> #     COMPATIBLE_MACHINE_yourmachine = "yourmachine"
>
> but at the end there is
> COMPATIBLE_MACHINE = "(^$)"
>
> Now, the latter form is what I'm used to see.
>
> Which kind of advantages using COMPATIBLE_MACHINE_yourmachine ? In
> that way you don't mask the recipe for other machines...so I don't see
> the purpose and I think should be discouraged. Thus, I'd amend the
> example in the comment.

I wouldn't call it exactly masking with that syntax. Other machines
can still set
their compatibility explicitly with their own machine specific
override, which is
how linux-yocto + linux-yocto-bsp + meta-$semi have been put together for
quite some time.

The goal is to set a base which is incompatible with all machines, and then
suggest that you must have a machine or other layer that adds your
explicit compatibility (I know I'm stating the obvious) .. and using a machine
specific override to do that is one good way to be clear and avoid overly long
and complex series of |'d (is that a word?) machines that can cause append
problems in their own right.

So I'd think that an update to the comment that included COMPATIBLE_MACHINE
or COMPATIBLE_MACHINE_append would be a good addition, but I wouldn't
drop the existing text .. just augment it if we want.

Good comment though.

Cheers,

Bruce

>
> My 2 cents
>
> Andrea
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


