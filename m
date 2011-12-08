Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RYicm-0003rn-IF
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 19:23:17 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Dec 2011 10:16:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="84396647"
Received: from unknown (HELO [10.255.12.35]) ([10.255.12.35])
	by orsmga001.jf.intel.com with ESMTP; 08 Dec 2011 10:16:10 -0800
Message-ID: <4EE0FEEA.7080806@linux.intel.com>
Date: Thu, 08 Dec 2011 10:16:10 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323292966.git.otavio@ossystems.com.br>
	<0ab4225dfaee3c59d5200f9d73d75e4b44f3a498.1323292966.git.otavio@ossystems.com.br>
In-Reply-To: <0ab4225dfaee3c59d5200f9d73d75e4b44f3a498.1323292966.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 1/1] initramfs-framework: provides a modular initramfs
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
X-List-Received-Date: Thu, 08 Dec 2011 18:23:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/07/2011 01:23 PM, Otavio Salvador wrote:
> Provides the API and modules for a modular initramfs. The currently
> included modules are:
>
>   * initramfs-module-debug adds support to dynamic debugging of
>     initramfs using bootparams
>
>   * initramfs-module-udev: enables udev usage
>
>   * initramfs-module-mdev: enables mdev usage
>
>   * initramfs-module-e2fs: adds support for ext4, ext3 and ext2
>     filesystems
>
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>   .../initrdscripts/initramfs-framework/debug        |   82 ++++++++++++
>   .../initrdscripts/initramfs-framework/e2fs         |   28 ++++
>   .../initrdscripts/initramfs-framework/finish       |   46 +++++++
>   .../initrdscripts/initramfs-framework/init         |  136 ++++++++++++++++++++
>   .../initrdscripts/initramfs-framework/mdev         |   30 +++++
>   .../initrdscripts/initramfs-framework/udev         |   22 +++
>   .../initrdscripts/initramfs-framework_1.0.bb       |   57 ++++++++
>   7 files changed, 401 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/debug
>   create mode 100755 meta/recipes-core/initrdscripts/initramfs-framework/e2fs
>   create mode 100755 meta/recipes-core/initrdscripts/initramfs-framework/finish
>   create mode 100755 meta/recipes-core/initrdscripts/initramfs-framework/init
>   create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/mdev
>   create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/udev
>   create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
>

Merged to OE-Core

Thanks
	Sau!


