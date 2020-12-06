Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.12382.1607216088980758753
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Dec 2020 16:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=e5+TQphk;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Subject: Re: [OE-core] [meta-oe][PATCH v4 1/3] introduce lib_subpackage
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607216088;
	bh=gapNWsXFSOOPRX7Zn9NmVMXi2DnDNzz+c3dHrKoi7dg=;
	h=To:Cc:References:From:Date:In-Reply-To:From;
	b=e5+TQphkO3qShBmKK6WOJf/p+5ozpNdryN/jjePvHsig8vR8hU/Ix3blkw5dt4xtu
	 XtvWeJeiRsB7WVsWb63Vgkb9pOukSsQCiUbLC8BuKYy4EraePzDyV0EoOhcKXVgNqT
	 7XddWe6Vzpbn8Ml3hUMjO0HeW7qwbVQi+rMMqi2yJn++uH4n5an4mgZ9Tmjm9wQD5V
	 4U5H7hP+InUw6Ky2CH1UyX3BsabRBUEXodqkzsnDKKhL2alZZTCk3rcTjQ7ObUaQU/
	 rkRB0u12iZcsF3b1VbFHyjVOv3zqhNnhru1VOR3kJRE3CpWdPgIL7N+2Ir3A70MpzV
	 2lmBODDuownYw==
To: Phil Blundell <pb@pbcl.net>
Cc: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20201203232826.28519-1-okaya@kernel.org>
 <20201204110142.GV30831@pbcl.net>
 <d7593470-039f-e4c4-e4a9-36c475cf99c0@kernel.org>
 <20201205222337.GW30831@pbcl.net>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <df4bd423-75d3-176f-a0e0-8f95f789107b@kernel.org>
Date: Sat, 5 Dec 2020 19:54:47 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201205222337.GW30831@pbcl.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/5/2020 5:23 PM, Phil Blundell wrote:
>> I'm open to giving it a better name. Richard pointed me to a file
>> beginning with lib_foo.class for where this functionality could be
>> hosted before.
> I suppose the interesting question here, then, is "what is this class
> actually for?"  The description above says that it "allows us to easily
> split a recipe into subpackages" but doesn't say very much about what
> the consequences of including the class actually are or under what
> circumstances that's useful.
> 
> Reading between the lines the idea seems to be that this class is
> appropriate for recipes that build a collection of utilities each of
> which is essentially independent and is useful in its own right
> without any of the others.  Is that right?

Yes, this is correct.

> 
>>>> +    d.appendVar("PACKAGES", " " + " ".join(packages))
>>>> +    d.appendVar("PROVIDES", " " + " ".join(packages))
>>> It seems a bit strange to be putting the same things in PACKAGES and
>>> PROVIDES.  Is that actually necessary?
>> I want to be able to include procps-ps without the entire procps
>> package. I was not able to do that without the above two lines.
> What do you mean by "include procps-ps"?  It sounds like you're saying
> you want to be able to introduce procps-ps to DEPENDS, is that right?
> 

I want to be able to include a specific tool out of N number of tools
that a package builds into the image.

> p.

