Return-Path: <angelo@sysam.it>
Received: from sysam.it (ec2-18-194-220-216.eu-central-1.compute.amazonaws.com
	[18.194.220.216])
	by mail.openembedded.org (Postfix) with ESMTP id ABBFF7987E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 15:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sysam.it (Postfix) with ESMTP id CA5A420969;
	Thu,  4 Oct 2018 15:08:29 +0000 (UTC)
Received: from sysam.it ([127.0.0.1])
	by localhost (sysam.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HALPjGlK87u9; Thu,  4 Oct 2018 15:08:28 +0000 (UTC)
Received: from jerusalem (host70-5-dynamic.16-79-r.retail.telecomitalia.it
	[79.16.5.70]) by sysam.it (Postfix) with ESMTPSA id 258F520967;
	Thu,  4 Oct 2018 15:08:28 +0000 (UTC)
Date: Thu, 4 Oct 2018 17:08:27 +0200
From: Angelo Dureghello <angelo@sysam.it>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20181004150827.GA15761@jerusalem>
References: <20181004132953.3568-1-angelo@sysam.it>
	<CAJTo0LakckQ+=uGaP9Nf-Mg4i53=7w4FsuhGY7bC1Tv3t7HNSQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LakckQ+=uGaP9Nf-Mg4i53=7w4FsuhGY7bC1Tv3t7HNSQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: (No subject)
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
X-List-Received-Date: Thu, 04 Oct 2018 15:19:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Burton,

On Thu, Oct 04, 2018 at 02:55:37PM +0100, Burton, Ross wrote:
> I'm curious: the data sheet for the processor you mention in 4/4 says
> that it ha 64K of RAM.  Are there other processors in the range, or
> have you done incredible things?
>

64KB is the internal static ram (SRAM), that's commonly 4 to 64K
for this family (i.e. some recent arm reachs 512K).
Then there is the built-in SDRAM/DDR2 controller :)
where i connect 128MB of DDR2(SDRAM), but other boards may have more.

Linux runs fine in ColdFire family from a long time. Initially only
non-MMU uClinux, now also the mainline kernel with MMU enabled.
 
Regards,
Angelo
 
> Ross
> On Thu, 4 Oct 2018 at 14:30, Angelo Dureghello <angelo@sysam.it> wrote:
> >
> >
> > This patch serie adds initial support for m68k architecture.
> > A Linux kernel build has been tested successfully using a local
> > meta layer, or kernel-yocto.
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

