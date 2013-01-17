Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tvm0a-0001mZ-BY
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 10:44:21 +0100
Received: by mail-pb0-f41.google.com with SMTP id xa7so1301064pbc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 01:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=J7cEOu1aa5PCdW94PP9fg2MCf5vwdTewIfNecaLRg58=;
	b=ZdGexrF71pJG22A494GefhieF9+o1Pth3qGl6Qpi98zdyjU4u04dmN+YmbclcLUYEh
	4dGLt1dhvapRC7ACa/9B5yXvenIjagSK8WjcyFukV8ekag/dIRTsLk1W7VGsUSe/5Iy8
	uYBIm+t97rsbLxIOqmvxt4SattjWzmM6CU/FtfZaaGnvUSQV91E41EJ7Mq3bVyps9XHV
	gSCuO3DtPFmdDjKb+BTE2nAa+Ajfvic67Kk28tdljTM93XkjA5ASnxunBzEY1gZUMR+D
	z8Se/8QAjeyIgyJ0Mb6NE4q88mGtohC09PEHPLlkxMCo3/iXZ7tvIwIgrMy9N/qoZucM
	DcIg==
X-Received: by 10.69.0.8 with SMTP id au8mr11721371pbd.58.1358414896778;
	Thu, 17 Jan 2013 01:28:16 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id wr4sm744555pbc.72.2013.01.17.01.28.14
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 01:28:15 -0800 (PST)
Date: Thu, 17 Jan 2013 10:28:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20130117092811.GB3067@jama>
References: <cover.1358406049.git.hongxu.jia@windriver.com>
	<6b20de5260fdf8542bd214ca4c380bfe7614f56c.1358406049.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <6b20de5260fdf8542bd214ca4c380bfe7614f56c.1358406049.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] libnss-mdns:fix support prerm at image creation time
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
X-List-Received-Date: Thu, 17 Jan 2013 09:44:24 -0000
X-Groupsio-MsgNum: 33935
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Content-Disposition: inline

--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2013 at 03:07:21PM +0800, Hongxu Jia wrote:
> The pkg_prerm_${PN} failed at image creation time because $D is not assig=
ned
> as the prefix of "/etc/nsswitch.conf"

Again looks the same why not use $D/etc/nsswitch.conf in both cases?

>=20
> [YOCTO #3633]
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb |   11 +++++++=
++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/=
meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> index f7356e4..e9a4128 100644
> --- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> +++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2d5025d4aa3495=
befef8f17206a5b0a1"
> =20
>  DEPENDS =3D "avahi"
>  RDEPENDS_${PN} =3D "avahi-daemon"
> -PR =3D "r6"
> +PR =3D "r7"
> =20
>  SRC_URI =3D "http://0pointer.de/lennart/projects/nss-mdns/nss-mdns-${PV}=
=2Etar.gz"
> =20
> @@ -30,7 +30,14 @@ pkg_postinst_${PN} () {
>  }
> =20
>  pkg_prerm_${PN} () {
> +if [ "$D" !=3D "" ]; then
>  	sed -e '/^hosts:/s/\s*\<mdns4\>//' \
>  		-e '/^hosts:/s/\s*mdns4_minimal\s\+\[NOTFOUND=3Dreturn\]//' \
> -		-i /etc/nsswitch.conf
> +		-i $D/etc/nsswitch.conf
> +	exit 0
> +fi
> +
> +sed -e '/^hosts:/s/\s*\<mdns4\>//' \
> +	-e '/^hosts:/s/\s*mdns4_minimal\s\+\[NOTFOUND=3Dreturn\]//' \
> +	-i /etc/nsswitch.conf
>  }
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

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD3xCsACgkQN1Ujt2V2gBxMEQCgjgcmwa6LnkTUyiHIPoE0vPVz
2D8AoKPqd80x6IJNuXVvepM98oX27Ulw
=usca
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
