Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 39DF77D081
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 17:45:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 452pBh2J6Sz3w;
	Mon, 13 May 2019 19:45:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557769548;
	bh=sd1hMjOow8WWYm2Mq1FE04FpAXlQnrxJgi010DBudjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MVwoLikfG6B/G+f8hKKf9QxPD6FTX/IWldZt2or+ROxYzMlvO+2TEyUh90T80lgJ8
	tnluxjcEq7g6SZlsz+OAVhl/4UJHPU5tSaOi6Wxq31lSdBT53J70lPF5ADJMUVBQLU
	hQfhU1qB1mp3B3rosIBVaul8MBP4M09O7MX5RiAGCGW9pSQw2dPOskY22o0f0NdYTq
	dNiukdUZYlxtttEPRiGlRxFgoQ2ImeKoj7hZYcVFGnFRQZJWQgPftu8uOjPqU2aYa6
	pRh19KaVDSUw9tqTyD0wK3zvl63aWKgB79IwAUZuV80r9PbQ4kJXZvnA4gu9vX1KpL
	4kAkGHsip5ARyMLJkI+coIgLwh2swzbauzKrUs0PMg7HEl6n3bvGo7zMqVVyWwAiX/
	Zul9ea+ih+iEfHChw4Vu06Iu3Vi98nI4VRS0e0Ke9QnMSFAGOJvd70DYiUOUeRti/2
	Ltaetp5vastOnwkC4uzZTpEGjxORIp44oCH3necRe405/Z0Xlni2oP2hBQV8t+hvJq
	P+Hup4JQXQUJK344bOt0zeYVZglT2vOJGJjjbYChE0ZCyYxesFSB+l0TYzvxf5TbkZ
	Hx/9OWstUvuSJ2D4uxDwZbE/LdM9Iud9UEsz5e8AsRm2KtOJt5MOlIMPCL1MiyFnXI
	eHI13B39NaeBfG40EbgnpBjY=
Date: Mon, 13 May 2019 20:45:46 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190513174546.GA19390@localhost>
References: <20190513153303.50095-1-alex.kanavin@gmail.com>
	<CAMKF1srh_U0ge_1VkPJ0TAS6hKPkybyADUXaTp7SqRnFCmPm=Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srh_U0ge_1VkPJ0TAS6hKPkybyADUXaTp7SqRnFCmPm=Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] qemux86: use a Core 2 Duo CPU instead of the original circa-1993 Pentium
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
X-List-Received-Date: Mon, 13 May 2019 17:45:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 13, 2019 at 08:54:50AM -0700, Khem Raj wrote:
> On Mon, May 13, 2019 at 8:33 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> 
> > This matches what the qemux86_64 is currently using, and
> > will allow testing the instructions added in the meantime;
> > particularly various SSE extensions are now enabled.
> 
> While I like this change I also worry if we are leaving out any significant
> x86 implementation out there in embedded space x86-64 is relatively newer
> compared to 32 bit which was long stable

Intel Quark and AMD Geode LX are still available to buy today
(Geode for at least 2 more years).

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


