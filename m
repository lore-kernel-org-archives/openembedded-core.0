Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DA2F26006E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 17:05:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44PbsP0pmyz4x;
	Wed, 20 Mar 2019 18:05:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553101545;
	bh=a3ImdxlPcWbtdYF1fzXjKyOPX+9KvNdQWfDLCQY2jjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QaiOIPG46ArNBbMGUOMpMPx8mGftsXiEF/GSr+qhDIutPFOO7ybusGMTYDbXb1g/Z
	KDIwIooosUO6QRdXpNVqGt+SHF376RgMlgZ7uWy+a9U1//J8r/6TlHDD4YTJLIhv0j
	Tw9NRc1mcw1HoexAePvcbyHqNVEJM4p34ZEvx3B8hBa3adjcjB9rYoq/x17y6J5t7e
	BftgSf8G5vPuYbXIUG5K31GEr7qVhlaJNc65HBz8dMmwIOrQU216tKF7wl9AVyQXEi
	gaPwsVo3g6nhVPM0GuZY2GPA8BNY51g6+0HDHlkjBwoML92Aft/8qxEnuImOwDtkC2
	eh5YVU1+kzLyCjf8j5sPQ/miA7WFre9D042g6tzWzezdXr6kLz4GHtrlOyV/xJW5EH
	1xjA0n5+whe5TPOg0qHiZv8zJ59YOwMOtWIwUnTPVnSWWvGr5UgR/xgce6U+W1KRK4
	ILkCFvpj2aEQIrfogCFtmUkrIAcqngZlm8s85mODEPIrpRZcR2DL4LXJmne2D7cxa3
	SLWCd2t1F7DMIqvT++d9cuNWSMoXeMwCYBZgDF6+4c7UHUb59uHseA34c07aVey6ly
	MoVMbZkcuwJufuSNLQstaiu4L8hHJ1bPjCMzWAGdcJI1XbP1mpP1Ha4eEO3rvq5SEG
	o8aD0hDye9Dew7Zk0d93T4Js=
Date: Wed, 20 Mar 2019 19:05:43 +0200
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190320170543.GA3358@localhost>
References: <20190320140929.24410-1-bunk@stusta.de>
	<6682ab95-b029-e881-43ee-59d3f7cfc174@gmail.com>
	<20190320145650.GA31018@localhost>
	<6251ba28-7d83-e490-c564-7e20cdb8b04f@gmail.com>
	<20190320155530.GA1365@localhost>
	<bed849b4-7b7c-89f4-40ca-1581a1e87023@gmail.com>
MIME-Version: 1.0
In-Reply-To: <bed849b4-7b7c-89f4-40ca-1581a1e87023@gmail.com>
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
X-List-Received-Date: Wed, 20 Mar 2019 17:05:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 20, 2019 at 09:33:56AM -0700, akuster808 wrote:
> 
> 
> On 3/20/19 8:55 AM, Adrian Bunk wrote:
> > On Wed, Mar 20, 2019 at 08:21:31AM -0700, akuster808 wrote:
> >> On 3/20/19 7:56 AM, Adrian Bunk wrote:
> >>> On Wed, Mar 20, 2019 at 07:35:53AM -0700, akuster808 wrote:
> >>>> On 3/20/19 7:09 AM, Adrian Bunk wrote:
> >>>>> Copyright hash changed to to year change.
> >>>>  You are missing one of the more important bits of info that would help
> >>>> make the decision if this gets into M4 or waits until after 2.7 releases.
> >>>>
> >>>> Go look at the 9.11.5-p4 release notes.
> >>> What part of the release notes are you referring to?
> >>>
> >>> And why are you talking about release notes for a version
> >>> that is neither of the two versions in this upgrade?
> >> Ah, because the 9.11.5 has patch level updates from -p1 to -p5 that are
> >> not the current 9.11.5 and those changes  are included in 9.11.6.
> > Most items in the 9.11.6 release notes are also in the 9.11.5
> > release notes.
> 
> 9.11.5-P4 
> 
>   * CVE-2018-5744: A specially crafted packet can cause named to leak
>     memory
>     <https://lists.isc.org/pipermail/bind-announce/2019-February/001115.html> 
>     /Michael McNally /
>   * CVE-2018-5745: An assertion failure can occur if a trust anchor
>     rolls over to an unsupported key algorithm when using managed-keys
>     <https://lists.isc.org/pipermail/bind-announce/2019-February/001116.html> 
>     /Michael McNally /
>   * CVE-2019-6465: Controls for zone transfers might not be properly
>     applied to Dynamically Loadable Zones (DLZs) if the zones are
>     writable.
>     <https://lists.isc.org/pipermail/bind-announce/2019-February/001117.html> 
>     /Michael McNally /
> 
> 
> please add just the CVE references to the commit message.

Precedent in master seems to be to not list CVEs fixed in new upstream,
only when CVE fixes get backported.

Justifying my patch with CVE numbers would also be wrong since for only 
these CVE fixes 9.11.5-p4 would be better than 9.11.6.

> >> Also, nowhere was it mentioned this is a bugfix only update.
> > It is not a bugfix only update.
> 
> The 9.11 series is a Extended Supported Version. (ESV) release.  Use the
> software for Production Environments needing infrequent upgrades and no
> new features.
> 
> https://www.isc.org/downloads/software-support-policy/version-numbering/

I am not disputing that it is an LTS series.

But 9.11.5 -> 9.11.6 is not a bugfix only update.

> >> This helps
> >> me in deciding if this is a back port candidate.
> > You are saying you were threatening to veto inclusion into 2.7 because
> > you aren't able to decide whether it should be backported to 2.6?
> 
> Not at all. We have entered 2.7 M3 which includes freezing package
> updates. The ones that have the best chance of getting in are ones that
> are bugfixes and or include CVE fixes. Without any information, the
> chance on being included goes down. Having more info in the commit
> message helps Richard and Ross to decide if they should include it.
>...
> I am the package maintainer and I appreciate folks helping me support
> the packages I maintain with in updates and fixes.

Do whatever you want to do, it's best to end the discussion at this point.

> regards,
> Armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


