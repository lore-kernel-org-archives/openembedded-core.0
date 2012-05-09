Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SSGdq-00032Y-NK
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 01:49:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 May 2012 16:39:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="142093288"
Received: from unknown (HELO [10.255.12.218]) ([10.255.12.218])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2012 16:39:47 -0700
Message-ID: <4FAB0043.10002@linux.intel.com>
Date: Wed, 09 May 2012 16:39:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335991900.git.raj.khem@gmail.com>
In-Reply-To: <cover.1335991900.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/7] Misc fixes
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
X-List-Received-Date: Wed, 09 May 2012 23:49:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2012 01:53 PM, Khem Raj wrote:
> These fixes are independent but feeding into the bigger items
> e.g. mips64/sh4 support, supporting xorg-xserver on qemumachines
> etc.
>
> The following changes since commit 35b5fb2dd2131d4c7dc6635c14c6e08ea6926457:
>
>    eglibc-package: remove /var (2012-05-01 12:36:18 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib kraj/misc-updates
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-updates
>
> Khem Raj (6):
>    unfs-server: Do not use DESTDIR
Withdrawn
>    xserver-xorg: Fix build on powerpc
Holding with rest of xserver changes

>    libatomics-ops: Make it build for SH4
Merged

>    qemu-git: Move to tip of git
Not merged.

>    openssl: Fix build for mips64(el)
>    uclibc: Return correct endianness for mips64
Merged

>
> Yuri Bushmelev (1):
>    Enable PARALLEL_MAKE for testing
>
Not merged at this time

Thanks
	Sau!


>   meta/recipes-bsp/pciutils/pciutils_3.1.9.bb        |    1 -
>   meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    1 -
>   meta/recipes-connectivity/iproute2/iproute2.inc    |    1 -
>   .../nfs-utils/nfs-utils_1.2.3.bb                   |    1 -
>   .../openssl/openssl-1.0.0i/configure-targets.patch |   17 ++---
>   .../recipes-connectivity/openssl/openssl_1.0.0i.bb |    2 +-
>   meta/recipes-core/eggdbus/eggdbus_0.6.bb           |    1 -
>   meta/recipes-core/uclibc/uclibc-config.inc         |    2 +-
>   meta/recipes-devtools/autoconf/autoconf_2.68.bb    |    1 -
>   .../recipes-devtools/qemu/qemu-git/powerpc_rom.bin |  Bin 0 ->  4096 bytes
>   meta/recipes-devtools/qemu/qemu_git.bb             |   18 ++----
>   .../unfs-server/unfs-server_2.1+2.2beta47.bb       |    4 +-
>   meta/recipes-extended/groff/groff_1.20.1.bb        |    1 -
>   meta/recipes-extended/mailx/mailx_12.5.bb          |    1 -
>   .../net-tools/net-tools_1.60-23.bb                 |    1 -
>   meta/recipes-extended/sat-solver/sat-solver_git.bb |    1 -
>   .../fontconfig/fontconfig_2.8.0.bb                 |    1 -
>   meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    1 -
>   meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb  |    1 -
>   meta/recipes-graphics/xcb/xcb-util.inc             |    1 -
>   .../xorg-xserver/xserver-xorg-1.11.2.inc           |    9 ++-
>   .../xserver-xorg-1.11.2/gcc-47-warning.patch       |   33 +++++++++
>   .../libatomics-ops/gentoo/sh4-atomic-ops.patch     |   70 ++++++++++++++++++++
>   .../pulseaudio/libatomics-ops_1.2.bb               |    6 +-
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    1 -
>   meta/recipes-multimedia/speex/speex_1.2rc1.bb      |    1 -
>   meta/recipes-support/icu/icu-3.6.inc               |    1 -
>   meta/recipes-support/libpcre/libpcre_8.21.bb       |    1 -
>   28 files changed, 129 insertions(+), 50 deletions(-)
>   create mode 100644 meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
>   create mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/sh4-atomic-ops.patch
>


