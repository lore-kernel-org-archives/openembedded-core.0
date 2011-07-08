Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qf3Yt-0004gC-2R
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 07:25:11 +0200
Received: by iwn4 with SMTP id 4so1549323iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2011 22:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=uLkdsabaC3hqeUrsA3xuAK0HYwkZhWyVLMrCiQi0FPU=;
	b=L/uDHY5fT7Uzl5WPdjjZpeikl2zlV8y5NwzkP1nMUS1dDtjsBhw8883GskdHFbSDUJ
	DgWq2E/pjMi1uhhbWJcZnllgvYgMjs7T9FXH8TwYsCc0+Uf2oZHjaUY4y97MHXWwGtZM
	K9PZROiWM4Ve71fjD05ioMbKw4Cs6uHRz+uLs=
Received: by 10.231.24.193 with SMTP id w1mr1445626ibb.41.1310102478407;
	Thu, 07 Jul 2011 22:21:18 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id e23sm5851766ibe.40.2011.07.07.22.21.17
	(version=SSLv3 cipher=OTHER); Thu, 07 Jul 2011 22:21:17 -0700 (PDT)
Message-ID: <4E1693CC.8080403@gmail.com>
Date: Thu, 07 Jul 2011 22:21:16 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1310044227.git.paul.eggleton@linux.intel.com>	<b53c3209e62b53c744afeed13e1563932770cf1f.1310044227.git.paul.eggleton@linux.intel.com>	<09ECC867-24F5-4CC7-8312-F00F34897B68@dominion.thruhere.net>
	<201107071534.51372.paul.eggleton@linux.intel.com>
In-Reply-To: <201107071534.51372.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/2] bitbake.conf: update OLDEST_KERNEL to 2.6.0
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
X-List-Received-Date: Fri, 08 Jul 2011 05:25:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2011 07:34 AM, Paul Eggleton wrote:
> On Thursday 07 July 2011 15:24:46 Koen Kooi wrote:
>> angstrom has been setting it to 2.6.16 for some years now, I forget which
>> bug that fixed over 2.6.0
>
> Personally I don't know enough about which crusty old 2.6 kernels people are
> still using out there, so I figured 2.6.0 was the safest bet.

If oe-core never supported older kernel than 2.6.37 then setting it to 
2.6.37 would be better IMO

>
> A trawl of the OE history turns up these two:
>
> -----------------------------------
> commit 8b0202e6e3f90a772df301e8522f9deb03e50132
> Author: Tom Rini<tom_rini@mentor.com>
> Date:   Wed Mar 3 12:17:38 2010 -0700
>
>      glibc*.inc: Bump OLDEST_KERNEL to 2.6.16
>
>      Per glibc's ChangeLog, 2.6.16 is the minimum required by at least glibc
>      2.9
>      Prior to this, it was a murky 2.6.14 + patches to 2.6.16 (when it was all
>      upstream).
> -----------------------------------
> commit 794e8652f5c4fef71a8b9ab834b39f75b99f9420
> Author: Koen Kooi<koen@openembedded.org>
> Date:   Thu May 21 20:30:37 2009 +0200
>
>      Angstrom 2009.X: set OLDEST_KERNEL to 2.6.16 to avoid problems with
> ppoll()
> -----------------------------------
>
> Any further comments/info? Should we be using 2.6.16 in oe-core as well?
>
> Cheers,
> Paul
>



