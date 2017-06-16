Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 176727847D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 15:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 721B120B7A;
	Fri, 16 Jun 2017 15:24:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id K5tkjzz6ZB8Z; Fri, 16 Jun 2017 15:24:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 50A2B207A3;
	Fri, 16 Jun 2017 15:24:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CD3BF162504; Fri, 16 Jun 2017 11:24:26 -0400 (EDT)
Date: Fri, 16 Jun 2017 11:24:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170616152426.GG28053@denix.org>
References: <1497602780-1744-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1497604955.24449.12.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1497604955.24449.12.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_ipk: Clean up Source entry in ipk packages
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
X-List-Received-Date: Fri, 16 Jun 2017 15:24:28 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jun 16, 2017 at 10:22:35AM +0100, Richard Purdie wrote:
> On Fri, 2017-06-16 at 09:46 +0100, Richard Purdie wrote:
> > There is the potential for sensitive information to leak through the
> > urls
> > there and removing it brings this into the behavior of the other
> > package
> > backends since filtering it is likely error prone.
> > 
> > Since ipks don't appear to be generated at all if we don't set this,
> > set
> > the field to the recipe name used (basename only, no paths). This
> > avoids
> > information leaking. We may want to drop the field if opkg can allow
> > that
> > at a future point but the recipe name is a suitable identifier for
> > now.
> > 
> > Reported-by: Andrej Valek <andrej.valek@siemens.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/package_ipk.bbclass | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> Since this is rather important I have backported this to
> pyro/morty/krogoth with the appropriate tweaks.

Ouch! We were actually using that field to generate the URL list for the 
Software Manifest out of the package feed...

Was this discussed before? Can this change be made optional?

-- 
Denys

