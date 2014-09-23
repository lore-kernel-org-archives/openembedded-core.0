Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB8771527
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 19:29:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Sep 2014 12:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,581,1406617200"; d="scan'208";a="607357203"
Received: from justinda-mobl1.ger.corp.intel.com (HELO [10.255.12.217])
	([10.255.12.217])
	by orsmga002.jf.intel.com with ESMTP; 23 Sep 2014 12:28:43 -0700
Message-ID: <1411500521.26861.33.camel@empanada.home.network>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Date: Tue, 23 Sep 2014 14:28:41 -0500
In-Reply-To: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>, Otavio Salvador <otavio@ossystems.com.br>,
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
X-List-Received-Date: Tue, 23 Sep 2014 19:29:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-09-22 at 13:35 +0200, Maciej Borzecki wrote:
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

This is a nice addition and thanks for fixing the smaller problems you
found.

For the whole series:

Acked-by: Tom Zanussi <tom.zanussi@intel.com>



