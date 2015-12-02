Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id C866765D00
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 21:18:42 +0000 (UTC)
Received: by wmww144 with SMTP id w144so232502456wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 13:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GzMNFNMPgahrwIquEKr1KtYWD3sNXfWB7rc/RiHv9hM=;
	b=X3wszMqP/sDfNtdmeEbKqlr4nozgfaCruXOT23sspI8tx9oBj2H1BUdafoBL0tij73
	cKj/yCXpKVeOKDnmGN52lIF6ozTeNdrnK1kUoG7YN+VBom7XoVPGR4ATitU+Lc4uB+/1
	Fb+Qkguqt2oHbrXkzDJcawWHuh5N9kJ2nN4YSNGTE6TJFCnF9zR3LPrFSTGA+tTc5M2d
	78R6mMrM7VBwf6GF6PJwJj4VA+A8icnzZPUz2ud+it48kc6V8tbCBetrSXPB8xoCWpCf
	i1hDtMFjZpBXsKZwdg7dd+hSR7Loc0fX2AHPNPVqCH48pBr1+tXcQzbu+LTW4t1fS2UX
	UEtw==
X-Received: by 10.194.110.5 with SMTP id hw5mr8216121wjb.154.1449091123022;
	Wed, 02 Dec 2015 13:18:43 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v196sm4911128wmv.10.2015.12.02.13.18.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Dec 2015 13:18:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Dec 2015 22:19:46 +0100
To: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <20151202211946.GE2248@jama>
References: <cover.1449054142.git.joshua.lock@collabora.co.uk>
	<b6d0cb53694261e395f44e8948cc94599ff80559.1449054142.git.joshua.lock@collabora.co.uk>
MIME-Version: 1.0
In-Reply-To: <b6d0cb53694261e395f44e8948cc94599ff80559.1449054142.git.joshua.lock@collabora.co.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] connman-conf: mark as allarch and not requiring default deps
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
X-List-Received-Date: Wed, 02 Dec 2015 21:18:43 -0000
X-Groupsio-MsgNum: 74275
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w/VI3ydZO+RcZ3Ux"
Content-Disposition: inline

--w/VI3ydZO+RcZ3Ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2015 at 11:03:53AM +0000, Joshua Lock wrote:
> This recipe just installs some data files and thus is architecture
> independent and doesn't require a compiler and libc in its DEPENDS.

allarch.bbclass already sets INHIBIT_DEFAULT_DEPS

> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> ---
>  meta/recipes-connectivity/connman/connman-conf.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/rec=
ipes-connectivity/connman/connman-conf.bb
> index bef9237..1e119ad 100644
> --- a/meta/recipes-connectivity/connman/connman-conf.bb
> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
> @@ -4,7 +4,9 @@ network interface for a qemu machine."
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-=
2.0;md5=3D801f80980d171dd6425610833a22dbe6"
> =20
> -inherit systemd
> +inherit systemd allarch
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> =20
>  SRC_URI_append_qemuall =3D " file://wired.config \
>                             file://wired-setup \
> --=20
> 2.4.3
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w/VI3ydZO+RcZ3Ux
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZfYHAACgkQN1Ujt2V2gBzx9wCfbE4pFt6irWElt8HktIodZheA
qpIAoKwh465abSIcNJ2uFd5r7rF9tFFT
=Lc5P
-----END PGP SIGNATURE-----

--w/VI3ydZO+RcZ3Ux--
