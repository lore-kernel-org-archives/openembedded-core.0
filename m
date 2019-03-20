Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id C9615605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 11:03:44 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id j9so2238479wrn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 04:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Xo9zlIjLb9EKAoaOAOBMLcgGhTLG+ppAvOGkUB6Ef7w=;
	b=szFVC0Va3tql5HgZ8Y54n8VjnhwfAzGO5VXHr17kS2GZTPLqgx/k1pM6MEacisedAn
	+sVI13pfrGTEzBV3BYNUhWjO4xmyv/JuFTDJxbFfub3zqsHYkUsuHPsY2XxWJ7kMccqG
	NfUNnaPtgbJ0vQUjIJROUv5XGzXe0Zc0uhLt4fXlW8B1UnIA3ZWHFYUPVU/B0DqdCAQC
	zTJjjBKYUQ+dgN595IrWQiw7VTbgnlcNBb+1RhOR6CCcdM+gU7h5Y93kM4XJAk5eT66N
	n5+CU4pQR2RmZUdRqvleu7seaP0gkssgkQZNGTQL34W9XM5d2B/49CY6emWYEeNJfFBk
	2gyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Xo9zlIjLb9EKAoaOAOBMLcgGhTLG+ppAvOGkUB6Ef7w=;
	b=RoI278GAVMKliylCC0PyUtkwdghkoJKpeLsVGYyTwFS170HYrC75jc6+5ZwHmIe0w7
	sH1EMWfjlpmn6Yk5OOUzQkDKVjppgHNJJcsOgCMJZjX9zSgHG8kN3nLLCeXiVTQIbVzj
	tzMaVmHOmWlqFptqfqn/M2R8uQG1dQH4jmh7QhJynCwjZTPz55bJJxgRCYeZ4lG2oDZE
	3sXerIc4S0tpTgaXxos97GqUD/7pub15g249Knj79GMKGDuotwd6SSCv3sW71aNZL70X
	tbgC8nv7M36yfdt9t4VeyngHDTHczHo824tndqbKcVoSdris1XwaZ/7Z77YUvqXmHawd
	tnnA==
X-Gm-Message-State: APjAAAXL+hEiUn3KKqirwtMMLhx3Scqi1AdaG5y+aUFJe40rB2P1IqZZ
	9wiKHbz0zziv7qU+ovLN0PU=
X-Google-Smtp-Source: APXvYqylFKwpZ+tLCUgVfGDyMDKgT6hHvrksyBGkAMwGEaEeFOT3/4a4M0iRKGbupEZ7mYLIro1rRQ==
X-Received: by 2002:adf:e487:: with SMTP id i7mr3963489wrm.264.1553079825523; 
	Wed, 20 Mar 2019 04:03:45 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id a9sm2270044wrt.29.2019.03.20.04.03.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 20 Mar 2019 04:03:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 20 Mar 2019 12:03:44 +0100
To: Jiang Lu <lu.jiang@windriver.com>
Message-ID: <20190320110344.GA1966@jama>
References: <20190320093929.28688-1-lu.jiang@windriver.com>
	<20190320093929.28688-4-lu.jiang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190320093929.28688-4-lu.jiang@windriver.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] glib-networking:enable glib-networking build as native package
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
X-List-Received-Date: Wed, 20 Mar 2019 11:03:45 -0000
X-Groupsio-MsgNum: 122455
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2019 at 05:39:28PM +0800, Jiang Lu wrote:
> Enable glib-networking build as a native package, for it is depended
> by libsoup.
>=20
> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> ---
>  .../glib-networking/glib-networking_2.58.0.bb            | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb =
b/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
> index f3190e1cae..96ba181b71 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
> @@ -29,3 +29,12 @@ FILES_${PN} +=3D "\
>                  "
>  FILES_${PN}-dev +=3D "${libdir}/gio/modules/libgio*.la"
>  FILES_${PN}-staticdev +=3D "${libdir}/gio/modules/libgio*.a"
> +
> +# Make sure we compile with ca-certificates support enabled.
> +PACKAGECONFIG_append =3D " ca-certificates"

Why not enable it in default PACKAGECONFIG? Using _append will make it
more difficult for people to remove this in their layer.

> +
> +DEPENDS +=3D "ca-certificates"

Is it really build time dependency?

> +RDEPENDS_${PN} +=3D "ca-certificates"
> +
> +# We need native version for ostree-/flatpak-native.
> +BBCLASSEXTEND =3D "native"
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXJIeDwAKCRA3VSO3ZXaA
HL5gAJ4pu1EX5Te3ejiJsVF5aiHxUBhDuACfesNcLyfI2EImyVa73RK9W5+JYYA=
=XXvk
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
