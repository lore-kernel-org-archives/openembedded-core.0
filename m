Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 71C5E6D548
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 15:55:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44PZJN2mGrz5c;
	Wed, 20 Mar 2019 16:55:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553097333;
	bh=moX1Lrec4vGhjUHCWnXL00dsyy77cZAN24iYePikRiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IQofwlrmmsqnzkAmP7gUFGKry31M+GLHSRsAhj6y5YHoNthmpGPidzUVMbBKUA3og
	Jnfn17+XpTTezppytqoTbgimOGlIV04STTtGjoBfT75Vi/hy62r1pZ7r3B1GyU3jtS
	sx1r5VsVk5KnJfng45+a+Mr1E3fVYViyC/aCjJwkZ4PjmJgXfatUwPR8ynfwHwv+4n
	ovtSLE68JTj7RgRLTRhovp3ji7AKbqRHXojSWB/Sb1ylYvKvmTxt2f8AtSelbVqAvF
	NmRNedKaC1NKCmtTY4hHlL11ncjQDzgy+Jf+VSD1mPaXIMSz6vkI332NzgAqQ/3YiV
	v+Op+Kj1KOGiAAV0db3FWCW/wevMZd1Wg33r5JHtQWzecDL1o5+SRuo6ksWEBhT7+k
	MtbprAH4bCGqn50RAQBU4PlxWi9N4fhnJm5msV88La7KsnGCJngNP2VdoqRafa8zhW
	LrXN8qLqgqHD2zBR6w5AmowANHBJbks+OxQzXLbD4vhovNBA7S/vN/7LsgyEu6mYrX
	hiS6Yl3o83x+cRMEx1NRPmoalbwjcwsHDsySwKPbqsMOHlKdMhsDJJ0CDXw6V/g/Wa
	TTfum9Qh7/NWd4JPmueV8fF+vWNyrUzTO7YzmDbQcpAS7XOP8NsGWE68WUuFSCM9Wh
	EZvrFghmhIcTJjw0n9NFLEB4=
Date: Wed, 20 Mar 2019 17:55:30 +0200
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190320155530.GA1365@localhost>
References: <20190320140929.24410-1-bunk@stusta.de>
	<6682ab95-b029-e881-43ee-59d3f7cfc174@gmail.com>
	<20190320145650.GA31018@localhost>
	<6251ba28-7d83-e490-c564-7e20cdb8b04f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6251ba28-7d83-e490-c564-7e20cdb8b04f@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: Upgrade 9.11.5 -> 9.11.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Mar 2019 15:55:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 20, 2019 at 08:21:31AM -0700, akuster808 wrote:
> On 3/20/19 7:56 AM, Adrian Bunk wrote:
> > On Wed, Mar 20, 2019 at 07:35:53AM -0700, akuster808 wrote:
> >>
> >> On 3/20/19 7:09 AM, Adrian Bunk wrote:
> >>> Copyright hash changed to to year change.
> >>  You are missing one of the more important bits of info that would help
> >> make the decision if this gets into M4 or waits until after 2.7 releases.
> >>
> >> Go look at the 9.11.5-p4 release notes.
> > What part of the release notes are you referring to?
> >
> > And why are you talking about release notes for a version
> > that is neither of the two versions in this upgrade?
> 
> Ah, because the 9.11.5 has patch level updates from -p1 to -p5 that are
> not the current 9.11.5 and those changes  are included in 9.11.6.

Most items in the 9.11.6 release notes are also in the 9.11.5
release notes.

> Also, nowhere was it mentioned this is a bugfix only update.

It is not a bugfix only update.

> This helps
> me in deciding if this is a back port candidate.

You are saying you were threatening to veto inclusion into 2.7 because
you aren't able to decide whether it should be backported to 2.6?

> Keywords to look for: Bugfix only, CVE's, ABI changes, dependency
> changes, depreciated functions and new features.
> 
> I are hoping a little do-diligence in being applied to package updates
> otherwise automation will save us all a bunch of time.

Doing the 9.11.5 -> 9.11.6 upgrade in master is something I wouldn't 
have suggested if I wouldn't have considered it reasonable.

Upgrading bind 9.11.4 -> 9.11.6 in thud is a case where 
automation or keywords in a commit cannot make the decision.
It doesn't look like a clear case either way to me.

The recipe maintainer might be better qualified to analyse
whether or not this is a backport candidate.

> Thanks,
> Armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


