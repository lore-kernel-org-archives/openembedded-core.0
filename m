Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 975A979859
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 18:20:06 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g33-v6so7409858wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 11:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/JvpAFz23Gs3sMvNZxitdlqW2LGTjaE8W3cLxlU0hr0=;
	b=Za0c599Q+TSX3P9JadWt5JgqlOiNZ2qoWYo4VezNVyireWo1SVcuZoDODDYeuMIwPF
	Gw7a3VUoiP5GW1e3jq8Ulilhtjpf9FRVAxTNEQKUwLc7+VhLWWp9+0nl2XY+iWY8xrOQ
	4tpzpng204IJyxwAfjjqEidUW/KZDHupMtYJrG+QWZQPmnRMxeH7YeSNvWj7ewsbIL4x
	tFb9zRx8+YCPNr6ZA981bjCSSntij3qE+1HuAODIqu22ijrbMtuQHo7qhrAr5hQZvNjM
	PlF9rFdADb82wmCE0TdL58XYZD9ORBTV1LdlSuwztAmvRL99E5yF7lpW4jWp9FrSK68b
	Ae7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/JvpAFz23Gs3sMvNZxitdlqW2LGTjaE8W3cLxlU0hr0=;
	b=inxqO8V56jTGdTQZ+9PFPY97la6HN4XhNm0QGObN+WUgjVeLIe93jZP0epaxkEhPAn
	pSc0cNslPdM5nOgLiIL2DdPR93e1KkMWBE5IVR4eQf6srXIWZLzeLlk0chmQiB5MFr1s
	71z3dwIx64rL+Dpu+x4HcAE/v36eaT1/rjBfBXoZs7/ygXIeve53f/kvUkIMj7enN329
	l7IuHt9i7fXr+X5QaJ7lE7yfOSh+Zb+PuP+6gXCQpin52Z8VDdGMdrgk94zK4U47ErYb
	jvE3XOr8Lls0/KNwhmu4t09Q+AVguu4/JMWR1kgzmIrRxc5+HL/1M9TKe1VSZKmXKPxl
	tmZg==
X-Gm-Message-State: APzg51A1zW6Kr/0RZRTD3LLSsWTCWqeaw5ePRzSNwRFQ4XIaN2wZYnSj
	1HrwPlN2Qvs0Qp5asg249ok=
X-Google-Smtp-Source: ANB0VdbqxBZSE64XL5PSKvS4EDqZ0fRwj/9hooPa+2BqzvZmOWsUTn0pH65Pj274ztmOb2SqYfKQ+w==
X-Received: by 2002:a5d:528f:: with SMTP id
	c15-v6mr6889081wrv.102.1536862807032; 
	Thu, 13 Sep 2018 11:20:07 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g2-v6sm3536934wme.20.2018.09.13.11.20.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 13 Sep 2018 11:20:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 13 Sep 2018 20:20:07 +0200
To: kai.kang@windriver.com
Message-ID: <20180913182007.GA1437@jama>
References: <cover.1536248856.git.kai.kang@windriver.com>
	<2824ade62c3ec58c96074aba632740a8118c15f2.1536248856.git.kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <2824ade62c3ec58c96074aba632740a8118c15f2.1536248856.git.kai.kang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] allarch: only enable allarch when multilib is not used
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
X-List-Received-Date: Thu, 13 Sep 2018 18:20:07 -0000
X-Groupsio-MsgNum: 116247
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 06, 2018 at 11:52:24PM +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> Some allarch packages rdepends non-allarch packages. when multilib is
> used, it doesn't expand the dependency chain correctly, e.g.
>=20
> core-image-sato -> ca-certificates(allarch) -> openssl
>=20
> we expect dependency chain for lib32-core-image-sato:
>=20
> lib32-core-image-sato -> ca-certificates(allarch) -> lib32-openssl
>=20
> it should install lib32-openssl for ca-certificates but openssl is still
> wrongly required.
>=20
> Only enable allarch when multilib is not used to fix the issue.
>=20
> signed-off-by: kai kang <kai.kang@windriver.com>
> ---
>  meta/classes/allarch.bbclass         | 12 +++++++++++-
>  meta/classes/icecc.bbclass           |  2 +-
>  meta/classes/multilib.bbclass        |  3 ++-
>  meta/classes/multilib_global.bbclass |  4 +---
>  meta/classes/package.bbclass         |  9 ++++++---
>  5 files changed, 21 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> index 1eebe0bf2e..45f62a5939 100644
> --- a/meta/classes/allarch.bbclass
> +++ b/meta/classes/allarch.bbclass
> @@ -2,7 +2,17 @@
>  # This class is used for architecture independent recipes/data files (us=
ually scripts)
>  #
> =20
> -PACKAGE_ARCH =3D "all"
> +python allarch_package_arch_handler () {
> +    if bb.data.inherits_class("nativesdk", d) or bb.data.inherits_class(=
"crosssdk", d):
> +        return
> +
> +    variants =3D d.getVar("MULTILIB_VARIANTS")
> +    if not variants:
> +        d.setVar("PACKAGE_ARCH", "all" )
> +}
> +
> +addhandler allarch_package_arch_handler
> +allarch_package_arch_handler[eventmask] =3D "bb.event.RecipePreFinalise"

Maybe I'm overlooking something, but doesn't this overwrite whatever
PACKAGE_ARCH as set before this?

I have some recipes where the PACKAGE_ARCH is set to MACHINE_ARCH through
another bbclass, but then overwritten with "all" by allarch_package_arch_ha=
ndler:

# $PACKAGE_ARCH [5 operations]
#   set oe-core/meta/conf/bitbake.conf:150
#     [_defaultval] "${TUNE_PKGARCH}"
#   set meta-lg-webos/meta-webos/conf/distro/include/webos.inc:241
#     "${MACHINE_ARCH}"
#   set oe-core/meta/conf/documentation.conf:304
#     [doc] "The architecture of the resulting package or packages."
#   set meta-lg-webos/meta-webos/classes/webos_machine_impl_dep.bbclass:11
#     "${MACHINE_ARCH}"
#   set allarch.bbclass:12 [allarch_package_arch_handler]
#     "all"
# pre-expansion value:
#   "all"
PACKAGE_ARCH=3D"all"

But surprisingly if I do the same with e.g. packagegroup-core-boot in oe-co=
re I get:

# $PACKAGE_ARCH [4 operations]
#   set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:150
#     [_defaultval] "${TUNE_PKGARCH}"
#   set /OE/build/oe-core/openembedded-core/meta/conf/documentation.conf:304
#     [doc] "The architecture of the resulting package or packages."
#   set /OE/build/oe-core/openembedded-core/meta/recipes-core/packagegroups=
/packagegroup-core-boot.bb:9
#     "${MACHINE_ARCH}"
#   set? /OE/build/oe-core/openembedded-core/meta/classes/packagegroup.bbcl=
ass:12
#     "all"
# pre-expansion value:
#   "${MACHINE_ARCH}"
PACKAGE_ARCH=3D"qemux86_64"

Why isn't allarch_package_arch_handler executed in the 2nd case?

Cheers,

> =20
>  python () {
>      # Allow this class to be included but overridden - only set
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index 0ca8de86c2..b5a8457747 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -171,7 +171,7 @@ def use_icecc(bb,d):
>      return "yes"
> =20
>  def icecc_is_allarch(bb, d):
> -    return d.getVar("PACKAGE_ARCH") =3D=3D "all" or bb.data.inherits_cla=
ss('allarch', d)
> +    return d.getVar("PACKAGE_ARCH") =3D=3D "all"
> =20
>  def icecc_is_kernel(bb, d):
>      return \
> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
> index f2ac8bdfef..7b4d6472b0 100644
> --- a/meta/classes/multilib.bbclass
> +++ b/meta/classes/multilib.bbclass
> @@ -50,7 +50,8 @@ python multilib_virtclass_handler () {
>      if bb.data.inherits_class('nativesdk', e.data) or bb.data.inherits_c=
lass('crosssdk', e.data):
>          raise bb.parse.SkipRecipe("We can't extend nativesdk recipes")
> =20
> -    if bb.data.inherits_class('allarch', e.data) and not bb.data.inherit=
s_class('packagegroup', e.data):
> +    if bb.data.inherits_class('allarch', e.data) and not d.getVar('MULTI=
LIB_VARIANTS') \
> +        and not bb.data.inherits_class('packagegroup', e.data):
>          raise bb.parse.SkipRecipe("Don't extend allarch recipes which ar=
e not packagegroups")
> =20
>      # Expand this since this won't work correctly once we set a multilib=
 into place
> diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib=
_global.bbclass
> index d2ec1adfea..1bb62427b0 100644
> --- a/meta/classes/multilib_global.bbclass
> +++ b/meta/classes/multilib_global.bbclass
> @@ -165,9 +165,7 @@ python multilib_virtclass_handler_global () {
>          return
> =20
>      if bb.data.inherits_class('kernel', e.data) or \
> -            bb.data.inherits_class('module-base', e.data) or \
> -            (bb.data.inherits_class('allarch', e.data) and\
> -             not bb.data.inherits_class('packagegroup', e.data)):
> +            bb.data.inherits_class('module-base', e.data):
>              variants =3D (e.data.getVar("MULTILIB_VARIANTS") or "").spli=
t()
> =20
>              import oe.classextend
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 0b6f65a855..d1e9138c66 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -494,7 +494,8 @@ def get_package_mapping (pkg, basepkg, d):
> =20
>      if key in data:
>          # Have to avoid undoing the write_extra_pkgs(global_variants...)
> -        if bb.data.inherits_class('allarch', d) and data[key] =3D=3D bas=
epkg:
> +        if bb.data.inherits_class('allarch', d) and not d.getVar('MULTIL=
IB_VARIANTS') \
> +            and data[key] =3D=3D basepkg:
>              return pkg
>          return data[key]
> =20
> @@ -1413,7 +1414,8 @@ fi
>      if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('mo=
dule-base', d):
>          write_extra_pkgs(variants, pn, packages, pkgdatadir)
> =20
> -    if (bb.data.inherits_class('allarch', d) and not bb.data.inherits_cl=
ass('packagegroup', d)):
> +    if bb.data.inherits_class('allarch', d) and not variants \
> +        and not bb.data.inherits_class('packagegroup', d):
>          write_extra_pkgs(global_variants, pn, packages, pkgdatadir)
> =20
>      workdir =3D d.getVar('WORKDIR')
> @@ -1502,7 +1504,8 @@ fi
>      if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('mo=
dule-base', d):
>          write_extra_runtime_pkgs(variants, packages, pkgdatadir)
> =20
> -    if bb.data.inherits_class('allarch', d) and not bb.data.inherits_cla=
ss('packagegroup', d):
> +    if bb.data.inherits_class('allarch', d) and not variants \
> +        and not bb.data.inherits_class('packagegroup', d):
>          write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
> =20
>  }
> --=20
> 2.18.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW5qqVgAKCRA3VSO3ZXaA
HNrHAKCqCL3SJefLhpMZtga3zGQXMgTtuACfVF2Xa2igqyHD3iUfgfqmuuqEOGA=
=puhh
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
