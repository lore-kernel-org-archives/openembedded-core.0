Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1434C6E7D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 10:24:48 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id cc10so3010770wib.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 03:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yR58PHHwQ0cn+pBj+di85BcVda+KXsyNEYbltODw0ME=;
	b=qvz4UH0g/BnWprdau5WvuIw49Jxo+DOyMgZyZs3OIZ+TNmGPVZuY3IQ2eBIqt4FhAf
	v23Y+0nIg8GBj+QGA0n2D2QWVZ1HihTJGe0FH+sZIbFnIVlp1aOtxaDQMotI786tytE+
	wwb4btJZGCj0jKm77QbrRAPm2w4LErTu0qrMYE9PdDjTNew3JB3Rs5GEjYYkJwZ2diyM
	Eu+rf8QExaQTmuhvsb5t97tAGTRhqs4ubr+lmsNXkx150LGIV6svIbdFKozioJwPvGvk
	bdzxK1z9Vo+3BrA9iu0bFOLKF4cHDZNjX6KkPa+NnmDffWxkgmPkKLsEh/CZFtD2J1T3
	Wbmw==
X-Received: by 10.194.60.37 with SMTP id e5mr13196155wjr.32.1396261488897;
	Mon, 31 Mar 2014 03:24:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x45sm32062766eef.15.2014.03.31.03.24.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 03:24:47 -0700 (PDT)
Date: Mon, 31 Mar 2014 12:24:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Message-ID: <20140331102446.GB2425@jama>
References: <1396254930-11013-1-git-send-email-kai.kang@windriver.com>
	<1396254930-11013-2-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1396254930-11013-2-git-send-email-kai.kang@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo-1.5.1: keep install command directory mode
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
X-List-Received-Date: Mon, 31 Mar 2014 10:24:51 -0000
X-Groupsio-MsgNum: 51904
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aT9PWwzfKXlsBJM1"
Content-Disposition: inline

--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2014 at 04:35:30PM +0800, Kai Kang wrote:
> From: "yanjun.zhu" <yanjun.zhu@windriver.com>
>=20
> When install command sets the created directory mode, pseudo will change
> the mode of the directory to 0700 incorrectly. Backport patch to fix it.
>=20
> Drop PR as well.
>=20
> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../files/pseudo-1.5.1-install-directory-mode.patch    | 18 ++++++++++++=
++++++
>  meta/recipes-devtools/pseudo/pseudo_1.5.1.bb           |  3 +--
>  2 files changed, 19 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/pseudo/files/pseudo-1.5.1-insta=
ll-directory-mode.patch
>=20
> diff --git a/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-dire=
ctory-mode.patch b/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-=
directory-mode.patch
> new file mode 100644
> index 0000000..e8eaf13
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-m=
ode.patch
> @@ -0,0 +1,18 @@
> +Upstream-Status: Backport
> +
> +when install command sets the created directory mode, pseudo will change
> +the mode of the directory to 0700 incorrectly.
> +
> +Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +--- a/ports/unix/guts/mkdirat.c
> ++++ b/ports/unix/guts/mkdirat.c
> +@@ -25,6 +25,7 @@
> + 		stat_rc =3D base_fstatat(dirfd, path, &buf, AT_SYMLINK_NOFOLLOW);
> + #endif
> + 		if (stat_rc !=3D -1) {
> ++			buf.st_mode =3D PSEUDO_DB_MODE(buf.st_mode, mode);
> + 			pseudo_client_op(OP_MKDIR, 0, -1, dirfd, path, &buf);
> + 		} else {
> + 			pseudo_debug(1, "mkdir of %s succeeded, but stat failed: %s\n",
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb b/meta/recipes-=
devtools/pseudo/pseudo_1.5.1.bb
> index bc92856..c265017 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
> @@ -1,11 +1,10 @@
>  require pseudo.inc
> =20
> -PR =3D "r4"

You cannot drop PR when PV/PE is the same, version goes backward (you
should notice QA Error about that).

> -
>  SRC_URI =3D " \
>      http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
>      file://0001-pseudo_has_unload-add-function.patch \
>      file://shutdownping.patch \
> +    file://pseudo-1.5.1-install-directory-mode.patch \
>  "
> =20
>  SRC_URI[md5sum] =3D "5ec67c7bff5fe68c56de500859c19172"
> --=20
> 1.8.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aT9PWwzfKXlsBJM1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM5Qm4ACgkQN1Ujt2V2gBxQTQCgipZpKB6+ewsLXkNgVy9ZWiuM
Pw4An1yEmknagEceL+d6QFYx12zKnODS
=WoYw
-----END PGP SIGNATURE-----

--aT9PWwzfKXlsBJM1--
