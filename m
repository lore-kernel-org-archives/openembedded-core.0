Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id A0F5B6AE37;
	Thu, 31 Oct 2013 09:49:08 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so1261717eak.18
	for <multiple recipients>; Thu, 31 Oct 2013 02:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mnEpQGpnlKoingYyjVxFj6jFWVy5JsOhoIygs9JYEiM=;
	b=YvxA/tdLJqFDKa0QTSB43nJNMSffYtNrcz+z+N02YMRPawsRwG/FqjXYpUJfliwPHZ
	esYmK3+M4rLduS30fXKoV/uct+tP3ERlbI70EaskqqjxI0xA6kdFI49xs3k+QwlMDv+7
	2thMguiGlzXAk38wjgXnM9TZhaz7xIAs5G3wUCw/KS/slFhRxgJEG6LI4Lhv/DWaLQGq
	wcuP4hAAG50O+ipg8w2zT+33xXarVT5MIyDfMIzB2Pbm7pJzvw6EPNvsus3CyhCw7fXS
	ICFXuIv8sGw/gVQZYPZ/rLo6AiT4+6x3NqIAQAgLAvlb+k9+W0ssYuZq9F3zDklfWIwv
	gbfg==
X-Received: by 10.15.48.67 with SMTP id g43mr2094782eew.17.1383212950044;
	Thu, 31 Oct 2013 02:49:10 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a1sm6430018eem.1.2013.10.31.02.49.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Oct 2013 02:49:09 -0700 (PDT)
Date: Thu, 31 Oct 2013 10:49:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20131031094910.GH32015@jama>
References: <20131030171857.47AA3504D1@opal>
MIME-Version: 1.0
In-Reply-To: <20131030171857.47AA3504D1@opal>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : telepathy-mission-control: upgrade to 5.16.0
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
X-List-Received-Date: Thu, 31 Oct 2013 09:49:09 -0000
X-Groupsio-MsgNum: 46451
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGu/vTNewDGZ7tmp"
Content-Disposition: inline

--MGu/vTNewDGZ7tmp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2013 at 05:18:57PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 6bae01a04a375906731555b997766d41f887b496
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D6bae01a04a375906731555b997766d41f887b496
>=20
> Author: Cristian Iorga <cristian.iorga@intel.com>
> Date:   Wed Oct 30 10:53:11 2013 +0200
>=20
> telepathy-mission-control: upgrade to 5.16.0
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Please see Ross's comment in
http://patchwork.openembedded.org/patch/59289/

some PACKAGECONFIGs shouldn't be needed now

>=20
> ---
>=20
>  ...15.0.bb =3D> telepathy-mission-control_5.16.0.bb} |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-contro=
l_5.15.0.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control=
_5.16.0.bb
> similarity index 93%
> rename from meta/recipes-connectivity/telepathy/telepathy-mission-control=
_5.15.0.bb
> rename to meta/recipes-connectivity/telepathy/telepathy-mission-control_5=
=2E16.0.bb
> index f1a1320..bdab9c1 100644
> --- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.=
0.bb
> +++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.=
0.bb
> @@ -9,8 +9,8 @@ DEPENDS =3D "libtelepathy dbus-glib gconf libxslt-native"
>  SRC_URI =3D "http://telepathy.freedesktop.org/releases/telepathy-mission=
-control/telepathy-mission-control-${PV}.tar.gz \
>  	file://tmc-Makefile-fix-race.patch \
>  	"
> -SRC_URI[md5sum] =3D "0efd7d9043f6e189e8ed8111d043b52c"
> -SRC_URI[sha256sum] =3D "88800d1b5f385e94b34721319ff4fe65c493632954d7229b=
36e57af5b4a7e1b5"
> +SRC_URI[md5sum] =3D "736ae9d71028d8e6d95017433c07fa06"
> +SRC_URI[sha256sum] =3D "edc3c7265c291343d5d7d47c20add4d426e894068c66c796=
96795502a4e1c1d0"
> =20
>  inherit autotools pkgconfig pythonnative
> =20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MGu/vTNewDGZ7tmp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJyJ5YACgkQN1Ujt2V2gBzHYQCfVmuFngtOCkI8OwoEHGFgUnzf
lyYAoKbjF6kbA6dBRPqJlndUWjEZFWNH
=/t5i
-----END PGP SIGNATURE-----

--MGu/vTNewDGZ7tmp--
