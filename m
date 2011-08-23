Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvfZs-0004dC-Tk
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 03:14:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Aug 2011 18:10:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="41145944"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2011 18:10:06 -0700
Message-ID: <4E52FDEE.30306@linux.intel.com>
Date: Mon, 22 Aug 2011 18:10:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313657192.git.jingdong.lu@windriver.com>
In-Reply-To: <cover.1313657192.git.jingdong.lu@windriver.com>
Cc: Jingdong.Lu@windriver.com
Subject: Re: [PATCH 0/1]initrdscripts: fix init-live.sh
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
X-List-Received-Date: Tue, 23 Aug 2011 01:14:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/18/2011 01:50 AM, Jingdong.Lu@windriver.com wrote:
> From: Jingdong Lu<jingdong.lu@windriver.com>
>
> Fix bug: [YOCTO 686] (partly)
>
> "ROOT_IMAGE" is a wrong path and it can't be mounted when using liveCD. So
> modify value of "ROOT_IMAGE" in init-live.sh to "isolinux/rootfs.img".
> If we want to use liveCD, we also need to add some kernel options related to
> CDROM support when compling kernel.
>
> The following changes since commit a21ff559e7c93e9da61104f4a33e42e6004189fd:
>    Richard Purdie (1):
>          Fixup remaining bb.msg.domain users
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib jingdonglu/bug686
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jingdonglu/bug686
>
> Jingdong Lu (1):
>    initrdscripts: fix init-live.sh
>
>   meta/recipes-core/initrdscripts/files/init-live.sh |    2 +-
>   .../initrdscripts/initramfs-live-boot_1.0.bb       |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Although I saw an email that stated this broke other BSP using hddimg, 
did you test this varition?

Thanks
	Sau!


