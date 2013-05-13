Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UbsCg-0008Sc-HD
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 14:50:15 +0200
Received: by mail-la0-f47.google.com with SMTP id fq12so735571lab.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 05:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=dhfW85mnBQ90nzUL01iYgIs+Cu443moqzxcD2Odb0yM=;
	b=vpWDkie5/tO08rc5AVNX6d0WTrTYfFaa0R9zQAVH2cZzhSdPrnhgVZ83JmjQHh/FW7
	eIA6BTRHOuGG4/Yv3T7fkU1RNGwDkRwFJ//e3X+EhfT5xYPPStXr+82QQQ/35sdOWqOo
	8PoUDv03yqYTB7B9iHUBLe8Z53m4iE5jc9sJKOH1erKFowtyfWDZQgMeZJXKcaWCLIWY
	lhoadRfft/Lxv8C836fJlx8/RzzqnRMRzQGUQPmpHgtc68N/wmkzEgTieFdgjyEQckgB
	3CcaTGlXua28fIKaMTupPY4/rIKcVziIfq2jRsRCbosQdG863ZdmNG8CFHML4g9ak2vy
	yv7A==
MIME-Version: 1.0
X-Received: by 10.112.159.136 with SMTP id xc8mr12675697lbb.57.1368448318586; 
	Mon, 13 May 2013 05:31:58 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Mon, 13 May 2013 05:31:58 -0700 (PDT)
In-Reply-To: <5190A747.6090403@communistcode.co.uk>
References: <1368356739-17625-1-git-send-email-sgw@linux.intel.com>
	<9E4F6205-6171-4D60-A669-609A49F763C1@gmail.com>
	<518FD2F2.5070105@linux.intel.com>
	<020E3790-121B-49E9-87E3-55ACA9095B10@gmail.com>
	<5190166A.5050000@windriver.com>
	<5190A747.6090403@communistcode.co.uk>
Date: Mon, 13 May 2013 08:31:58 -0400
Message-ID: <CADkTA4MAFAJbb8e-da4g_4t579FkOPC0hJJs3roP513hfVJtgw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] tcmode-default: Set 4.8 as default
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
X-List-Received-Date: Mon, 13 May 2013 12:50:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 13, 2013 at 4:41 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> On 12/05/13 23:23, Bruce Ashfield wrote:
>>
>> On 13-05-12 5:49 PM, Khem Raj wrote:
>>>
>>>
>>> On May 12, 2013, at 10:35 AM, Saul Wold <sgw@linux.intel.com> wrote:
>>>
>>>> On 05/12/2013 09:29 AM, Khem Raj wrote:
>>>>>
>>>>> Hi Saul
>>>>>
>>>>> There is one serious problem that I ran into was that qemuarm 3.8
>>>>> kernel segfaulted
>>>>> is it working for you ?
>>>>>
>>>> Nope your right there does appear to be a problem with ARM, I thought we
>>>> where have sanity test issues again, I just completed a build and verified
>>>> that I get a Kernel paninc with 3.8 Kernel and 4.8 GCC.
>>>>
>>>> Not ready yet!
>>>>
>>>> Khem, are you looking into it?  I have CC'ed Bruce for the kernel also.
>>>
>>>
>>> haven't looked into the problem in detail. Its one of those either a
>>> problem in gcc or gcc uncovering a latent bug in kernel.
>>
>>
>> I'll get myself set up and do a build on Monday, see if anything obvious
>> pops up (i.e. start with the latest and see if it works, then bisect
>> back). I'm already poking at mips64, so I can do this in parallel.
>>
>> Bruce
>>
>>>
>>>
>>
>
> I know the beaglebone kernel was segfaulting on me until Koen updated to
> 3.8.11, I think it included some important backports. Would definitely be
> worth a try, Koen can point to you to commit which fixed it, I seem to have
> lost the link into the IRC nether.

Luckily I have the latest 3.8.x ready to go, and we are already on 3.8.11, so
as Koen indicated in his follow up, it may be a patch in 3.8.11 + something
else. I'll start with my latest 3.8 tree, and then use 3.9 and 3.10 respectively
until I can find the patch.

That being said, if anyone else bisects and finds the fix, I'll be
happy to merge
a change, or take the confirmation that it's in the pending -stable update.

Bruce

>
> Cheers,
>
> --
>
>   Jack Mitchell (jack@embed.me.uk)
>   Embedded Systems Engineer
>   http://www.embed.me.uk
>
> --
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


