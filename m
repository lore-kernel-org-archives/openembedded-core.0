Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 600F57089E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 10:17:11 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id k48so749022wev.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Aug 2014 03:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=syL52BSd7tu9MjcYY7kdzvGWzp9XY+/m5wudZOQ+Ans=;
	b=pnFotTILGX9nomjMD4tsvBiJClHR0uEsaiDqwqoKJrCYdv47wrdR9AZ+h1/mC2qSp8
	SKK9VXS7xtGYzAM8P4m9CnSVGyeprjij+8mTfF54/ylFwTjkxvbmiz3VWxvG2xn95sdv
	xZhVh+PoimnIJJCUdYwwaXID4RbINoYnqD1sPbElo7K4tQ45LpX3v4rcWOEDzEkmd0li
	OCq5QOQFhUblkNeYgjJKG3m8Ol4hOQ4VJd7vM9zRBzArYW4wQOtNxAos1olRO/nxdOCE
	JysEMFVzUnTnUrjNtjS0FZOjIgXzsBYiLBLReetfwf4LZ4DxqzokhRhSbC2noZ0c2kT1
	LzxA==
X-Received: by 10.180.95.68 with SMTP id di4mr18706598wib.60.1407233828884;
	Tue, 05 Aug 2014 03:17:08 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ex4sm6341388wic.2.2014.08.05.03.17.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Aug 2014 03:17:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 5 Aug 2014 12:17:37 +0200
To: Yasir Khan <yasir_khan@mentor.com>
Message-ID: <20140805101737.GH2465@jama>
References: <1407229341-15578-1-git-send-email-yasir_khan@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1407229341-15578-1-git-send-email-yasir_khan@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wpa-supplicant: use PACKAGECONFIG for ssl selection
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
X-List-Received-Date: Tue, 05 Aug 2014 10:17:12 -0000
X-Groupsio-MsgNum: 55994
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6lXr1rPCNTf1w0X8"
Content-Disposition: inline

--6lXr1rPCNTf1w0X8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 05, 2014 at 02:02:21PM +0500, Yasir Khan wrote:
> From: Yasir-Khan <yasir_khan@mentor.com>
>=20
> Select between openssl or gnutls as ssl implementation via
> PACKAGECONFIG instead of explicitly adding both via DEPENDS.
>=20
> Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
> ---
>  .../wpa-supplicant/wpa-supplicant.inc              |   17 ++++++++++++++=
++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc =
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
> index d9c6532..3bbe832 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
> @@ -6,9 +6,13 @@ LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791=
d0e \
>                      file://README;beginline=3D1;endline=3D56;md5=3Da0725=
0b28e857455336bb59fc31cb845 \
>                      file://wpa_supplicant/wpa_supplicant.c;beginline=3D1=
;endline=3D12;md5=3De8e021e30f3a6ab7c341b66b86626a5a"
> -DEPENDS =3D "gnutls dbus libnl openssl libgcrypt"
> +DEPENDS =3D "dbus libnl libgcrypt"
>  RRECOMMENDS_${PN} =3D "wpa-supplicant-passphrase wpa-supplicant-cli"
> =20
> +PACKAGECONFIG[defaultval] +=3D "gnutls"

What is defaultval varflag?

We normally use PACKAGECONFIG ?=3D "gnutls"

> +PACKAGECONFIG[gnutls] =3D ",,gnutls"
> +PACKAGECONFIG[ssl] =3D ",,openssl"
> +
>  inherit systemd
> =20
>  SYSTEMD_SERVICE_${PN} =3D "wpa_supplicant.service wpa_supplicant-nl80211=
@.service wpa_supplicant-wired@.service"
> @@ -36,6 +40,17 @@ CONFFILES_${PN} +=3D "${sysconfdir}/wpa_supplicant.con=
f"
>  do_configure () {
>  	install -m 0755 ${WORKDIR}/defconfig-gnutls wpa_supplicant/.config
>  	echo "CFLAGS +=3D\"-I${STAGING_INCDIR}/libnl3\"" >> wpa_supplicant/.con=
fig
> +=09
> +	sed -i '/CONFIG_TLS/d' wpa_supplicant/.config
> +	if echo "${PACKAGECONFIG}" | grep -qw "ssl"; then
> +        	ssl=3Dopenssl
> +	elif echo "${PACKAGECONFIG}" | grep -qw "gnutls"; then
> +        	ssl=3Dgnutls
> +	fi
> +	if [ -n "$ssl" ]; then
> +        	echo "CONFIG_TLS =3D $ssl" >>wpa_supplicant/.config
> +	fi

Why don't you rename defconfig-gnutls to something generic and add
something like "CONFIG_TLS =3D %ssl%" there to replace it with one sed
call here based on selected implementation.

> +
>  }
> =20
>  export EXTRA_CFLAGS =3D "${CFLAGS}"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6lXr1rPCNTf1w0X8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPgr0EACgkQN1Ujt2V2gBzMUACffdQeZUAx8/n6ToDZBedTfYw0
vVwAoJztsVByIbuO0sj/0EzC4E5D14xd
=DTKW
-----END PGP SIGNATURE-----

--6lXr1rPCNTf1w0X8--
