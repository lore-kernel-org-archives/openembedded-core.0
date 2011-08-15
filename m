Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1QsrOt-0003g4-BA
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 09:15:55 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 15 Aug 2011 00:10:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,372,1309762800"; 
   d="scan'208";a="7100516"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Aug 2011 00:10:12 -0700
Received: from pgsmsx102.gar.corp.intel.com (10.221.44.80) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 15 Aug 2011 15:09:12 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX102.gar.corp.intel.com (10.221.44.80) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Mon, 15 Aug 2011 15:09:12 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Mon, 15 Aug 2011 15:09:08 +0800
From: "Xu, Jiajun" <jiajun.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 15 Aug 2011 15:09:07 +0800
Thread-Topic: [OE-core] [PATCH 1/1] libsdl: Add libSDL.so into Sato image
Thread-Index: AcxYCKlYDQwHQM/wQBiphoJs7/DpGQDDi1dA
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D7163EBE@shsmsx501.ccr.corp.intel.com>
References: <cover.1312523858.git.jiajun.xu@intel.com>
	<c9f3ca9552ecf8d0c3bd1128ee7a915bfb7776f6.1312523858.git.jiajun.xu@intel.com>
	<1312979842.14274.370.camel@rex>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D70F765D@shsmsx501.ccr.corp.intel.com>
	<1313054734.6733.91.camel@phil-desktop>
In-Reply-To: <1313054734.6733.91.camel@phil-desktop>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] libsdl: Add libSDL.so into Sato image
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
X-List-Received-Date: Mon, 15 Aug 2011 07:15:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> Something like that, yeah.  I don't think you want/need to do anything
> with RDEPENDS since that should all be automatic.
>=20

Thanks for your suggestion, Phil. I have modified my patches as below. Coul=
d you help to review it?

> If SDL can use GLES as well as GL then it might be worth adding
> support for both.  They should probably be separate DISTRO_FEATUREs
> (and possibly we should have separate features again for GLES1.1 versus G=
LES2.0).
>=20

It seems libsdl 1.2 could not support GLES. Libsdl 1.3 supports GLES but it=
 is still under construction.


Patch 1
Libsdl: add target version
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Djxu49/oe=
-contrib&id=3De141a00db49c6c2aa631b065b4a1391c9abe0277

diff --git a/meta/recipes-graphics/libsdl/libsdl-nativesdk_1.2.11.bb b/meta=
/recipes-graphics/libsdl/libsdl_1.2.11.bb
similarity index 73%
rename from meta/recipes-graphics/libsdl/libsdl-nativesdk_1.2.11.bb
rename to meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
index e64a62e..7c1c507 100644
--- a/meta/recipes-graphics/libsdl/libsdl-nativesdk_1.2.11.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
@@ -1,17 +1,25 @@
-DESCRIPTION =3D "Simple DirectMedia Layer - native Edition"
+SUMMARY =3D "Simple DirectMedia Layer"
+DESCRIPTION =3D "Simple DirectMedia Layer is a cross-platform multimedia \
+library designed to provide low level access to audio, keyboard, mouse, \
+joystick, 3D hardware via OpenGL, and 2D video framebuffer."
 HOMEPAGE =3D "http://www.libsdl.org"
+BUGTRACKER =3D "http://bugzilla.libsdl.org/"
+
 SECTION =3D "libs"
-LICENSE =3D "LGPLv2.1"
-DEPENDS =3D "libx11-nativesdk libxext-nativesdk libxrandr-nativesdk libxre=
nder-nativesdk"
-RDEPENDS_${PN} =3D "libx11-nativesdk libxrandr-nativesdk libxrender-native=
sdk libxext-nativesdk"
-PR =3D "r5"

+LICENSE =3D "LGPLv2.1"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D27818cd7fd83877a8e3ef82b82798ef=
4"

+DEPENDS =3D "virtual/libx11 libxext libxrandr libxrender"
+DEPENDS_virtclass-nativesdk =3D "libx11-nativesdk libxrandr-nativesdk libx=
render-nativesdk libxext-nativesdk"
+
+PR =3D "r6"
+
 SRC_URI =3D "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
           file://acinclude.m4 \
           file://configure_tweak.patch;patch=3D1 \
           file://kernel-asm-page.patch;patch=3D1 "
+
 S =3D "${WORKDIR}/SDL-${PV}"

 SRC_URI[md5sum] =3D "418b42956b7cd103bfab1b9077ccc149"
@@ -34,3 +42,5 @@ PARALLEL_MAKE =3D ""
 do_configure_prepend() {
        cp ${WORKDIR}/acinclude.m4 ${S}/acinclude.m4
 }
+
+BBCLASSEXTEND =3D "nativesdk"


Patch 2
Libsdl: enable opengl for libsdl
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Djxu49/oe=
-contrib&id=3Da6139bd9b26c792ab0c00b57c374e9ac8dade33d

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb b/meta/recipes-g=
raphics/libsdl/libsdl_1.2.11.bb
index 7c1c507..f08077d 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
@@ -10,10 +10,10 @@ SECTION =3D "libs"
 LICENSE =3D "LGPLv2.1"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D27818cd7fd83877a8e3ef82b82798ef=
4"

-DEPENDS =3D "virtual/libx11 libxext libxrandr libxrender"
+DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl'=
, '', d)} virtual/libx11 libxext libxrandr libxrender"
 DEPENDS_virtclass-nativesdk =3D "libx11-nativesdk libxrandr-nativesdk libx=
render-nativesdk libxext-nativesdk"

-PR =3D "r6"
+PR =3D "r7"

 SRC_URI =3D "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
           file://acinclude.m4 \
@@ -33,7 +33,8 @@ EXTRA_OECONF =3D "--disable-static --disable-debug --disa=
ble-cdrom --enable-thread
                 --disable-mintaudio --disable-nasm --enable-video-x11 --di=
sable-video-dga \
                 --disable-video-fbcon --disable-video-directfb --disable-v=
ideo-ps2gs \
                 --disable-video-xbios --disable-video-gem --disable-video-=
dummy \
-                --disable-video-opengl --enable-input-events --enable-pthr=
eads \
+                --enable-input-events --enable-pthreads \
+               ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-vid=
eo-opengl', '--disable-video-opengl', d)} \
                --disable-video-svga \
                 --disable-video-picogui --disable-video-qtopia --enable-dl=
open"


> p.

Best Regards,
Jiajun




