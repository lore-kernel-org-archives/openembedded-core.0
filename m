Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 809FC607FF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 14:28:54 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id pn19so2172739lab.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 May 2014 07:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+EmAcwf9Ajevi7VTja5SFVnwq3Q7aogfakoLOSF2QZI=;
	b=zm58t0FeOpxizsN7WyucEVsgOpWG4b+Uwaw+vjlb5/f5i3MTYY6EOo46F8DCz8/7Kt
	AatLUk3Scc7TLrXID4NO9JT6n90O7RZFFp6nrkHAk8VyhZvwZp+XYhNj5GSBB3C3lo6E
	0CqWFP3NLFOg3cRGifjazYuBuTviuUM4/DgH8uKicOF11NFFMButS2UFcSqGvK7YH5bc
	Z+DsFAgi0Olm2Bhv2byHvjmvQkdAE8f7ivYg29MkQ9RSLVNDO7b9Yda+f08P6WEahG+x
	495IugrVE8q26v7bbtq/hOfHfIu/n1WYf7EKbL3I2xD8P6DBDaWcuTtnd7XXWHBUy4ag
	vVwg==
X-Received: by 10.112.72.137 with SMTP id d9mr7295212lbv.19.1398954535000;
	Thu, 01 May 2014 07:28:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	tq9sm30070195lbb.10.2014.05.01.07.28.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 May 2014 07:28:53 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 1 May 2014 16:29:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Message-ID: <20140501142909.GR2486@jama>
References: <cover.1398871949.git.valentin.popa@intel.com>
	<cff8f1a8914290689c411c19e78f7118036eda9c.1398871949.git.valentin.popa@intel.com>
MIME-Version: 1.0
In-Reply-To: <cff8f1a8914290689c411c19e78f7118036eda9c.1398871949.git.valentin.popa@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] nettle: add nettle to poky
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
X-List-Received-Date: Thu, 01 May 2014 14:29:00 -0000
X-Groupsio-MsgNum: 52723
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N1CVQ/ktHqKQOXDR"
Content-Disposition: inline

--N1CVQ/ktHqKQOXDR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2014 at 06:39:31PM +0300, Valentin Popa wrote:
> Newer versions of gnutls depends on nettle.

> [OE-core] [PATCH 1/3] nettle: add nettle to poky

This isn't poky.

>=20
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> ---
>  meta/recipes-support/nettle/nettle_2.7.1.bb | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta/recipes-support/nettle/nettle_2.7.1.bb
>=20
> diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-s=
upport/nettle/nettle_2.7.1.bb
> new file mode 100644
> index 0000000..eb7c9de
> --- /dev/null
> +++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "A low level cryptographic library"
> +HOMEPAGE =3D "http://www.lysator.liu.se/~nisse/nettle/"
> +SECTION =3D "libs"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f1720=
6a5b0a1"
> +
> +DEPENDS +=3D "gmp"
> +
> +SRC_URI =3D "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "003d5147911317931dd453520eb234a5"
> +SRC_URI[sha256sum] =3D "bc71ebd43435537d767799e414fce88e521b7278d48c8606=
51216e1fc6555b40"
> +
> +do_configure_prepend() {
> +       if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
> +               cp ${S}/aclocal.m4 ${S}/acinclude.m4
> +       fi
> +}
> +
> +inherit autotools
> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--N1CVQ/ktHqKQOXDR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNiWjUACgkQN1Ujt2V2gByuNACfZ7/hTDQAHLwwYwwbjuu0gCA+
RF0AoImLsPCqMYnKllJ23l9XBhhx7uGp
=yvXq
-----END PGP SIGNATURE-----

--N1CVQ/ktHqKQOXDR--
