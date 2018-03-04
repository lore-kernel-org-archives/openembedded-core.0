Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 410D160291
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 18:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 05B9420B2C;
	Sun,  4 Mar 2018 18:57:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2s9gWVmejDa0; Sun,  4 Mar 2018 18:57:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C766C20855;
	Sun,  4 Mar 2018 18:57:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3A673163308; Sun,  4 Mar 2018 13:57:17 -0500 (EST)
Date: Sun, 4 Mar 2018 13:57:17 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180304185717.GW2786@denix.org>
References: <1520041611-39622-1-git-send-email-denis@denix.org>
	<1520184325.3436.74.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1520184325.3436.74.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] busybox: separate inittab into own package, due to SERIAL_CONSOLES being machine-specific
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
X-List-Received-Date: Sun, 04 Mar 2018 18:57:19 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Mar 04, 2018 at 05:25:25PM +0000, Richard Purdie wrote:
> On Fri, 2018-03-02 at 20:46 -0500, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > * Create busybox-inittab recipe to produce machine-specific package
> > with /etc/inittab
> >   and necessary getty calls for a machine, based on SERIAL_CONSOLES,
> > similar to how
> >   sysvinit-inittab was done
> > 
> > * Since CONFIG_FEATURE_USE_INITTAB is controlled by VIRTUAL-
> > RUNTIME_init_manager, make
> >   main busybox package RDEPENDS on busybox-inittab when init_manager
> > is set to busybox
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../recipes-core/busybox/busybox-inittab_1.27.2.bb | 32
> > ++++++++++++++++++++++
> >  meta/recipes-core/busybox/busybox.inc              | 12 ++------
> >  2 files changed, 34 insertions(+), 10 deletions(-)
> >  create mode 100644 meta/recipes-core/busybox/busybox-
> > inittab_1.27.2.bb
> 
> 
> Can you send a patch to fix:
> 
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/878/steps/Running%20oe-selftest/logs/stdio
> 
> i.e. 
> 
> oe-selftest -r distrodata.Distrodata.test_maintainers
> 
> please? (missing maintainers entry for busybox-inittab)

Ah, I was hoping it would be covered by the main busybox entry...

Should I add myself for busybox-inittab, or original maintainer, Armin?

-- 
Denys

