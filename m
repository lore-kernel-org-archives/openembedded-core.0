Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QBw25-0002kP-Ih
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 23:30:57 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Apr 2011 14:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,235,1301900400"; d="scan'208";a="630685354"
Received: from unknown (HELO [10.255.13.48]) ([10.255.13.48])
	by orsmga002.jf.intel.com with ESMTP; 18 Apr 2011 14:28:35 -0700
Message-ID: <4DACAD02.7070303@linux.intel.com>
Date: Mon, 18 Apr 2011 14:28:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Yu Ke <ke.yu@intel.com>
References: <cover.1302485033.git.ke.yu@intel.com>
In-Reply-To: <cover.1302485033.git.ke.yu@intel.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 0/9] upgrade recipes
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
X-List-Received-Date: Mon, 18 Apr 2011 21:30:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/10/2011 06:28 PM, Yu Ke wrote:
> From: Yu Ke<ke.yu@intel.com>
>
> upgrade the following recipes to latest version:
>
>   libdrm
>   xf86-input-synaptics
>   xf86-input-vmmouse
>   mesa
>   evieext
>   xf86-input-mouse
>   pango
>   xf86-input-keyboard
>   xkbcomp
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: kyu3/upgrade-04-11
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/upgrade-04-11
>
> Thanks,
>      Yu Ke<ke.yu@intel.com>
> ---
>
>
> Yu Ke (9):
>    libdrm: upgrade from 2.4.23 to 2.4.24
>    xf86-input-synaptics: upgrade from 1.3.0 to 1.4.0
>    xf86-input-vmmouse: upgrade from 12.6.10 to 12.7.0
>    mesa: upgrade to 7.10.2
>    evieext: upgrade from 1.1.0 to 1.1.1
>    xf86-input-mouse: upgrade from 1.6 to 1.7
>    pango: upgrade from 1.28.3 to 1.28.4
>    xf86-input-keyboard: upgrade from 1.5.0 to 1.6.0
>    xkbcomp: upgrade from 1.2.0 to 1.2.1
>
>   .../distro/include/preferred-xorg-versions.inc     |   12 +-
>   .../installtests.patch                             |    0
>   .../drm/{libdrm_2.4.23.bb =>  libdrm_2.4.24.bb}     |    4 +-
>   .../mesa/files/talloc-removal.patch                |15571 --------------------
>   .../mesa/{mesa-dri_7.10.bb =>  mesa-dri_7.10.2.bb}  |    7 +-
>   .../{mesa-xlib_7.10.bb =>  mesa-xlib_7.10.2.bb}     |    7 +-
>   .../{pango-1.28.3 =>  pango-1.28.4}/no-tests.patch  |    0
>   .../pango/{pango_1.28.3.bb =>  pango_1.28.4.bb}     |    4 +-
>   .../xorg-app/xkbcomp/cross-compile-fix.patch       |   35 -
>   .../{xkbcomp_1.2.0.bb =>  xkbcomp_1.2.1.bb}         |    5 +-
>   ...board_1.5.0.bb =>  xf86-input-keyboard_1.6.0.bb} |    4 +-
>   ...ut-mouse_1.6.0.bb =>  xf86-input-mouse_1.7.0.bb} |    4 +-
>   ...tics_1.3.0.bb =>  xf86-input-synaptics_1.4.0.bb} |    4 +-
>   ...use_12.6.10.bb =>  xf86-input-vmmouse_12.7.0.bb} |    4 +-
>   .../{evieext_1.1.0.bb =>  evieext_1.1.1.bb}         |    8 +-
>   15 files changed, 30 insertions(+), 15639 deletions(-)
>   rename meta/recipes-graphics/drm/{libdrm-2.4.23 =>  libdrm-2.4.24}/installtests.patch (100%)
>   rename meta/recipes-graphics/drm/{libdrm_2.4.23.bb =>  libdrm_2.4.24.bb} (54%)
>   delete mode 100644 meta/recipes-graphics/mesa/files/talloc-removal.patch
>   rename meta/recipes-graphics/mesa/{mesa-dri_7.10.bb =>  mesa-dri_7.10.2.bb} (85%)
>   rename meta/recipes-graphics/mesa/{mesa-xlib_7.10.bb =>  mesa-xlib_7.10.2.bb} (68%)
>   rename meta/recipes-graphics/pango/{pango-1.28.3 =>  pango-1.28.4}/no-tests.patch (100%)
>   rename meta/recipes-graphics/pango/{pango_1.28.3.bb =>  pango_1.28.4.bb} (50%)
>   delete mode 100644 meta/recipes-graphics/xorg-app/xkbcomp/cross-compile-fix.patch
>   rename meta/recipes-graphics/xorg-app/{xkbcomp_1.2.0.bb =>  xkbcomp_1.2.1.bb} (72%)
>   rename meta/recipes-graphics/xorg-driver/{xf86-input-keyboard_1.5.0.bb =>  xf86-input-keyboard_1.6.0.bb} (74%)
>   rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.6.0.bb =>  xf86-input-mouse_1.7.0.bb} (76%)
>   rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.3.0.bb =>  xf86-input-synaptics_1.4.0.bb} (83%)
>   rename meta/recipes-graphics/xorg-driver/{xf86-input-vmmouse_12.6.10.bb =>  xf86-input-vmmouse_12.7.0.bb} (64%)
>   rename meta/recipes-graphics/xorg-proto/{evieext_1.1.0.bb =>  evieext_1.1.1.bb} (54%)
>
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>

Merged into oe-core and master

Thanks
	Sau!



