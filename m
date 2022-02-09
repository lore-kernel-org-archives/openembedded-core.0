Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <6b2b59da15e0889c58c2a79515870994aa29a5c8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][master][PATCHv2] buildhistory.bbclass: Enable exporting more recipe and package data
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 09 Feb 2022 15:34:16 +0000
In-Reply-To: <YgPPaRecZGTG2MF9@korppu>
References: <20220209092947.25677-1-sanakazisk19@gmail.com>
	 <c2d76693b74d961e97ef38470dad1f60c425f889.camel@linuxfoundation.org>
	 <YgPBUKU8qutnuI8I@korppu>
	 <3909a8bd81a99f80cbcafa66b68c2601b4a2235e.camel@linuxfoundation.org>
	 <YgPPaRecZGTG2MF9@korppu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Mikko.Rapeli@bmw.de
Cc: sanakazisk19@gmail.com, openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com

On Wed, 2022-02-09 at 14:27 +0000, Mikko.Rapeli@bmw.de wrote:
> On Wed, Feb 09, 2022 at 01:40:22PM +0000, Richard Purdie wrote:
> > On Wed, 2022-02-09 at 13:27 +0000, Mikko.Rapeli@bmw.de wrote:
> > > Hi,
> > > 
> > > On Wed, Feb 09, 2022 at 12:23:39PM +0000, Richard Purdie wrote:
> > > > People have requested changes like this before and I rejected it as I'm worried
> > > > that allowing people to customise this code will just fork the project into many
> > > > different directions. 
> > > 
> > > It's the other way round. There are a lot of needs to extract metadata from
> > > build system into something where reports can be generated.
> > 
> > I don't doubt that however buildhistory was written for a specific purpose and
> > if we start adding the ability to customise it heavily we lose the ability for
> > comparisions to be made, or sstate reuse and so on.
> > 
> > I'm partly channelling the original author's views on this since they had some
> > very specific thoughts on this change. I do sometimes wonder if I should
> > continue doing that though :/.
> 
> Then how should yocto users export CVE_NAME, LICENSE, PN, PV, SRC_URI etc from
> the build system to generate SW bill of materials (BOM) for their product
> and track progress?
> 
> Yes, SPDX can be the other answer but I don't find that human readable or working
> out of the box atm.

buildhistory was not intended for SBOM generation, that is what create-spdx is
being developed for. They have two quite different intentions and trying to turn
one into the other is why I have concerns about this patch.

For example, of we did go this way, next, we may need to either write a
converter of buildhistory to SPDX format, or change buildhistory to use SPDX
format so that it has a standard SBOM output form. This is not the direction we
want/need to go.

Cheers,

Richard

