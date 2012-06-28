Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SkKQy-0008RN-9T; Thu, 28 Jun 2012 21:31:21 +0200
Received: by werg55 with SMTP id g55so1676648wer.6
	for <multiple recipients>; Thu, 28 Jun 2012 12:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FOhvjRvpLlfkO90NaxU3+KOr3nsuT59Z9WJETdsl9Ds=;
	b=v3hc+jJOxwIWgeY+QUiQKxWFYs2xQ8hlkSOfUaYZ2xkACvB8EotkKFPl54Ds6zEtmV
	/fHLUDasBFOrjzwUSD3mlRtVEhMLi562ZmyXqo5yRy0CM54H4leG1xYww+s9qB8h78O2
	7bPPz/CNujdaSN8V2xeDhCb7ZifEeTmzmljh4z6la16t15p9bMp4CEmT30+IvBZEdrXj
	rzQEeX2C9ugvjk5ilZlex0Asu/A9DCqq43l4YEJyFjU1QEJQ28xiKWLDAYZ4W+1SBo3E
	KWleQYGa5GcrX4yH/nsPxOpk6adut8ZDtlYBXy1ryokjEcI7hFOWpfu97Nz2QNokJPBC
	4sVg==
Received: by 10.180.87.232 with SMTP id bb8mr394621wib.0.1340911225438;
	Thu, 28 Jun 2012 12:20:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m4sm1803061wie.1.2012.06.28.12.20.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 12:20:24 -0700 (PDT)
Date: Thu, 28 Jun 2012 21:20:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120628192018.GB5532@localhost.jama.net>
References: <20120625153328.B76A81033A@opal>
MIME-Version: 1.0
In-Reply-To: <20120625153328.B76A81033A@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Paul Gortmaker : linux-firmware: update to main repo on kernel.org
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
X-List-Received-Date: Thu, 28 Jun 2012 19:31:21 -0000
X-Groupsio-MsgNum: 24260
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline

--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 25, 2012 at 03:33:28PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: b9d42ec94dfcbe92ce2a857045a0e3678c05c26c
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Db9d42ec94dfcbe92ce2a857045a0e3678c05c26c
>=20
> Author: Paul Gortmaker <paul.gortmaker@windriver.com>
> Date:   Fri Jun 22 10:15:07 2012 -0400
>=20
> linux-firmware: update to main repo on kernel.org
>=20
> This is now the authoratative repository, taking updates.
> The latest has a couple updated license files, vs. the previous
> srcrev that was used.
>=20
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>=20
> ---
>=20
>  .../linux-firmware/linux-firmware_git.bb           |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/m=
eta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index 3675978..8aacce4 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -7,23 +7,23 @@ SECTION =3D "kernel"
> =20
>  LICENSE =3D "Proprietary"
> =20
> -LIC_FILES_CHKSUM =3D "file://LICENSE.radeon_rlc;md5=3D4c243f7854d2884b48=
3abda991adef43 \
> +LIC_FILES_CHKSUM =3D "file://LICENSE.radeon;md5=3De56b405656593a0c97e478=
513051ea0e \
>                      file://LICENSE.dib0700;md5=3Df7411825c8a555a1a3e5eab=
9ca773431 \
>                      file://LICENCE.xc5000;md5=3D1e170c13175323c32c7f4d09=
98d53f66 \
>                      file://LICENCE.ralink-firmware.txt;md5=3Dab2c269277c=
45476fb449673911a2dfd \
>                      file://LICENCE.qla2xxx;md5=3D4005328a134054f0fa077bd=
c37aa64f2 \
> -                    file://LICENCE.iwlwifi_firmware;md5=3D311cc823df5b1b=
e4f00fbf0f17d96a6b \
> +                    file://LICENCE.iwlwifi_firmware;md5=3D11545778abf78c=
43d7644d4f171ea1c7 \
>                      file://LICENCE.i2400m;md5=3D14b901969e23c41881327c0d=
9e4b7d36 \
>                      file://LICENCE.atheros_firmware;md5=3D30a14c7823beed=
ac9fa39c64fdd01a13 \
>                      file://LICENCE.agere;md5=3Daf0133de6b4a9b2522defd5f1=
88afd31 \
>                      file://LICENCE.rtlwifi_firmware.txt;md5=3D00d06cfd3e=
ddd5a2698948ead2ad54a5 \
>                     "
> =20
> -SRCREV =3D "15888a2eab052ac3d3f49334e4f6f05f347a516e"
> +SRCREV =3D "e98750f0d68d0037ce5a186f7f863a9c13bf773a"
>  PV =3D "0.0+git${SRCPV}"
> -PR =3D "r1"
> +PR =3D "r2"
> =20
> -SRC_URI =3D "git://git.infradead.org/users/dwmw2/linux-firmware.git;prot=
ocol=3Dgit"
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linu=
x-firmware.git;protocol=3Dgit"

changing git URL (or even just branch) in recipe with SRCPV in PV resets LO=
CALCOUNT to zero..
so breaks upgrade path.

Bump PE or PV to fix that!

NOTE: package linux-firmware-0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf7=
73a-r2: task do_package: Started
ERROR: Package version for package linux-firmware-sd8686 went backwards whi=
ch would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f=
05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
ERROR: Package version for package linux-firmware-rtl8192cu went backwards =
which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4=
f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
ERROR: Package version for package linux-firmware-rtl8192ce went backwards =
which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4=
f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
ERROR: Package version for package linux-firmware-rtl8192su went backwards =
which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4=
f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
ERROR: Package version for package linux-firmware-wl12xx went backwards whi=
ch would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f=
05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
ERROR: Package version for package linux-firmware-dbg went backwards which =
would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f05f=
347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
ERROR: Package version for package linux-firmware-staticdev went backwards =
which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4=
f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
ERROR: Package version for package linux-firmware-dev went backwards which =
would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f05f=
347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
ERROR: Package version for package linux-firmware-doc went backwards which =
would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f05f=
347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
ERROR: Package version for package linux-firmware-locale went backwards whi=
ch would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f=
05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
ERROR: Package version for package linux-firmware went backwards which woul=
d break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f05f347a=
516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
NOTE: package linux-firmware-0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf7=
73a-r2: task do_package: Succeeded

Cheers,

> =20
>  S =3D "${WORKDIR}/git"
> =20
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/srnIACgkQN1Ujt2V2gBzUFACgrHR09qwStEAzjvLOcYKb6VzU
qloAn2I44onp9T6NjZNLMekWpTuzlWPO
=+mE9
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
