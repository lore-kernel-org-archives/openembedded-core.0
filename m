Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SyJpL-0000P2-Gn
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 11:42:19 +0200
Received: by bkcik5 with SMTP id ik5so821672bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2012 02:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nKkbAYGJSPlJ5x1l/V0K7t8oEeg+cf5mW4D8fyuASFU=;
	b=JEu/b8KzkFj39/yTFuoD8TycfFTF0yjJ8tTbOMPcUcG09FuHZrgKLXp7+GXWzupB1g
	Lq7Bv9FDp6jkgCkZ40bdDA0cg5yxzpi2Li1I5Ek9E1i80wc9SXIIo0qRf9rvl5aeLklA
	YhLR7uhtPepg3VIQLDeK/EckP8vaXMTNJFXx/bNbxP2iAeze/incxidYYNm/PZQMdenW
	6AC6r4RAU2IZ8XmptWoSEsdXLwejjTpvRZY+zuctDyQ4Ae9RGDVwCbxe3Iww41TEuGF6
	mwyQCPXx4Z4EPpKSoGKOM6wdYYoTM3SwKZcypa72yeylffO+X80F9WosSjiFmW0vOZzl
	iU7w==
Received: by 10.205.130.17 with SMTP id hk17mr3948216bkc.76.1344245435043;
	Mon, 06 Aug 2012 02:30:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm7031025bkc.5.2012.08.06.02.30.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 02:30:34 -0700 (PDT)
Date: Mon, 6 Aug 2012 11:30:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120806093030.GH3267@jama.jama.net>
References: <20120723113712.GE3271@jama.jama.net>
	<1344162252-22403-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1344162252-22403-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] opkg-utils: inherit pythonnative
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
X-List-Received-Date: Mon, 06 Aug 2012 09:42:19 -0000
X-Groupsio-MsgNum: 27010
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Gk0KcsbyUMelFU1"
Content-Disposition: inline

--/Gk0KcsbyUMelFU1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 05, 2012 at 12:24:12PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/re=
cipes-devtools/opkg-utils/opkg-utils_git.bb
> index 92e6624..caa66f7 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -8,7 +8,9 @@ RDEPENDS_${PN} =3D "python"
>  RDEPENDS_${PN}_virtclass-native =3D ""
>  SRCREV =3D "49cc783d8e0415059d126ae22c892988717ffda7"
>  PV =3D "0.1.8+git${SRCPV}"
> -PR =3D "r0"
> +PR =3D "r1"
> +
> +inherit pythonnative
> =20
>  SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dgit \
>             "

Please ignore this patch, this needs to be in package-index recipe (and
I had both patches when testing this :/)

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/Gk0KcsbyUMelFU1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAfjrYACgkQN1Ujt2V2gBwsyQCaAkrHTHvNN4We6dqE2D509y5i
1eoAoJFm4DmbN/jWpxUYsBj+N8FIiM0O
=0yw3
-----END PGP SIGNATURE-----

--/Gk0KcsbyUMelFU1--
