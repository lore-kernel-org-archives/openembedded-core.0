Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC87731C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 04:41:04 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3pgtHz72t8z3hjc3;
	Thu, 14 Jan 2016 05:41:03 +0100 (CET)
X-Auth-Info: DTQkpo3E2FG1BDVb/dXr2cXisBc3q+uA/TewdZ55ibY=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3pgtHz5t5YzvdWV; 
	Thu, 14 Jan 2016 05:41:03 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Jan 2016 05:41:04 +0100
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1452741432-10746-1-git-send-email-marex@denx.de>
	<3EB3A651-B3EE-4E31-9A2D-F4D9D71EC4FA@gmail.com>
In-Reply-To: <3EB3A651-B3EE-4E31-9A2D-F4D9D71EC4FA@gmail.com>
MIME-Version: 1.0
Message-Id: <201601140541.04430.marex@denx.de>
Cc: trini@konsulko.com, Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] u-boot: Update to 2016.01 release
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
X-List-Received-Date: Thu, 14 Jan 2016 04:41:05 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, January 14, 2016 at 05:04:22 AM, Khem Raj wrote:
> > On Jan 13, 2016, at 7:17 PM, Marek Vasut <marex@denx.de> wrote:
> > 
> > Upgrade U-Boot to latest version and drop upstreamed patches.
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Otavio Salvador <otavio@ossystems.com.br>
> > Cc: Ross Burton <ross.burton@intel.com>
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > V2: Drop the _defconfig addition to make ${UBOOT_MACHINE} . This leaves
> > 
> >    U-Boot build broken unless you abuse the UBOOT_MACHINE variable to
> >    explicitly contain the _defconfig bit. Apparently, some BSPs depend
> >    on this behavior.
> 
> This looks fine now.

Thanks. Are there any further comments down below ?

> > ---
> > ...utils_2015.10.bb => u-boot-fw-utils_2016.01.bb} |    6 +-
> > ...kimage_2015.10.bb => u-boot-mkimage_2016.01.bb} |    6 +-
> > ...-u-boot-.lds-remove-_GLOBAL_OFFSET_TABLE_.patch |  185 ---
> > ...-non-Android-booting-with-ramdisk-and-or-.patch |   36 -
> > ...board_f-enable-setup_board_part1-for-MIPS.patch |   59 -
> > ...PS-bootm-rework-and-fix-broken-bootm-code.patch |  254 -----
> > ...PS-bootm-use-CONFIG_IS_ENABLED-everywhere.patch |   93 --
> > ...-Replace-extern-inline-with-static-inline.patch | 1184
> > -------------------- meta/recipes-bsp/u-boot/u-boot_2015.10.bb         

[...]

Best regards,
Marek Vasut

