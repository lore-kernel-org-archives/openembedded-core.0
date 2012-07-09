Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoHY3-0006Ck-Mm
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:14:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Jul 2012 10:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="165845710"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by azsmga001.ch.intel.com with ESMTP; 09 Jul 2012 10:03:48 -0700
Message-ID: <4FFB0EF4.5000901@linux.intel.com>
Date: Mon, 09 Jul 2012 10:03:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1341376182.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1341376182.git.dvhart@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Live installer fixes and EFI support
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
X-List-Received-Date: Mon, 09 Jul 2012 17:14:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2012 09:33 PM, Darren Hart wrote:
> Cleanup the existing installer a bit.
> Fix the grub-efi-native help2man build issue.
> Add EFI support to the installer.
>
> I have tested both PCBIOS install as well as EFI install from a live USB key to
> the internal MMC device on the FRI2 BSP.
>
> The following changes since commit a6b6df1350149c116050cb93c3c7b4802c709d31:
>
>    task-core-tools-debug: Added openssh-sftp-server. (2012-07-03 14:52:38 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/user-contrib/dvhart/oe-core installer
>    http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=installer
>
> Darren Hart (5):
>    init-install: Use swap_ratio in the calulation of swap_size
>    init-install: Correct ext2->ext3 typo in logging
>    init-install: Clean up partition alignment
>    grub-efi: Do not use help2man

Merged the above set into OE-Core

>    EFI: Make installer EFI aware

As noted, this is missing some bits that define: initramfs-live-install-efi

Sau!


>
>   meta/classes/grub-efi.bbclass                      |    2 +
>   .../grub/files/grub-1.99-disable-help2man.patch    |  231 ++++++++++++++++++++
>   meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |   17 +-
>   .../images/core-image-minimal-initramfs.bb         |    2 +-
>   .../initrdscripts/files/init-install-efi.sh        |  188 ++++++++++++++++
>   .../initrdscripts/files/init-install.sh            |   12 +-
>   meta/recipes-core/initrdscripts/files/init-live.sh |    6 +-
>   7 files changed, 440 insertions(+), 18 deletions(-)
>   create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-disable-help2man.patch
>   create mode 100644 meta/recipes-core/initrdscripts/files/init-install-efi.sh
>



