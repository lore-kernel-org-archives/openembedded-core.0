Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TJNz2-0007qT-2n
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 14:23:24 +0200
Received: by iebc13 with SMTP id c13so17541610ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 05:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Xb+R4hgXWDh935YHgUX2shIgOLwN4w1NeJyZs9CFmLo=;
	b=Q+HihIZX1wtaJlU2cXhJGErRGzCuU/41YwyqSmOE1hvpG/MzxaFprK4+lCsyrbhXei
	Y4LrSbeDbY3gOn7rJAe/aT3QFOGcagaIgtCkTwywD/PHniExRhTCSh2jHT3r4gYcL2ob
	bzhFee0oVFdDPkHCcBV8qqqJDc9flsmw5vX2DtWUqweeBiBIJQ65BEmmNAsVtTm1m/7T
	fYpUZK1MDTY3mJypWgV4y4WDc2F46hgkEO2ZQ6uEV0cfbM393FJ+3Xz5cVd/8snPCO+C
	fqxNq7Yjz1qH1W98k71ml4bqINhDdPuES1U/l+W9Mt7mtlQFcJTCu457WmTqo69U6PKJ
	K2KQ==
MIME-Version: 1.0
Received: by 10.50.47.129 with SMTP id d1mr11939174ign.45.1349266223731; Wed,
	03 Oct 2012 05:10:23 -0700 (PDT)
Received: by 10.64.99.226 with HTTP; Wed, 3 Oct 2012 05:10:23 -0700 (PDT)
In-Reply-To: <506BC13D.9030909@windriver.com>
References: <52507f028d9ec0e88078673e15e238d010cfaead.1349239001.git.dvhart@linux.intel.com>
	<506BC13D.9030909@windriver.com>
Date: Wed, 3 Oct 2012 14:10:23 +0200
Message-ID: <CAAQYJAvNKTTzux33yYq9Vif3+40Cc=B51Wh1usE9vS1kCqQ-sw@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Oct 2012 12:23:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 3, 2012 at 6:38 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 12-10-03 12:36 AM, Darren Hart wrote:
>>
>> It is necessary to supply file://defconfig to the SRC_URI when using
>> a defconfig (it is not implicitly understood as the commentary might
>> currently suggest).
>
>
> Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>
>
>>
>> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
>> CC: Bruce Ashfield<bruce.ashfield@windriver.com>
>> ---
>>   meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>> b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>> index 1f0b3a2..4115d2f 100644
>> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>> @@ -13,7 +13,8 @@
>>   #
>>   #   You must also provide a Linux kernel configuration. The most direct
>>   #   method is to copy your .config to files/defconfig in your layer,
>> -#   in the same directory as the bbappend.
>> +#   in the same directory as the bbappend and add file://defconfig to
>> +#   your SRC_URI.
>>   #
>>   #   To use the yocto kernel tooling to generate a BSP configuration
>>   #   using modular configuration fragments, see the yocto-bsp and
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Great, this example can be very useful to create custom kernel recipes.

Just one thing, the comments on the top suggest to set
#     COMPATIBLE_MACHINE_yourmachine = "yourmachine"

but at the end there is
COMPATIBLE_MACHINE = "(^$)"

Now, the latter form is what I'm used to see.

Which kind of advantages using COMPATIBLE_MACHINE_yourmachine ? In
that way you don't mask the recipe for other machines...so I don't see
the purpose and I think should be discouraged. Thus, I'd amend the
example in the comment.

My 2 cents

Andrea


