Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TF4Uo-0003cq-VM
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 16:46:23 +0200
Received: from localhost ([127.0.0.1]:53864 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TF4IV-0001J0-5C
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 14:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=8ipB6dAkfqfex8MjJS0h8pjwWz8=; b=hN4yy/QbTpr8nWhvNNRtdO+1REjG
	o+fLmJYoQGGSg0sF/qhy8xXh7tYe20cN61eFC4tIM5C9xj/FMO+d2qTMLjp4X5Yh
	V8b3XvuAAwl09psyb6ZWauIpI9x/l//kBMqbhXhg0VijzOrnyrg1Gf9rnLmd1U/S
	7d+OGoEQcLhtpUk=
Received: from [195.171.99.130] (port=61424 helo=[192.168.0.42])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TF4IV-0001Ix-2k
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 14:33:39 +0000
Message-ID: <505C7B1B.5050808@communistcode.co.uk>
Date: Fri, 21 Sep 2012 15:35:07 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120910 Thunderbird/15.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <505C7402.4060604@communistcode.co.uk>
	<1348236516.10108.79.camel@ted>
	<505C7849.70307@communistcode.co.uk>
	<C6510F6D410BB64A8C15398EDC6B847C46AF4D78@ORSMSX101.amr.corp.intel.com>
In-Reply-To: <C6510F6D410BB64A8C15398EDC6B847C46AF4D78@ORSMSX101.amr.corp.intel.com>
Subject: Re: ld problems with relocated toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Sep 2012 14:46:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 21/09/12 15:27, Zhang, Jessica wrote:
> Jack,
>
> Please open a bug in bugzilla for the issue, since we're in final stage of 1.3, all the issues that need to be addressed need have a bug number associate with it.
>
> Thanks,
> Jessica
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Jack Mitchell
> Sent: Friday, September 21, 2012 7:23 AM
> Cc: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] ld problems with relocated toolchain
>
> On 21/09/12 15:08, Richard Purdie wrote:
>> On Fri, 2012-09-21 at 15:04 +0100, Jack Mitchell wrote:
>>> I am currently having issues building my application with the latest
>>> toolchain.
>>>
>>> I have used the new capabilities of it being relocatable to place it
>>> somewhere sensible and I think this may be what is breaking it. My
>>> old toolchain in /opt still works perfectly.
>>>
>>> The error I receive is:
>>>
>>> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
>>> cannot find crtbegin.o: No such file or directory
>>> collect2: error: ld returned 1 exit status
>>> make: *** [R0005] Error 1
>>>
>>> However, crtbeign.o is at the path:
>>>
>>>       [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ pwd
>>> /home/jack/Projects/R0005-SDK-210912/sysroots/armv7a-vfp-neon-poky-linux-gnueabi
>>>       [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ find . -name
>>>       crtbegin.o
>>>       ./usr/lib/arm-poky-linux-gnueabi/4.7.2/crtbegin.o
>>>       [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ ls usr/lib
>>>       lib/     libexec/
>>>       [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ ls usr/libexec/
>>>       pt_chown
>>>       [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$
>>>
>>>
>>> Does anyone have an idea what is the issue here? Why can't it find
>>> the object file?
>> Did you have the patches that just merged to master applied? There are
>> a number of relocation issues those just addressed.
>>
>> Cheers,
>>
>> Richard
>>
> If you're talking about the ones from Laurentiu, then yes - I had been waiting for the merge and was hoping that it would fix my issues, but alas it wasn't to be!
>
> Regards,
>
> --
>
>     Jack Mitchell (jack@embed.me.uk)
>     Embedded Systems Engineer
>     http://www.embed.me.uk
>
> --
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3156

Thanks!

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



