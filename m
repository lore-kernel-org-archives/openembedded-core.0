Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1SrTkI-0003Cs-Nr
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 14:52:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Jul 2012 05:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="173674426"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga002.jf.intel.com with ESMTP; 18 Jul 2012 05:41:28 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 18 Jul 2012 13:40:32 +0100
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.176]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.108]) with mapi id
	14.01.0355.002; Wed, 18 Jul 2012 13:40:32 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/3] pulseaudio: upgrade to 2.0
Thread-Index: AQHNZE1nHGCCho9a7kS7jfWhs1bc1Jcu+9xQ
Date: Wed, 18 Jul 2012 12:40:31 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161729C4@IRSMSX102.ger.corp.intel.com>
References: <1342513736-468-1-git-send-email-cristian.iorga@intel.com>
	<1342513736-468-2-git-send-email-cristian.iorga@intel.com>
	<5005B48D.5080707@linux.intel.com>
In-Reply-To: <5005B48D.5080707@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 18 Jul 2012 12:52:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Saul,

libcanberra is just a small recipe inside pulseaudio recipe.
This is the reason for submitting as a single patch.
If is really necessary, I will re-submit them as two patches.

Regards,
Cristian

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Tuesday, July 17, 2012 9:53 PM
To: Patches and discussions about the oe-core layer
Cc: Iorga, Cristian
Subject: Re: [OE-core] [PATCH 2/3] pulseaudio: upgrade to 2.0

On 07/17/2012 01:28 AM, Cristian Iorga wrote:
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   .../{libcanberra_0.28.bb =3D> libcanberra_0.29.bb}   |   14 +++++++----=
---
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
>   .../{pulseaudio_1.1.bb =3D> pulseaudio_2.0.bb}       |    7 +++----
>   3 files changed, 11 insertions(+), 12 deletions(-)
>   rename meta/recipes-multimedia/pulseaudio/{libcanberra_0.28.bb =3D> lib=
canberra_0.29.bb} (76%)
>   rename meta/recipes-multimedia/pulseaudio/{pulseaudio_1.1.bb =3D>=20
> pulseaudio_2.0.bb} (64%)
>
You seem to be updating 2 recipes here, please separate them out as 2 discr=
ete commits.

see below also.

> diff --git a/meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb=20
> b/meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
> similarity index 76%
> rename from meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb
> rename to meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
> index e69c89d..b3c0e3d 100644
> --- a/meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb
> +++ b/meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
> @@ -5,14 +5,14 @@ LIC_FILES_CHKSUM =3D "file://LGPL;md5=3D2d5025d4aa3495b=
efef8f17206a5b0a1 \
>                       file://src/canberra.h;beginline=3D7;endline=3D24;md=
5=3Dc616c687cf8da540a14f917e0d23ab03"
>
>   DEPENDS =3D "gtk+ pulseaudio alsa-lib libtool libvorbis"
> -PR =3D "r1"
> +PR =3D "r0"
>
>   inherit gconf autotools
>
> -SRC_URI =3D "http://0pointer.de/lennart/projects/libcanberra/libcanberra=
-${PV}.tar.gz"
> +SRC_URI =3D "http://0pointer.de/lennart/projects/libcanberra/libcanberra=
-${PV}.tar.xz"
>
> -SRC_URI[md5sum] =3D "c198b4811598c4c161ff505e4531b02c"
> -SRC_URI[sha256sum] =3D "eb1f8b2cabad7f07b6e44d606a91d73e1efca4b46daf92bd=
553e7222bc68868c"
> +SRC_URI[md5sum] =3D "2594093a5d61047bd9cc87e955f86df8"
> +SRC_URI[sha256sum] =3D "127a5ef07805856d63758e5180ebfb241d1f80094fd301c2=
87591a15b8cfcd72"
>
>   EXTRA_OECONF =3D " --disable-oss --disable-ltdl-install"
>
> @@ -25,8 +25,8 @@ PACKAGES +=3D "${PN}-gnome"
>   FILES_${PN} +=3D "${libdir}/gtk-2.0/modules/ ${datadir}/gnome"
>   FILES_${PN}-gnome +=3D "${datadir}/gdm/autostart/LoginWindow/libcanberr=
a-ready-sound.desktop \
>   	              ${libdir}/gnome-settings-daemon-3.0/gtk-modules/canberra=
-gtk-module.desktop"
> -FILES_${PN}-dev +=3D "${libdir}/libcanberra-0.28/libcanberra-*.so \
> -		    ${libdir}/libcanberra-0.28/libcanberra-*.la \
> +FILES_${PN}-dev +=3D "${libdir}/libcanberra-0.29/libcanberra-*.so \
> +		    ${libdir}/libcanberra-0.29/libcanberra-*.la \
>   		    ${datadir}/vala/vapi"
> -FILES_${PN}-dbg +=3D "${libdir}/gtk-2.0/modules/.debug ${libdir}/libcanb=
erra-0.28/.debug"
> +FILES_${PN}-dbg +=3D "${libdir}/gtk-2.0/modules/.debug ${libdir}/libcanb=
erra-0.29/.debug"
>
Can we change these hardcoded version numbers to ${PV} instead? or -*?

> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc=20
> b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index c3d6d98..cd09940 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -6,7 +6,7 @@ LICENSE =3D "GPLv2+ & LGPLv2.1"
>   LIC_FILES_CHKSUM =3D "file://GPL;md5=3D4325afd396febcb659c36b49533135d4=
 \
>                       file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1 =
\
>                       file://src/modules/bluetooth/proximity-helper.c;beg=
inline=3D1;endline=3D25;md5=3De4cc710e40a4d900c2c294167bc58270 \
> -                    file://src/pulsecore/vector.h;beginline=3D1;endline=
=3D21;md5=3D1b561f0a2ca47b1fa49862a6ccaacff1"
> +                    file://src/pulsecore/resampler.h;beginline=3D4;endli=
ne=3D23;md5=3Dc3d539b93f8c82a1780bfa3cfa544a95"

What changed here and why, anytime we change LIC_FILES_CHKSUM you should en=
sure it's commented in the commit message.

>   DEPENDS =3D "libatomics-ops liboil avahi libsamplerate0 libsndfile1 lib=
tool \
>              ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 l=
ibxtst libice libsm libxcb gtk+', '', d)}"
>   # optional
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb=20
> b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb
> similarity index 64%
> rename from meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
> rename to meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb
> index e88a3a5..7e57e5e 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb
> @@ -1,6 +1,6 @@
>   require pulseaudio.inc
>
> -PR =3D "r10"
> +PR =3D "r0"
>
>   DEPENDS +=3D "libjson gdbm speex libxml-parser-perl-native"
>
> @@ -8,11 +8,10 @@ inherit gettext perlnative
>
>   SRC_URI =3D "http://freedesktop.org/software/pulseaudio/releases/pulsea=
udio-${PV}.tar.xz \
>     file://volatiles.04_pulse \
> -  file://pulseaudio_fix_for_x32.patch \
>   "
Why are you removing this patch? Also, you don't remove the corresponding f=
ile?  Did you test x32?


>
> -SRC_URI[md5sum] =3D "17d21df798cee407b769c6355fae397a"
> -SRC_URI[sha256sum] =3D "6fe531136f6ebce2d35872a2d2c914278cdc5dcdd5eea516=
dc52c81f9001f5ee"
> +SRC_URI[md5sum] =3D "9bbde657c353fe675c3b693054175a8e"
> +SRC_URI[sha256sum] =3D "28b42edd42f4879a6884af5f0ec11801ac001eb758288121=
5b36649aa37e2061"
>
>   do_compile_prepend() {
>       cd ${S}
>

Thanks
	Sau!


