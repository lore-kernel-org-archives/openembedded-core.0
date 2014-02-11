Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8DF7E6E8C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 20:09:57 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id t10so3846525eei.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 12:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WkTDLLekuRBE8uPwumQwks6fFC5aXL5f9KONpVlTsWo=;
	b=fT2Xfb88HDiQew3qn3ntEl2EUrU1RqARTGHB4Gmas5BZfxAjsKEh8EYvCDiZeKvUAb
	bfIaZTyMpKvw4StIxpohsD92ZO5qCXqfvQqV5oFZ4jL59Wz5AGu/pt/nbSF+A/CKex5g
	tEMiXGoxWni5tSWxuJMMIMBEMk4mJiSaGb9yvr/pWo3ry5clN1VGe0at4YZP1p2fvIdY
	wWLs71Lz8D+Z+p+70m2wZb5qqrHVe24QDHZKA3Ct7S59EF6gE27WSSAfncsY/N3AuONc
	R0hOqwhM6/aWmh6U4nHsSPYx/TDgHqxzmmKCihUE+8x9Izo1XDFRRZEdJ9svylZN0lWM
	GbgQ==
X-Received: by 10.15.110.69 with SMTP id cg45mr5770774eeb.93.1392149397847;
	Tue, 11 Feb 2014 12:09:57 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k6sm71953660eep.17.2014.02.11.12.09.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Feb 2014 12:09:55 -0800 (PST)
Date: Tue, 11 Feb 2014 21:10:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Message-ID: <20140211201014.GB3776@jama>
References: <1392142093-9057-1-git-send-email-valentin.popa@intel.com>
MIME-Version: 1.0
In-Reply-To: <1392142093-9057-1-git-send-email-valentin.popa@intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: upgrade to 9.2.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Feb 2014 20:09:57 -0000
X-Groupsio-MsgNum: 50041
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline

--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2014 at 08:08:13PM +0200, Valentin Popa wrote:
> tested on qemux86, genericx86 for core-image-sato
> and core-image-weston.

Does it resolve
http://lists.openembedded.org/pipermail/openembedded-core/2014-January/0887=
27.html
?

>=20
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> ---
>  .../mesa/{mesa-gl_9.2.2.bb =3D> mesa-gl_9.2.5.bb}                |  0
>  meta/recipes-graphics/mesa/{mesa_9.2.2.bb =3D> mesa_9.2.5.bb}    | 10 ++=
++++++--
>  meta/recipes-graphics/mesa/mesa_git.bb                         | 10 ++++=
++++--
>  3 files changed, 16 insertions(+), 4 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa-gl_9.2.2.bb =3D> mesa-gl_9.2.5.b=
b} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_9.2.2.bb =3D> mesa_9.2.5.bb} (38=
%)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_9.2.2.bb b/meta/recipes-g=
raphics/mesa/mesa-gl_9.2.5.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_9.2.2.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb
> diff --git a/meta/recipes-graphics/mesa/mesa_9.2.2.bb b/meta/recipes-grap=
hics/mesa/mesa_9.2.5.bb
> similarity index 38%
> rename from meta/recipes-graphics/mesa/mesa_9.2.2.bb
> rename to meta/recipes-graphics/mesa/mesa_9.2.5.bb
> index 60eba01..8d7d88f 100644
> --- a/meta/recipes-graphics/mesa/mesa_9.2.2.bb
> +++ b/meta/recipes-graphics/mesa/mesa_9.2.5.bb
> @@ -5,7 +5,13 @@ SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/Me=
saLib-${PV}.tar.bz2 \
>             file://0006-fix-out-of-tree-egl.patch \
>             "
> =20
> -SRC_URI[md5sum] =3D "20887f8020db7d1736a01ae9cd5d8c38"
> -SRC_URI[sha256sum] =3D "c78a5035233672844cf2492fe82dc10877e12026be227d04=
469d6ca6ac656a3d"
> +SRC_URI[md5sum] =3D "9fb4de29ca1d9cfd03cbdefa123ba336"
> +SRC_URI[sha256sum] =3D "b46ab9efed176df0591993397594d712ada9da6a47fd31bb=
e75050fe28eb6bf0"
> =20
>  S =3D "${WORKDIR}/Mesa-${PV}"
> +
> +#because we cannot rely on the fact that all apps will use pkgconfig,
> +#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> +do_configure_append() {
> +    sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('D=
ISTRO_FEATURES', 'x11', '0', '1', d)}/' ${S}/include/EGL/eglplatform.h
> +}
> diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphi=
cs/mesa/mesa_git.bb
> index 19d3e70..af499a9 100644
> --- a/meta/recipes-graphics/mesa/mesa_git.bb
> +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> @@ -5,8 +5,8 @@ DEFAULT_PREFERENCE =3D "-1"
>  LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3Df69a4626e9efc40fa0d=
3cc3b02c9eacf"
> =20
>  PR =3D "${INC_PR}.0"
> -SRCREV =3D "8f0742051e8501e737affb392996aef172034ca8"
> -PV =3D "9.2.2+git${SRCPV}"
> +SRCREV =3D "4636e87191fddd492ed8c61ba61faf4b2d89b2e4"
> +PV =3D "9.2.5+git${SRCPV}"
> =20
>  SRC_URI =3D "git://anongit.freedesktop.org/git/mesa/mesa \
>             file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when=
-HA.patch \
> @@ -14,3 +14,9 @@ SRC_URI =3D "git://anongit.freedesktop.org/git/mesa/mes=
a \
>             "
> =20
>  S =3D "${WORKDIR}/git"
> +
> +#because we cannot rely on the fact that all apps will use pkgconfig,
> +#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> +do_configure_append() {
> +    sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('D=
ISTRO_FEATURES', 'x11', '0', '1', d)}/' ${S}/include/EGL/eglplatform.h
> +}
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlL6g6YACgkQN1Ujt2V2gBwcpgCgnnLfqATzoc3uFEu0F99Jw8ES
VqcAmgMPu5zYV2/DWLJbT0eiDfhvEKip
=skoY
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
