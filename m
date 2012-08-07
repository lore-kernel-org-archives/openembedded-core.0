Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Syf9v-0000ib-U9
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 10:28:59 +0200
Received: by weyr6 with SMTP id r6so2421684wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 01:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cEhoXN5wn5qPYqwmuat3JPOyC4UCxOr+qQTMjU66DKw=;
	b=cjT9uNqVZq9Uvk1MHL8tT+Z9wVOoC1xUCju2puf/LEKtNj/m0+sJ53NkdNXarMeNLI
	5XdLj1oxci6k/iLTGy52fepMKGO67YQJrATrpKl/Whkr8eNuXZu7Z9yr57rz13HkBMjL
	YvA4Yo3mCg0zSkNqqcuwmpFRFOLJu+dby3LPkXVI+TDwfxctcT8jNxlvTSiwds82XN8P
	pwHoNFJiyeknFlHksz7eNLv5gV8aSbkmGObhGU4aA6TQ+TfXRzkdQiMhE7rsN5jCyq7l
	AmPJ3uV/ByoCBp020borkbvwxAmWWX7uLltOrjKiBKHOBzGnAONWg5KkxpGnsjGPYpMw
	kGlw==
Received: by 10.216.133.200 with SMTP id q50mr6372899wei.166.1344327434448;
	Tue, 07 Aug 2012 01:17:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm29736957wiz.11.2012.08.07.01.17.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 01:17:13 -0700 (PDT)
Date: Tue, 7 Aug 2012 10:17:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120807081710.GQ3267@jama.jama.net>
References: <1344325488-20479-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1344325488-20479-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][for-denzil 1/8] opkg-utils: bump SRCREV for Packages cache fix and other fixes
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
X-List-Received-Date: Tue, 07 Aug 2012 08:29:00 -0000
X-Groupsio-MsgNum: 27072
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Hw0FrjWlp+qkNlJP"
Content-Disposition: inline

--Hw0FrjWlp+qkNlJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 07, 2012 at 09:44:41AM +0200, Koen Kooi wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../opkg-utils/opkg-utils/add-license-field.patch  |   39 -----------
>  .../opkg-utils/arfile_header_split.patch           |   27 --------
>  .../opkg-utils/index-ignore-filenotfound.patch     |   73 --------------=
------
>  .../opkg-utils/opkg-utils/mtime-int.patch          |   30 --------
>  .../opkg-utils/opkg-utils/shebang.patch            |   46 ------------
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    7 +-
>  6 files changed, 1 insertion(+), 221 deletions(-)
>  delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/add-licen=
se-field.patch
>  delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/arfile_he=
ader_split.patch
>  delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/index-ign=
ore-filenotfound.patch
>  delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int=
=2Epatch
>  delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/shebang.p=
atch
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/re=
cipes-devtools/opkg-utils/opkg-utils_git.bb
> index 4fe4038..1996c75 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -6,16 +6,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9b=
a36caa9b7df079bae19f \
>                      file://opkg.py;beginline=3D1;endline=3D18;md5=3D1591=
7491ad6bf7acc666ca5f7cc1e083"
>  RDEPENDS_${PN} =3D "python"
>  RDEPENDS_${PN}_virtclass-native =3D ""
> -SRCREV =3D "16665959c330b5958c0f0f4624a9ca7f823f98de"
> +SRCREV =3D "44df9dd3dc411ca1255cb4b23bde7eb71aed4778"

Better to use latest for this (only 3 commits, 2 of them fixing
python-2.6)

>  PV =3D "0.1.8+git${SRCPV}"
>  PR =3D "r1"
> =20
>  SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dgit \
> -           file://index-ignore-filenotfound.patch \
> -           file://mtime-int.patch \
> -           file://add-license-field.patch \
> -           file://arfile_header_split.patch \
> -           file://shebang.patch \
>             "
> =20
>  S =3D "${WORKDIR}/git"
> --=20
> 1.7.10
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Hw0FrjWlp+qkNlJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAgzwYACgkQN1Ujt2V2gBz6wACdFb7gY+8uxjxlKO4D9MsmkT3O
5cYAn0wW1g76vmjo2QqhDGqQQhUI/T9o
=jhGE
-----END PGP SIGNATURE-----

--Hw0FrjWlp+qkNlJP--
