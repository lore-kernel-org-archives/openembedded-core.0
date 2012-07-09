Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoHzM-0007D6-7J
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:43:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Jul 2012 10:32:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="169337181"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga002.jf.intel.com with ESMTP; 09 Jul 2012 10:32:01 -0700
Message-ID: <4FFB1591.6080404@linux.intel.com>
Date: Mon, 09 Jul 2012 10:32:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341425229.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1341425229.git.laurentiu.palcu@intel.com>
Subject: Re: [PATCH 0/8] package upgrades
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
X-List-Received-Date: Mon, 09 Jul 2012 17:43:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2012 11:17 AM, Laurentiu Palcu wrote:
> Hi all.
>
> This is another set of package upgrades. All packages were compiled successfully
> for all architectures. Basic sanity tests for DirectFB were performed using
> core-image-gtk-directfb on qemux86. The rest of the packages were tested with
> core-image-sato on qemux86.
>
> Thanks,
> Laurentiu
>
> The following changes since commit ee89e38d478b5f9e13dd87c9333f9c4d56d51e3e:
>
>    prexport.bbclass: Fix typo in warning: "AUROPR" -> "AUTOPR". (2012-07-04 17:40:38 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib lpalcu/upgrades
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/upgrades
>
> Laurentiu Palcu (8):
>    directfb: upgrade to 1.6.1
>    directfb-examples: upgrade to 1.6.0
>    libx11: upgrade to 1.5.0
>    libx11-trim: upgrade to 1.5.0
>    libx11-diet: upgrade to 1.5.0
>    libxi: upgrade to 1.6.1
>    xinput: upgrade to 1.6.0
>    pixman: upgrade to 0.26.2
>
>   ...xamples_1.5.3.bb => directfb-examples_1.6.0.bb} |    4 +-
>   meta/recipes-graphics/directfb/directfb.inc        |    4 +-
>   .../directfb/fix-compilation-with-zlib.patch       |   29 +++++
>   ...se-ARM-assembler-for-atomic-operations-on.patch |   27 ----
>   ...ibdirect-remove-include-of-linux-config.h.patch |   29 -----
>   meta/recipes-graphics/directfb/directfb_1.5.3.bb   |   23 ----
>   meta/recipes-graphics/directfb/directfb_1.6.1.bb   |   23 ++++
>   meta/recipes-graphics/xorg-app/xinput_1.5.3.bb     |   14 --
>   meta/recipes-graphics/xorg-app/xinput_1.6.0.bb     |   15 +++
>   ...quest-as-substitute-for-GetReq-GetReqExtr.patch |  137 --------------------
>   .../keysymdef_include.patch                        |    0
>   .../makekeys_crosscompile.patch                    |    0
>   .../x11_disable_makekeys.patch                     |   13 +-
>   .../X18NCMSstubs.diff                              |    2 +-
>   .../fix-disable-xlocale.diff                       |    0
>   .../fix-utf8-wrong-define.patch                    |    0
>   .../keysymdef_include.patch                        |    0
>   .../x11_disable_makekeys.patch                     |   13 +-
>   .../{libx11-diet_1.4.4.bb => libx11-diet_1.5.0.bb} |    4 +-
>   .../keysymdef_include.patch                        |    0
>   .../makekeys_crosscompile.patch                    |    0
>   .../x11_disable_makekeys.patch                     |   20 +--
>   .../{libx11-trim_1.4.4.bb => libx11-trim_1.5.0.bb} |    6 +-
>   .../xorg-lib/{libx11_1.4.4.bb => libx11_1.5.0.bb}  |    7 +-
>   .../xorg-lib/{libxi_1.4.5.bb => libxi_1.6.1.bb}    |    4 +-
>   .../{pixman_0.25.2.bb => pixman_0.26.2.bb}         |    9 +-
>   26 files changed, 114 insertions(+), 269 deletions(-)
>   rename meta/recipes-graphics/directfb/{directfb-examples_1.5.3.bb => directfb-examples_1.6.0.bb} (77%)
>   create mode 100644 meta/recipes-graphics/directfb/directfb/fix-compilation-with-zlib.patch
>   delete mode 100644 meta/recipes-graphics/directfb/directfb/libdirect-Use-ARM-assembler-for-atomic-operations-on.patch
>   delete mode 100644 meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
>   delete mode 100644 meta/recipes-graphics/directfb/directfb_1.5.3.bb
>   create mode 100644 meta/recipes-graphics/directfb/directfb_1.6.1.bb
>   delete mode 100644 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
>   create mode 100644 meta/recipes-graphics/xorg-app/xinput_1.6.0.bb
>   delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-_XGetRequest-as-substitute-for-GetReq-GetReqExtr.patch
>   rename meta/recipes-graphics/xorg-lib/{libx11-1.4.4 => libx11-1.5.0}/keysymdef_include.patch (100%)
>   rename meta/recipes-graphics/xorg-lib/{libx11-1.4.4 => libx11-1.5.0}/makekeys_crosscompile.patch (100%)
>   rename meta/recipes-graphics/xorg-lib/{libx11-1.4.4 => libx11-1.5.0}/x11_disable_makekeys.patch (74%)
>   rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-diet-1.5.0}/X18NCMSstubs.diff (99%)
>   rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-diet-1.5.0}/fix-disable-xlocale.diff (100%)
>   rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-diet-1.5.0}/fix-utf8-wrong-define.patch (100%)
>   rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-diet-1.5.0}/keysymdef_include.patch (100%)
>   rename meta/recipes-graphics/xorg-lib/{libx11-trim-1.4.4 => libx11-diet-1.5.0}/x11_disable_makekeys.patch (74%)
>   rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.4.4.bb => libx11-diet_1.5.0.bb} (86%)
>   rename meta/recipes-graphics/xorg-lib/{libx11-trim-1.4.4 => libx11-trim-1.5.0}/keysymdef_include.patch (100%)
>   rename meta/recipes-graphics/xorg-lib/{libx11-trim-1.4.4 => libx11-trim-1.5.0}/makekeys_crosscompile.patch (100%)
>   rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-trim-1.5.0}/x11_disable_makekeys.patch (62%)
>   rename meta/recipes-graphics/xorg-lib/{libx11-trim_1.4.4.bb => libx11-trim_1.5.0.bb} (79%)
>   rename meta/recipes-graphics/xorg-lib/{libx11_1.4.4.bb => libx11_1.5.0.bb} (67%)
>   rename meta/recipes-graphics/xorg-lib/{libxi_1.4.5.bb => libxi_1.6.1.bb} (82%)
>   rename meta/recipes-graphics/xorg-lib/{pixman_0.25.2.bb => pixman_0.26.2.bb} (75%)
>

Merged into OE-Core

Thanks
	Sau!



