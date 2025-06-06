Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F271EC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 15:53:02 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.36950.1749225179325705059
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 08:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 63EAB40C06;
	Fri,  6 Jun 2025 15:52:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qHIsxu-CP93Y; Fri,  6 Jun 2025 15:52:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1DBD640800;
	Fri,  6 Jun 2025 15:52:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4AACB169D10; Fri,  6 Jun 2025 11:52:53 -0400 (EDT)
Date: Fri, 6 Jun 2025 11:52:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: adrian.freihofer@siemens.com
Cc: Francesco Dolcini <francesco@dolcini.it>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
	"hiago.franco@toradex.com" <hiago.franco@toradex.com>
Subject: Re: [meta-ti] [PATCH v7 00/20] FIT image improvements
Message-ID: <20250606155253.GB18383@denix.org>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
 <20250606102936.GA29790@francesco-nb>
 <81913717cdad27b7ffb9c29a39fd5b6883190c22.camel@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81913717cdad27b7ffb9c29a39fd5b6883190c22.camel@siemens.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 15:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218161

On Fri, Jun 06, 2025 at 02:11:57PM +0000, Adrian Freihofer via lists.yoctoproject.org wrote:
> Hi Francesco
> 
> Congratulate, your CI is faster than I am with updating the
> documentation :-). But in the mean time published the corresponding
> documentation update too:
> https://lists.yoctoproject.org/g/docs/message/7017
> 
> Yes, unfortunately there is a breaking change. The modification has
> undergone extensive review through several months of technical meetings
> and patch review sessions. A very brief migration guide is here.
> 
> Coming from a configuration like:
>   KERNEL_IMAGETYPE = "fitImage"
>   KERNEL_CLASSES = "kernel-fitimage"
> and building a kernel like:
>   bitbake linux-yocto
> 
> needs to be changed to:
>   KERNEL_CLASSES = "kernel-fit-extra-artifacts"
> and building a kernel like:
>   bitbake linux-yocto-fitimage

Quick question here - can you still produce multple kernel types in a single 
go from a single kernel recipe? E.g. old KERNEL_IMAGETYPES = "Image fitImage"

Or are those now mutually exclusive?


> I hope that helps. Otherwise, please let me know.
> Adrian
> 
> 
> 
> 
> On Fri, 2025-06-06 at 12:29 +0200, Francesco Dolcini wrote:
> > Hello Adrian,
> >
> > On Tue, Jun 03, 2025 at 10:23:11AM +0200, AdrianF wrote:
> > > From: Adrian Freihofer <adrian.freihofer@siemens.com>
> > >
> > > This patch series re-writes the FIT image related code. The goal is
> > > to
> > > fix [YOCTO #12912] which is a long standing issue.
> >
> > I did not have time to look into the details yet, but it seems that
> > this
> > breaks build with meta-ti.
> >
> > > 06-05:18:06:33  ERROR: ParseError at
> > > /workdir/oe/build/../layers/openembedded-core/meta/classes-
> > > recipe/kernel.bbclass:183: Could not inherit file classes/kernel-
> > > fitimage.bbclass
> > > 06-05:18:06:33  ERROR: Parsing halted due to errors, see error
> > > messages above
> >
> > https://gist.github.com/dolcini/8240a229516e7a93356ebba56631d3c0
> >
> > Francesco
> >

