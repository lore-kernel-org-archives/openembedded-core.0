Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2141A6E996
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 14:41:51 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so502026eek.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Mar 2014 06:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2Bx+hrdNpQG6A2d9ksBTuwI05qfdEx4n+raaBFyCdbc=;
	b=NcJFukZWGZz6ym1ZTtK+TH4f1SE3IOkTd0RL8dvcmfoVkElbCEWPGpbryVFknwyfFS
	BUXLVTzKCzj68H5DWUX5xX90LeXYhnDHYPGLkDoqIWlANXuio1gN5fFNL9KaGwKZiFA3
	G5TMPZdavnJqoNoD2pPIZ+s5huVZGhRaLzXk7rto8Yo2elyKUtVxDHoiFMLdhInA1cS6
	RVPIr9MZ+DitwGp/eTgVR25FR2heogADrbvgb5rOGi9pzCpfblM+1Zh+cg2pGl31W1KF
	dFtZ2G70BM2nLQHUfFcPccCVF1d0FWCOoLoASwlYaLTsaGZl3IomrbYVy4Yc+ZobpWDu
	M6HQ==
X-Received: by 10.14.218.193 with SMTP id k41mr5776373eep.16.1394030511930;
	Wed, 05 Mar 2014 06:41:51 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id m1sm9755428een.7.2014.03.05.06.41.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Mar 2014 06:41:50 -0800 (PST)
Date: Wed, 5 Mar 2014 15:41:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
Message-ID: <20140305144147.GW26981@jama>
References: <cover.1394010806.git.ajlennon@dynamicdevices.co.uk>
	<ce88733ef0143e96e323aff0ac34909d43eda4bf.1394010806.git.ajlennon@dynamicdevices.co.uk>
MIME-Version: 1.0
In-Reply-To: <ce88733ef0143e96e323aff0ac34909d43eda4bf.1394010806.git.ajlennon@dynamicdevices.co.uk>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH 1/1] daq: Update from 2.0.1 to 2.0.2
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
X-List-Received-Date: Wed, 05 Mar 2014 14:41:52 -0000
X-Groupsio-MsgNum: 50905
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V66X/350vc37cwHu"
Content-Disposition: inline

--V66X/350vc37cwHu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2014 at 09:16:23AM +0000, Alex J Lennon wrote:
> daq-2.0.1.tar.gz is missing from SRC_URI location. Presumably replaced wi=
th 2.02.

Wrong ML, meta-oe patches should go to openembedded-devel list (read
README).

>=20
> Signed-off-by: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
> ---
>  meta-oe/recipes-connectivity/daq/daq_2.0.2.bb |   16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb b/meta-oe/reci=
pes-connectivity/daq/daq_2.0.2.bb
> new file mode 100644
> index 0000000..2675e2a
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "The dump DAQ test the various inline mode features "
> +HOMEPAGE =3D "http://www.snort.org"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9ce51a65dd738dc1ae631d8b21c4=
0e0"
> +
> +PARALLEL_MAKE =3D ""
> +
> +DEPENDS =3D "libpcap libpcre "
> +
> +SRC_URI =3D "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
> +            file://disable-run-test-program-while-cross-compiling.patch "
> +
> +SRC_URI[md5sum] =3D "865bf9b750a2a2ca632591a3c70b0ea0"
> +SRC_URI[sha256sum] =3D "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51=
f605309beac269a8"
> +
> +inherit autotools
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V66X/350vc37cwHu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMXN6sACgkQN1Ujt2V2gBzejgCeJzGI0dm85ZlxQbOvB2AkWjYs
SWcAoI6oCr5sgF56TwMYJ7L+JhvzGcGe
=GmNW
-----END PGP SIGNATURE-----

--V66X/350vc37cwHu--
