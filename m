Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id BA6A07D5BE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 20:05:40 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w1so9416143wrp.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 13:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=O2bvHxF5ls66Oj5SS0brF31biwrV2BUO6VDu2x32y0Y=;
	b=kNal3XhwSrUfrmGWCzLoNVME4ppSAJ6cFF63QUmBzeZ+y0qQHUmWF1+gcYbLsrea7k
	qh/ZuecvEk44Mc/4EZpdJtbQVtvvFeD8ur9fXnt1FZ8lkU7Erv/dT1p7gxsCh0nvFIFd
	O7PG6srSQ8L4jiQiQGun/PrHbhIJJpZrhQqUWN5Mwlk27cNdoJRiFV2Uozp70wWgVIsZ
	qIenQu1eVGpbXfoZz0LT+j/jpndQ7LTJBV20VEM8GmA/oK+1HJaPm1XHPTsY6dgpxKdi
	y5Pg5hRTycl9Oim2FA+4SwV9OICDtN8ChrNOvJvUS9GftyqjMBtr7MRMRm0O26fF5imu
	neXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=O2bvHxF5ls66Oj5SS0brF31biwrV2BUO6VDu2x32y0Y=;
	b=VSjHd9d+6IgTr5JBgHIPAnGrWuS4/FekoUgHyoSsBGr8An79FKY7Gm6DiHTMCDkbkb
	DVnQj3kaMBsjDyJaEpgTQXd/zYKC1peOj8O9bhzAj0MRagu3XRCkjzx5bJxk7GdGpGqe
	CtWe0kgs/CbxKxFZ9wzsioNTsz//jvkRP9GmP78mB2rRBYCRzs3+k9w5QizveV7an0wH
	Jg2hFA/7ta5HDZRvgDh1yH7jnIHbUYfXpoothcLbD14e4dCNx6FTp0ATv0AJdhwBe244
	Ls9rN1kS8nbCN6TZlD4GAb5OqWXTvqBZshNep3ypf/9yft0MTVRTInerVpNb4zh6o0Lt
	X0+Q==
X-Gm-Message-State: APjAAAW1NbJDUQ3E7wmqBMzyyW8lro5qrHlMIBTf8y+MY+arQB+d1ms8
	JhSNh7wTmAIoTQPOvIryteM=
X-Google-Smtp-Source: APXvYqyaeOtenjXMSw8b/lSHKWS0PSo+diiO8N0kSCCK+w3bAk52iLNxakAk7QnPe3WgLZ0fPnr5gQ==
X-Received: by 2002:adf:f1cc:: with SMTP id z12mr10090977wro.180.1554494741435;
	Fri, 05 Apr 2019 13:05:41 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	s203sm5220826wmf.14.2019.04.05.13.05.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 05 Apr 2019 13:05:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 5 Apr 2019 22:05:46 +0200
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Message-ID: <20190405200546.GB1614@jama>
References: <20190405192835.8080-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190405192835.8080-1-schnitzeltony@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gstreamer1.0-python: rework gobject-introspection handling
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
X-List-Received-Date: Fri, 05 Apr 2019 20:05:41 -0000
X-Groupsio-MsgNum: 123103
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline

--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 05, 2019 at 09:28:35PM +0200, Andreas M=FCller wrote:
> gobject-introspection is mandatory for gstreamer1.0-python - there is no
> configure option to enable or disable it.
>=20
> To handle properly, this patch does:
>=20
> * Make 'gobject-introspection-data' a required distro feature
> * Add
>   'UNKNOWN_CONFIGURE_WHITELIST_append =3D " --enable-introspection --disa=
ble-introspection"'
>    - it was removed in gobject-introspection.bbclass to avoid
>   | ERROR: libgee-0.18.0-r0 do_configure: QA Issue: libgee: configure was=
 passed unrecognised options: --disable-schemas-install [unknown-configure-=
option]
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@gmail.com>
> ---
>  .../gstreamer/gstreamer1.0-python_1.14.4.bb                   | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4=
=2Ebb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
> index 8d45ca2668..fb76a37b92 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
> @@ -16,6 +16,10 @@ PNREAL =3D "gst-python"
> =20
>  S =3D "${WORKDIR}/${PNREAL}-${PV}"
> =20
> +# gobject-introspection is mandatory and cannot be configured
> +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"

Is distro_features_check inherited somewhere? I don't see it in this
part and the above IIRC doesn't work without distro_features_check
inherit.

Cheers,

> +UNKNOWN_CONFIGURE_WHITELIST_append =3D " --enable-introspection --disabl=
e-introspection"
> +
>  inherit autotools pkgconfig distutils3-base upstream-version-is-even gob=
ject-introspection
> =20
>  do_install_append() {
> --=20
> 2.20.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXKe1GQAKCRA3VSO3ZXaA
HGfxAJ9aP+9m3kB6TmZNVkWbju3NMb5wGwCbBJeswPikKs9Q5k70fNpAK2iprYw=
=zyAY
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
