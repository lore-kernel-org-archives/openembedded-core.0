Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 5CA476FF7D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 05:01:52 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3pgGpS35MLz3hjYP;
	Wed, 13 Jan 2016 06:01:52 +0100 (CET)
X-Auth-Info: 6sFH5F7bP5qBF9YFPgqrwUkIFuZWmIDiDlLRS5OFSKI=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3pgGpS1R3fzvdWV; 
	Wed, 13 Jan 2016 06:01:52 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Jan 2016 06:01:50 +0100
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1452656212-9836-1-git-send-email-marex@denx.de>
	<CAMKF1spwghM0XJ7TP0chW4i1fwpG5qLqu=YzR8Jjc_BsLi48Hw@mail.gmail.com>
In-Reply-To: <CAMKF1spwghM0XJ7TP0chW4i1fwpG5qLqu=YzR8Jjc_BsLi48Hw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201601130601.50890.marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2016.01 release
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
X-List-Received-Date: Wed, 13 Jan 2016 05:01:52 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, January 13, 2016 at 05:49:08 AM, Khem Raj wrote:
> On Tue, Jan 12, 2016 at 7:36 PM, Marek Vasut <marex@denx.de> wrote:
> > Upgrade U-Boot to latest version and drop upstreamed patches.
> > 
> > Repair configuration of U-Boot during build. It is no longer
> > possible to run "make foomachine" in U-Boot. Instead, it is
> > necessary to do "make foomachine_defconfig ; make". Fix this
> > in u-boot.inc and u-boot-fw-utils*.bb .
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Otavio Salvador <otavio@ossystems.com.br>
> > Cc: Ross Burton <ross.burton@intel.com>
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > 
> >  meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.10.bb |   49 -
> >  meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.01.bb |   49 +
> >  meta/recipes-bsp/u-boot/u-boot-mkimage_2015.10.bb  |   32 -
> >  meta/recipes-bsp/u-boot/u-boot-mkimage_2016.01.bb  |   32 +
> 
> can you make git work hard to detect renames so its easier to review it ?
> 
> git format -C

I usually use git format-patch -M -C, but didn't do it this time.
I can do a repost if needed.

btw. do you have any other comment about this patch? It'd be nice if you
could snip out of the irrelevant part(s) of the patch so it's easier to
find the relevant comments.

> >  meta/recipes-bsp/u-boot/u-boot.inc                 |    4 +-
> >  ...-u-boot-.lds-remove-_GLOBAL_OFFSET_TABLE_.patch |  185 ---
> >  ...-non-Android-booting-with-ramdisk-and-or-.patch |   36 -
> >  ...board_f-enable-setup_board_part1-for-MIPS.patch |   59 -
> >  ...PS-bootm-rework-and-fix-broken-bootm-code.patch |  254 -----
> >  ...PS-bootm-use-CONFIG_IS_ENABLED-everywhere.patch |   93 --
> >  ...-Replace-extern-inline-with-static-inline.patch | 1184
> >  -------------------- meta/recipes-bsp/u-boot/u-boot_2015.10.bb         

[...]

Best regards,
Marek Vasut

