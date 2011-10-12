Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RDpvO-0003Gh-Dl
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 05:56:11 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Oct 2011 20:50:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,527,1312182000"; d="scan'208";a="72600308"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2011 20:50:26 -0700
Received: from pgsmsx104.gar.corp.intel.com (10.221.44.91) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 12 Oct 2011 11:49:47 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX104.gar.corp.intel.com (10.221.44.91) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Wed, 12 Oct 2011 11:49:47 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 12 Oct 2011 11:48:49 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2011 11:48:47 +0800
Thread-Topic: [OE-core] [oe-core][PATCHv3 01/31] xserver-xf86(-dri)-lite:
	rename	to xserver-xorg and xserver-xorg-lite
Thread-Index: AcyFE2XXgJ1HdkKETGygn3hnGLtX8gDfiseQ
Message-ID: <1865303E0DED764181A9D882DEF65FB6D23164E84D@shsmsx502.ccr.corp.intel.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
	<8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCHv3 01/31] xserver-xf86(-dri)-lite: rename	to xserver-xorg and xserver-xorg-lite
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
X-List-Received-Date: Wed, 12 Oct 2011 03:56:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Glad to see the patches to upgrade xserver and libx11. Good work! :-)

BTW, we also need to upgrade meta-intel's side since BSP can't build now:
http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1670
I'm working on this bug.

Thanks,
-- Dexuan


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Saturday, October 08, 2011 1:05 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [oe-core][PATCHv3 01/31] xserver-xf86(-dri)-lite: rena=
me to
> xserver-xorg and xserver-xorg-lite
>
> * xserver-xorg is closer to upstream naming and
>   that's how it's named in OE-classic and meta-oe? It would make meta-oe
>   transition easier and better to do it now then convert meta-oe to
>   xserver-xf86 and then rename it back later.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/distro/include/default-providers.inc     |    4 ++--
>  .../conf/distro/include/distro_tracking_fields.inc |   20 ++++++++++----=
------
>  meta/conf/machine/qemux86-64.conf                  |    6 +++---
>  meta/conf/machine/qemux86.conf                     |    6 +++---
>  meta/conf/multilib.conf                            |    2 +-
>  ...ver-xf86-common.inc =3D> xserver-xorg-common.inc} |    1 +
>  ...xserver-xf86-lite.inc =3D> xserver-xorg-lite.inc} |    4 +---
>  .../crosscompile.patch                             |    0
>  .../fix_open_max_preprocessor_error.patch          |    0
>  .../macro_tweak.patch                              |    2 +-
>  ...-lite_1.10.1.bb =3D> xserver-xorg-lite_1.10.1.bb} |    2 +-
>  ...{xserver-xf86-dri-lite.inc =3D> xserver-xorg.inc} |    2 +-
>  .../cache-xkbcomp-output-for-fast-start-up.patch   |    0
>  .../crosscompile.patch                             |    0
>  .../fix_macros1.patch                              |    0
>  .../fix_open_max_preprocessor_error.patch          |    0
>  .../macro_tweak.patch                              |    2 +-
>  ...6-dri-lite_1.10.1.bb =3D> xserver-xorg_1.10.1.bb} |    2 +-
>  ...er-xf86-dri-lite_git.bb =3D> xserver-xorg_git.bb} |    2 +-
>  19 files changed, 27 insertions(+), 28 deletions(-)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-common.inc =3D>
> xserver-xorg-common.inc} (96%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite.inc =3D>
> xserver-xorg-lite.inc} (95%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite =3D>
> xserver-xorg-lite}/crosscompile.patch (100%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite =3D>
> xserver-xorg-lite}/fix_open_max_preprocessor_error.patch (100%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite =3D>
> xserver-xorg-lite}/macro_tweak.patch (93%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite_1.10.1.bb =
=3D>
> xserver-xorg-lite_1.10.1.bb} (89%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite.inc =3D=
>
> xserver-xorg.inc} (97%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite =3D>
> xserver-xorg}/cache-xkbcomp-output-for-fast-start-up.patch (100%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite =3D>
> xserver-xorg}/crosscompile.patch (100%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite =3D>
> xserver-xorg}/fix_macros1.patch (100%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite =3D>
> xserver-xorg}/fix_open_max_preprocessor_error.patch (100%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite =3D>
> xserver-xorg}/macro_tweak.patch (93%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite_1.10.1.=
bb =3D>
> xserver-xorg_1.10.1.bb} (93%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite_git.bb =
=3D>
> xserver-xorg_git.bb} (94%)
>
> diff --git a/meta/conf/distro/include/default-providers.inc
> b/meta/conf/distro/include/default-providers.inc
> index d51ac64..a5cdb5b 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -3,8 +3,8 @@
>  #
>  PREFERRED_PROVIDER_virtual/db ?=3D "db"
>  PREFERRED_PROVIDER_virtual/db-native ?=3D "db-native"
> -PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xf86"
> -PREFERRED_PROVIDER_virtual/xserver-xf86 ?=3D "xserver-xf86-dri-lite"
> +PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
> +PREFERRED_PROVIDER_virtual/xserver-xf86 ?=3D "xserver-xorg"
>  PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa-xlib"
>  PREFERRED_PROVIDER_virtual/update-alternatives ?=3D
> "update-alternatives-cworth"
>  PREFERRED_PROVIDER_virtual/update-alternatives-native ?=3D "opkg-native"
> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc
> b/meta/conf/distro/include/distro_tracking_fields.inc
> index 7b6c4a9..8af80c7 100644
> --- a/meta/conf/distro/include/distro_tracking_fields.inc
> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> @@ -3683,14 +3683,14 @@ RECIPE_INTEL_SECTION_pn-mesa-xlib=3D"graphic
> core"
>  RECIPE_LAST_UPDATE_pn-mesa-xlib =3D "Nov 27, 2010"
>  RECIPE_MAINTAINER_pn-mesa-xlib=3D"Yu Ke <ke.yu@intel.com>"
>
> -RECIPE_STATUS_pn-xserver-xf86-dri-lite=3D"green" # no update needed
> -RECIPE_LATEST_VERSION_pn-xserver-xf86-dri-lite=3D"1.8.99.904"
> -RECIPE_NO_OF_PATCHES_pn-xserver-xf86-dri-lite=3D"2"
> -RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xf86-dri-lite=3D"2
> monthes"
> -RECIPE_LATEST_RELEASE_DATE_pn-xserver-xf86-dri-lite=3D"2010/07/01"
> -RECIPE_INTEL_SECTION_pn-xserver-xf86-dri-lite=3D"graphic core"
> -RECIPE_LAST_UPDATE_pn-xserver-xf86-dri-lite =3D "Jan 18, 2011"
> -RECIPE_MAINTAINER_pn-xserver-xf86-dri-lite=3D"Yu Ke <ke.yu@intel.com>"
> +RECIPE_STATUS_pn-xserver-xorg=3D"green" # no update needed
> +RECIPE_LATEST_VERSION_pn-xserver-xorg=3D"1.8.99.904"
> +RECIPE_NO_OF_PATCHES_pn-xserver-xorg=3D"2"
> +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xorg=3D"2
> monthes"
> +RECIPE_LATEST_RELEASE_DATE_pn-xserver-xorg=3D"2010/07/01"
> +RECIPE_INTEL_SECTION_pn-xserver-xorg=3D"graphic core"
> +RECIPE_LAST_UPDATE_pn-xserver-xorg =3D "Jan 18, 2011"
> +RECIPE_MAINTAINER_pn-xserver-xorg=3D"Yu Ke <ke.yu@intel.com>"
>
>  RECIPE_STATUS_pn-xf86-input-synaptics =3D "red"
>  DISTRO_PN_ALIAS_pn-xf86-input-synaptics =3D "Meego=3Dxorg-x11-drv-synapt=
ics
> Fedora=3Dxorg-x11-drv-synaptics Ubuntu=3Dxserver-xorg-input-synaptics
> Mandriva=3Dx11-driver-input-synaptics Debian=3Dxfree86-driver-synaptics"
> @@ -5908,8 +5908,8 @@ DISTRO_PN_ALIAS_pn-pseudo =3D "Windriver"
>
>  DISTRO_PN_ALIAS_pn-btrfs-tools =3D "Debian=3Dbtrfs-tools Fedora=3Dbtrfs-=
progs"
>  DISTRO_PN_ALIAS_pn-rt-tests =3D "Debian=3Drt-tests Ubuntu=3Drt-tests"
> -DISTRO_PN_ALIAS_pn-xserver-xf86-lite =3D "Fedora=3Dxorg-x11-server
> Ubuntu=3Dxserver-xorg"
> -DISTRO_PN_ALIAS_pn-xserver-xf86-dri-lite =3D "Fedora=3Dxorg-x11-server
> Ubuntu=3Dxserver-xorg"
> +DISTRO_PN_ALIAS_pn-xserver-xorg =3D "Fedora=3Dxorg-x11-server
> Ubuntu=3Dxserver-xorg"
> +DISTRO_PN_ALIAS_pn-xserver-xorg =3D "Fedora=3Dxorg-x11-server
> Ubuntu=3Dxserver-xorg"
>  DISTRO_PN_ALIAS_pn-xserver-kdrive =3D "Fedora=3Dxorg-x11-server
> Ubuntu=3Dxserver-xorg"
>  DISTRO_PN_ALIAS_pn-dtc =3D "Fedora=3Ddtc Ubuntu=3Ddtc"
>  DISTRO_PN_ALIAS_pn-dtc-native =3D "Fedora=3Ddtc Ubuntu=3Ddtc"
> diff --git a/meta/conf/machine/qemux86-64.conf
> b/meta/conf/machine/qemux86-64.conf
> index 18a7513..f28cf08 100644
> --- a/meta/conf/machine/qemux86-64.conf
> +++ b/meta/conf/machine/qemux86-64.conf
> @@ -4,8 +4,8 @@
>
>  PREFERRED_PROVIDER_virtual/libgl  =3D "mesa-dri"
>  PREFERRED_PROVIDER_virtual/libx11 ?=3D "libx11-trim"
> -PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xf86-dri-lite"
> -PREFERRED_PROVIDER_virtual/xserver-xf86 ?=3D "xserver-xf86-dri-lite"
> +PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
> +PREFERRED_PROVIDER_virtual/xserver-xf86 ?=3D "xserver-xorg"
>
>  require conf/machine/include/tune-x86_64.inc
>  require conf/machine/include/qemu.inc
> @@ -17,7 +17,7 @@ KERNEL_IMAGETYPE =3D "bzImage"
>  SERIAL_CONSOLE =3D "115200 ttyS0"
>
>  # We bypass swrast but we need it to be present for X to load correctly
> -XSERVER ?=3D "xserver-xf86-dri-lite \
> +XSERVER ?=3D "xserver-xorg \
>             mesa-dri-driver-swrast \
>             xf86-input-vmmouse \
>             xf86-input-keyboard \
> diff --git a/meta/conf/machine/qemux86.conf
> b/meta/conf/machine/qemux86.conf
> index 5d0d03e..75c9042 100644
> --- a/meta/conf/machine/qemux86.conf
> +++ b/meta/conf/machine/qemux86.conf
> @@ -4,8 +4,8 @@
>
>  PREFERRED_PROVIDER_virtual/libgl  =3D "mesa-dri"
>  PREFERRED_PROVIDER_virtual/libx11 ?=3D "libx11-trim"
> -PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xf86-dri-lite"
> -PREFERRED_PROVIDER_virtual/xserver-xf86 ?=3D "xserver-xf86-dri-lite"
> +PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
> +PREFERRED_PROVIDER_virtual/xserver-xf86 ?=3D "xserver-xorg"
>
>  require conf/machine/include/tune-i586.inc
>  require conf/machine/include/qemu.inc
> @@ -17,7 +17,7 @@ KERNEL_IMAGETYPE =3D "bzImage"
>  SERIAL_CONSOLE =3D "115200 ttyS0"
>
>  # We bypass swrast but we need it to be present for X to load correctly
> -XSERVER ?=3D "xserver-xf86-dri-lite \
> +XSERVER ?=3D "xserver-xorg \
>             mesa-dri-driver-swrast \
>             xf86-input-vmmouse \
>             xf86-input-keyboard \
> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
> index b9da33a..5e4b435 100644
> --- a/meta/conf/multilib.conf
> +++ b/meta/conf/multilib.conf
> @@ -442,7 +442,7 @@ BBCLASSEXTEND_append_pn-xrandr =3D "
> ${MULTILIBS}"
>  BBCLASSEXTEND_append_pn-xrestop =3D " ${MULTILIBS}"
>  BBCLASSEXTEND_append_pn-xserver-nodm-init =3D " ${MULTILIBS}"
>  BBCLASSEXTEND_append_pn-xserver-xf86-config =3D " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-xserver-xf86-dri-lite =3D " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-xserver-xorg =3D " ${MULTILIBS}"
>  BBCLASSEXTEND_append_pn-xset =3D " ${MULTILIBS}"
>  BBCLASSEXTEND_append_pn-xtrans =3D " ${MULTILIBS}"
>  BBCLASSEXTEND_append_pn-xtscal =3D " ${MULTILIBS}"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> similarity index 96%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> index 17d456c..78c5f2e 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D3dd2bbe3563837f80ed8926b06c1c353"
>
>  # xf86-*-* packages depend on an X server built with the xfree86 DDX
>  # so we have a virtual to represent that:
> +# deprecated, we should use virtual/xserver instead
>  PROVIDES =3D "virtual/xserver-xf86"
>
>  # Other packages tend to just care that there is *an* X server:
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
> similarity index 95%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
> index 131c258..f1cef1b 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
> @@ -1,6 +1,4 @@
> -require xserver-xf86-common.inc
> -
> -PROVIDES +=3D "xserver-xf86-lite"
> +require xserver-xorg-common.inc
>
>  PROTO_DEPS =3D "randrproto renderproto fixesproto damageproto xextproto
> xproto xf86dgaproto xf86miscproto xf86rushproto xf86vidmodeproto
> xf86bigfontproto compositeproto recordproto resourceproto videoproto
> scrnsaverproto evieext trapproto xineramaproto fontsproto kbproto inputpr=
oto
> bigreqsproto xcmiscproto glproto"
>
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/crosscompile.p=
atch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/crosscompile.patch
> similarity index 100%
> rename from
> meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/crosscompile.pat=
ch
> rename to
> meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/crosscompile.patch
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/fix_open_max_prepr=
oc
> essor_error.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/fix_open_max_prepr=
oc
> essor_error.patch
> similarity index 100%
> rename from
> meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/fix_open_max_preproc=
es
> sor_error.patch
> rename to
> meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/fix_open_max_preproc=
e
> ssor_error.patch
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/macro_tweak.patch
> similarity index 93%
> rename from
> meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch
> rename to
> meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/macro_tweak.patch
> index 2b75427..2b32d4e 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.pa=
tch
> +++
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/macro_tweak.patch
> @@ -2,7 +2,7 @@ This is the revised version of files/macro_tweak.patch fo=
r
>  xorg-server 1.8.99.904.
>
>  the files/macro_tweak.patch can not removed now since it is used by
> -xserver-kdrive-1.7.99.2 and xserver-xf86-lite_1.7.99.2. Once they
> +xserver-kdrive-1.7.99.2 and xserver-xorg(-lite). Once they
>  are all upgraded to 1.8.99.904, the the files/macro_tweak.patch
>  can be safely replace by this patch.
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.=
bb
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.10.1.bb
> similarity index 89%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.b=
b
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.10.1.bb
> index e42f27d..63b2c38 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.10.1.bb
> @@ -1,4 +1,4 @@
> -require xserver-xf86-lite.inc
> +require xserver-xorg-lite.inc
>
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D74df27b6254cc88d2799b5f4f5949c00"
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
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
>  PROTO_DEPS =3D "randrproto renderproto fixesproto damageproto xextproto
> xproto xf86dgaproto xf86miscproto xf86rushproto xf86vidmodeproto
> xf86bigfontproto compositeproto recordproto resourceproto videoproto
> scrnsaverproto evieext trapproto xineramaproto fontsproto kbproto inputpr=
oto
> bigreqsproto xcmiscproto glproto"
>
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/cache-xkbcomp-=
out
> put-for-fast-start-up.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/cache-xkbcomp-output-fo=
r
> -fast-start-up.patch
> similarity index 100%
> rename from
> meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/cache-xkbcomp-ou=
tpu
> t-for-fast-start-up.patch
> rename to
> meta/recipes-graphics/xorg-xserver/xserver-xorg/cache-xkbcomp-output-for-=
fa
> st-start-up.patch
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
> similarity index 100%
> rename from
> meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch
> rename to
> meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros1.pa=
tch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_macros1.patch
> similarity index 100%
> rename from
> meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros1.patc=
h
> rename to
> meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_macros1.patch
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_p=
rep
> rocessor_error.patch
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocess
> or_error.patch
> similarity index 100%
> rename from
> meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_pre=
pro
> cessor_error.patch
> rename to
> meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor
> _error.patch
> diff --git
> a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.pa=
tc
> h b/meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch
> similarity index 93%
> rename from
> meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patc=
h
> rename to
> meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch
> index 2b75427..2b32d4e 100644
> ---
> a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.pa=
tc
> h
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch
> @@ -2,7 +2,7 @@ This is the revised version of files/macro_tweak.patch fo=
r
>  xorg-server 1.8.99.904.
>
>  the files/macro_tweak.patch can not removed now since it is used by
> -xserver-kdrive-1.7.99.2 and xserver-xf86-lite_1.7.99.2. Once they
> +xserver-kdrive-1.7.99.2 and xserver-xorg(-lite). Once they
>  are all upgraded to 1.8.99.904, the the files/macro_tweak.patch
>  can be safely replace by this patch.
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.1=
0.1.bb
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
> similarity index 93%
> rename from
> meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
> index b797f97..0194798 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
> @@ -1,4 +1,4 @@
> -require xserver-xf86-dri-lite.inc
> +require xserver-xorg.inc
>
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D74df27b6254cc88d2799b5f4f5949c00"
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git=
.bb
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
> similarity index 94%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.=
bb
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
> index 87ba040..beef06a 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
> @@ -1,4 +1,4 @@
> -require xserver-xf86-dri-lite.inc
> +require xserver-xorg.inc
>
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D74df27b6254cc88d2799b5f4f5949c00"
>
> --
> 1.7.7
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


