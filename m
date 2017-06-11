Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id A3731780BD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 19:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E5AA120879;
	Sun, 11 Jun 2017 19:59:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Fahm2WlPks1f; Sun, 11 Jun 2017 19:59:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BE163203C2;
	Sun, 11 Jun 2017 19:59:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5A1991624EA; Sun, 11 Jun 2017 15:59:28 -0400 (EDT)
Date: Sun, 11 Jun 2017 15:59:28 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170611195928.GR28053@denix.org>
References: <20170611165839.26175-1-net147@gmail.com>
	<CAJTo0LaXFGX118Og439zY9vpv5J1R76DBhA_ttuhLeEp6EUE_g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaXFGX118Og439zY9vpv5J1R76DBhA_ttuhLeEp6EUE_g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][pyro][PATCH] bitbake.conf: Add whoami to HOSTTOOLS
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
X-List-Received-Date: Sun, 11 Jun 2017 19:59:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 11, 2017 at 08:17:09PM +0100, Burton, Ross wrote:
> On 11 June 2017 at 17:58, Jonathan Liu <net147@gmail.com> wrote:
> 
> > The whoami command is used when building the Linux kernel in
> > scripts/mkcompile_h to embed the build user that is visible
> > in /proc/version.
> >
> 
> Not if you have oe-core a5a14edb5573e33667b63b1e34cb4e19d075e8e8, in theory
> at least.  Unless you have an entirely from-scratch recipe that doesn't use
> kernel.bbclass, I guess.

Not in pyro - care to backport?

-- 
Denys

