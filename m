Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOPuU-0001mm-P8
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Apr 2012 10:55:14 +0200
Received: by wgbdr1 with SMTP id dr1so1614403wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2012 01:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ydcymv31aPNJBoBgO6mFwpgMedpC9jDjTWFyXhVE2HQ=;
	b=DmPGt0tXfLrWkEde79hU0Qv3bpePDXHloKSX7KjSImTMii0uJ3bQpmoppdVQhxrfFL
	xSymznOd3m6JArA+pYHzejC0aqCeR9NlnCUCIe8/wGr5ibXZ1bWXEL97/X+Lqb7kHSkW
	71WH4qR/+hcXvHRXlyGju/Jl1aQG9q2KxoKhI+kIU29qW5FXajr3oj8/JCPjMl1aIrEJ
	S/or1n+PiyogFl8l1dZGtzd3eDUHzhvMIhFQtm5en45qgRXC4DBlNPuoh4rz4hEsD8Io
	EopVT7XpoQ/EkvyaJoDjgiUPY/T6m5hIfQyzelyG4XuAP87Pz27EbFHZIvjGNTKf6LTc
	1jMA==
Received: by 10.180.80.104 with SMTP id q8mr20053492wix.14.1335689134248;
	Sun, 29 Apr 2012 01:45:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n20sm30398801wiw.5.2012.04.29.01.45.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 01:45:33 -0700 (PDT)
Date: Sun, 29 Apr 2012 10:45:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120429084538.GA350@jama.jama.net>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
	<baa0f344e516b3474cf5f1a5e8afcbc392be16de.1335600691.git.dongxiao.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <baa0f344e516b3474cf5f1a5e8afcbc392be16de.1335600691.git.dongxiao.xu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 6/8] ofono: upgrade to version 1.6
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
X-List-Received-Date: Sun, 29 Apr 2012 08:55:14 -0000
X-Groupsio-MsgNum: 21311
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 28, 2012 at 04:12:30PM +0800, Dongxiao Xu wrote:
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
>  .../ofono/{ofono_1.5.bb =3D> ofono_1.6.bb}           |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>  rename meta/recipes-connectivity/ofono/{ofono_1.5.bb =3D> ofono_1.6.bb} =
(97%)
>=20
> diff --git a/meta/recipes-connectivity/ofono/ofono_1.5.bb b/meta/recipes-=
connectivity/ofono/ofono_1.6.bb
> similarity index 97%
> rename from meta/recipes-connectivity/ofono/ofono_1.5.bb
> rename to meta/recipes-connectivity/ofono/ofono_1.6.bb
> index dad813f..d0f273b 100644
> --- a/meta/recipes-connectivity/ofono/ofono_1.5.bb
> +++ b/meta/recipes-connectivity/ofono/ofono_1.6.bb
> @@ -1,6 +1,6 @@
>  require ofono.inc
> =20
> -PR =3D "r1"
> +PR =3D "r0"

without checksum change it will fail, right?

I'll send patch I have for ofono upgrade in my branch.

> =20
>  SRC_URI  =3D "${KERNELORG_MIRROR}/linux/network/ofono/${BPN}-${PV}.tar.b=
z2 \
>  	          file://ofono"
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+c/7IACgkQN1Ujt2V2gBwixACglz2Q90IKwYW0YlFO7OKSfErW
ilgAn1gsXODn+qNf+r6FIGAjlKl5QyAZ
=x+qB
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
