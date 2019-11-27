Return-Path: <pb@pbcl.net>
Received: from pbcl.net (pbcl.net [159.69.221.92])
	by mail.openembedded.org (Postfix) with ESMTP id F07AC7FA0E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 15:07:41 +0000 (UTC)
Received: from pb by pbcl.net with local (Exim 4.89)
	(envelope-from <pb@pbcl.net>)
	id 1iZyuf-0008NV-3i; Wed, 27 Nov 2019 16:07:29 +0100
Date: Wed, 27 Nov 2019 16:07:29 +0100
From: Phil Blundell <pb@pbcl.net>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20191127150729.hzgkcifbrerveady@pbcl.net>
References: <CANNYZj9uAs5wQPya6R9q3gfSQm_Xyu9xViGBxOQ2COKKbcYeWg@mail.gmail.com>
	<20191120223207.6cuuklpgrzuhqug3@pbcl.net>
	<CANNYZj93tJxTsCwS3cg3J=0WB--A0Af26Y=nO9fOdfNb9okRYg@mail.gmail.com>
	<20191120231812.GB3962@localhost>
	<238a39c7-b794-aaa0-1da6-4b585078f447@intel.com>
	<fc3a26d7c77f2781cbad28cdb8fc71995ab5e327.camel@linuxfoundation.org>
	<20191121135942.h776ktsg6jwow4sj@pbcl.net>
	<32d99e6a-b196-6d1d-dac2-a0e1ccfa2c75@intel.com>
	<20191126115954.f4mlttmrp2ieahax@pbcl.net>
	<69bd2c0d-ef6d-b194-c36e-d91594e8bd68@intel.com>
MIME-Version: 1.0
In-Reply-To: <69bd2c0d-ef6d-b194-c36e-d91594e8bd68@intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 08/11] lrzsz: remove the recipe
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
X-List-Received-Date: Wed, 27 Nov 2019 15:07:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 27, 2019 at 02:32:46PM +0000, Ross Burton wrote:
> On 26/11/2019 11:59, Phil Blundell wrote:
> > On Mon, Nov 25, 2019 at 12:07:25PM +0000, Ross Burton wrote:
> > > If you can send a patch sooner rather than later for lrzsz to fix the build
> > > with modern gettext then that would be *awesome*, as this recipe is the sole
> > > blocker.
> 
> We run autoreconf as part of do_configure, so why is this patch shipping
> replacement aclocal/configure/etc files that are going to be overwritten?

Because you said you wanted the patch sooner rather than later, and the easiest
way to do that was to update the whole package to use modern autotools, generate
a new tarball with "make dist", and then just generate a diff between the old
and new tarballs.  If what you actually want is a minimal patch, I can do that 
but it will take longer.

p.

