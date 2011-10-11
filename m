Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RDWDL-000506-7k
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 08:53:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9B6lZuV004368
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Oct 2011 23:47:35 -0700 (PDT)
Received: from [128.224.162.225] (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 10 Oct 2011 23:47:35 -0700
Message-ID: <4E93E69A.7070402@windriver.com>
Date: Tue, 11 Oct 2011 14:47:54 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
	<8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
X-Originating-IP: [128.224.162.225]
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCHv3 01/31] xserver-xf86(-dri)-lite: rename to xserver-xorg and xserver-xorg-lite
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
X-List-Received-Date: Tue, 11 Oct 2011 06:53:25 -0000
Content-Type: multipart/alternative;
	boundary="------------060404070007020805070700"

--------------060404070007020805070700
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2011?10?08? 01:04, Martin Jansa wrote:
> * xserver-xorg is closer to upstream naming and
>    that's how it's named in OE-classic and meta-oe? It would make meta-oe
>    transition easier and better to do it now then convert meta-oe to
>    xserver-xf86 and then rename it back later.
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/conf/distro/include/default-providers.inc     |    4 ++--
>   .../conf/distro/include/distro_tracking_fields.inc |   20 ++++++++++----------
>   meta/conf/machine/qemux86-64.conf                  |    6 +++---
>   meta/conf/machine/qemux86.conf                     |    6 +++---
>   meta/conf/multilib.conf                            |    2 +-
>   ...ver-xf86-common.inc =>  xserver-xorg-common.inc} |    1 +
>   ...xserver-xf86-lite.inc =>  xserver-xorg-lite.inc} |    4 +---
>   .../crosscompile.patch                             |    0
>   .../fix_open_max_preprocessor_error.patch          |    0
>   .../macro_tweak.patch                              |    2 +-
>   ...-lite_1.10.1.bb =>  xserver-xorg-lite_1.10.1.bb} |    2 +-
>   ...{xserver-xf86-dri-lite.inc =>  xserver-xorg.inc} |    2 +-
>   .../cache-xkbcomp-output-for-fast-start-up.patch   |    0
>   .../crosscompile.patch                             |    0
>   .../fix_macros1.patch                              |    0
>   .../fix_open_max_preprocessor_error.patch          |    0
>   .../macro_tweak.patch                              |    2 +-
>   ...6-dri-lite_1.10.1.bb =>  xserver-xorg_1.10.1.bb} |    2 +-
>   ...er-xf86-dri-lite_git.bb =>  xserver-xorg_git.bb} |    2 +-
>   19 files changed, 27 insertions(+), 28 deletions(-)
>   rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-common.inc =>  xserver-xorg-common.inc} (96%)
>   rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite.inc =>  xserver-xorg-lite.inc} (95%)
>   rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite =>  xserver-xorg-lite}/crosscompile.patch (100%)
>   rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite =>  xserver-xorg-lite}/fix_open_max_preprocessor_error.patch (100%)
>   rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite =>  xserver-xorg-lite}/macro_tweak.patch (93%)
>   rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite_1.10.1.bb =>  xserver-xorg-lite_1.10.1.bb} (89%)
>   rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite.inc =>  xserver-xorg.inc} (97%)
>   rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite =>  xserver-xorg}/cache-xkbcomp-output-for-fast-start-up.patch (100%)
>   rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite =>  xserver-xorg}/crosscompile.patch (100%)
>   rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite =>  xserver-xorg}/fix_macros1.patch (100%)
>   rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite =>  xserver-xorg}/fix_open_max_preprocessor_error.patch (100%)
>   rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite =>  xserver-xorg}/macro_tweak.patch (93%)
>   rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite_1.10.1.bb =>  xserver-xorg_1.10.1.bb} (93%)
>   rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite_git.bb =>  xserver-xorg_git.bb} (94%)
>
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> index d51ac64..a5cdb5b 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -3,8 +3,8 @@
>   #
>   PREFERRED_PROVIDER_virtual/db ?= "db"
>   PREFERRED_PROVIDER_virtual/db-native ?= "db-native"
> -PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xf86"
> -PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xf86-dri-lite"
> +PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> +PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
>   PREFERRED_PROVIDER_virtual/libgl ?= "mesa-xlib"
>   PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives-cworth"
>   PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
> index 7b6c4a9..8af80c7 100644
> --- a/meta/conf/distro/include/distro_tracking_fields.inc
> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> @@ -3683,14 +3683,14 @@ RECIPE_INTEL_SECTION_pn-mesa-xlib="graphic core"
>   RECIPE_LAST_UPDATE_pn-mesa-xlib = "Nov 27, 2010"
>   RECIPE_MAINTAINER_pn-mesa-xlib="Yu Ke<ke.yu@intel.com>"
>
> -RECIPE_STATUS_pn-xserver-xf86-dri-lite="green" # no update needed
> -RECIPE_LATEST_VERSION_pn-xserver-xf86-dri-lite="1.8.99.904"
> -RECIPE_NO_OF_PATCHES_pn-xserver-xf86-dri-lite="2"
> -RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xf86-dri-lite="2 monthes"
> -RECIPE_LATEST_RELEASE_DATE_pn-xserver-xf86-dri-lite="2010/07/01"
> -RECIPE_INTEL_SECTION_pn-xserver-xf86-dri-lite="graphic core"
> -RECIPE_LAST_UPDATE_pn-xserver-xf86-dri-lite = "Jan 18, 2011"
> -RECIPE_MAINTAINER_pn-xserver-xf86-dri-lite="Yu Ke<ke.yu@intel.com>"
> +RECIPE_STATUS_pn-xserver-xorg="green" # no update needed
> +RECIPE_LATEST_VERSION_pn-xserver-xorg="1.8.99.904"
> +RECIPE_NO_OF_PATCHES_pn-xserver-xorg="2"
> +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xorg="2 monthes"
> +RECIPE_LATEST_RELEASE_DATE_pn-xserver-xorg="2010/07/01"
> +RECIPE_INTEL_SECTION_pn-xserver-xorg="graphic core"
> +RECIPE_LAST_UPDATE_pn-xserver-xorg = "Jan 18, 2011"
> +RECIPE_MAINTAINER_pn-xserver-xorg="Yu Ke<ke.yu@intel.com>"
>
>   RECIPE_STATUS_pn-xf86-input-synaptics = "red"
>   DISTRO_PN_ALIAS_pn-xf86-input-synaptics = "Meego=xorg-x11-drv-synaptics Fedora=xorg-x11-drv-synaptics Ubuntu=xserver-xorg-input-synaptics Mandriva=x11-driver-input-synaptics Debian=xfree86-driver-synaptics"
> @@ -5908,8 +5908,8 @@ DISTRO_PN_ALIAS_pn-pseudo = "Windriver"
>
>   DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-progs"
>   DISTRO_PN_ALIAS_pn-rt-tests = "Debian=rt-tests Ubuntu=rt-tests"
> -DISTRO_PN_ALIAS_pn-xserver-xf86-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
> -DISTRO_PN_ALIAS_pn-xserver-xf86-dri-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"

Hi Martin,
> +DISTRO_PN_ALIAS_pn-xserver-xorg = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
I guess this should be xserver-xorg-lite.

Regards,
Kai

>
> +DISTRO_PN_ALIAS_pn-xserver-xorg = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
>   DISTRO_PN_ALIAS_pn-xserver-kdrive = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
>   DISTRO_PN_ALIAS_pn-dtc = "Fedora=dtc Ubuntu=dtc"
>   DISTRO_PN_ALIAS_pn-dtc-native = "Fedora=dtc Ubuntu=dtc"
> diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
> index 18a7513..f28cf08 100644
> --- a/meta/conf/machine/qemux86-64.conf
> +++ b/meta/conf/machine/qemux86-64.conf
> @@ -4,8 +4,8 @@
>
>   PREFERRED_PROVIDER_virtual/libgl  = "mesa-dri"
>   PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
> -PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xf86-dri-lite"
> -PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xf86-dri-lite"
> +PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> +PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
>
>   require conf/machine/include/tune-x86_64.inc
>   require conf/machine/include/qemu.inc
> @@ -17,7 +17,7 @@ KERNEL_IMAGETYPE = "bzImage"
>   SERIAL_CONSOLE = "115200 ttyS0"
>
>   # We bypass swrast but we need it to be present for X to load correctly
> -XSERVER ?= "xserver-xf86-dri-lite \
> +XSERVER ?= "xserver-xorg \
>              mesa-dri-driver-swrast \
>              xf86-input-vmmouse \
>              xf86-input-keyboard \
> diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
> index 5d0d03e..75c9042 100644
> --- a/meta/conf/machine/qemux86.conf
> +++ b/meta/conf/machine/qemux86.conf
> @@ -4,8 +4,8 @@
>
>   PREFERRED_PROVIDER_virtual/libgl  = "mesa-dri"
>   PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
> -PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xf86-dri-lite"
> -PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xf86-dri-lite"
> +PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> +PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
>
>   require conf/machine/include/tune-i586.inc
>   require conf/machine/include/qemu.inc
> @@ -17,7 +17,7 @@ KERNEL_IMAGETYPE = "bzImage"
>   SERIAL_CONSOLE = "115200 ttyS0"
>
>   # We bypass swrast but we need it to be present for X to load correctly
> -XSERVER ?= "xserver-xf86-dri-lite \
> +XSERVER ?= "xserver-xorg \
>              mesa-dri-driver-swrast \
>              xf86-input-vmmouse \
>              xf86-input-keyboard \
> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
> index b9da33a..5e4b435 100644
> --- a/meta/conf/multilib.conf
> +++ b/meta/conf/multilib.conf
> @@ -442,7 +442,7 @@ BBCLASSEXTEND_append_pn-xrandr = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-xrestop = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-xserver-nodm-init = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-xserver-xf86-config = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xserver-xf86-dri-lite = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-xserver-xorg = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-xset = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-xtrans = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-xtscal = " ${MULTILIBS}"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> similarity index 96%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> index 17d456c..78c5f2e 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3dd2bbe3563837f80ed8926b06c1c353"
>
>   # xf86-*-* packages depend on an X server built with the xfree86 DDX
>   # so we have a virtual to represent that:
> +# deprecated, we should use virtual/xserver instead
>   PROVIDES = "virtual/xserver-xf86"
>
>   # Other packages tend to just care that there is *an* X server:
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
> similarity index 95%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
> index 131c258..f1cef1b 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
> @@ -1,6 +1,4 @@
> -require xserver-xf86-common.inc
> -
> -PROVIDES += "xserver-xf86-lite"
> +require xserver-xorg-common.inc
>
>   PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86rushproto xf86vidmodeproto xf86bigfontproto compositeproto recordproto resourceproto videoproto scrnsaverproto evieext trapproto xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/crosscompile.patch
> similarity index 100%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/crosscompile.patch
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/crosscompile.patch
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/fix_open_max_preprocessor_error.patch
> similarity index 100%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/fix_open_max_preprocessor_error.patch
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/fix_open_max_preprocessor_error.patch
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/macro_tweak.patch
> similarity index 93%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/macro_tweak.patch
> index 2b75427..2b32d4e 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/macro_tweak.patch
> @@ -2,7 +2,7 @@ This is the revised version of files/macro_tweak.patch for
>   xorg-server 1.8.99.904.
>
>   the files/macro_tweak.patch can not removed now since it is used by
> -xserver-kdrive-1.7.99.2 and xserver-xf86-lite_1.7.99.2. Once they
> +xserver-kdrive-1.7.99.2 and xserver-xorg(-lite). Once they
>   are all upgraded to 1.8.99.904, the the files/macro_tweak.patch
>   can be safely replace by this patch.
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.10.1.bb
> similarity index 89%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.10.1.bb
> index e42f27d..63b2c38 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.10.1.bb
> @@ -1,4 +1,4 @@
> -require xserver-xf86-lite.inc
> +require xserver-xorg-lite.inc
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> similarity index 97%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index 6b13873..9bc0ee4 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -1,4 +1,4 @@
> -require xserver-xf86-common.inc
> +require xserver-xorg-common.inc
>
>   PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86rushproto xf86vidmodeproto xf86bigfontproto compositeproto recordproto resourceproto videoproto scrnsaverproto evieext trapproto xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/cache-xkbcomp-output-for-fast-start-up.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/cache-xkbcomp-output-for-fast-start-up.patch
> similarity index 100%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/cache-xkbcomp-output-for-fast-start-up.patch
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg/cache-xkbcomp-output-for-fast-start-up.patch
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
> similarity index 100%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_macros1.patch
> similarity index 100%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros1.patch
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_macros1.patch
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch
> similarity index 100%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_preprocessor_error.patch
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch
> similarity index 93%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch
> index 2b75427..2b32d4e 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch
> @@ -2,7 +2,7 @@ This is the revised version of files/macro_tweak.patch for
>   xorg-server 1.8.99.904.
>
>   the files/macro_tweak.patch can not removed now since it is used by
> -xserver-kdrive-1.7.99.2 and xserver-xf86-lite_1.7.99.2. Once they
> +xserver-kdrive-1.7.99.2 and xserver-xorg(-lite). Once they
>   are all upgraded to 1.8.99.904, the the files/macro_tweak.patch
>   can be safely replace by this patch.
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
> similarity index 93%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
> index b797f97..0194798 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
> @@ -1,4 +1,4 @@
> -require xserver-xf86-dri-lite.inc
> +require xserver-xorg.inc
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
> similarity index 94%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
> index 87ba040..beef06a 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
> @@ -1,4 +1,4 @@
> -require xserver-xf86-dri-lite.inc
> +require xserver-xorg.inc
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
>


--------------060404070007020805070700
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 2011&#24180;10&#26376;08&#26085; 01:04, Martin Jansa wrote:
    <blockquote
cite="mid:8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com"
      type="cite">
      <pre wrap="">* xserver-xorg is closer to upstream naming and
  that's how it's named in OE-classic and meta-oe? It would make meta-oe
  transition easier and better to do it now then convert meta-oe to
  xserver-xf86 and then rename it back later.

Signed-off-by: Martin Jansa <a class="moz-txt-link-rfc2396E" href="mailto:Martin.Jansa@gmail.com">&lt;Martin.Jansa@gmail.com&gt;</a>
---
 meta/conf/distro/include/default-providers.inc     |    4 ++--
 .../conf/distro/include/distro_tracking_fields.inc |   20 ++++++++++----------
 meta/conf/machine/qemux86-64.conf                  |    6 +++---
 meta/conf/machine/qemux86.conf                     |    6 +++---
 meta/conf/multilib.conf                            |    2 +-
 ...ver-xf86-common.inc =&gt; xserver-xorg-common.inc} |    1 +
 ...xserver-xf86-lite.inc =&gt; xserver-xorg-lite.inc} |    4 +---
 .../crosscompile.patch                             |    0
 .../fix_open_max_preprocessor_error.patch          |    0
 .../macro_tweak.patch                              |    2 +-
 ...-lite_1.10.1.bb =&gt; xserver-xorg-lite_1.10.1.bb} |    2 +-
 ...{xserver-xf86-dri-lite.inc =&gt; xserver-xorg.inc} |    2 +-
 .../cache-xkbcomp-output-for-fast-start-up.patch   |    0
 .../crosscompile.patch                             |    0
 .../fix_macros1.patch                              |    0
 .../fix_open_max_preprocessor_error.patch          |    0
 .../macro_tweak.patch                              |    2 +-
 ...6-dri-lite_1.10.1.bb =&gt; xserver-xorg_1.10.1.bb} |    2 +-
 ...er-xf86-dri-lite_git.bb =&gt; xserver-xorg_git.bb} |    2 +-
 19 files changed, 27 insertions(+), 28 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-common.inc =&gt; xserver-xorg-common.inc} (96%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite.inc =&gt; xserver-xorg-lite.inc} (95%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite =&gt; xserver-xorg-lite}/crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite =&gt; xserver-xorg-lite}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite =&gt; xserver-xorg-lite}/macro_tweak.patch (93%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite_1.10.1.bb =&gt; xserver-xorg-lite_1.10.1.bb} (89%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite.inc =&gt; xserver-xorg.inc} (97%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite =&gt; xserver-xorg}/cache-xkbcomp-output-for-fast-start-up.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite =&gt; xserver-xorg}/crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite =&gt; xserver-xorg}/fix_macros1.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite =&gt; xserver-xorg}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite =&gt; xserver-xorg}/macro_tweak.patch (93%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite_1.10.1.bb =&gt; xserver-xorg_1.10.1.bb} (93%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite_git.bb =&gt; xserver-xorg_git.bb} (94%)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index d51ac64..a5cdb5b 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -3,8 +3,8 @@
 #
 PREFERRED_PROVIDER_virtual/db ?= "db"
 PREFERRED_PROVIDER_virtual/db-native ?= "db-native"
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xf86"
-PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xf86-dri-lite"
+PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
+PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa-xlib"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives-cworth"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 7b6c4a9..8af80c7 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -3683,14 +3683,14 @@ RECIPE_INTEL_SECTION_pn-mesa-xlib="graphic core"
 RECIPE_LAST_UPDATE_pn-mesa-xlib = "Nov 27, 2010"
 RECIPE_MAINTAINER_pn-mesa-xlib="Yu Ke <a class="moz-txt-link-rfc2396E" href="mailto:ke.yu@intel.com">&lt;ke.yu@intel.com&gt;</a>"
 
-RECIPE_STATUS_pn-xserver-xf86-dri-lite="green" # no update needed
-RECIPE_LATEST_VERSION_pn-xserver-xf86-dri-lite="1.8.99.904"
-RECIPE_NO_OF_PATCHES_pn-xserver-xf86-dri-lite="2"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xf86-dri-lite="2 monthes"
-RECIPE_LATEST_RELEASE_DATE_pn-xserver-xf86-dri-lite="2010/07/01"
-RECIPE_INTEL_SECTION_pn-xserver-xf86-dri-lite="graphic core"
-RECIPE_LAST_UPDATE_pn-xserver-xf86-dri-lite = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-xserver-xf86-dri-lite="Yu Ke <a class="moz-txt-link-rfc2396E" href="mailto:ke.yu@intel.com">&lt;ke.yu@intel.com&gt;</a>"
+RECIPE_STATUS_pn-xserver-xorg="green" # no update needed
+RECIPE_LATEST_VERSION_pn-xserver-xorg="1.8.99.904"
+RECIPE_NO_OF_PATCHES_pn-xserver-xorg="2"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xorg="2 monthes"
+RECIPE_LATEST_RELEASE_DATE_pn-xserver-xorg="2010/07/01"
+RECIPE_INTEL_SECTION_pn-xserver-xorg="graphic core"
+RECIPE_LAST_UPDATE_pn-xserver-xorg = "Jan 18, 2011"
+RECIPE_MAINTAINER_pn-xserver-xorg="Yu Ke <a class="moz-txt-link-rfc2396E" href="mailto:ke.yu@intel.com">&lt;ke.yu@intel.com&gt;</a>"
 
 RECIPE_STATUS_pn-xf86-input-synaptics = "red"
 DISTRO_PN_ALIAS_pn-xf86-input-synaptics = "Meego=xorg-x11-drv-synaptics Fedora=xorg-x11-drv-synaptics Ubuntu=xserver-xorg-input-synaptics Mandriva=x11-driver-input-synaptics Debian=xfree86-driver-synaptics"
@@ -5908,8 +5908,8 @@ DISTRO_PN_ALIAS_pn-pseudo = "Windriver"
 
 DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-progs"
 DISTRO_PN_ALIAS_pn-rt-tests = "Debian=rt-tests Ubuntu=rt-tests"
-DISTRO_PN_ALIAS_pn-xserver-xf86-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
-DISTRO_PN_ALIAS_pn-xserver-xf86-dri-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"</pre>
    </blockquote>
    <br>
    Hi Martin,
    <blockquote
cite="mid:8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com"
      type="cite">
      <pre wrap="">
+DISTRO_PN_ALIAS_pn-xserver-xorg = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"</pre>
    </blockquote>
    I guess this should be xserver-xorg-lite.<br>
    <br>
    Regards,<br>
    Kai<br>
    <br>
    <blockquote
cite="mid:8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com"
      type="cite">
      <pre wrap=""><big><big><big><big></big></big></big></big>
+DISTRO_PN_ALIAS_pn-xserver-xorg = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 DISTRO_PN_ALIAS_pn-xserver-kdrive = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 DISTRO_PN_ALIAS_pn-dtc = "Fedora=dtc Ubuntu=dtc"
 DISTRO_PN_ALIAS_pn-dtc-native = "Fedora=dtc Ubuntu=dtc"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 18a7513..f28cf08 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -4,8 +4,8 @@
 
 PREFERRED_PROVIDER_virtual/libgl  = "mesa-dri"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xf86-dri-lite"
-PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xf86-dri-lite"
+PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
+PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 
 require conf/machine/include/tune-x86_64.inc
 require conf/machine/include/qemu.inc
@@ -17,7 +17,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 
 # We bypass swrast but we need it to be present for X to load correctly
-XSERVER ?= "xserver-xf86-dri-lite \
+XSERVER ?= "xserver-xorg \
            mesa-dri-driver-swrast \
            xf86-input-vmmouse \
            xf86-input-keyboard \
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 5d0d03e..75c9042 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -4,8 +4,8 @@
 
 PREFERRED_PROVIDER_virtual/libgl  = "mesa-dri"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xf86-dri-lite"
-PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xf86-dri-lite"
+PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
+PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 
 require conf/machine/include/tune-i586.inc
 require conf/machine/include/qemu.inc
@@ -17,7 +17,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 
 # We bypass swrast but we need it to be present for X to load correctly
-XSERVER ?= "xserver-xf86-dri-lite \
+XSERVER ?= "xserver-xorg \
            mesa-dri-driver-swrast \
            xf86-input-vmmouse \
            xf86-input-keyboard \
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index b9da33a..5e4b435 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -442,7 +442,7 @@ BBCLASSEXTEND_append_pn-xrandr = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-xrestop = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-xserver-nodm-init = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-xserver-xf86-config = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-xserver-xf86-dri-lite = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-xserver-xorg = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-xset = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-xtrans = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-xtscal = " ${MULTILIBS}"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
similarity index 96%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index 17d456c..78c5f2e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=3dd2bbe3563837f80ed8926b06c1c353">"file://COPYING;md5=3dd2bbe3563837f80ed8926b06c1c353"</a>
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
 # so we have a virtual to represent that:
+# deprecated, we should use virtual/xserver instead
 PROVIDES = "virtual/xserver-xf86"
 
 # Other packages tend to just care that there is *an* X server:
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
similarity index 95%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
index 131c258..f1cef1b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
@@ -1,6 +1,4 @@
-require xserver-xf86-common.inc
-
-PROVIDES += "xserver-xf86-lite"
+require xserver-xorg-common.inc
 
 PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86rushproto xf86vidmodeproto xf86bigfontproto compositeproto recordproto resourceproto videoproto scrnsaverproto evieext trapproto xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/crosscompile.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/crosscompile.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/crosscompile.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/fix_open_max_preprocessor_error.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/fix_open_max_preprocessor_error.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/fix_open_max_preprocessor_error.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/macro_tweak.patch
similarity index 93%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/macro_tweak.patch
index 2b75427..2b32d4e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/macro_tweak.patch
@@ -2,7 +2,7 @@ This is the revised version of files/macro_tweak.patch for
 xorg-server 1.8.99.904.
 
 the files/macro_tweak.patch can not removed now since it is used by
-xserver-kdrive-1.7.99.2 and xserver-xf86-lite_1.7.99.2. Once they
+xserver-kdrive-1.7.99.2 and xserver-xorg(-lite). Once they
 are all upgraded to 1.8.99.904, the the files/macro_tweak.patch
 can be safely replace by this patch.
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.10.1.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.10.1.bb
index e42f27d..63b2c38 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.10.1.bb
@@ -1,4 +1,4 @@
-require xserver-xf86-lite.inc
+require xserver-xorg-lite.inc
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00">"file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"</a>
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
similarity index 97%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 6b13873..9bc0ee4 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -1,4 +1,4 @@
-require xserver-xf86-common.inc
+require xserver-xorg-common.inc
 
 PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86rushproto xf86vidmodeproto xf86bigfontproto compositeproto recordproto resourceproto videoproto scrnsaverproto evieext trapproto xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/cache-xkbcomp-output-for-fast-start-up.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/cache-xkbcomp-output-for-fast-start-up.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/cache-xkbcomp-output-for-fast-start-up.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg/cache-xkbcomp-output-for-fast-start-up.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_macros1.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros1.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_macros1.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_preprocessor_error.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch
similarity index 93%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch
index 2b75427..2b32d4e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch
@@ -2,7 +2,7 @@ This is the revised version of files/macro_tweak.patch for
 xorg-server 1.8.99.904.
 
 the files/macro_tweak.patch can not removed now since it is used by
-xserver-kdrive-1.7.99.2 and xserver-xf86-lite_1.7.99.2. Once they
+xserver-kdrive-1.7.99.2 and xserver-xorg(-lite). Once they
 are all upgraded to 1.8.99.904, the the files/macro_tweak.patch
 can be safely replace by this patch.
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
similarity index 93%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
index b797f97..0194798 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
@@ -1,4 +1,4 @@
-require xserver-xf86-dri-lite.inc
+require xserver-xorg.inc
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00">"file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"</a>
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
index 87ba040..beef06a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
@@ -1,4 +1,4 @@
-require xserver-xf86-dri-lite.inc
+require xserver-xorg.inc
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00">"file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"</a>
 
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------060404070007020805070700--
