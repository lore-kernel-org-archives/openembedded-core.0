Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id B7B0460272
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2019 13:09:52 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t27so18239903wra.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2019 05:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6trHlyvrbIDNUhiM0fOR0Ws1fzEPY2d/oJVdG2hy6/U=;
	b=q/Ji+mIJFfxmP65lSfY1lV+GwErRyxZ9erVyhYswsd3+NOxl9D4bnb3ScmaWthxmVA
	BxN3dcvmGa91QFi26Oi/wIHr2Jr6dWEt+ALAtdQF/Iml9Q57ecuR+swb/3MKi9JamWcB
	w6oy2Rwef3BF4YERdS8grzHIwbcYYPyScbUofQ98sK7h6YFLORjiI390mQNwwlwHnHzx
	8G2V7MnQAJpEL8JocmGDEymwpFx+SiWKM7aWnavV9Hl+K2UZ532csjlODECleR/wRIc1
	/v2SavROjJuMYLNrj8YmBcYC05vMRCau3RoarDOTjNBDk+vdkCB8tNSXyxyIBYRcZykz
	TJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6trHlyvrbIDNUhiM0fOR0Ws1fzEPY2d/oJVdG2hy6/U=;
	b=q6yrkW48k4MZFugNjNa9YXbopO4BFC62OnFzSmIhfi4X7Ht85UX7bJ6/dyJ03bACvl
	qRB0NpmxIbvOxCj/JXIHGPXLnoqIZqzjcGoxz8RQ1fg0w8Nueo29VD2IkswJHNrgBJvK
	2kC7i1YZN8L2UY8r6EykZKiYb6qj6qY6SGyqWUzP7V/duQ31reAV3emKVjuEUg6wbPil
	k2nPTlpyIwrywiPqql72WQjOgUKFLbhjEpdYWjT6zLBDozNH6drFwBQcFCQW2J3s1l5J
	A/Yk5/QZHpVtTOoOkBSfBuIdOePrh0+Dz24sSGQjaljf5hnZYbt0jkRWpbVnq6oUHza1
	iYkA==
X-Gm-Message-State: AJcUukf5kISQA5AHcwXk3IuHkb4l/x8ev41Thdsug93gGdAztvwdPpUd
	HbSNAW4g3LomcHUabx439vLLQErb
X-Google-Smtp-Source: ALg8bN4ic8oHSRIJ5ijbOVXCWhPm1ZftnQwRf/IC+jtS1nwZRr0UYzMLUJK1a/9vbzJ9Fh7c/k0Q6A==
X-Received: by 2002:adf:f691:: with SMTP id v17mr19763192wrp.114.1547903393294;
	Sat, 19 Jan 2019 05:09:53 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	a6sm36052881wmh.10.2019.01.19.05.09.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 19 Jan 2019 05:09:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 19 Jan 2019 14:09:59 +0100
To: Shantanu <shantanu@senic.com>
Message-ID: <20190119130959.GA1840@jama>
References: <20190119122618.5173-1-shantanu@senic.com>
MIME-Version: 1.0
In-Reply-To: <20190119122618.5173-1-shantanu@senic.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] Add recipe for python bindings of Berkeley DB
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
X-List-Received-Date: Sat, 19 Jan 2019 13:09:53 -0000
X-Groupsio-MsgNum: 120346
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 19, 2019 at 05:56:18PM +0530, Shantanu wrote:
> Signed-off-by: Shantanu <shantanu@senic.com>

Wrong ML, this belongs to openembedded-devel ML.

> ---
>  .../python/python3-bsddb3_6.2.6.bb            | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-bsddb3_6.=
2.6.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb =
b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
> new file mode 100644
> index 000000000..0cb10fbab
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "pybsddb is the Python binding for the Oracle Berkeley D=
B"

Use SUMMARY.

> +HOMEPAGE =3D "https://www.jcea.es/programacion/pybsddb.htm"
> +SECTION =3D "devel/python"
> +LICENSE =3D "AGPL-3.0"
> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/AGPL-3.0;md5=3D73f1eb=
20517c55bf9493b7dd6e480788"

Don't use COMMON_LICENSE_DIR in LIC_FILES_CHKSUM.

> +SRC_URI[md5sum] =3D "ebb7554bbe1a518abbe742753a617577"

Where is sha256sum?

> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE =3D "bsddb3"
> +
> +DEPENDS =3D "db \
> +  python3-core \
> +"
> +
> +DISTUTILS_BUILD_ARGS =3D "--berkeley-db=3D${STAGING_DIR_HOST}/usr"
> +DISTUTILS_INSTALL_ARGS =3D "--berkeley-db=3D${STAGING_DIR_HOST}/usr"
> +
> +RDEPENDS_${PN} =3D "db"
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

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXEMhpgAKCRA3VSO3ZXaA
HBvpAKChXcFnEjVWTG+W9hC8X+h018cjpgCfb6XZNYZcTRkUyfK98J4JqPMQGSQ=
=UoXN
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
