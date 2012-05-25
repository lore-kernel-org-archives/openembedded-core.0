Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SXqOW-00047D-Vg
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 11:01:13 +0200
Received: by bkcjm2 with SMTP id jm2so553941bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 01:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JZ2O14rTNz07Nvi0CYYv9670kHQV9W9biiTPxNXWSM0=;
	b=ESSHsUYQASiBrhUZekZqYNSVhpBDtYFSUOCioymzfQHC4BNNvQu9CYQPp45cGqJQVm
	tAMXErJ7o0Lj2paL46i43stZ71W3Ft9LahogFOAgv/8qDDm8GSrEbrdMlgakTMGsY+0v
	ekVAfaY6tGeGAZ8MMYWgxEpVBMJIIR9suUAQAN5LgMdnI4P2kiMeCr4esrATKqgeG76M
	Uv4OVyzs6SbOqvYyRkweAyU6bIHxwGCj9ZJAYGUfQJXFa6QQmno9zMudSm49rX+lgW6A
	cRuimP/5KC/+GOvRkMcyH02yA/lo3SDZem0VZUd2+BNWOULxlex/7eP1vZ/wN+IalR5Y
	3RRg==
Received: by 10.204.151.82 with SMTP id b18mr1050387bkw.132.1337935860628;
	Fri, 25 May 2012 01:51:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ig1sm5501045bkc.4.2012.05.25.01.50.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 May 2012 01:50:59 -0700 (PDT)
Date: Fri, 25 May 2012 10:51:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120525085103.GB3138@jama.jama.net>
References: <cover.1337868781.git.radu.moisan@intel.com>
	<eb1e7a0ded7e26ab8f79017f20ce139de82810b0.1337868781.git.radu.moisan@intel.com>
MIME-Version: 1.0
In-Reply-To: <eb1e7a0ded7e26ab8f79017f20ce139de82810b0.1337868781.git.radu.moisan@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/3] mtd-utils: Update to version 1.5.0
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
X-List-Received-Date: Fri, 25 May 2012 09:01:13 -0000
X-Groupsio-MsgNum: 22792
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Content-Disposition: inline

--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 25, 2012 at 11:50:56AM +0300, Radu Moisan wrote:
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
>  .../mtd/{mtd-utils_1.4.9.bb =3D> mtd-utils_1.5.0.bb} |    2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/mtd/{mtd-utils-1.4.9 =3D> mtd-utils-1.5.0}/=
add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
>  rename meta/recipes-devtools/mtd/{mtd-utils_1.4.9.bb =3D> mtd-utils_1.5.=
0.bb} (98%)
>=20
> diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.4.9/add-exclusion-to-m=
kfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils-1.5.0/add-exclu=
sion-to-mkfs-jffs2-git-2.patch
> similarity index 100%
> rename from meta/recipes-devtools/mtd/mtd-utils-1.4.9/add-exclusion-to-mk=
fs-jffs2-git-2.patch
> rename to meta/recipes-devtools/mtd/mtd-utils-1.5.0/add-exclusion-to-mkfs=
-jffs2-git-2.patch
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb b/meta/recipes-=
devtools/mtd/mtd-utils_1.5.0.bb
> similarity index 98%
> rename from meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb
> rename to meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
> index 4228b51..be71efe 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "git://git.infradead.org/mtd-utils.git;prot=
ocol=3Dgit;tag=3D995cfe51b0a3cf
> =20
>  S =3D "${WORKDIR}/git/"
> =20
> -PR =3D "r1"
> +PR =3D "r0"
> =20
>  EXTRA_OEMAKE =3D "'CC=3D${CC}' 'RANLIB=3D${RANLIB}' 'AR=3D${AR}' 'CFLAGS=
=3D${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=3D${S}'"

does it really update version?
SRC_URI =3D "git://git.infradead.org/mtd-utils.git;protocol=3Dgit;tag=3D995=
cfe51b0a3cf32f381c140bf72b21bf91cef1b
wasn't changed, so I guess the sources are the same.

Cheers,

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

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+/R/cACgkQN1Ujt2V2gBw3SwCfdCkQ6NvwEkYadg1QhU3grY6i
3HwAoI9aYW5Q1XTnOhxygO+ttyXoGxCJ
=wWog
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--
