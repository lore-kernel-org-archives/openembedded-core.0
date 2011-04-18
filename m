Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QBri5-0008IR-WB
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 18:54:03 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Apr 2011 09:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,233,1301900400"; d="scan'208";a="911182910"
Received: from unknown (HELO [10.255.13.48]) ([10.255.13.48])
	by fmsmga001.fm.intel.com with ESMTP; 18 Apr 2011 09:51:40 -0700
Message-ID: <4DAC6C1B.9070204@linux.intel.com>
Date: Mon, 18 Apr 2011 09:51:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1302576423.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302576423.git.dexuan.cui@intel.com>
Subject: Re: [PATCH 00/12] recipe upgrades and fix
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
X-List-Received-Date: Mon, 18 Apr 2011 16:54:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2011 08:16 PM, Dexuan Cui wrote:
> From: Dexuan Cui<dexuan.cui@intel.com>
>
> The upgrades are mostly filename/checksum changes.
> Add --enable-specs=no for xextproto, libxi.
>
> [YOCTO #968]
>      gnu-config: add dependency on perl to fix some occassional failures.
>      See http://bugzilla.pokylinux.org/show_bug.cgi?id=968 for details.
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: dcui/master
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master
>
> Thanks,
>      Dexuan Cui<dexuan.cui@intel.com>
> ---
>
>
> Dexuan Cui (12):
>    oprofileui: upgrade to latest git version
>    libxt: update from 1.0.9 to the latest version 1.1.1
>    libxi: upgrade from 1.4.0 to the latest version 1.4.2
>    fixesproto: upgrade from 4.1.2 to the latest version 5.0
>    xproto: upgrade from 7.0.20 to the latest version 7.0.21
>    gnome-doc-utils: upgrade from 0.20.4 to the latest version 0.20.5
>    xextproto: upgrade from 7.1.2 to the latest version 7.2.0
>    libpciaccess: upgrade from 0.12.0 to the latest version 0.12.1
>    cronie: upgrade from 1.4.6 to the latest version 1.4.7
>    preferred-xorg-versions.inc: update libxt, libxi, fixesproto, xproto,
>      xextproto and libpciaccess
>    distro_tracking_fields.inc: update the info for the following recipes
>    gnu-config: add dependency on perl
>
>   .../conf/distro/include/distro_tracking_fields.inc |   83 ++++++++++----------
>   .../conf/distro/include/poky-default-revisions.inc |    2 +-
>   .../distro/include/preferred-xorg-versions.inc     |   20 +++---
>   .../gnu-config/gnu-config_20080123.bb              |    2 +-
>   .../cronie/{cronie_1.4.6.bb =>  cronie_1.4.7.bb}    |    4 +-
>   ...c-utils_0.20.4.bb =>  gnome-doc-utils_0.20.5.bb} |    4 +-
>   ...bpciaccess_0.12.0.bb =>  libpciaccess_0.12.1.bb} |    6 +-
>   .../xorg-lib/{libxi_1.4.0.bb =>  libxi_1.4.2.bb}    |    5 +-
>   .../xorg-lib/{libxt_1.0.9.bb =>  libxt_1.1.1.bb}    |    6 +-
>   .../{fixesproto_4.1.2.bb =>  fixesproto_5.0.bb}     |    8 +-
>   .../{xextproto_7.1.2.bb =>  xextproto_7.2.0.bb}     |    6 +-
>   .../{xproto_7.0.20.bb =>  xproto_7.0.21.bb}         |    6 +-
>   meta/recipes-kernel/oprofile/oprofileui_git.bb     |    2 +-
>   13 files changed, 79 insertions(+), 75 deletions(-)
>   rename meta/recipes-extended/cronie/{cronie_1.4.6.bb =>  cronie_1.4.7.bb} (93%)
>   rename meta/recipes-gnome/gnome/{gnome-doc-utils_0.20.4.bb =>  gnome-doc-utils_0.20.5.bb} (53%)
>   rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.12.0.bb =>  libpciaccess_0.12.1.bb} (56%)
>   rename meta/recipes-graphics/xorg-lib/{libxi_1.4.0.bb =>  libxi_1.4.2.bb} (76%)
>   rename meta/recipes-graphics/xorg-lib/{libxt_1.0.9.bb =>  libxt_1.1.1.bb} (85%)
>   rename meta/recipes-graphics/xorg-proto/{fixesproto_4.1.2.bb =>  fixesproto_5.0.bb} (56%)
>   rename meta/recipes-graphics/xorg-proto/{xextproto_7.1.2.bb =>  xextproto_7.2.0.bb} (76%)
>   rename meta/recipes-graphics/xorg-proto/{xproto_7.0.20.bb =>  xproto_7.0.21.bb} (57%)
>
Pulled these into oe-core and master, except the gnu-config patch, which 
you are already talking with RP about.

Sau!


