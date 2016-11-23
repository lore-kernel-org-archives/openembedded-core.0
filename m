Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id BC339605BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 18:10:37 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id xy5so1610171wjc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 10:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=KzaWACqIqDGOt2WM65ga+md4kDXke/P9akN3yTgP6QM=;
	b=c1cKwLykhMMtJMoYSfFP+cbTbVQgvvfLVdzSasYo7N0WFfnamAM2l+40eE2ucDZ2gB
	mUUyxcRMJMPX3ijhcr9w7m5FoBUO6H0P1bCsDmwGaOfgArJ+iSGrsqgG6o/zVRxrTQmQ
	7Hx7DXpGn63tnAkCr5ygezKUcVsQ+a1TDlcJFyyHj0jJ8tirpaX9Mc/pwEwYw/TnRzrT
	MY+W6svWVXhULtyoM44n+cJMNC1pB3yXDiwlQ+TgWV5o2C+Mi7RO5P6o0uuSgWtm7bc/
	LF8lNNlp9P1I5RDDZnZqMMMfXnwrrhmWjFg2CupcDGSLkdiuky9HhNkBc6ogEvpF7a0j
	wZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KzaWACqIqDGOt2WM65ga+md4kDXke/P9akN3yTgP6QM=;
	b=TddhBuNPkrwOSu6NeK7ERFAwKASJx04eIE39J8HyIvRVe3V0ADcXctLkLcC5x1x/3c
	OYxKd35PicfckmJiYX/3qnQHZWgDpnpal5Qr3wzDKgnDBgbBGzeDOssOEnDpEyVpALqx
	D1WL+KPjmOjYwfpIbgQZ1ZzJG1lX3+/mri+X5q+Xs9eX4yZmEPkowY7vzm0PF2jl7gfM
	C4Cz0PUmV9mgoLyy4so/oBW/TUW0ggyXcRUsDWU8hu0h+pQFKJrYDX7O0iTiwlPjGift
	AVD1PQGatEHdxfekCpz5+BCFkPlk7WYYhzwJOeyaGs9hNRWq9FyObk8Cp3n1efeTxOqC
	dwhQ==
X-Gm-Message-State: AKaTC03/7lgkAlP234kWosxjs1p9d3M0iAk8hgwl50bkb1B33047ymyRIwbo0WNZlCM2zA==
X-Received: by 10.194.75.161 with SMTP id d1mr4311889wjw.7.1479924638721;
	Wed, 23 Nov 2016 10:10:38 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	ab10sm37545284wjc.45.2016.11.23.10.10.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 23 Nov 2016 10:10:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Nov 2016 19:10:39 +0100
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20161123181039.GF3265@jama>
References: <20161123174209.211349-1-mark.hatle@windriver.com>
	<20161123174209.211349-2-mark.hatle@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20161123174209.211349-2-mark.hatle@windriver.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta/conf/layer.conf: Add recommended download layer
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
X-List-Received-Date: Wed, 23 Nov 2016 18:10:40 -0000
X-Groupsio-MsgNum: 89770
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NQTVMVnDVuULnIzU"
Content-Disposition: inline

--NQTVMVnDVuULnIzU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 11:42:09AM -0600, Mark Hatle wrote:
> This is a Wind River specific patch and not generally applicable.

Then why is it sent to oe-core ML?

>=20
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/conf/layer.conf | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 24b4df0..a94e524 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -11,6 +11,8 @@ BBFILE_PRIORITY_core =3D "5"
>  # cause compatibility issues with other layers
>  LAYERVERSION_core =3D "9"
> =20
> +LAYERRECOMMENDS_core =3D "oe-core-dl-2-2"
> +
>  BBLAYERS_LAYERINDEX_NAME_core =3D "openembedded-core"
> =20
>  # Set a variable to get to the top of the metadata location
> --=20
> 2.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NQTVMVnDVuULnIzU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDXbngAKCRA3VSO3ZXaA
HBTTAJ9DQ0z8CyIJLOVtYKMxDRKOcJndywCgoeXD+Fm/KhPqgHnwPdNI7DBhDOc=
=P2Ct
-----END PGP SIGNATURE-----

--NQTVMVnDVuULnIzU--
