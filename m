Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXrEz-0003PM-UN
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 10:23:10 +0100
Received: by eeav2 with SMTP id v2so873775eea.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 01:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=g3VlAiOKq+LHdN6bUbRk17Ftv5eZYxNEK7RSJIWl5co=;
	b=xXJdZqy5KWOd7UL5QtoMiThpjYWeZ/IXjEkJj+I7s6ay6UCjEn4UcLamlB2d5vLwxR
	5jffC5SOHyoYOsKSBb8+g2xQ5EX4j7bM803xCE/Km5SL79517qO6bCWNP0r+d5CpdCRt
	Ur2EZBl13Pb4S/AYqc9E8h7H363mUAIa0rjyA=
Received: by 10.14.3.98 with SMTP id 74mr2159224eeg.159.1323162974947;
	Tue, 06 Dec 2011 01:16:14 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x12sm68931654eef.9.2011.12.06.01.16.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 01:16:13 -0800 (PST)
Date: Tue, 6 Dec 2011 10:16:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20111206091601.GA5456@jama.jama.net>
References: <cover.1323160412.git.Martin.Jansa@gmail.com>
	<7bf394a40453afe887753dea6879a5f01a6b3fcc.1323160412.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7bf394a40453afe887753dea6879a5f01a6b3fcc.1323160412.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][oe-core 2/3] subversion: update 1.7.0 to 1.7.1 and force libtool recreation
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
X-List-Received-Date: Tue, 06 Dec 2011 09:23:10 -0000
X-Groupsio-MsgNum: 13663
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 06, 2011 at 09:35:20AM +0100, Martin Jansa wrote:
> From: Klaus Kurzmann <mok@fluxnetz.de>
>=20
> * subversion-1.7.* had libtool-2.4, oe-core now has 2.4.2 and it was
>   failing:
>   x86_64-linux-libtool: Version mismatch error.  This is libtool 2.4.2, b=
ut the
>   x86_64-linux-libtool: definition of this LT_INIT comes from libtool 2.4.
>   x86_64-linux-libtool: You should recreate aclocal.m4 with macros from l=
ibtool 2.4.2
>   x86_64-linux-libtool: and run autoconf again.

Hmm, subversion-1.7.2 was released yesterday evening and 1.7.1 tar.bz2
removed (moved to archive). I'll retest with 1.7.2 and send updated
patch.

Cheers,

>=20
> Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../libtool2.patch                                 |    0
>  .../{subversion_1.7.0.bb =3D> subversion_1.7.1.bb}   |    7 ++++---
>  2 files changed, 4 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/subversion/{subversion-1.7.0 =3D> subversio=
n-1.7.1}/libtool2.patch (100%)
>  rename meta/recipes-devtools/subversion/{subversion_1.7.0.bb =3D> subver=
sion_1.7.1.bb} (75%)
>=20
> diff --git a/meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.p=
atch b/meta/recipes-devtools/subversion/subversion-1.7.1/libtool2.patch
> similarity index 100%
> rename from meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.pa=
tch
> rename to meta/recipes-devtools/subversion/subversion-1.7.1/libtool2.patch
> diff --git a/meta/recipes-devtools/subversion/subversion_1.7.0.bb b/meta/=
recipes-devtools/subversion/subversion_1.7.1.bb
> similarity index 75%
> rename from meta/recipes-devtools/subversion/subversion_1.7.0.bb
> rename to meta/recipes-devtools/subversion/subversion_1.7.1.bb
> index 396b35b..a99e087 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.7.0.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.7.1.bb
> @@ -14,8 +14,8 @@ DEFAULT_PREFERENCE =3D "-1"
>  SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://libtool2.patch \
>  "
> -SRC_URI[md5sum] =3D "930e6644a1b6094efd268fde6a318f04"
> -SRC_URI[sha256sum] =3D "64fd5f263a80e609717a3ca42f1f2625606a5c4a40a85716=
f82c866033780978"
> +SRC_URI[md5sum] =3D "8a4fa74385df85a9702141b6b68b8307"
> +SRC_URI[sha256sum] =3D "d34bde626fac1aa553f5c9aeedf961999a77cc31540ace18=
da5aeacdd03d6608"
> =20
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4a14fd2da3134e40a087eb4326a4e=
cd4"
> =20
> @@ -32,6 +32,7 @@ acpaths =3D "-I build/ -I build/ac-macros/"
> =20
>  do_configure_prepend () {
>  	rm -f ${S}/libtool
> -	rm -f ${S}/build/libtool.m4
> +	rm -f ${S}/build/libtool.m4 ${S}/build/ltmain.sh ${S}/build/ltoptions.m=
4 ${S}/build/ltsugar.m4 ${S}/build/ltversion.m4 ${S}/build/lt~obsolete.m4
> +	rm -f ${S}/aclocal.m4
>  	sed -i -e 's:with_sasl=3D"/usr/local":with_sasl=3D"${STAGING_DIR}":' ${=
S}/build/ac-macros/sasl.m4
>  }
> --=20
> 1.7.8
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7d3VEACgkQN1Ujt2V2gBwYvACfX2Q/6IX7jjPEmi6lvcnAiKWO
2mkAn0w3KYBbgpItzOzyOA/wwbznCBMB
=aeae
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
