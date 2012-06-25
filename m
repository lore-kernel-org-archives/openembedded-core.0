Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjBwY-0007pQ-TX
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 18:15:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 Jun 2012 09:04:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="160439583"
Received: from unknown (HELO [10.255.12.180]) ([10.255.12.180])
	by azsmga001.ch.intel.com with ESMTP; 25 Jun 2012 09:04:22 -0700
Message-ID: <4FE88C06.80900@linux.intel.com>
Date: Mon, 25 Jun 2012 09:04:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1340182393.git.kai.kang@windriver.com>
In-Reply-To: <cover.1340182393.git.kai.kang@windriver.com>
Cc: poky@yoctoproject.org, 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 0/1] [Yocto 2579] fix runqemu on ext2 image
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
X-List-Received-Date: Mon, 25 Jun 2012 16:15:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/20/2012 01:55 AM, Kang Kai wrote:
> Hi,
>
> This patch is for Yocto 2579.
>
> When set DISTRO to poky-tiny it only builds ext2 image and runqemu doesn't set qemu options for ext2 image that cause qemu fails to boot. Fix it.
>
> Regards,
> Kai
>
> The following changes since commit e0a70547069fe7e8a2d6bdaffc985fb172d46c31:
>
>    perl: Allow perl to cross build and native build in a directory named "t" (2012-06-18 17:33:04 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/runqemu
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/runqemu
>
> Kang Kai (1):
>    runqemu-internal: qemu fails to run on ext2 image
>
>   scripts/runqemu-internal |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!

(BTW, please use openembedded-core for items in meta)


