Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QUkEt-0006Cs-61
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 20:45:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jun 2011 11:42:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,342,1304319600"; d="scan'208";a="16293771"
Received: from unknown (HELO [10.255.12.216]) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2011 11:42:34 -0700
Message-ID: <4DF1141A.904@linux.intel.com>
Date: Thu, 09 Jun 2011 11:42:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307581528.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1307581528.git.dongxiao.xu@intel.com>
Subject: Re: [PATCH 0/1][PULL] Fix udevd launch issue
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
X-List-Received-Date: Thu, 09 Jun 2011 18:45:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2011 06:08 PM, Dongxiao Xu wrote:
> Hi Saul,
>
> This commit fixes the udevd launch issue after system second boot. [YOCTO #1146].
> Without udevd daemon, device nodes will not be created if dynamically insert a kernel module.
>
> Please help to review and pull.
>
> The following changes since commit 5af197b55a4b779f1ec93186f0723026949ba2b5:
>
>    cache: Implement multiple extra cache fields request support (2011-06-07 22:40:01 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dxu4/bugfix
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/bugfix
>
> Dongxiao Xu (1):
>    udev: Fix udevd launch issue after system second boot
>
>   meta/recipes-core/udev/udev-164/init |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
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


