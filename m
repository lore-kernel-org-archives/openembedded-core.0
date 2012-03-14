Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1S7nSv-00046j-Ko
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 13:38:05 +0100
Received: by wera1 with SMTP id a1so1604806wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 05:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=H/9q0fKD51dFI8Ma8fM+7Yorb7K6H0usO3xy9s4OrIM=;
	b=B/CCTK9TF79zUgSbTqB1vOTdrL9Ai1zNkdbIDEnhVai320FCUCNFSDgzsYAX5HYiJF
	iGA3eiJgoym604KKu5AfgHdyLdfDWzlshi/y6G1wQmgGvRl+FTRfFLNAI3o2ngfQozlX
	YdUSoDCzqfmTMxa3imtaXfnETPlKR9keFutoFqBhc3ta7rMkmI0pLbuLuFymPKSigi+7
	s2Z+qS5Ew+lLOWequyesBQv6Hfx2pdO5COAEqd53xjTiNRX7kCTRHSvQQFnYNR3dmDT0
	BzwsigPSfWqjXLLtCbWfRNl702vXV6H/sv8CRs+nbpTFN0cA/OxAnA5qQjDL+zx6fO91
	zzqQ==
MIME-Version: 1.0
Received: by 10.216.133.137 with SMTP id q9mr1531895wei.12.1331728160398; Wed,
	14 Mar 2012 05:29:20 -0700 (PDT)
Received: by 10.216.28.196 with HTTP; Wed, 14 Mar 2012 05:29:20 -0700 (PDT)
In-Reply-To: <5205752.2zb4P1afWQ@helios>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<9583d660052617740b61feeb6739263f06e5a64f.1331685330.git.paul.eggleton@linux.intel.com>
	<512FF648-8A82-4307-BEB7-0EC1A8FD15A7@dominion.thruhere.net>
	<5205752.2zb4P1afWQ@helios>
Date: Wed, 14 Mar 2012 08:29:20 -0400
Message-ID: <CADkTA4M6XgC3vo-GR5MnK1HcS58tz0-WrwSX0KOhaeRMMhqnvA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 6/6] linux-yocto-tiny: add dependency on xz-native
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
X-List-Received-Date: Wed, 14 Mar 2012 12:38:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 14, 2012 at 4:32 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 14 March 2012 09:21:06 Koen Kooi wrote:
>> Op 14 mrt. 2012, om 01:36 heeft Paul Eggleton het volgende geschreven:
>> > The kernel configuration requires lzma to compress the kernel image
>> > (CONFIG_KERNEL_LZMA=y), so add a dependency on xz-native which provides
>> > it.
>>
>> Have a look at
>> https://github.com/Angstrom-distribution/meta-ti/commit/b72cb13fcf83b9d3428
>> 08ea30379bfb6a1321b54 :)
>
> Right, I thought about that already - but we do not (by default) use defconfigs
> with linux-yocto*, so you'd have to go through all config fragments with this
> check. I figured it probably wasn't worth the effort in this case.

In this case, you wouldn't go through the fragments, you'd just add one that
turns it on when you want it. Don't audit a defconfig, push the few options that
you want onto the build.

Cheers,

Bruce

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


