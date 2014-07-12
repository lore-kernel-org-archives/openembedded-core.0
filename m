Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id A47517030B;
	Sat, 12 Jul 2014 08:41:37 +0000 (UTC)
Received: from [99.240.204.5] (port=49868 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X5ssD-0008Hm-D5; Sat, 12 Jul 2014 04:41:37 -0400
Date: Sat, 12 Jul 2014 04:41:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAMKF1spgCphqN7PVskjP_bHd2CfsBRi52y=KJ2fWyjwQxw0cYw@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1407120436510.28008@localhost>
References: <alpine.LFD.2.11.1407111821080.6262@localhost>
	<CAP9ODKqwOXV+GxNhoPFXJWcjLipD1P176Qcy0bBNMuzF9=Bhng@mail.gmail.com>
	<CAMKF1spgCphqN7PVskjP_bHd2CfsBRi52y=KJ2fWyjwQxw0cYw@mail.gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH] core-image.bbclass: Reformat definition of CORE_IMAGE_BASE_INSTALL
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
X-List-Received-Date: Sat, 12 Jul 2014 08:41:40 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 11 Jul 2014, Khem Raj wrote:

> On Fri, Jul 11, 2014 at 4:41 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
> > Hello,
> >
> > +OE-Core
> >
> > On Fri, Jul 11, 2014 at 7:23 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >>
> >> Reformat the assignment to CORE_IMAGE_BASE_INSTALL to be more
> >> intuitively obvious.
> >>
> >> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >>
> >> ---
> >>
> >>   compile and run-time tested, building a core-image-minimal for
> >> qemuarm.
> >>
> >> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
> >> index 1b36cba..d2b9d69 100644
> >> --- a/meta/classes/core-image.bbclass
> >> +++ b/meta/classes/core-image.bbclass
> >> @@ -59,13 +59,11 @@ MACHINE_HWCODECS ??= ""
> >>  CORE_IMAGE_BASE_INSTALL = '\
> >>      packagegroup-core-boot \
> >>      packagegroup-base-extended \
> >> -    \
> >> -    ${CORE_IMAGE_EXTRA_INSTALL} \
> >>      '
> >>
> >>  CORE_IMAGE_EXTRA_INSTALL ?= ""
> >>
> >> -IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
> >> +IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL} ${CORE_IMAGE_EXTRA_INSTALL}"
> >
> > For me, more intuitively would be:
> >
> > CORE_IMAGE_BASE_INSTALL ?= ...
>
> weak assignment here would mean overridable base install which is
> not the intention. we want a working base image when inheriting
> core-image

  except that that argument doesn't really hold water given how one
can inherit core-image, then (as i pointed out) immediately wipe out
that supposedly inviolable definition of CORE_IMAGE_BASE_INSTALL by
simply reassigning to IMAGE_INSTALL.

  i *like* the idea of a weak assignment to CORE_IMAGE_BASE INSTALL.
it's effectively what core-image-minimal is doing anyway, it just
allows you to do it in a way that's not grotesquely ugly.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

