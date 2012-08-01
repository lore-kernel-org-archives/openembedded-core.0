Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwXWp-0003bS-Pm
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 13:55:51 +0200
Received: by wibhm11 with SMTP id hm11so3408154wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 04:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QGxgaTXAgaECFGVQKgDLVC78FUbE+t3apD5nZDN3S6g=;
	b=PhxBFLMUAUeFD9+kaF6Eqp9qu3g+6f3p19hnFZ2Dw0LCmQ2abwYUY8h28Soe8fkHQo
	14kvwnESCGm1E3jew+9jS42B6uv3xIfRTsKnYm/FC8B+5otkuA1s9LvFbhiOo0cc1RwZ
	a0jSEbR8s5vKXai+s2+bafrx2A/e6a5qMyW2A4o30idHIGn0FyFuKJT1R6U3ehm+dSr9
	wnka8Vu/eX4UxMOS5g8A3lXq4bdOTRGwct5XCOSFPTLVpa6+twKnFKU/qnHTcyrcoFs1
	kh8BgxQyYf2cCnMkaaZaL8yeYaa+3ww0E2S929CIJRdqxhgdDX2G0WUBqnFOyNoK/Hp1
	5wRA==
Received: by 10.180.97.33 with SMTP id dx1mr15809179wib.18.1343821453587;
	Wed, 01 Aug 2012 04:44:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ep14sm34328140wid.0.2012.08.01.04.44.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 04:44:12 -0700 (PDT)
Date: Wed, 1 Aug 2012 13:44:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120801114409.GB16306@jama.jama.net>
References: <1343821320-21727-1-git-send-email-radu.moisan@intel.com>
MIME-Version: 1.0
In-Reply-To: <1343821320-21727-1-git-send-email-radu.moisan@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] liburcu: Upgrade to upstream 0.7.3
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
X-List-Received-Date: Wed, 01 Aug 2012 11:55:51 -0000
X-Groupsio-MsgNum: 26613
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline

--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2012 at 02:42:00PM +0300, Radu Moisan wrote:
> LICENSE file has data changed.

Without any change in package (tarball checksums)?

This is follow up to:
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/025034.html
right?

Because this change alone doesn't make much sense.

Cheers,

> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  meta/recipes-support/liburcu/liburcu_0.7.3.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/liburcu/liburcu_0.7.3.bb b/meta/recipes=
-support/liburcu/liburcu_0.7.3.bb
> index a28c3e6..86f29be 100644
> --- a/meta/recipes-support/liburcu/liburcu_0.7.3.bb
> +++ b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://lttng.org/urcu"
>  BUGTRACKER =3D "http://lttng.org/project/issues"
> =20
>  LICENSE =3D "LGPLv2.1+ & MIT-style"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db472dc110d38774921e1d5ccb0065=
fff \
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D95dfea59eeaa41a4057faa07a58f5=
f89 \
>                      file://urcu.h;beginline=3D4;endline=3D32;md5=3D4de0d=
68d3a997643715036d2209ae1d9 \
>                      file://urcu/uatomic/x86.h;beginline=3D4;endline=3D21=
;md5=3D220552f72c55b102f2ee35929734ef42"
> =20
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAZFokACgkQN1Ujt2V2gBzdrQCfdHzTCbC9qh9J1SaZXBDu4gP6
TckAnAzl5hXP5UR/9RfT9KTeRf+KQ84u
=MRXE
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
