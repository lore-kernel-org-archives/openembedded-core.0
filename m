Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SxJJD-0000QX-U6
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 16:57:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2012 07:45:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="176620588"
Received: from unknown (HELO [10.252.121.43]) ([10.252.121.43])
	by azsmga001.ch.intel.com with ESMTP; 03 Aug 2012 07:45:17 -0700
Message-ID: <501BE3F9.9050809@intel.com>
Date: Fri, 03 Aug 2012 17:45:13 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1343997523-4117-1-git-send-email-radu.moisan@intel.com>
	<20120803124658.GC30148@jama.jama.net>
In-Reply-To: <20120803124658.GC30148@jama.jama.net>
Subject: Re: [PATCH][RFC] u-boot: Upgrade to upstream stable 2012.07
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2012 14:57:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2012 03:46 PM, Martin Jansa wrote:
> On Fri, Aug 03, 2012 at 03:38:42PM +0300, Radu Moisan wrote:
>> Building u-boot requires UBOOT_MACHINE. In the u-boot README file
>> building u-boot is achieved with "make NAME_config" and then
>> "make all". I assumend UBOOT_MACHINE to be the "NAME" part and thus,
>> the "_config" addition in u-boot.inc
>> NAME is the machine name, and choices area vailable in boards.conf,
>> I used for testing coreboot-x86.
>  From this description I don't see why _config is now appended when
> probably all BSPs had it included in UBOOT_MACHINE variable before
>
> meta-nokia/recipes-bsp/u-boot/u-boot_git.bb:UBOOT_MACHINE_nokia900 = "nokia_rx51_config"
> meta-openmoko/conf/machine/om-gta04.conf:UBOOT_MACHINE = "omap3_gta04_config"
> meta-openmoko/recipes-bsp/u-boot/u-boot_git.bb:UBOOT_MACHINE_om-gta04 = "omap3_gta04_config"
> conf/machine/am180x-evm.conf:UBOOT_MACHINE = "da850evm_config"
> conf/machine/am335x-evm.conf:UBOOT_MACHINE = "am335x_evm_config"
> conf/machine/am3517-evm.conf:UBOOT_MACHINE = "am3517_evm_config"
> conf/machine/am37x-evm.conf:UBOOT_MACHINE = "omap3_evm_config"
> conf/machine/beagleboard.conf:UBOOT_MACHINE = "omap3_beagle_config"
> conf/machine/beaglebone.conf:UBOOT_MACHINE = "am335x_evm_config"
> conf/machine/hawkboard.conf:UBOOT_MACHINE = "da850_omapl138_evm_config"
> conf/machine/include/davinci.inc:UBOOT_MACHINE = "davinci_dvevm_config"
> conf/machine/include/ti814x.inc:UBOOT_MACHINE = "ti8148_evm_config_nand"
> conf/machine/include/ti816x.inc:UBOOT_MACHINE = "ti8168_evm_config"
> conf/machine/omap3-touchbook.conf:UBOOT_MACHINE = "omap3_beagle_config"
> conf/machine/omap3evm.conf:UBOOT_MACHINE = "omap3_evm_config"
> conf/machine/pandaboard.conf:UBOOT_MACHINE = "omap4_panda_config"
>
> And any sensible is to append it to *MACHINE* variable as default:
> recipes-bsp/u-boot/u-boot.inc:UBOOT_MACHINE ?= "${MACHINE}_config"
>
> Cheers,

Ok, missed that, I'll fix it.

radu


