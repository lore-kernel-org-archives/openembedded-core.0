Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrD4I-0005sV-Jy
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 21:04:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Jul 2012 11:53:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169504433"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 17 Jul 2012 11:53:01 -0700
Message-ID: <5005B48D.5080707@linux.intel.com>
Date: Tue, 17 Jul 2012 11:53:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342513736-468-1-git-send-email-cristian.iorga@intel.com>
	<1342513736-468-2-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1342513736-468-2-git-send-email-cristian.iorga@intel.com>
Subject: Re: [PATCH 2/3] pulseaudio: upgrade to 2.0
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
X-List-Received-Date: Tue, 17 Jul 2012 19:04:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2012 01:28 AM, Cristian Iorga wrote:
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   .../{libcanberra_0.28.bb => libcanberra_0.29.bb}   |   14 +++++++-------
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
>   .../{pulseaudio_1.1.bb => pulseaudio_2.0.bb}       |    7 +++----
>   3 files changed, 11 insertions(+), 12 deletions(-)
>   rename meta/recipes-multimedia/pulseaudio/{libcanberra_0.28.bb => libcanberra_0.29.bb} (76%)
>   rename meta/recipes-multimedia/pulseaudio/{pulseaudio_1.1.bb => pulseaudio_2.0.bb} (64%)
>
You seem to be updating 2 recipes here, please separate them out as 2 
discrete commits.

see below also.

> diff --git a/meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb b/meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
> similarity index 76%
> rename from meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb
> rename to meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
> index e69c89d..b3c0e3d 100644
> --- a/meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb
> +++ b/meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
> @@ -5,14 +5,14 @@ LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>                       file://src/canberra.h;beginline=7;endline=24;md5=c616c687cf8da540a14f917e0d23ab03"
>
>   DEPENDS = "gtk+ pulseaudio alsa-lib libtool libvorbis"
> -PR = "r1"
> +PR = "r0"
>
>   inherit gconf autotools
>
> -SRC_URI = "http://0pointer.de/lennart/projects/libcanberra/libcanberra-${PV}.tar.gz"
> +SRC_URI = "http://0pointer.de/lennart/projects/libcanberra/libcanberra-${PV}.tar.xz"
>
> -SRC_URI[md5sum] = "c198b4811598c4c161ff505e4531b02c"
> -SRC_URI[sha256sum] = "eb1f8b2cabad7f07b6e44d606a91d73e1efca4b46daf92bd553e7222bc68868c"
> +SRC_URI[md5sum] = "2594093a5d61047bd9cc87e955f86df8"
> +SRC_URI[sha256sum] = "127a5ef07805856d63758e5180ebfb241d1f80094fd301c287591a15b8cfcd72"
>
>   EXTRA_OECONF = " --disable-oss --disable-ltdl-install"
>
> @@ -25,8 +25,8 @@ PACKAGES += "${PN}-gnome"
>   FILES_${PN} += "${libdir}/gtk-2.0/modules/ ${datadir}/gnome"
>   FILES_${PN}-gnome += "${datadir}/gdm/autostart/LoginWindow/libcanberra-ready-sound.desktop \
>   	              ${libdir}/gnome-settings-daemon-3.0/gtk-modules/canberra-gtk-module.desktop"
> -FILES_${PN}-dev += "${libdir}/libcanberra-0.28/libcanberra-*.so \
> -		    ${libdir}/libcanberra-0.28/libcanberra-*.la \
> +FILES_${PN}-dev += "${libdir}/libcanberra-0.29/libcanberra-*.so \
> +		    ${libdir}/libcanberra-0.29/libcanberra-*.la \
>   		    ${datadir}/vala/vapi"
> -FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug ${libdir}/libcanberra-0.28/.debug"
> +FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug ${libdir}/libcanberra-0.29/.debug"
>
Can we change these hardcoded version numbers to ${PV} instead? or -*?

> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index c3d6d98..cd09940 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -6,7 +6,7 @@ LICENSE = "GPLv2+ & LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
>                       file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>                       file://src/modules/bluetooth/proximity-helper.c;beginline=1;endline=25;md5=e4cc710e40a4d900c2c294167bc58270 \
> -                    file://src/pulsecore/vector.h;beginline=1;endline=21;md5=1b561f0a2ca47b1fa49862a6ccaacff1"
> +                    file://src/pulsecore/resampler.h;beginline=4;endline=23;md5=c3d539b93f8c82a1780bfa3cfa544a95"

What changed here and why, anytime we change LIC_FILES_CHKSUM you should 
ensure it's commented in the commit message.

>   DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool \
>              ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxtst libice libsm libxcb gtk+', '', d)}"
>   # optional
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb
> similarity index 64%
> rename from meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
> rename to meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb
> index e88a3a5..7e57e5e 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb
> @@ -1,6 +1,6 @@
>   require pulseaudio.inc
>
> -PR = "r10"
> +PR = "r0"
>
>   DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
>
> @@ -8,11 +8,10 @@ inherit gettext perlnative
>
>   SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
>     file://volatiles.04_pulse \
> -  file://pulseaudio_fix_for_x32.patch \
>   "
Why are you removing this patch? Also, you don't remove the 
corresponding file?  Did you test x32?


>
> -SRC_URI[md5sum] = "17d21df798cee407b769c6355fae397a"
> -SRC_URI[sha256sum] = "6fe531136f6ebce2d35872a2d2c914278cdc5dcdd5eea516dc52c81f9001f5ee"
> +SRC_URI[md5sum] = "9bbde657c353fe675c3b693054175a8e"
> +SRC_URI[sha256sum] = "28b42edd42f4879a6884af5f0ec11801ac001eb7582881215b36649aa37e2061"
>
>   do_compile_prepend() {
>       cd ${S}
>

Thanks
	Sau!


