Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 735137ECBE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 19:53:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Nvds3j9Hz9W;
	Wed,  4 Sep 2019 21:53:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567626834;
	bh=+E39ciylunJpM+dST/qWMjZwewRt1GmI9v81TfPrGVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R1VL+EHz+FrQyGUKBebGuL/tXycRishwl/Gyhfg8BK6GQJ4h3c5Yu89snQt7XgXZ/
	w01LgkNxhW9Jaeq54sr7sRDpF4DJvWvvb03A+F+tmL2XwACE3CY/zksqYjZezw2qzw
	lWZsG6DHfXUPmIGWhbWhfk2OiGA1jN+467WMLG3Z95C6H2F53wfy+dpovVvfRd6D4G
	70r4SotGLMtYn0Pf8Szq4YnmEBotXodAtZVmzxJWgry6XWK/i3eQcFimAAXWO2hwXt
	YEw/T8IKJVrIM6uz6/roifwtxONjoOsTMGzcTTCWANrr9NpY93AViS61Vqmo1Jxsp7
	aCZpOIZpnIzSEbZtkxGnqVpTv3NJdU1XIfunvEiGFT6BknlxTErC5Rh4Ew+bbY7mgk
	6osBYoXwpZO74GaIP7Obcq/3blPuzWg3XhxR+fUwkU8KzNYzcVcm/xbcZQZIKbXG04
	mGFzayY65JTgEskX1wN+QvwkTiT7aoXSOM8+TrgcqDHzP/Jgzqku/j6HcDHdamcbFu
	hGDEfXe+lHdLtUCy8KX0DU3DQ9EFxryWI5qnYvoL1bspft0+e4gv2nIm5os+XS588J
	SoNxpwKro8WTsJ4mtiUzlGBim3CKZik0iYB1cxb5FB3vOuwKQ5ADmXRssfdB3A8/hc
	3MYMJldgiNWRJgKQ2R7MdAy0=
Date: Wed, 4 Sep 2019 22:53:51 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190904195351.GA21155@localhost>
References: <20190816194405.12751-1-wesley.lindauer@gmail.com>
	<20190816194405.12751-6-wesley.lindauer@gmail.com>
	<CAMKF1sruqPBcwobNNErkdHKAnP7zT8zda81O2FUP88u=5ZnmVg@mail.gmail.com>
	<20190827180449.GA29638@localhost>
	<5fc12556-a817-e312-e1ed-60878a97d78c@windriver.com>
	<CALBQxSsXuM+926J=A=2R=X7xPSz4htuFk3pKrJ3Zpj1uK0AXDw@mail.gmail.com>
	<32b3f42b-2ff1-79c8-2777-b9a788190969@windriver.com>
	<0f8a4a800e70afe1eef8875571dbb50e1dc8f865.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <0f8a4a800e70afe1eef8875571dbb50e1dc8f865.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] xz: Remove GPLv3 license checksum
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
X-List-Received-Date: Wed, 04 Sep 2019 19:53:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Sep 04, 2019 at 07:50:35PM +0100, Richard Purdie wrote:
> On Wed, 2019-09-04 at 08:07 -0400, Mark Hatle wrote:
> > On 9/3/19 1:59 PM, Wes Lindauer wrote:
> > > Mark,
> > > 
> > > In reference to "It typically does NOT include the license of
> > > things used to
> > > build the software (such as makefiles, autoconf fragments, etc)".
> > > Since the only file that is licensed under GPLv3 is a M4 macro,
> > > does that mean
> > > the current patch is still valid? Shouldn't the GPLv3 license be
> > > removed from
> > > this recipe?
> > 
> > Unless the M4 file is generating/injecting code into the build(very
> > few I've
> > seen do this), then I would say it's not under GPLv3 at all.  (And I
> > wouldn't
> > have included GPLv3 in the LICENSE statement.)
> > 
> > But we need more consensus then just me saying so.
> > 
> > This may be a good question for the OE-TSC to ensure that we have
> > clarification
> > on this issue, and it's not just me saying I think one way or
> > another.
> 
> Not sure it needs to go to the TSC, we just need a patch which clearly
> says why the LICENSE statement is incorrect. I don't think the original
> patch in the series was clear about why GPLv3 didn't apply but if the
> commit message is improved, its probably fine.

I am getting more and more confused about both the patch and the 
semantics of LICENSE.

The status quo in the recipe is:

<--  snip  ->

# The source includes bits of PD, GPLv2, GPLv3, LGPLv2.1+, but the only file
# which is GPLv3 is an m4 macro which isn't shipped in any of our packages,
# and the LGPL bits are under lib/, which appears to be used for libgnu, which
# appears to be used for DOS builds. So we're left with GPLv2+ and PD.
LICENSE = "GPLv2+ & GPL-3.0-with-autoconf-exception & LGPLv2.1+ & PD"
LICENSE_${PN} = "GPLv2+"
LICENSE_${PN}-dev = "GPLv2+"
LICENSE_${PN}-staticdev = "GPLv2+"
LICENSE_${PN}-doc = "GPLv2+"
LICENSE_${PN}-dbg = "GPLv2+"
LICENSE_${PN}-locale = "GPLv2+"
LICENSE_liblzma = "PD"

LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                    file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
                    file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
                    file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
                    "

<--  snip  -->

My confusion about the patch is that it removes COPYING.GPLv3 from 
LIC_FILES_CHKSUM but keeps GPL-3.0-with-autoconf-exception in LICENSE.

My confusion about the semantics of LICENSE is that I fail to find a 
clear statement in the documentation that the legal meaning of LICENSE 
in OE is what Mark claims it would be. Is this just Marks personal 
opinion on what should be done, or is this undocumented tribal 
knowledge, or is the exact semantics of LICENSE documented
somewhere in a language that lawyers understand?

My guess for the latter would be "undocumented tribal knowledge",
and clarification is required what is actually correct or incorrect
here. And I think this is also what Mark was asking for.

> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


