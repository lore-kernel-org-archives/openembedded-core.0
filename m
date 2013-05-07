Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UZeCk-0007Yk-28
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 11:29:02 +0200
Received: by mail-pb0-f47.google.com with SMTP id uo1so257999pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 02:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=9zEIDqIpJhR7fkQ19gKpTXy0RKWSGruAV3wRDk2iGFQ=;
	b=tiZlQu6F1D0mavOr2+xr/R/nBgMWsALZG/t1dXnc/gbgp+7dzYGssxwQs7z9p76FSH
	/daY3RgVqT5HkcN87Z+QbIToV2/7iPYZPjQ6YjPEeUPE7IP7NZ2tS7fK704Vm2AnYklw
	OUgS0UEvUJ6iZNPtg7ehaGJc3v4/laSOohDfah0js7h0eA4iUkaETiwTwY3fcXiNz/5N
	0ZnkW5Iov2tweOthDk+R7u16o8NcIFUWChG3TR5ceg0x1H/yzr77dCPt6skfSIpCl/Aw
	nuinhpPFw+cKYVama4TXcW+5W9NuCXabG1EAPWsgbU6JCdL1oDwpEvYzyE4R1fJOxAR7
	5ErQ==
X-Received: by 10.66.159.6 with SMTP id wy6mr1801885pab.206.1367917860810;
	Tue, 07 May 2013 02:11:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j13sm29553444pat.17.2013.05.07.02.10.58 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 02:10:59 -0700 (PDT)
Date: Tue, 7 May 2013 11:10:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
Message-ID: <20130507091051.GC3187@jama>
References: <1367917682-23214-1-git-send-email-bogdan.a.marinescu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1367917682-23214-1-git-send-email-bogdan.a.marinescu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python-scons: upgraded to 2.3.0
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
X-List-Received-Date: Tue, 07 May 2013 09:29:04 -0000
X-Groupsio-MsgNum: 38755
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Content-Disposition: inline

--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2013 at 12:08:02PM +0300, Bogdan Marinescu wrote:
> "2013" was added in the 'Copyright' line in LICENSE.txt.
>=20
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>  ...ons-native_2.2.0.bb =3D> python-scons-native_2.3.0.bb} |    2 +-
>  meta/recipes-devtools/python/python-scons_2.2.0.bb      |   15 ---------=
------
>  meta/recipes-devtools/python/python-scons_2.3.0.bb      |   14 +++++++++=
+++++
>  3 files changed, 15 insertions(+), 16 deletions(-)
>  rename meta/recipes-devtools/python/{python-scons-native_2.2.0.bb =3D> p=
ython-scons-native_2.3.0.bb} (100%)
>  delete mode 100644 meta/recipes-devtools/python/python-scons_2.2.0.bb
>  create mode 100644 meta/recipes-devtools/python/python-scons_2.3.0.bb
>=20
> diff --git a/meta/recipes-devtools/python/python-scons-native_2.2.0.bb b/=
meta/recipes-devtools/python/python-scons-native_2.3.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/python/python-scons-native_2.2.0.bb
> rename to meta/recipes-devtools/python/python-scons-native_2.3.0.bb
> index 701e0f7..87450b6 100644
> --- a/meta/recipes-devtools/python/python-scons-native_2.2.0.bb
> +++ b/meta/recipes-devtools/python/python-scons-native_2.3.0.bb
> @@ -1,5 +1,5 @@
>  require python-scons_${PV}.bb
>  inherit native pythonnative
>  DEPENDS =3D "python-native"
> -RDEPENDS_${PN} =3D ""
>  PR =3D "r0"

You can drop PR here.

> +RDEPENDS_${PN} =3D ""
> diff --git a/meta/recipes-devtools/python/python-scons_2.2.0.bb b/meta/re=
cipes-devtools/python/python-scons_2.2.0.bb
> deleted file mode 100644
> index b796ae8..0000000
> --- a/meta/recipes-devtools/python/python-scons_2.2.0.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -DESCRIPTION =3D "A Software Construction Tool"
> -SECTION =3D "devel/python"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D61e6307bb15ee490a9ec01fd2=
7022d7e"
> -SRCNAME =3D "scons"
> -
> -PR =3D "r0"
> -
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] =3D "f737f474a02d08156c821bd2d4d4b632"
> -SRC_URI[sha256sum] =3D "f7fcd11a7af7ec13d587a2f7cf14a92e3223eea64bf07845=
4a9856ec0ab465b9"
> -S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit distutils
> diff --git a/meta/recipes-devtools/python/python-scons_2.3.0.bb b/meta/re=
cipes-devtools/python/python-scons_2.3.0.bb
> new file mode 100644
> index 0000000..1110f6e
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python-scons_2.3.0.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION =3D "A Software Construction Tool"
> +SECTION =3D "devel/python"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D98e9a1e6029e715255c52032a=
1eba637"
> +SRCNAME =3D "scons"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "083ce5624d6adcbdaf2526623f456ca9"
> +SRC_URI[sha256sum] =3D "9442069999cf4b2caa94a5886ab4c2c71de1718ed5e9176c=
18e2b6dbca463b4b"
> +
> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit distutils
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

--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGIxRsACgkQN1Ujt2V2gBzsYQCfQ1N/9fJlQg8bSvxc0qMp70n6
wnYAni/81O7R1c8s4jPsHMaJRrfT/gxz
=6Kii
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--
