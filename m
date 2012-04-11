Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SI4Ww-0004Mk-9G
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 22:52:42 +0200
Received: by wgbds1 with SMTP id ds1so4062186wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 13:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=W9Fwl7nyXhoNkdoLoyHnB4XODt6bXGJjmZFVwwV0DLc=;
	b=j1Al+2hfqU0uxE4cY59kd8QZr4WZYwygg4dnB1/qlWWzVNqkgeBCAbSTuGl/xk4c4D
	3KmjYzdyeqMHfGZzcFX0MrdBG1yU54I/40eVH1XC4zjIQEboWrlbLR1a6dOGcflxXFhI
	swDvUvTm3vy1nV8m/nq++dIkdMm68sxPmo9Rfig8aeWpkJm1FJhOZcTd4sUAFQq/0bzu
	soTZK1K4SCUEQwSa23MZjDTsuTmin+LkDsa4evja5Q7SWFCI0/KBJNEQobNZoPqchlV+
	H5ZT4hWfD1hRAagSOSVUjXsC5Ay9MdJ3D0AkBdF9lg7vW5zOeVU5GhU6Srf3jWTAPboz
	fdGw==
Received: by 10.180.8.231 with SMTP id u7mr19301753wia.9.1334177003025;
	Wed, 11 Apr 2012 13:43:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n20sm13419741wiw.5.2012.04.11.13.43.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 13:43:21 -0700 (PDT)
Date: Wed, 11 Apr 2012 13:43:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120411114320.GA3637@jama.jama.net>
References: <1334160821-11771-1-git-send-email-florin.sarbu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1334160821-11771-1-git-send-email-florin.sarbu@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] vala: Add vala package as a devtool (version 0.12.1)
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
X-List-Received-Date: Wed, 11 Apr 2012 20:52:42 -0000
X-Groupsio-MsgNum: 20611
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 11, 2012 at 07:13:41PM +0300, Florin Sarbu wrote:
> Added the vala package from meta-oe to support future systemd integration.

When you're adding it from meta-oe, why not in current version with
needed patch to build e.g. midori?

=2E./meta-openembedded/meta-oe/recipes-devtools/vala/vala-0.14.2
=2E./meta-openembedded/meta-oe/recipes-devtools/vala/vala-0.14.2/0001-git-v=
ersion-gen-don-t-append-dirty-if-we-re-not-in-g.patch
=2E./meta-openembedded/meta-oe/recipes-devtools/vala/vala_0.14.2.bb
=2E./meta-openembedded/meta-oe/recipes-devtools/vala/vala.inc

Cheers,

>=20
> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
> ---
>  meta/recipes-devtools/vala/vala.inc       |   25 +++++++++++++++++++++++=
++
>  meta/recipes-devtools/vala/vala_0.12.1.bb |    7 +++++++
>  2 files changed, 32 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-devtools/vala/vala.inc
>  create mode 100644 meta/recipes-devtools/vala/vala_0.12.1.bb
>=20
> diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/=
vala/vala.inc
> new file mode 100644
> index 0000000..0815c66
> --- /dev/null
> +++ b/meta/recipes-devtools/vala/vala.inc
> @@ -0,0 +1,25 @@
> +DESCRIPTION =3D "Vala is a C#-like language dedicated to ease GObject pr=
ogramming. \
> +Vala compiles to plain C and has no runtime environment nor penalities w=
hatsoever."
> +SECTION =3D "devel"
> +DEPENDS =3D "glib-2.0 dbus"
> +BBCLASSEXTEND =3D "native"
> +DEPENDS_virtclass-native =3D "glib-2.0-native dbus-native"
> +HOMEPAGE =3D "http://vala-project.org"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
> +INC_PR =3D "r0"
> +
> +#
> +# WARNING: This source release has specifically been built for OpenEmbed=
ded.
> +# Don't update to any upstream release without consulting the recipe mai=
ntainer.
> +#
> +
> +SRC_URI =3D "\
> +  http://downloads.freesmartphone.org/sources/vala-${PV}.tar.bz2;name=3D=
archive \
> +"
> +
> +inherit autotools
> +
> +EXTRA_OECONF =3D "--disable-vapigen"
> +
> +FILES_${PN}-doc +=3D "${datadir}/devhelp"
> diff --git a/meta/recipes-devtools/vala/vala_0.12.1.bb b/meta/recipes-dev=
tools/vala/vala_0.12.1.bb
> new file mode 100644
> index 0000000..1049ed6
> --- /dev/null
> +++ b/meta/recipes-devtools/vala/vala_0.12.1.bb
> @@ -0,0 +1,7 @@
> +require vala.inc
> +SRC_URI =3D "ftp://ftp.gnome.org/pub/GNOME/sources/vala/0.12/vala-${PV}.=
tar.bz2"
> +
> +FILES_${PN} +=3D "${datadir}/vala-0.12/vapi"
> +
> +SRC_URI[md5sum] =3D "bf35262cc611de447147d01cbac33767"
> +SRC_URI[sha256sum] =3D "d9a2be21bb8ab88eab838e7f3a4d0aaa2a1fddf35615dca3=
2bef6a0051f58ea8"
> --=20
> 1.7.9.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+FblgACgkQN1Ujt2V2gBy5/QCfYFYkirDzueFwExyRY1XEcOc7
CxEAnjL1YQUSwjT9zX9egAdVMue1Ejjb
=eIig
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
