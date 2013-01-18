Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tw7WA-0004w2-BV
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 09:42:06 +0100
Received: by mail-pb0-f45.google.com with SMTP id mc8so1921424pbc.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 00:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=bpJl14ebS6Gvg2xoAEhZRDyXln5u/wckXTqcq0m9H8s=;
	b=B3rhlPV2AbEcXdJGlifzdZUDyb4jNZDSgIMvBIgsE7kBqjo1QNU38EvnI8/u6CUpFB
	VWQlwG+vyVBV6P81BmqJ9c+/Coz3pPBkrMinFZb6r+ABccyKoe0r7LWWkwxtGZYfIlIl
	Do/S+F36D0MC+rC8rCURXMQl9Y7f8ffOhvAIYsoTxEAMXglUM2iORtoO0WIvmIUywuVF
	2wZoojX3iKuFrApjb5ZMRm4AM8aabHRi7vHdwpUih756tSZ5Wa++zLkmLi9oESuaMllL
	9b/fgaAw23iXIso66fIOi+jgHsR5LAxQHbC3cy99fozoaJ4HjlkTu9ZvCSavTWLw/RNn
	ZWiQ==
X-Received: by 10.68.189.35 with SMTP id gf3mr2927608pbc.69.1358497577435;
	Fri, 18 Jan 2013 00:26:17 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qt3sm2683697pbb.32.2013.01.18.00.26.14
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 00:26:16 -0800 (PST)
Date: Fri, 18 Jan 2013 09:26:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: rongqing.li@windriver.com
Message-ID: <20130118082611.GC3091@jama>
References: <cover.1358477598.git.rongqing.li@windriver.com>
	<101e3bb96160957183aaa5770f989757916edaa9.1358477598.git.rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <101e3bb96160957183aaa5770f989757916edaa9.1358477598.git.rongqing.li@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org, joe.macdonald@windriver.com
Subject: Re: [PATCH 1/2] xinetd: enable tcp-wrappers support by DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2013 08:42:11 -0000
X-Groupsio-MsgNum: 34006
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Content-Disposition: inline

--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 18, 2013 at 10:56:22AM +0800, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>  meta/recipes-extended/xinetd/xinetd_2.3.15.bb |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes=
-extended/xinetd/xinetd_2.3.15.bb
> index 3bde512..9278cc2 100644
> --- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
> +++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
> @@ -7,7 +7,7 @@ LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D8ad8615198542444f84d28a6cf2=
26dd8"
> =20
>  DEPENDS =3D ""
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  SRC_URI =3D "http://www.xinetd.org/xinetd-${PV}.tar.gz \
>        file://xinetd.init \
> @@ -28,6 +28,9 @@ INITSCRIPT_PARAMS =3D "defaults"
> =20
>  EXTRA_OECONF=3D"--disable-nls"
> =20
> +DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'tcp-wrappers', 'tcp-w=
rappers', '', d)}"
> +EXTRA_OECONF +=3D "${@base_contains('DISTRO_FEATURES', 'tcp-wrappers', '=
--with-libwrap', '', d)}"
> +

Why not use PACKAGECONFIG here?

Cheers,

>  do_configure() {
>  	# Looks like configure.in is broken, so we are skipping
>  	# rebuilding configure and are just using the shipped one
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD5ByMACgkQN1Ujt2V2gBw3xACgqSrNuf0ol3GcnmtHdoalV7QL
OQEAnj7KdzrgqLMW1yPi46mpBpuiKZqR
=YNqx
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--
