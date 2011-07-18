Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QiwnK-0000x7-0M
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 01:00:10 +0200
Received: by fxh10 with SMTP id 10so7574928fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 15:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eTpR3+Fv+5jyA/AA+jzGUGD3xBND1Z1OHmzz/zv+Yck=;
	b=vFIYynOFFmUReuUGEh6msUXLGc4aO4j2GK/H6fEs1/tl/sMzeM8j4INc4vkw0fMdOQ
	yJyKW6mZBnONdFWI6qIS1gLdqOL1HkqxfyklkAWtQXUNxVWOb6edFI/ClURIqp8dVjXj
	0Yx6vvQ8W0zCrBXerqEjeIEZ5OPUpmiSo9LP8=
Received: by 10.223.100.83 with SMTP id x19mr10696074fan.59.1311029765344;
	Mon, 18 Jul 2011 15:56:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o17sm3247271fal.2.2011.07.18.15.56.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 15:56:04 -0700 (PDT)
Date: Tue, 19 Jul 2011 00:55:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110718225556.GI3412@jama.jama.net>
References: <cover.1310081443.git.sgw@linux.intel.com>
	<0a996270e51deae8b1f22299e1e024dcb6c0be88.1310081443.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <0a996270e51deae8b1f22299e1e024dcb6c0be88.1310081443.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 8/8] libx11: enable xcb support
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
X-List-Received-Date: Mon, 18 Jul 2011 23:00:10 -0000
X-Groupsio-MsgNum: 6066
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4Djgzn3z2HSNnx0"
Content-Disposition: inline

--T4Djgzn3z2HSNnx0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 07, 2011 at 04:31:40PM -0700, Saul Wold wrote:
> [YOCTO #1196]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb |   11 ++++++++---
>  1 files changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb b/meta/recipe=
s-graphics/xorg-lib/libx11_1.3.4.bb
> index 3e046a1..04d4a97 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "MIT & MIT-style & BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbf75bfe4d05068311b5e6862d4b5f=
2c5"
> =20
>  PE =3D "1"
> -PR =3D "r1"
> +PR =3D "r3"
> =20
>  SRC_URI +=3D "file://x11_disable_makekeys.patch \
>              file://nodolt.patch \
> @@ -16,8 +16,13 @@ SRC_URI[md5sum] =3D "f65c9c7ecbfb64c19dbd7927160d63fd"
>  SRC_URI[sha256sum] =3D "88d7238ce5f7cd123450567de7a3b56a43556e4ccc45df38=
b8324147c889a844"
> =20
>  DEPENDS +=3D "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
> -            libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
> +            libxdmcp xf86bigfontproto kbproto inputproto xproto-native l=
ibxcb"
> =20
> -EXTRA_OECONF +=3D "--without-xcb"
> +DEPENDS_virtclass-native +=3D "bigreqsproto-native xproto-native xextpro=
to-native xtrans-native libxau-native xcmiscproto-native \
> +            libxdmcp-native xf86bigfontproto-native kbproto-native input=
proto-native xproto-native"
> +
> +XCB =3D "--with-xcb"
> +XCB_virtclass-native =3D "--without-xcb"
> +EXTRA_OECONF +=3D "${XCB}"
> =20
>  BBCLASSEXTEND =3D "native nativesdk"

FWIW:

few months back I've replied on similar change that --without-xcb is not
available in newer libx11 and that it would be better to upgrade to
newer libx11 or keep xcb enabled for -native too and add 2
BBCLASSEXTENDS to needed xcb recipes..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--T4Djgzn3z2HSNnx0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4kufwACgkQN1Ujt2V2gByinACeOAvwwiSJ6bnio5bU6YbIjaDE
9HsAnR5U8swFQ5ELAIvmn/WtHfSOxZZO
=Gjj5
-----END PGP SIGNATURE-----

--T4Djgzn3z2HSNnx0--
