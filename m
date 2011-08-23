Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <klausfpga@gmail.com>) id 1QvyTj-0002q8-Oa
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 23:25:47 +0200
Received: by fxg11 with SMTP id 11so587424fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2011 14:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:cc:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=oUiRWS3f/rzkhqLI7l9W8UYuvCMNtpM8C3oUa4N/zuo=;
	b=eUHwM97axzar6zC1gy+gLNNkufYN6HRLdaUPMcJr/OG4prSTqNOTq9sHl8tLPQodL/
	/gf/dTNsP351qYt95A9zpxXbUvzaMjG4a4hisPFii49HC603QevShk5VZX3+cEQFsmS1
	RQKAlFyRK7cdUUG3XpWTQAT1ZbShnEWl1Gy5c=
Received: by 10.223.5.76 with SMTP id 12mr6062568fau.103.1314134462403;
	Tue, 23 Aug 2011 14:21:02 -0700 (PDT)
Received: from [192.168.0.5] (unicorn.dungeon.de [81.56.82.123])
	by mx.google.com with ESMTPS id p4sm292610fah.1.2011.08.23.14.21.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Aug 2011 14:21:01 -0700 (PDT)
Message-ID: <4E5419B7.502@gmail.com>
Date: Tue, 23 Aug 2011 23:20:55 +0200
From: Klausfpga <klausfpga@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 ""
MIME-Version: 1.0
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4E537A0E.2040605@gmail.com>
	<201108231725.13418.paul.eggleton@linux.intel.com>
In-Reply-To: <201108231725.13418.paul.eggleton@linux.intel.com>
Subject: Re: Wiki seems dead. is openembedded wiki still active?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Aug 2011 21:25:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Paul,

Thanks for your detailed answer.

On 08/23/2011 06:25 PM, Paul Eggleton wrote:
> Yes that's the correct link, although the website is temporarily down;
> the
> appropriate people have apparently been informed and hopefully can fix it soon.
> Ok so just bad timing :-(
>
> However the website/wiki can still be accessed under 
> http://wiki.openembedded.org.
>  
>> What I wanted to find out on the wiki:
>>
>> - what branch / tag to checkout to have a consitant verison
>> I'm not quite sure what you're asking here. 
>>
What I wanted to know was what to checkout best:
 origin/master/  might not be a good idea, at least last time I tried
this I often
fell into inconsistent  releases

 origin/stable/2009 on the other hand had it's latest change in July 2010


>> FYI OE is in the middle of a transition of sorts; we're moving to a more 
>> modular metadata structure based around a smaller common core (OE-Core). For 
>> more information please see this page:
>>
>>   http://wiki.openembedded.org/index.php/OpenEmbedded-Core
>>
This looks interesting. Thanks for this info. I will read more on the wiki.
>> - what to use as starting point for a minimalist x86 system being able
>> to run under qemu (x86)
> "Minimalist" is somewhat subjective. OE-core alone provides a "qemux86" 
> machine target, a distro-less basic configuration and a "core-image-minimal" 
> image that provides a basic console-only system without package management.
>
Well with minimalist I meant kernel + base file system + busybox +
package management

I will look at qemux86 and core-image-minimal

>> - How to add a gnu toolchain package to my minimalist target system
> I think this is a case of adding "tools-sdk" to your IMAGE_FEATURES; someone 
> else might be able to offer more help here.
>
>> - what to use as starting point for a minimalist arm11 system being able
>> to run under qemu (x86)
> Same as above except use "qemuarm" as the machine.
>
>> - what is the recommended way to run bitbake in a 64 bit environment
>> (psyco is not working). Is pypy an option?
> There's no specific recommended way; the psyco warning was just a warning and 
> in any case if you're using a recent version of BitBake (as you need to for 
> OE-core) then Psyco support has been removed and you won't get the warning.
>
What I meant here is: Can pypy or somethign else be used in order to
accelerate the
execution of BitBake.

>> - what are the correct mailing lists for such questions
> For OE-classic discussion as well as layers above OE-core, use the 
> openembedded-devel mailing list. For OE-core use this list (openembedded-
> core). I suspect the openembedded-core list will merge into openembedded-devel 
> at some point in the near future.
>
>
Thanks ance more




