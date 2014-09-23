Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 6998365FFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 18:31:33 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCD00KDVA411J00@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 23 Sep 2014 13:31:13 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 40B7720357; Tue,
	23 Sep 2014 14:31:13 -0400 (EDT)
Date: Tue, 23 Sep 2014 14:31:13 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Message-id: <20140923183113.GC2480@denix.org>
References: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1411385721-22264-10-git-send-email-maciej.borzecki@open-rnd.pl>
MIME-version: 1.0
In-reply-to: <1411385721-22264-10-git-send-email-maciej.borzecki@open-rnd.pl>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>, Tom Zanussi <tom.zanussi@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Maciek Borzecki <maciek.borzecki@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 9/9] beaglebone.conf: add IMAGE_BOOT_FILES
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
X-List-Received-Date: Tue, 23 Sep 2014 18:31:39 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Sep 22, 2014 at 01:35:21PM +0200, Maciej Borzecki wrote:
> Set IMAGE_BOOT_FILES to list of files that end up in boot
> partition. This in turn is used by wic to generate a bootable SD card
> image.
> 
> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

But meta-yocto-bsp is not part of openembedded-core...


> ---
>  meta-yocto-bsp/conf/machine/beaglebone.conf | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-yocto-bsp/conf/machine/beaglebone.conf b/meta-yocto-bsp/conf/machine/beaglebone.conf
> index 4263715..a316207 100644
> --- a/meta-yocto-bsp/conf/machine/beaglebone.conf
> +++ b/meta-yocto-bsp/conf/machine/beaglebone.conf
> @@ -35,3 +35,5 @@ UBOOT_ENTRYPOINT = "0x80008000"
>  UBOOT_LOADADDRESS = "0x80008000"
>  
>  MACHINE_FEATURES = "usbgadget usbhost vfat alsa"
> +
> +IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} MLO"
> -- 
> 1.9.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

