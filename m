Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RaFAx-0008O6-J2
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 00:20:51 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Dec 2011 15:13:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86464506"
Received: from unknown (HELO [10.255.12.64]) ([10.255.12.64])
	by orsmga002.jf.intel.com with ESMTP; 12 Dec 2011 15:13:55 -0800
Message-ID: <4EE68AB2.6070607@linux.intel.com>
Date: Mon, 12 Dec 2011 15:13:54 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323323130.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1323323130.git.nitin.a.kamble@intel.com>
Cc: hjl.tools@gmail.com
Subject: Re: [PATCH 00/11] X32 related Fixes
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
X-List-Received-Date: Mon, 12 Dec 2011 23:20:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/07/2011 09:48 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> These commits fix various recipe building issues with x32 toolchain.
>
> mdadm&  gst-fluendo commits are reworked based on the feedback received earlier.
>
> Thanks,
> Nitin
>
> The following changes since commit f17e0ae38b2e6c4cbe7f0f9d76c3e1a386335fd1:
>
>    conf/machine: Don't poke around providers which aren't machine specific/safe (2011-12-06 22:47:09 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/x32
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/x32
>
> H.J. Lu (3):
>    mesa: Properly create share library for x32
>    siteinfo: create a new siteinfo for x32-linux
>    openssl-1.0.0e: Update x32 Configure
>
> Nitin A Kamble (8):
>    gst-fluendo.inc: remove unneccessary hack
>    mdadm: Make custom CC definition conditional
>    pulseaudio: fix compilation with x32 toolchain
>    libacpi: Fix libdir for x32
>    findutils: Fix compilation for x32 toolchain
>    pax: fix compilation with x32 toolchain
>    libacpi: Use the cross strip instead of host strip
>    x86 tune: fix TUNE_PKGARCH definition for proper PACKAGE_ARCH
>
>   meta/classes/siteinfo.bbclass                      |    2 +-
>   meta/conf/machine/include/ia32/arch-ia32.inc       |    4 +-
>   meta/conf/machine/include/tune-core2.inc           |    6 +-
>   .../libacpi/files/libacpi_fix_for_x32.patch        |   47 ++++
>   .../use_correct_strip_in_cross_environment.patch   |   23 ++
>   meta/recipes-bsp/libacpi/libacpi_0.2.bb            |    6 +-
>   .../openssl-1.0.0e/openssl_fix_for_x32.patch       |    2 +-
>   .../findutils-4.4.2/findutils_fix_for_x32.patch    |   40 ++++
>   meta/recipes-extended/findutils/findutils_4.4.2.bb |    5 +-
>   .../mdadm/files/mdadm-3.2.2_fix_for_x32.patch      |   25 +++
>   meta/recipes-extended/mdadm/mdadm_3.2.2.bb         |    4 +-
>   .../pax/pax/pax-3.4_fix_for_x32.patch              |  185 ++++++++++++++++
>   meta/recipes-extended/pax/pax_3.4.bb               |    5 +-
>   .../mesa/mesa/mesa_fix_for_x32.patch               |   20 ++-
>   meta/recipes-multimedia/gstreamer/gst-fluendo.inc  |    4 -
>   .../pulseaudio/pulseaudo_fix_for_x32.patch         |  225 ++++++++++++++++++++
>   .../pulseaudio/pulseaudio_1.1.bb                   |    3 +-
>   meta/site/x32-linux                                |    9 +
>   18 files changed, 592 insertions(+), 23 deletions(-)
>   create mode 100644 meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
>   create mode 100644 meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch
>   create mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_x32.patch
>   create mode 100644 meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
>   create mode 100644 meta/recipes-extended/pax/pax/pax-3.4_fix_for_x32.patch
>   create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_for_x32.patch
>   create mode 100644 meta/site/x32-linux
>

Merged into OE-Core (from updated branch)

Thanks
	Sau!


