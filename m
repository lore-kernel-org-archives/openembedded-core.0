Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.11942.1589462173543645259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 06:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=D1Zj/2yT;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=glre=64=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49NBr82dmqz5l;
	Thu, 14 May 2020 15:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589462170;
	bh=wYfFqk8NbSZxh4rkwrCrTQxQ+kZSQ8N27DI24oz4wDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D1Zj/2yTi/5IS3ay1dXZh2/Pjlmz4t9UYhmFkw3DMZGbpxjN65QFYzjISTEHo3ClE
	 s/uQ4FHTxAEvKCwi2n9v5gO7WVmRVMkmsSehH6njd9cgxy387fcdcgSTZGMOBFs0Si
	 8kAQdE4qDufkJi7kEkHGAhMgY8e4xF7+fnFJR1IuhpKxUnUmGirmpBHN6WFQUg6n4y
	 5hF4IZUbHNgyt2MfB3a64hcNRnjKfgX0XfozLUgqkLsyFIFDdjcevH9L0h1m7xMv3O
	 ntrw/a1Y/w6wrsK3WQTkPP6s1+8cjfeQLTqzxvua3toE054eIhTUTnMugfImM3cXc+
	 kGr+ekwY2U4ALYZtqaXQ976SC7MbvmDy8L7+iNUYYRXFE9j5jBjs1TjDrlSfSWBHrW
	 A0ejMxWnE/jfWGQsI3ZIsPccPhdHnBMQBmiSGoFNPrfTUCzUA/yXAnfhLRYypEYoyZ
	 As4WP4tLxJsItLXt3rQDZp1uMc6V91RplX6it7h1clc4zmntaxlauvJ3PzwhAa8aMU
	 7Ap06gn9P1F3XpazzQrVdeZXvOFm/Ux/ehFNJZgD7L6qW0CuQH1B//0/YJs+VQAaJU
	 xvU5ayZcIRH6C5+cPxGKcl2dIgRvFHbq4wrQFc6b0dbiIWpWqzhEiIHdlztXm55Cxa
	 y0u/JUL/sxRq9UwvFTt69Q1Q=
Date: Thu, 14 May 2020 16:16:06 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V3 3/3] gcc10: Revert using __getauxval in libgcc
Message-ID: <20200514131606.GA17383@localhost>
References: <20200511182812.441561-1-raj.khem@gmail.com>
 <20200511182812.441561-3-raj.khem@gmail.com>
 <20200514073821.GA16323@localhost>
 <CAMKF1sp0G_fz0Jjf5z4=qR5rTVK-miTABZjdkQn2FK2Ypm4v2g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp0G_fz0Jjf5z4=qR5rTVK-miTABZjdkQn2FK2Ypm4v2g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 14, 2020 at 05:47:48AM -0700, Khem Raj wrote:
> On Thu, May 14, 2020 at 12:38 AM Adrian Bunk <bunk@stusta.de> wrote:
> > On Mon, May 11, 2020 at 11:28:12AM -0700, Khem Raj wrote:
> > > This was added recently, but it seems be chewing more than what it
> > > should and causes non glibc packages also depend on it.
> > >...
> >
> > Is this only valgrind (there is a upstream bug open for that),
> > or were there more recipes with a problem?
> 
> Just valgrind but problem can happen with static linking with no default
> libs in general

No, it cannot.
The relevant part of "no default libs" is not linking with libc.

Linking statically with libgcc and then providing own implementations
of all libc functions used by libgcc instead of linking with libc is
not a common situation.

cu
Adrian
