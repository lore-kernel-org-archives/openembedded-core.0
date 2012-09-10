Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TB6XX-0003Ax-Sr
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 18:08:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Sep 2012 08:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,398,1344236400"; d="scan'208";a="191200798"
Received: from unknown (HELO [10.255.13.123]) ([10.255.13.123])
	by orsmga001.jf.intel.com with ESMTP; 10 Sep 2012 08:56:16 -0700
Message-ID: <504E0DA0.6000802@linux.intel.com>
Date: Mon, 10 Sep 2012 08:56:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1346970617.git.raj.khem@gmail.com>
In-Reply-To: <cover.1346970617.git.raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] Upgrade qemu to 1.2 and eglibc with kconfig
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2012 16:08:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2012 03:32 PM, Khem Raj wrote:
> This patchset updates qemu to 1.2 release
> Adds kconfig to eglibc, kconfig is of interest for
> eglibc upstream which is next step.
> Removes nptl and enable-tls configure options from
> x86 machine configurations
>
> The following changes since commit 610f8c0c0cab8e258919689fd641faec28b58caf:
>
>    adt-installer: Allow changing YOCTOADT_REPO (2012-09-05 23:27:31 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib kraj/qemu-eglibc-updates
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu-eglibc-updates
>
> Khem Raj (6):
>    eglibc-2.16: Add kconfig infrastructure
>    eglibc: Enable kconfig for option management
>    kconfig-frontends: Create symlinks for conf and mconf
>    qemu-git: Move to tip of git past 1.2 release
>    qemu: Update from 0.15 to 1.2
>    machines/x86: Drop redundant glibc configure knobs
>
>   meta/conf/machine/include/ia32-base.inc            |    5 -
>   meta/conf/machine/qemux86-64.conf                  |    3 -
>   meta/conf/machine/qemux86.conf                     |    4 -
>   .../0001-eglibc-menuconfig-support.patch           | 1007 ++++++++++++++++++++
>   ...0002-eglibc-menuconfig-hex-string-options.patch |  169 ++++
>   ...0003-eglibc-menuconfig-build-instructions.patch |  176 ++++
>   meta/recipes-core/eglibc/eglibc-initial.inc        |    1 +
>   meta/recipes-core/eglibc/eglibc-options.inc        |    4 +-
>   meta/recipes-core/eglibc/eglibc.inc                |    4 +
>   meta/recipes-core/eglibc/eglibc_2.16.bb            |    8 +-
>   .../kconfig-frontends/kconfig-frontends_3.5.bb     |    8 +-
>   .../qemu-0.15.1/0001-ppc64-Fix-linker-script.patch |   46 -
>   .../a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch |   66 --
>   ...-Actually-raise-interrupt-on-timer-expiry.patch |   41 -
>   .../qemu-0.15.1/ppc-s500-set-invalid-mask.patch    |  610 ------------
>   .../qemu/{qemu-0.15.1 => qemu-1.2.0}/arm-bgr.patch |   12 +-
>   .../enable-i386-linux-user.patch                   |    0
>   .../fallback-to-safe-mmap_min_addr.patch           |    0
>   .../fix-configure-checks.patch                     |   18 +-
>   .../{qemu-0.15.1 => qemu-1.2.0}/init-info.patch    |    0
>   .../larger_default_ram_size.patch                  |    0
>   .../{qemu-0.15.1 => qemu-1.2.0}/linker-flags.patch |   14 +-
>   .../{qemu-0.15.1 => qemu-1.2.0}/no-strip.patch     |    0
>   .../{qemu-0.15.1 => qemu-1.2.0}/powerpc_rom.bin    |  Bin 4096 -> 4096 bytes
>   .../qemu-vmware-vga-depth.patch                    |   70 +-
>   .../recipes-devtools/qemu/qemu-git/powerpc_rom.bin |  Bin 0 -> 4096 bytes
>   .../qemu/{qemu_0.15.1.bb => qemu_1.2.0.bb}         |   18 +-
>   meta/recipes-devtools/qemu/qemu_git.bb             |   15 +-
>   28 files changed, 1431 insertions(+), 868 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-menuconfig-support.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0002-eglibc-menuconfig-hex-string-options.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0003-eglibc-menuconfig-build-instructions.patch
>   delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix-linker-script.patch
>   delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch
>   delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch
>   delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/ppc-s500-set-invalid-mask.patch
>   rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/arm-bgr.patch (75%)
>   rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/enable-i386-linux-user.patch (100%)
>   rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/fallback-to-safe-mmap_min_addr.patch (100%)
>   rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/fix-configure-checks.patch (59%)
>   rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/init-info.patch (100%)
>   rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/larger_default_ram_size.patch (100%)
>   rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/linker-flags.patch (64%)
>   rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/no-strip.patch (100%)
>   rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/powerpc_rom.bin (100%)
>   rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/qemu-vmware-vga-depth.patch (61%)
>   create mode 100644 meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin
>   rename meta/recipes-devtools/qemu/{qemu_0.15.1.bb => qemu_1.2.0.bb} (57%)
>

Merged to OE-Core (along with the runqemu fix)

Thanks
	Sau!



