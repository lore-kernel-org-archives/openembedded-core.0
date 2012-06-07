Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Scdv0-0006LI-TC
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 16:42:35 +0200
Received: by wgbdr1 with SMTP id dr1so567499wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2012 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=q8rHGAIGv6VaCSmYS/vkUDfGt8dtrx/J3QvMP1yLUzw=;
	b=HfYdtedISOr9UxuFqBZRrjXTMEyqpMX/hYS5dETxCy7iVnz4nWp76F/NgHYgeYT/AB
	vkv9lqJbdT76NP3Gjs/h/DPNBjm6n4BehwyR/2WzpxyQpY+fqGF6JuYBnVzVN4kMBIGz
	3AyilM8wmb/sjYgBlddfITwEusaaN7+LMZJuq3OwLcnKWHjstQ7cfX6pfSpdmeuc1Dp4
	0viQiYWsds7SwQFJBH0c02iGt0//+aTmWNPyk6TAxjtoePicpBjVVOe9yR3fBuJ63bcy
	OXk7DGabjyhT1wzu9SvwgW7WeHlUD8R66J7EAFlU2uRAxi7jfjQJPuWA1ej8nCRUcmGy
	zV2Q==
Received: by 10.216.213.22 with SMTP id z22mr1083787weo.184.1339079526247;
	Thu, 07 Jun 2012 07:32:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j4sm1421215wiz.1.2012.06.07.07.32.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jun 2012 07:32:04 -0700 (PDT)
Date: Thu, 7 Jun 2012 16:32:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120607143221.GG3140@jama.jama.net>
References: <cover.1339078729.git.ross.burton@intel.com>
	<5afc9f367cc3224e82bbe59fe9bda14f504b45c0.1339078729.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <5afc9f367cc3224e82bbe59fe9bda14f504b45c0.1339078729.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/3] connman: respect the 3g feature and enable/disable ofono support
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
X-List-Received-Date: Thu, 07 Jun 2012 14:42:35 -0000
X-Groupsio-MsgNum: 23239
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yZnyZsPjQYjG7xG7"
Content-Disposition: inline

--yZnyZsPjQYjG7xG7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 07, 2012 at 03:19:36PM +0100, Ross Burton wrote:
> [YOCTO #2357]
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-connectivity/connman/connman.inc |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes=
-connectivity/connman/connman.inc
> index f2da8d9..58e3f56 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1f=
f87c09e5b7ccc2c4ca7e \
>  DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls \
>              ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', ''=
, d)} \
>              ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant',=
 '', d)} \
> -            ofono \
> +            ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
>              "
> =20
>  TIST =3D "--enable-tist"
> @@ -34,7 +34,7 @@ EXTRA_OECONF +=3D "\
>      ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi ${TIST}', =
'--disable-wifi', d)} \
>      ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth =
${TIST}', '--disable-bluetooth', d)} \
>      --enable-dnsproxy \
> -    --enable-ofono \
> +    ${@base_contains('DISTRO_FEATURES', '3g', '', '--disable-ofono', d)}=
 \
>      --enable-tools \
>      --enable-test \
>      --disable-polkit \

Why not use PACKAGECONFIG for all those?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yZnyZsPjQYjG7xG7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/Qu3UACgkQN1Ujt2V2gByzewCdHoJgbXpixRim1MTmm90QnmxR
iBMAnjzK06lKBUf+TrRt17UAY3onnA6j
=kN6Z
-----END PGP SIGNATURE-----

--yZnyZsPjQYjG7xG7--
