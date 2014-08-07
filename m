Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 498A160169
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 20:15:33 +0000 (UTC)
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3hTgtZ41Msz3hhsl;
	Thu,  7 Aug 2014 22:15:34 +0200 (CEST)
X-Auth-Info: CnfBd6afH+Sa/jYPC7gZHWOxIGBmysTE+OkExZny6Pc=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3hTgtZ1B3zz7S6Rv; 
	Thu,  7 Aug 2014 22:15:34 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Saul Wold <sgw@linux.intel.com>
Date: Thu, 7 Aug 2014 22:15:33 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1407424632-32649-1-git-send-email-marex@denx.de>
	<53E3DD34.4000100@linux.intel.com>
In-Reply-To: <53E3DD34.4000100@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201408072215.33862.marex@denx.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Add initial fitImage support
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
X-List-Received-Date: Thu, 07 Aug 2014 20:15:36 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, August 07, 2014 at 10:10:28 PM, Saul Wold wrote:
> On 08/07/2014 08:17 AM, Marek Vasut wrote:
> > The fitImage is a successor of the U-Boot uImage format, which is
> > considered legacy for years now. The fitImage allows packing multiple
> > kernel images, DTBs and other artifacts into a single image, which can
> > then be protected by SHA checksums and does even support signing the
> > images for verified boot.
> > 
> > This patchset is the first stab at adding the new image format into
> > Yocto.
> > 
> > Marek Vasut (5):
> >    Yocto: kernel: Rework do_uboot_mkimage
> >    Yocto: kernel: Pull out the linux.bin generation
> >    Yocto: kernel: Clean up KERNEL_IMAGETYPE_FOR_MAKE
> >    Yocto: kernel: Build DTBs early
> >    Yocto: kernel: Add basic fitImage support
> >   
> >   meta/classes/kernel.bbclass             | 229
> >   +++++++++++++++++++++++++++++---
> >   meta/recipes-kernel/linux/linux-dtb.inc |  14 +-
> >   2 files changed, 226 insertions(+), 17 deletions(-)
> 
> Hi Marek,
> 
> I am going to make a general request, can you please review the Commit
> Guildlines Wiki for Openembedded:
> 
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> 
> We appreciate your patches, but the commit messages need to be formatted
> correctly.  The Yocto: tag is not needed and you could clearly include
> which recipe, bbclass, file or subsystem (if across multiple files) so
> in the above it would be kernel.bbclass: ...
> 
> If you could please resubmit your changes with the correct commit
> summary for this series and your other patches that would be greatly
> appreciated.
> 
> Myself and others may have further feedback on your patches.

Ah, thanks! I'll give it a few days and will do V2 as per guidelines. Sorry for 
the mistake.

Best regards,
Marek Vasut

