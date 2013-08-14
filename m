Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 829046007B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 13:07:56 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V9anr-0001S9-OG; Wed, 14 Aug 2013 15:07:55 +0200
Message-ID: <1376485672.17787.1.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 14 Aug 2013 14:07:52 +0100
In-Reply-To: <20130814122216.GX17945@jama>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
	<16c7ff9c4e9ff11888d8d6b594f5ede88a78feeb.1376038140.git.paul.eggleton@linux.intel.com>
	<20130814122216.GX17945@jama>
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] libav: add from meta-oe, update and tweak
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
X-List-Received-Date: Wed, 14 Aug 2013 13:07:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-08-14 at 14:22 +0200, Martin Jansa wrote:
> On Fri, Aug 09, 2013 at 09:59:32AM +0100, Paul Eggleton wrote:
> > Changes from the meta-oe recipe:
> > * Update stable recipe to 0.8.8
> > * Update git recipe to the tag for 9.8 (for now)
> > * Switch over to a tarball for the release version recipe
> > * Add LICENSE_FLAGS = "commercial"
> > * Set SUMMARY instead of DESCRIPTION
> > * Add yasm-native to DEPENDS since there is now a recipe for it
> > * Remove libvpx from DEPENDS and add a PACKAGECONFIG option for it,
> >   disabled by default since it wasn't actually being enabled
> > * Add a PACKAGECONFIG option for x11 to enable/disable x11grab, and
> >   add the proper DEPENDS if so (still defaults to enabled)
> > * Add a number of other PACKAGECONFIG options, replacing some old
> >   comments as well as offering the ability to disable x264.
> > * Hide text relocation warning when building for i586 (PIC can't be
> >   enabled for 32-bit x86).
> 
> only for i586? I've just seen them in armv4t build:
> WARNING: QA Issue: ELF binary '/OE/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/libav/0.8.8-r0/packages-split/libswscale/usr/lib/libswscale.so.2.1.0' has relocations in .text

That looks like you just need to add arm to...

> > + case "$arch" in
> > +-    alpha|ia64|mips|parisc|ppc|sparc)
> > ++    alpha|ia64|mips|parisc|ppc|sparc|aarch64)
> > +         spic=$shared

... this slightly odd list here.  I'm not quite sure why aargh64 is in
there but arm isn't.

p.



