Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2c94-0001k9-NJ
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 05:27:39 +0100
Received: by iyb26 with SMTP id 26so9721195iyb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 21:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=011VTeO/qVO5A7q8beHrYIZItAKjgGdH31B+T7VsPF4=;
	b=rErnoDE5uu99QBVzOgx22AfAJQCJDKfcgTqiN7Why1ihcxqiPtPdr1jmLv+4yhfg0n
	ObDmHM1aoRbSkOwxF29WwAU1abp/aDPOCriIqCtCl42Kw4Mi4gH9AQ2hfI1cQG7L4uK/
	9wf6NIn1sp6lLKqYFDq12wn5jlPoZp1Rbwiws=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=r30UHm+5W/s2A03tW9l+95oNS0IkdxiiuWTuxxF/mnfPvlZdz1+VR4dtqJb8ooERTr
	SSQJp0z/qybUoudnWBuUR5YLF+0RPqBkV/2Kp78IurLLfxcXb14Dj+IY9ZUgxzRKhoVQ
	SIXar/0jXZ1dwz4xkbhB7ch+zbf/RtjsrEEgs=
Received: by 10.42.29.131 with SMTP id r3mr8910106icc.99.1300940746100;
	Wed, 23 Mar 2011 21:25:46 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c4sm5704069ict.19.2011.03.23.21.25.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2011 21:25:45 -0700 (PDT)
Date: Wed, 23 Mar 2011 21:26:10 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20110324042610.GB9120@sakrah.homelinux.org>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
	<AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
	<F4596E6F-7714-4DC4-B5C5-C647CCFFAC26@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <F4596E6F-7714-4DC4-B5C5-C647CCFFAC26@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] recipes-efl inside meta-oe or meta-efl next to meta-oe?
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
X-List-Received-Date: Thu, 24 Mar 2011 04:27:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/03/11 16:33), Koen Kooi wrote:
> 
> Op 23 mrt 2011, om 16:19 heeft Khem Raj het volgende geschreven:
> 
> > On Wed, Mar 23, 2011 at 4:49 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >> Hi,
> >> 
> >> I'd like to import the EFL recipes Martin did from meta-shr into the meta-openembedded repo. Before I go bothering Martin about it, what would be the best place to put them?
> >> 
> >> Inside meta-oe:
> >> 
> >> meta-openembedded/
> >>        meta-oe/
> >>                recipes-efl
> > 
> > Can efl we layered directly on top of oe-core  ? i.e. without needing meta-oe
> > in that case its better to be an independent layer. otherwise I would say put
> > them under recipes-efl
> 
> I think that's a misleading heuristic, I would like to give people the option to opt-in for extra recipes (parse time, legal sign-off, etc), instead of stuffing 5k recipes into meta-oe.
> If the person looking after efl* wants it in meta-oe, so be it, it's the maintainers call.

Obviously I was thinking of plug and play layers but that may not work
always in practice

> 
> regards,
> 
> Koen

-- 
-Khem


