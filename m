Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by mail.openembedded.org (Postfix) with ESMTP id 6FBF8605BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 12:57:34 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 61C98905; Mon, 22 Sep 2014 14:57:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 272EC6F3;
	Mon, 22 Sep 2014 14:57:36 +0200 (CEST)
Date: Mon, 22 Sep 2014 14:57:31 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Message-ID: <20140922125731.GB25675@piout.net>
References: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
MIME-Version: 1.0
In-Reply-To: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Denys Dmytriyenko <denys@ti.com>, Tom Zanussi <tom.zanussi@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [Patch 0/9]: support for generating SD images from wic
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
X-List-Received-Date: Mon, 22 Sep 2014 12:57:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On 22/09/2014 at 13:35:12 +0200, Maciej Borzecki wrote :
> This patch series is a proposal that adds support for generating SD
> card images for embedded boards using wic. I did not want to cross
> post to meta-ti and meta-freescale so Denys and Otavio are added in
> CC. I would be glad to receive some feedback from you.
> 
> So far, the 2 most common scenarios I've seen are that either the boot
> files need to be located in a specific partition, or the bootloader is
> located within the disk image, typically directly following MBR. The
> series implements support for the first case. The second case should
> be easily supportable on top of this code.
> 
> Within the context of boot partition, the proposal adds a new variable
> IMAGE_BOOT_FILES. The variable contains a list of files that need to
> be copied to the boot partition, possibly being renamed during the
> process (example BBB support lists u-boot.img and MLO, analogical
> config can be made up for RsPI). By default the files are picked up
> from DEPLOY_DIR_IMAGE.
> 
> Patches 1-4 solve some general problems in wic, so if these go through
> review I'd recommend merging them to master. If that's more convenient
> I can post them again as a separate series.
> 
> Patches 5-8 implement IMAGE_BOOT_FILES support, wic source plugin and
> a kickstart for SD card.
> 
> Patch 9 adds IMAGE_BOOT_FILES to yocto-bsp BBB config.
> 

For the whole series:
Tested-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

I tested on a custom am335x based platform.

Thanks !

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

