Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QwMfM-0007BR-TI
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 01:15:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Aug 2011 16:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,278,1312182000"; d="scan'208";a="42127450"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by azsmga001.ch.intel.com with ESMTP; 24 Aug 2011 16:10:36 -0700
Message-ID: <4E5584EC.7060600@linux.intel.com>
Date: Wed, 24 Aug 2011 16:10:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1314172740.git.jingdong.lu@windriver.com>
In-Reply-To: <cover.1314172740.git.jingdong.lu@windriver.com>
Cc: Jingdong.Lu@windriver.com
Subject: Re: [PATCH 0/1]initrdscripts: fix init-live.sh for hddimg and livecd
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
X-List-Received-Date: Wed, 24 Aug 2011 23:15:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/24/2011 01:25 AM, Jingdong.Lu@windriver.com wrote:
> From: Jingdong Lu<jingdong.lu@windriver.com>
>
> Both hddimg and livecd use init-live.sh script to boot the rootfs.img.
> But the paths of rootfs.img in hddimg and livecd are different. So we add
> a variable "ISOLINUX" to provide a correct path.
>
> The following changes since commit edd8e1e8b974eb3f0f9f66c2207aadf43612350b:
>    Scott Rifenbark (1):
>          documentation/adt-manual/adt-command.xml: general edits.
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib jingdonglu/bug686-v2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jingdonglu/bug686-v2
>
> Jingdong Lu (1):
>    initrdscripts: fix init-live.sh for hddimg and livecd
>
>   meta/recipes-core/initrdscripts/files/init-live.sh |   17 +++++++++++------
>   .../initrdscripts/initramfs-live-boot_1.0.bb       |    2 +-
>   2 files changed, 12 insertions(+), 7 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!


