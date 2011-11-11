Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROoqL-0004dk-IJ
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 12:00:21 +0100
Received: by faat2 with SMTP id t2so4054393faa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 02:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=df1U/1uQ6XcbfHLNVkq+3Jb3Qb4hBFZ8HBIeqWo0rvk=;
	b=Ngta+IkB2N+8Mw+fQh7QuRXPRctgu5P1mvpu5SBRBHVCJPq+NEZ5x8BBkpfgHNV6PF
	KI56UsSIBOOjdHy+0DfJMxi10qLMxRa3grCQnvBe7vIWVIdtu4vWM50YhMzI8BgoDOUG
	NueCEu5C/07rS5qysp8qlmusGr7d66l6EugXM=
Received: by 10.223.6.15 with SMTP id 15mr18452464fax.4.1321008844057;
	Fri, 11 Nov 2011 02:54:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o16sm15100608fag.21.2011.11.11.02.54.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 02:54:03 -0800 (PST)
Date: Fri, 11 Nov 2011 11:53:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111111105351.GA3574@jama.jama.net>
References: <cover.1321006415.git.xiaofeng.yan@windriver.com>
	<916a101607fa80d75dc37e833a792f4373f03890.1321006415.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <916a101607fa80d75dc37e833a792f4373f03890.1321006415.git.xiaofeng.yan@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/1] diretfb: update to 1.4.15
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
X-List-Received-Date: Fri, 11 Nov 2011 11:00:21 -0000
X-Groupsio-MsgNum: 12353
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 11, 2011 at 06:56:20PM +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

cover letter says 1.4.5 instead of 1.4.15
and this says diretfb instead of directfb

Cheers,

>=20
> The newest version for directfb is 1.5.3 but it's instruction set base on=
 armv6.
> Current qemuarm don't have some instructions for armv6 because some codes=
 of \
> the new version of directfb more than 1.5 are realized with assemble lang=
uage,for example the lock. \
> I update this recipe to 1.4.15 for directfb running more platform.
>=20
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  .../{directfb_1.4.12.bb =3D> directfb_1.4.15.bb}     |    9 ++++-
>  .../directfb-1.2.x-fix-pkgconfig-cflags.patch      |   36 +++++++++-----=
-----
>  2 files changed, 24 insertions(+), 21 deletions(-)
>  rename meta/recipes-graphics/directfb/{directfb_1.4.12.bb =3D> directfb_=
1.4.15.bb} (63%)
>=20
> diff --git a/meta/recipes-graphics/directfb/directfb_1.4.12.bb b/meta/rec=
ipes-graphics/directfb/directfb_1.4.15.bb
> similarity index 63%
> rename from meta/recipes-graphics/directfb/directfb_1.4.12.bb
> rename to meta/recipes-graphics/directfb/directfb_1.4.15.bb
> index 4e8203b..71c0876 100644
> --- a/meta/recipes-graphics/directfb/directfb_1.4.12.bb
> +++ b/meta/recipes-graphics/directfb/directfb_1.4.15.bb
> @@ -1,10 +1,15 @@
>  require directfb.inc
> =20
> -RV =3D "1.4-5"
> +RV =3D "1.4-6"
>  PR =3D "r0"
> =20
>  DEPENDS +=3D "sysfsutils"
> =20
> +SRC_URI =3D " \
> +    http://directfb.org/downloads/Core/DirectFB-1.4/DirectFB-${PV}.tar.g=
z \
> +    file://directfb-1.2.x-fix-pkgconfig-cflags.patch \
> +    "
> +
>  EXTRA_OECONF =3D "\
>    --enable-freetype=3Dyes \
>    --enable-zlib \
> @@ -14,7 +19,7 @@ EXTRA_OECONF =3D "\
>    --disable-x11 \
>  "
> =20
> -LEAD_SONAME =3D "libdirectfb-1.4.so.5"
> +LEAD_SONAME =3D "libdirectfb-1.4.so.6"
> =20
>  SRC_URI[md5sum] =3D "2c779c9a8456790c6c29ad85459b2600"
>  SRC_URI[sha256sum] =3D "b119ab9c5c0c505c23e32d41ae54bd04cb474c5e58900ec0=
f1cf9482f892f9b2"
> diff --git a/meta/recipes-graphics/directfb/files/directfb-1.2.x-fix-pkgc=
onfig-cflags.patch b/meta/recipes-graphics/directfb/files/directfb-1.2.x-fi=
x-pkgconfig-cflags.patch
> index 274ad50..ee60718 100644
> --- a/meta/recipes-graphics/directfb/files/directfb-1.2.x-fix-pkgconfig-c=
flags.patch
> +++ b/meta/recipes-graphics/directfb/files/directfb-1.2.x-fix-pkgconfig-c=
flags.patch
> @@ -1,9 +1,11 @@
> +directfb: Get this patch from Openembedded
> +
>  Upstream-Status: Inappropriate [configuration]
> +Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> =20
> -Index: DirectFB-1.4.11/directfb-internal.pc.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- DirectFB-1.4.11.orig/directfb-internal.pc.in	2010-10-08 05:43:46.000=
000000 -0700
> -+++ DirectFB-1.4.11/directfb-internal.pc.in	2011-04-06 13:48:23.12092399=
7 -0700
> +diff -Nur DirectFB-1.4.15/directfb-internal.pc.in DirectFB-1.4.15.new//d=
irectfb-internal.pc.in
> +--- DirectFB-1.4.15/directfb-internal.pc.in	2011-09-29 17:51:21.00000000=
0 +0800
> ++++ DirectFB-1.4.15.new//directfb-internal.pc.in	2011-11-03 15:14:37.000=
000000 +0800
>  @@ -2,10 +2,10 @@
>   exec_prefix=3D@exec_prefix@
>   moduledir=3D@MODULEDIR@
> @@ -17,31 +19,27 @@ Index: DirectFB-1.4.11/directfb-internal.pc.in
>   Requires: directfb =3D @VERSION@
>  -Cflags: @DFB_INTERNAL_CFLAGS@ -I@INTERNALINCLUDEDIR@
>  +Cflags: @DFB_INTERNAL_CFLAGS@ -I${includedir}/directfb -I${includedir}
> -Index: DirectFB-1.4.11/directfb.pc.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- DirectFB-1.4.11.orig/directfb.pc.in	2010-11-15 13:13:59.000000000 -0=
800
> -+++ DirectFB-1.4.11/directfb.pc.in	2011-04-06 14:09:33.528923998 -0700
> -@@ -9,4 +9,5 @@
> +diff -Nur DirectFB-1.4.15/directfb.pc.in DirectFB-1.4.15.new//directfb.p=
c.in
> +--- DirectFB-1.4.15/directfb.pc.in	2011-09-29 17:51:21.000000000 +0800
> ++++ DirectFB-1.4.15.new//directfb.pc.in	2011-11-03 15:15:55.000000000 +0=
800
> +@@ -9,4 +9,4 @@
>   Requires: @DEP_VOODOO@ fusion direct
>   Libs: -L${libdir} -ldirectfb @THREADLIB@ @OSX_LIBS@
> - Libs.private: -L${libdir} @MEDIALIB@ @DYNLIB@ @ZLIB_LIBS@
> + Libs.private: -L${libdir} @LIBM@ @DYNLIB@ @ZLIB_LIBS@
>  -Cflags: @THREADFLAGS@ -I@INCLUDEDIR@
>  +Cflags: @THREADFLAGS@ -I${includedir}/directfb
> -+
> -Index: DirectFB-1.4.11/lib/fusion/fusion.pc.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- DirectFB-1.4.11.orig/lib/fusion/fusion.pc.in	2010-10-08 05:43:46.000=
000000 -0700
> -+++ DirectFB-1.4.11/lib/fusion/fusion.pc.in	2011-04-06 13:48:23.12092399=
7 -0700
> +diff -Nur DirectFB-1.4.15/lib/fusion/fusion.pc.in DirectFB-1.4.15.new//l=
ib/fusion/fusion.pc.in
> +--- DirectFB-1.4.15/lib/fusion/fusion.pc.in	2011-09-29 17:51:21.00000000=
0 +0800
> ++++ DirectFB-1.4.15.new//lib/fusion/fusion.pc.in	2011-11-03 15:16:46.000=
000000 +0800
>  @@ -8,4 +8,4 @@
>   Version: @VERSION@
>   Requires: direct
>   Libs: -L${libdir} -lfusion
>  -Cflags: -I@INCLUDEDIR@
>  +Cflags: -I${includedir}/directfb -I${includedir}
> -Index: DirectFB-1.4.11/lib/voodoo/voodoo.pc.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- DirectFB-1.4.11.orig/lib/voodoo/voodoo.pc.in	2010-10-08 05:43:46.000=
000000 -0700
> -+++ DirectFB-1.4.11/lib/voodoo/voodoo.pc.in	2011-04-06 13:48:23.12092399=
7 -0700
> +diff -Nur DirectFB-1.4.15/lib/voodoo/voodoo.pc.in DirectFB-1.4.15.new//l=
ib/voodoo/voodoo.pc.in
> +--- DirectFB-1.4.15/lib/voodoo/voodoo.pc.in	2011-09-29 17:51:21.00000000=
0 +0800
> ++++ DirectFB-1.4.15.new//lib/voodoo/voodoo.pc.in	2011-11-03 15:17:34.000=
000000 +0800
>  @@ -8,4 +8,4 @@
>   Version: @VERSION@
>   Requires: direct
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk68/r8ACgkQN1Ujt2V2gBzqlQCfafuT8NM1c92hJpid51+Cm9p4
9B4AnijiCI76O7fWgNgiPu64IXhgRqv7
=CDAV
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
