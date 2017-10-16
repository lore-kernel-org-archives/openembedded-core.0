Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id E8F8577D6D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 17:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E0B6520901;
	Mon, 16 Oct 2017 17:48:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id VtJwgHAZu50I; Mon, 16 Oct 2017 17:48:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B3A2A20147;
	Mon, 16 Oct 2017 17:48:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 41B94162700; Mon, 16 Oct 2017 13:48:14 -0400 (EDT)
Date: Mon, 16 Oct 2017 13:48:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20171016174814.GV9221@denix.org>
References: <1507836933-142066-1-git-send-email-denis@denix.org>
	<CAJTo0LZOauk809g+8dCqk2t0sp24v6HJA6fGSQtYH0On1mC6Kg@mail.gmail.com>
	<20171013162825.GN9221@denix.org>
MIME-Version: 1.0
In-Reply-To: <20171013162825.GN9221@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] wayland-protocols: upgrade to 1.11
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
X-List-Received-Date: Mon, 16 Oct 2017 17:48:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 13, 2017 at 12:28:25PM -0400, Denys Dmytriyenko wrote:
> On Fri, Oct 13, 2017 at 12:33:35PM +0100, Burton, Ross wrote:
> > On 12 October 2017 at 20:35, Denys Dmytriyenko <denis@denix.org> wrote:
> > 
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > >
> > 
> > One day I'll figure out why quilt appears to be non-deterministic about
> > this but:
> > 
> > ERROR: wayland-protocols-1.11-r0 do_patch: Command Error: 'quilt --quiltrc
> > /data/poky-tmp/master/build/work/all-poky-linux/wayland-protocols/1.11-r0/recipe-sysroot-native/etc/quiltrc
> > push' exited with 0  Output:
> > Applying patch usesysrootprefixforpkgdatadirvariable.patch
> 
> I don't see this patch in master. Works fine in distroless and poky from 
> master.

Ping.


> > patching file wayland-protocols.pc.in
> > Hunk #1 FAILED at 1.
> > 1 out of 1 hunk FAILED -- rejects in file wayland-protocols.pc.in
> > Patch usesysrootprefixforpkgdatadirvariable.patch can be reverse-applied
> > 
> > Ross
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

