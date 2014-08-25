Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6EEDE617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 10:14:29 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u57so13012361wes.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 03:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+3TwTlPw7QbodygqKajX+SguL9icZI6Zf90m99sjlz0=;
	b=F7wVrbFg31UFWc+w2Twbl9R6CTaUqG0rFu46pD4+bEO7o6rWK85rr1tStVuc1gG8E0
	7S46Ruq1YudDuBucxCFx0mO8U9YpAp3tYhNmD9CquiLDBM/WD9utaF6CjEy2gLUY/Map
	0tHh/WiEQptbnE7AO1TFTqY3ezGay/Wxuoj6Tro+sG6pplQYTK4avnD2rkQuu96JoM0L
	Twr48zgbGtx5guUCXFlpDANh4mkGlqG7y2IdmwKgwE5oCkcc7dkM+BdCiqBv7XgY5Eiq
	ehHp1LOnQdeVDNVnDs++n04TtEJdC1rSMr2eIT9Zik9o+XXHPqhPzqUw3VGSJRegD75G
	mRCg==
X-Received: by 10.194.22.199 with SMTP id g7mr1334546wjf.131.1408961670690;
	Mon, 25 Aug 2014 03:14:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	za9sm83116480wjc.29.2014.08.25.03.14.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 03:14:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 25 Aug 2014 12:14:37 +0200
To: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Message-ID: <20140825101437.GP20524@jama>
References: <1408953391-25759-1-git-send-email-sven.ebenfeld@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1408953391-25759-1-git-send-email-sven.ebenfeld@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] md5deep: Add Recipe for md5deep package version 4.4
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
X-List-Received-Date: Mon, 25 Aug 2014 10:14:33 -0000
X-Groupsio-MsgNum: 56897
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z4IKABJTiQIqPwmW"
Content-Disposition: inline

--z4IKABJTiQIqPwmW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2014 at 09:56:31AM +0200, Sven Ebenfeld wrote:
> I need to build hashdeep/md5deep within OE to include it in my images. Th=
is recipe enables OE to cross-compile md5deep. I needed to add the patch as=
 do_configure_qa is complaining about cross-compilation errors otherwise. I=
 added a pull request for the issue with the variable expansion to hashdeep=
 as well.

Please send this to openembedded-devel@lists.openembedded.org


> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> ---
>  .../md5deep/files/wrong-variable-expansion.patch   | 39 ++++++++++++++++=
++++++
>  meta-oe/recipes-extended/md5deep/md5deep_4.4.bb    | 16 +++++++++
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/md5deep/files/wrong-variable=
-expansion.patch
>  create mode 100644 meta-oe/recipes-extended/md5deep/md5deep_4.4.bb
>=20
> diff --git a/meta-oe/recipes-extended/md5deep/files/wrong-variable-expans=
ion.patch b/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion=
=2Epatch
> new file mode 100644
> index 0000000..3a4c4f4
> --- /dev/null
> +++ b/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.pat=
ch
> @@ -0,0 +1,39 @@
> +--- a/configure.ac	2014-08-22 12:22:54.290884351 +0200
> ++++ b/configure.ac	2014-08-22 12:23:15.822306295 +0200
> +@@ -42,18 +42,6 @@
> +      ;;		 		    =20
> + esac
> +=20
> +-
> +-# Bring additional directories where things might be found into our
> +-# search path. I don't know why autoconf doesn't do this by default
> +-if test x"${mingw}" =3D=3D "xno" ; then
> +-  for spfx in /usr/local /opt/local /sw ; do
> +-    echo checking ${spfx}/include
> +-    if test -d ${spfx}/include; then
> +-        CPPFLAGS=3D"-I${spfx}/include $CPPFLAGS"
> +-        LDFLAGS=3D"-L${spfx}/lib $LDFLAGS"
> +-    fi
> +-  done
> +-fi
> + #
> + #
> + ################################################################
> +@@ -71,7 +59,7 @@
> +=20
> + if test $mingw =3D "no" ; then
> +   # add the warnings we don't want to do on mingw
> +-  $WARNINGS_TO_TEST=3D"$WARNINGS_TO_TEST -Wall -Wstrict-prototypes  -We=
ffc++"
> ++  WARNINGS_TO_TEST=3D"$WARNINGS_TO_TEST -Wall -Wstrict-prototypes  -Wef=
fc++"
> + fi
> +=20
> + for option in $WARNINGS_TO_TEST
> +@@ -105,7 +93,7 @@
> +=20
> + if test $mingw =3D "no" ; then
> +   # add the warnings we don't want to do on mingw
> +-  $WARNINGS_TO_TEST=3D"$WARNINGS_TO_TEST  -Weffc++"
> ++  WARNINGS_TO_TEST=3D"$WARNINGS_TO_TEST  -Weffc++"
> + fi
> +=20
> + for option in $WARNINGS_TO_TEST
> diff --git a/meta-oe/recipes-extended/md5deep/md5deep_4.4.bb b/meta-oe/re=
cipes-extended/md5deep/md5deep_4.4.bb
> new file mode 100644
> index 0000000..4e4a2f5
> --- /dev/null
> +++ b/meta-oe/recipes-extended/md5deep/md5deep_4.4.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "md5deep"

Please use better description than just PN (and use SUMMARY if it's
still short).

> +AUTHOR =3D "Jesse Kornblum, Simson L. Garfinkel"
> +HOMEPAGE =3D "http://md5deep.sourceforge.net"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9190f660105b9a56cdb272309bfd5=
491"
> +
> +inherit autotools
> +
> +SRC_URI =3D "git://github.com/jessek/hashdeep.git \
> +        file://wrong-variable-expansion.patch \
> +        "
> +
> +# Release 4.4
> +SRCREV =3D "cd2ed7416685a5e83eb10bb659d6e9bec01244ae"
> +
> +S =3D "${WORKDIR}/git"
> --=20
> 1.8.1.rc3
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z4IKABJTiQIqPwmW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP7DI0ACgkQN1Ujt2V2gBzbdQCdGMaiz+kZyjBPzdMbrNDFyAWW
fDoAnA4+tGAkxA10afXQy8YpqA9RSW1z
=fiQB
-----END PGP SIGNATURE-----

--z4IKABJTiQIqPwmW--
