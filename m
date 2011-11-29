Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVVVq-0006O2-N8
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 22:46:50 +0100
Received: by bkbzs2 with SMTP id zs2so9944069bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 13:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=G+E07Pr4tSIR49wC6uVxXNm87Yf9/Vr+Kb70pX8+mnI=;
	b=qgPrQQ4PDfWX1vzh/RBuE+vngZh81YBoPULez6E/MQj8Mnt48Kvk6+zc2eVOamkug3
	2DDLEQcZMlUpegRh3/J5mTmQGq1J0PWMNbQtTdTJ3TXFXJU2THhvZ3R5BwqSzlaxdNYJ
	mqu6xeavHUYXH2giG0PTKDsSgNVNjSc9n2tOI=
Received: by 10.204.156.141 with SMTP id x13mr52208786bkw.54.1322602811159;
	Tue, 29 Nov 2011 13:40:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c4sm39800327bkk.13.2011.11.29.13.40.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 13:40:09 -0800 (PST)
Date: Tue, 29 Nov 2011 22:40:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111129214007.GK7441@jama.jama.net>
References: <1322602415-24735-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1322602415-24735-1-git-send-email-msm@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] bitbake.conf: Ignore MACHINE as dep for MACHINEOVERRIDES
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
X-List-Received-Date: Tue, 29 Nov 2011 21:46:50 -0000
X-Groupsio-MsgNum: 13174
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mGCtrYeZ202LI9ZG"
Content-Disposition: inline

--mGCtrYeZ202LI9ZG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 03:33:35PM -0600, Matthew McClintock wrote:
> This dependency causes binutils to get rebuilt for some of
> our parts that are the same TARGET_ARCH but different
> MACHINE.
>=20
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> Comments on this? It seems like it might be better to some do this
> in the actual recipes (binutils, gcc-cross, etc) and not globally.
> However, I'm not really sure what goes in MACHINEOVERIDES in
> general and if it could be something that would cause sstate-cache
> to be invalid althogh I could image some scenarios.
>=20
>  meta/conf/bitbake.conf |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b4335c9..48ae458 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -659,6 +659,7 @@ AUTO_LIBNAME_PKGS =3D "${PACKAGES}"
>  OVERRIDES =3D "${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${=
MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
>  DISTROOVERRIDES ?=3D "${DISTRO}"
>  MACHINEOVERRIDES ?=3D "${MACHINE}"
> +MACHINEOVERRIDES[vardepsexclude] +=3D "MACHINE"
> =20
>  CPU_FEATURES ?=3D ""
>  CPU_FEATURES_arm ?=3D "vfp"
> --=20
> 1.7.6.1

is this of oe-core/master?

I see similar commit in 362512b83775ad7020e5870a594f0e7ca9ef83ba

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mGCtrYeZ202LI9ZG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7VUTcACgkQN1Ujt2V2gBxkIACgi5zRfiiQuWT9e8c3bwUtPgOH
QOUAn0bCJBvu9I+NZJtm4z6ZohOagEKA
=fbKC
-----END PGP SIGNATURE-----

--mGCtrYeZ202LI9ZG--
