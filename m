Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5595E7D124
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 14:43:35 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id z6so5015629wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 07:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4WQRLTK56p4wd4si0KeMeeV43NhkxC2KK66Pi212y/U=;
	b=TWZsO47vh+vdxCTrWdBLoJklFukY4T4AQpMH3JQlhgB1sRoD2g6Elucrf4kbiVIS6c
	cwA8GUd4ZuIIQSmfJW66Egv0OeyyfUQW2ogL6zSGSiIUTdokbhLeiMczhYE9L2UfjO3J
	2nuja2o6PdI/t5mG5UYz8vWkB9bFS7TzH2WNBXnmITlTYcn1iUFE1+76D33lPO3sPul9
	U93N5ZQa3cvIstID55tr9k8YvOESOZAi21eAindtdt0UyesM7wFYnWkHDoiBR+0JsX+x
	m9RKFgZbcTvxScHFrVQSWTUA0Mqq+F5sey/QXs39SZ8a8n/5SXff6xUqLWclvX7D9mNX
	3fGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4WQRLTK56p4wd4si0KeMeeV43NhkxC2KK66Pi212y/U=;
	b=IKWhuckct9FEVy51ow3LQyF7mSuuC9LXk40EPEOn3Xgnoetz+6GLupFvBi1Vrq5xAQ
	ozrQbu+8zKtI6w7UTPA/7mP3CRLxeUcFPWlXsldWGi0VSXGx5fKCOo1/IhUuQAdolYCD
	5ufKrhASnhPEeLkJ0e2Fi+GaY65mLqb8VbtTR0MAlNq4nAI6GKwJGmugKLE/UrSeVvUa
	6whzv8cHsRUiRPlq3MzFV0WDaqM67I8r8BdOFrwW77/+cSxqvwC+acDuXjPG811crvIU
	YszSc1jgpu7936uZPNC/L1WChOnnkQD5mtbmQBYpzr42/FIHv5jIePBFf3DgyYp/vvKz
	dMvg==
X-Gm-Message-State: APjAAAU7s2Wv0GpEodwgNU6UrWm6NhfGrFdVcj0ZmnRA2/duzjAKaRpL
	WlP3xrFfWj7I6BH01QCLmkI=
X-Google-Smtp-Source: APXvYqxTw1jEFUyr7iRA/izOoeJ2lb/QCYjSyZu9VOdoDKjVC+BJWFdTbGooMVY8CVQNO9tKzZ3aKg==
X-Received: by 2002:a7b:c769:: with SMTP id x9mr13278085wmk.103.1553697815934; 
	Wed, 27 Mar 2019 07:43:35 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	f20sm49386952wrg.91.2019.03.27.07.43.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 07:43:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Mar 2019 15:43:35 +0100
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190327144335.GC1598@jama>
References: <20190327140922.109867-1-alex.kanavin@gmail.com>
	<20190327140922.109867-7-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190327140922.109867-7-alex.kanavin@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/8] llvm: update from 8.0.0rc2 to 8.0.0 final release
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
X-List-Received-Date: Wed, 27 Mar 2019 14:43:35 -0000
X-Groupsio-MsgNum: 122662
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DIOMP1UsTsWJauNi"
Content-Disposition: inline

--DIOMP1UsTsWJauNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2019 at 03:09:21PM +0100, Alexander Kanavin wrote:
> Also, update PV to match the version scheme used by upstream
> to tag releases (e.g. major.minor.patch).
>=20
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/llvm/llvm_git.bb | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtoo=
ls/llvm/llvm_git.bb
> index d2ea927651d..d1832e03f71 100644
> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> @@ -19,18 +19,14 @@ PROVIDES +=3D "llvm${PV}"
>  LLVM_RELEASE =3D "${PV}"
>  LLVM_DIR =3D "llvm${LLVM_RELEASE}"
> =20
> -# SRCREV is set to the revision of 8.0.0-rc2 tag, while latest release
> -# tag is 7.0.1 as of Feb 18 2019, hence the need for UPSTREAM_CHECK_UNKN=
OWN
> -# Remove the UPSTREAM_VERSION_UNKNOWN line once 8.0.0 final is tagged
> -UPSTREAM_VERSION_UNKNOWN =3D "1"
> -SRCREV =3D "98ebe7460199b9cd79eb562b5e8705ad28f5513f"
> +SRCREV =3D "d2298e74235598f15594fe2c99bbac870a507c59"

Are you intentionally using d2298e74235598f15594fe2c99bbac870a507c59
instead of the SRCREV of the annotated tag llvmorg-8.0.0?

llvm-project $ git show-ref -d llvmorg-8.0.0
8474bc915331b2b7851fcad74f510803f0989b8b refs/tags/llvmorg-8.0.0
d2298e74235598f15594fe2c99bbac870a507c59 refs/tags/llvmorg-8.0.0^{}

I know that many projects don't use annotated tags, but if there is one
it would be nice to use that (so that it's easier to verify that the
SRCREV really matches with the tag).

>  BRANCH =3D "release/${MAJOR_VERSION}.x"
>  MAJOR_VERSION =3D "8"
>  MINOR_VERSION =3D "0"
>  PATCH_VERSION =3D "0"
>  SOLIBVER =3D "1"
> -PV =3D "${MAJOR_VERSION}.${MINOR_VERSION}"
> +PV =3D "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
>  SRC_URI =3D "git://github.com/llvm/llvm-project.git;branch=3D${BRANCH} \
>             file://0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if=
-th.patch \
>             file://0002-llvm-allow-env-override-of-exe-path.patch \
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

--DIOMP1UsTsWJauNi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXJuMFgAKCRA3VSO3ZXaA
HFPsAJ9O23gUaZQt80f0Rx2ZmUSwQuUbjgCgoossXpwWZlWu+0V8AoUT/TQbRHY=
=iS2e
-----END PGP SIGNATURE-----

--DIOMP1UsTsWJauNi--
