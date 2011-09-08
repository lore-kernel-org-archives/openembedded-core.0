Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1Val-0000y8-JP
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 05:47:55 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Sep 2011 20:42:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,348,1312182000"; d="scan'208";a="46631419"
Received: from unknown (HELO [10.255.14.148]) ([10.255.14.148])
	by azsmga001.ch.intel.com with ESMTP; 07 Sep 2011 20:42:53 -0700
Message-ID: <4E6839BD.4010507@linux.intel.com>
Date: Wed, 07 Sep 2011 20:42:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110816 Thunderbird/6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1315203166.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1315203166.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 0/1] Make initramfs-live-install consistent to grub
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
X-List-Received-Date: Thu, 08 Sep 2011 03:47:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2011 11:15 PM, Lianhao Lu wrote:
> This patch fixed bug #1428. Since the grub 0.97 on which the initramfs-live-install
> RDEPENDS doesn't support x86_64 target, remove it from the COMPATIBLE_HOST in
> initramfs-live-install.
>
> The following changes since commit 0616557a8c29b42bae0ffd5fd665a046810047e4:
>    Richard Purdie (1):
>          populate_sdk: We need to ensure that the SDK sysroot reflects PACKAGE_ARCH
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/bug1428
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1428
>
> Lianhao Lu (1):
>    initramfs-live-install: Be consistent with grub.
>
>   .../initrdscripts/initramfs-live-install_1.0.bb    |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
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


