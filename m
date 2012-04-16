Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SJo84-000059-1x
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 17:46:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Apr 2012 08:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="133066892"
Received: from unknown (HELO [10.255.12.25]) ([10.255.12.25])
	by orsmga002.jf.intel.com with ESMTP; 16 Apr 2012 08:36:45 -0700
Message-ID: <4F8C3C8D.3050801@linux.intel.com>
Date: Mon, 16 Apr 2012 08:36:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334390876.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1334390876.git.nitin.a.kamble@intel.com>
Subject: Re: [v2 0/4] grub & eglibc fixes for fedora 17 alpha
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
X-List-Received-Date: Mon, 16 Apr 2012 15:46:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/14/2012 01:59 AM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> These are various grub fixes for correctly building grub recipes for various targets.
> These are tested for emenlow, sugerbay, qemux86, qemux86-64 machines
>
> The eglibc commits is thes same as in the v1 pull request.
>
> Nitin
>
> The following changes since commit ee71422b9893f9f77173fb2612d1ffbbc68643c3:
>
>    linux-yocto: allow .cfg, .scc, .patch and defconfigs to be processed in order (2012-04-13 22:44:46 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/grub3
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/grub3
>
> Nitin A Kamble (4):
>    eglibc: fix builds on fedora 17 alpha
>    grub-1.99: use gcc-cross for building the target binaries
>    grub-efi-native, grub: fix build with gcc 4.7
>    grub-1.99: fix configure error
>
>   .../grub-1.99-fix-enable_execute_stack-check.patch |   27 ++++
>   .../grub/files/grub-1.99-fpmath-sse-387-fix.patch  |   37 +++++
>   ...rub-1.99-gcc-4.7.0-strict-aliasing-errors.patch |  147 ++++++++++++++++++++
>   ...b-1.99-gcc-4.7.0-uninitialized-var-errors.patch |   41 ++++++
>   .../grub/files/grub-1.99-gcc-4.7.0.patch           |   34 +++++
>   meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |   10 +-
>   meta/recipes-bsp/grub/grub_1.99.bb                 |   10 +-
>   meta/recipes-core/eglibc/eglibc-package.inc        |    5 +
>   meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
>   meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
>   10 files changed, 309 insertions(+), 6 deletions(-)
>   create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-fix-enable_execute_stack-check.patch
>   create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-fpmath-sse-387-fix.patch
>   create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch
>   create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch
>   create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0.patch
>

Merged into OE-Core with tweaks by RP to the eglibc patch.

Thanks
	Sau!


