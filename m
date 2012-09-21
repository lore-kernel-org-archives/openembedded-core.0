Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TF4JB-000360-Ta
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 16:34:27 +0200
Received: from localhost ([127.0.0.1]:46919 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TF46s-0000uq-0n
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 14:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:cc:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=2P3UN5STPIAR4qeSOOyRPwTMAwQ=; b=PoEtid7lD7o/IG3bUSfaHxGIy6o8
	D/yGK6fjnLbdpefmKmqibS5Usrs3SL0Xlwm9rmYDC1BFt4xiUbhlcQP3svKdDu7i
	QM5PlvfQtwuOjiIZK4jRE/jrFcgp7Jie6KLQiOJqhyOwPPhCU3WpEwHcbcTDT/iy
	Tt8aoBS4jlCDsVo=
Received: from [195.171.99.130] (port=53665 helo=[192.168.0.42])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TF46r-0000un-US
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 14:21:37 +0000
Message-ID: <505C7849.70307@communistcode.co.uk>
Date: Fri, 21 Sep 2012 15:23:05 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120910 Thunderbird/15.0.1
MIME-Version: 1.0
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <505C7402.4060604@communistcode.co.uk>
	<1348236516.10108.79.camel@ted>
In-Reply-To: <1348236516.10108.79.camel@ted>
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
X-List-Received-Date: Fri, 21 Sep 2012 14:34:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/09/12 15:08, Richard Purdie wrote:
> On Fri, 2012-09-21 at 15:04 +0100, Jack Mitchell wrote:
>> I am currently having issues building my application with the latest
>> toolchain.
>>
>> I have used the new capabilities of it being relocatable to place it
>> somewhere sensible and I think this may be what is breaking it. My old
>> toolchain in /opt still works perfectly.
>>
>> The error I receive is:
>>
>> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
>> cannot find crtbegin.o: No such file or directory
>> collect2: error: ld returned 1 exit status
>> make: *** [R0005] Error 1
>>
>> However, crtbeign.o is at the path:
>>
>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ pwd
>> /home/jack/Projects/R0005-SDK-210912/sysroots/armv7a-vfp-neon-poky-linux-gnueabi
>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ find . -name
>>      crtbegin.o
>>      ./usr/lib/arm-poky-linux-gnueabi/4.7.2/crtbegin.o
>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ ls usr/lib
>>      lib/     libexec/
>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ ls usr/libexec/
>>      pt_chown
>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$
>>
>>
>> Does anyone have an idea what is the issue here? Why can't it find the
>> object file?
> Did you have the patches that just merged to master applied? There are a
> number of relocation issues those just addressed.
>
> Cheers,
>
> Richard
>

If you're talking about the ones from Laurentiu, then yes - I had been 
waiting for the merge and was hoping that it would fix my issues, but 
alas it wasn't to be!

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



