Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1StFyW-0000Cj-Cx
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 12:34:52 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jul 2012 03:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="196663880"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2012 03:23:23 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Mon, 23 Jul 2012 11:23:23 +0100
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.176]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.108]) with mapi id
	14.01.0355.002; Mon, 23 Jul 2012 11:23:22 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] libcanberra: upgrade to ver. 0.29
Thread-Index: AQHNZtbF0gBv5qocoEqppvaSfJ26Zpc2qJsQ
Date: Mon, 23 Jul 2012 10:23:21 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1617413B@IRSMSX102.ger.corp.intel.com>
References: <1342778862-503-1-git-send-email-cristian.iorga@intel.com>
	<5009F5FC.5020409@linux.intel.com>
In-Reply-To: <5009F5FC.5020409@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] libcanberra: upgrade to ver. 0.29
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
X-List-Received-Date: Mon, 23 Jul 2012 10:34:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Saul,

I think everything is ok now.
Thanks.
It is already merged, with the right versions.

/Cristian

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Saturday, July 21, 2012 3:21 AM
To: Patches and discussions about the oe-core layer
Cc: Iorga, Cristian
Subject: Re: [OE-core] [PATCH 1/2] libcanberra: upgrade to ver. 0.29

On 07/20/2012 03:07 AM, Cristian Iorga wrote:
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   .../{libcanberra_0.28.bb =3D> libcanberra_0.29.bb}   |   14 +++++++----=
---
>   1 file changed, 7 insertions(+), 7 deletions(-)
>   rename meta/recipes-multimedia/pulseaudio/{libcanberra_0.28.bb =3D>=20
> libcanberra_0.29.bb} (76%)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb=20
> b/meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
> similarity index 76%
> rename from meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb
> rename to meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
> index e69c89d..27020c5 100644
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
> +FILES_${PN}-dev +=3D "${libdir}/libcanberra-${PV}/libcanberra-*.so \
> +		    ${libdir}/libcanberra-${PV}/libcanberra-*.la \
>   		    ${datadir}/vala/vapi"
> -FILES_${PN}-dbg +=3D "${libdir}/gtk-2.0/modules/.debug ${libdir}/libcanb=
erra-0.28/.debug"
> +FILES_${PN}-dbg +=3D "${libdir}/gtk-2.0/modules/.debug ${libdir}/libcanb=
erra-${PV}/.debug"
>
>


Richard merged earlier verions of both these patches, please verify if you =
need to rebase and make any additional changes and re-submit.

Sorry about the confusion

Thanks
	Sau!


