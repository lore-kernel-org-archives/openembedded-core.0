Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TUk10-0002MS-UC; Sat, 03 Nov 2012 21:08:23 +0100
Received: by mail-ee0-f47.google.com with SMTP id t10so2287308eei.6
	for <multiple recipients>; Sat, 03 Nov 2012 12:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Fgl5GqKTCFgdIrAMHdtNhNyqSyxq1Ura6KP4GRdSBwI=;
	b=A+8nTa38rm0G9cyKVu9X01xQIYKhtdb8Bkk7Eolw47i1i+/8+HbyM3UVlGr2w0tj0v
	FdbcYyTMnLnWGCXy/eNYvtvbG/QLgbRiz6G2gqE0/YUJlhLJQ2jJEUF3ZbbB4BXojH5T
	nYKb4xjVUs6vW2gwcqaNNGy0qd75r92Z8+zBzBi1Ao7DO1qFLchN1uY4a0PlLAoYmONH
	/VjabSAzjtOZRjDV+yGmT2ZG+wRvtac04v3R+eC4mVKEb4oFLOAbb9EuX/04iufZjqNH
	VkkjRpci3DgJNHrOa2h73dnvDWxKWlrOrEZsKA8NnR/du4QqBLDYL4+ITAbfzZH8kD3i
	mxcQ==
Received: by 10.14.223.4 with SMTP id u4mr19533062eep.19.1351972481873;
	Sat, 03 Nov 2012 12:54:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm34059004eel.14.2012.11.03.12.54.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Nov 2012 12:54:40 -0700 (PDT)
Date: Sat, 3 Nov 2012 20:54:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: daniel@fooishbar.org, ross.burton@intel.com,
	openembedded-core@lists.openembedded.org
Message-ID: <20121103195435.GE30165@jama.jama.net>
References: <20121102161855.814CC102E2@opal>
MIME-Version: 1.0
In-Reply-To: <20121102161855.814CC102E2@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Daniel Stone : mesa: Build separate GLU library
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Nov 2012 20:08:23 -0000
X-Groupsio-MsgNum: 31141
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qFgkTsE6LiHkLPZw"
Content-Disposition: inline

--qFgkTsE6LiHkLPZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 02, 2012 at 04:18:55PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 4395691a44b198ba0b9a969cbade669e8de07a4f
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D4395691a44b198ba0b9a969cbade669e8de07a4f
>=20
> Author: Daniel Stone <daniel@fooishbar.org>
> Date:   Fri Oct 26 16:00:09 2012 +0100
>=20
> mesa: Build separate GLU library

This seems to cause incremental qt4-x11-free builds to fail with:
| arm-oe-linux-gnueabi-g++  -march=3Darmv4t -marm -mthumb-interwork -mtune=
=3Darm920t --sysroot=3D/var/lib/jenkins/jobs/shr-core-branches/workspace/sh=
r-core/tmp-eglibc/sysroots/om-gta02 -Wl,-rpath-link,/var/lib/jenkins/jobs/s=
hr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/om-gta02/usr/lib -W=
l,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-rpath-link,/var/lib/jenki=
ns/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linu=
x-gnueabi/qt4-x11-free-4.8.3-r48.0/qt-everywhere-opensource-src-4.8.3/lib -=
Wl,-rpath-link,/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/t=
mp-eglibc/work/armv4t-oe-linux-gnueabi/qt4-x11-free-4.8.3-r48.0/qt-everywhe=
re-opensource-src-4.8.3/lib -shared -o libqglgraphicssystem.so .obj/release=
-shared/main.o   -L/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-co=
re/tmp-eglibc/sysroots/om-gta02/usr/lib -L/var/lib/jenkins/jobs/shr-core-br=
anches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/qt4-x11-f=
ree-4.8.3-r48.0/qt-everywhere-opensource-src-4.8.3/lib -lQtOpenGL -L/var/li=
b/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/om-=
gta02/usr/lib -L/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/=
tmp-eglibc/work/armv4t-oe-linux-gnueabi/qt4-x11-free-4.8.3-r48.0/qt-everywh=
ere-opensource-src-4.8.3/lib -lQtGui -lQtCore -lGLU -lGL -lpthread
| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sys=
roots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi/gcc/arm-oe-linux-gnu=
eabi/4.7.2/ld: cannot find -lGLU
| collect2: error: ld returned 1 exit status
| make[3]: *** [../../../../plugins/graphicssystems/libqglgraphicssystem.so=
] Error 1

> Mesa has removed GLU from the core tree upstream, so remove it from the
> Mesa build and add the separate tarball as a new recipe.
>=20
> Signed-off-by: Daniel Stone <daniel@fooishbar.org>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-graphics/glew/glew_1.9.0.bb   |    4 ++--
>  meta/recipes-graphics/mesa/libglu_9.0.0.bb |   27 ++++++++++++++++++++++=
+++++
>  meta/recipes-graphics/mesa/mesa-common.inc |   12 +++++++-----
>  3 files changed, 36 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/glew/glew_1.9.0.bb b/meta/recipes-grap=
hics/glew/glew_1.9.0.bb
> index 00fff11..599d64b 100644
> --- a/meta/recipes-graphics/glew/glew_1.9.0.bb
> +++ b/meta/recipes-graphics/glew/glew_1.9.0.bb
> @@ -5,9 +5,9 @@ SECTION =3D "x11"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D2ac251558de685c6b9478d89b=
e3149c2"
> =20
> -DEPENDS =3D "virtual/libx11 virtual/libgl libxext libxi libxmu"
> +DEPENDS =3D "virtual/libx11 virtual/libgl libglu libxext libxi libxmu"
> =20
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tg=
z \
>             file://autotools.patch \
> diff --git a/meta/recipes-graphics/mesa/libglu_9.0.0.bb b/meta/recipes-gr=
aphics/mesa/libglu_9.0.0.bb
> new file mode 100644
> index 0000000..7980749
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/libglu_9.0.0.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "The OpenGL utility toolkit"
> +DESCRIPTION =3D "GLU is a utility toolkit used with OpenGL implementatio=
ns"
> +
> +HOMEPAGE =3D "http://mesa3d.org"
> +BUGTRACKER =3D "https://bugs.freedesktop.org"
> +SECTION =3D "x11"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://include/GL/glu.h;endline=3D29;md5=3D6b79c57=
0f644363b356456e7d44471d9 \
> +                    file://src/libtess/tess.c;endline=3D29;md5=3D6b79c57=
0f644363b356456e7d44471d9"
> +
> +# Epoch as this used to be part of mesa-dri
> +PE =3D "2"
> +PR =3D "0"
> +
> +SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/glu/glu-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] =3D "be9249132ff49275461cf92039083030"
> +SRC_URI[sha256sum] =3D "1f7ad0d379a722fcbd303aa5650c6d7d5544fde83196b42a=
73d1193568a4df12"
> +
> +S =3D "${WORKDIR}/glu-${PV}"
> +
> +DEPENDS =3D "virtual/libgl"
> +
> +inherit autotools pkgconfig
> +
> +# Remove the mesa-glu dependency in mesa-glu-dev, as mesa-glu is empty
> +RDEPENDS_${PN}-dev =3D ""
> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-gr=
aphics/mesa/mesa-common.inc
> index faa8183..460877c 100644
> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> @@ -12,7 +12,7 @@ SECTION =3D "x11"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3D03ccdc4c379c4289aec=
fb8892c546f67"
> =20
> -INC_PR =3D "r3"
> +INC_PR =3D "r4"
>  PE =3D "2"
> =20
>  DEPENDS =3D "libxml2-native makedepend-native flex-native bison-native"
> @@ -24,7 +24,7 @@ FILESEXTRAPATHS_append :=3D "${THISDIR}/mesa:"
> =20
>  inherit autotools pkgconfig pythonnative
> =20
> -EXTRA_OECONF =3D "--enable-glu \
> +EXTRA_OECONF =3D "--disable-glu \
>                  --disable-glw \
>                  --disable-glut \
>                  --enable-shared-glapi"
> @@ -42,7 +42,6 @@ EXCLUDE_FROM_WORLD =3D "1"
>  RDEPENDS_${PN}-dev =3D ""
> =20
>  PACKAGES =3D+ "libegl libegl-dev \
> -             libglu libglu-dev \
>               libosmesa libosmesa-dev \
>               libgl libgl-dev \
>               libglapi libglapi-dev \
> @@ -51,13 +50,17 @@ PACKAGES =3D+ "libegl libegl-dev \
>               libgles2 libgles2-dev \
>              "
> =20
> +do_install_append () {
> +    # GLU is now in libglu (this shouldn't be required in Mesa 9.x)
> +    rm -f ${D}${includedir}/GL/glu*
> +}
> +
>  FILES_libegl =3D "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
>  FILES_libgbm =3D "${libdir}/libgbm.so.*"
>  FILES_libgles1 =3D "${libdir}/libGLESv1*.so.*"
>  FILES_libgles2 =3D "${libdir}/libGLESv2.so.*"
>  FILES_libgl =3D "${libdir}/libGL.so.*"
>  FILES_libglapi =3D "${libdir}/libglapi.so.*"
> -FILES_libglu =3D "${libdir}/libGLU.so.*"
>  FILES_libosmesa =3D "${libdir}/libOSMesa.so.*"
> =20
>  FILES_libegl-dev =3D "${libdir}/libEGL.* ${includedir}/EGL ${includedir}=
/KHR ${libdir}/pkgconfig/egl.pc"
> @@ -66,7 +69,6 @@ FILES_libgl-dev =3D "${libdir}/libGL.* ${includedir}/GL=
 ${libdir}/pkgconfig/gl.pc"
>  FILES_libglapi-dev =3D "${libdir}/libglapi.*"
>  FILES_libgles1-dev =3D "${libdir}/libGLESv1*.* ${includedir}/GLES ${libd=
ir}/pkgconfig/glesv1*.pc"
>  FILES_libgles2-dev =3D "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libd=
ir}/pkgconfig/glesv2.pc"
> -FILES_libglu-dev =3D "${libdir}/libGLU.* ${includedir}/GL/glu*.h ${libdi=
r}/pkgconfig/glu.pc"
>  FILES_libosmesa-dev =3D "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
> =20
>  FILES_${PN}-dbg +=3D "${libdir}/dri/.debug/* ${libdir}/egl/.debug/*"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qFgkTsE6LiHkLPZw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCVdnsACgkQN1Ujt2V2gBwvQQCgmVfoVyRLTn9H5Pu97fzQCJqs
M30AoLFZFhRnOjwv51tgexuML3R1bVCB
=lYc0
-----END PGP SIGNATURE-----

--qFgkTsE6LiHkLPZw--
