Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id CABDA6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 09:28:28 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id v187so23256578wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 01:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=soJNGMuQ9IWVMJWlh3qBwHduJ3YKb+T4uuwoRC3G9+k=;
	b=W7ZED/bsHlJ0g4g4EQwU8Ohrpi3x0SzNRcBZAk/gYIRYsbcYZs2g9sIVeLs3DsJQFN
	cJz7u19Z5PFgE1nqzqcVkBlu4B8OJ8SaJZIJh+y2H5ytIj8fE2pzPHia0GdwlZDJjqa5
	SWlkDvnaz5BjKWTc1wso/l9Hl2Rrm1JnDw19fjGfAV6rtoCOk/UgSpgYmCxFcwY1lkrk
	Z94zw0Gf4vFZLog9jlMI++71AoPY6JUKLO09EMuBPaxcY9QaNerSztj5hSo6Lb8/7rJJ
	1c0HFD/vxy/XOohWaVT1ZJJ73+kGnWj4BXBG0lywyZdwxTugVHkAMsz4WUjIqYF7wOpH
	9Y/A==
X-Received: by 10.28.194.7 with SMTP id s7mr34279434wmf.29.1449739708841;
	Thu, 10 Dec 2015 01:28:28 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	an7sm11473619wjc.44.2015.12.10.01.28.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 01:28:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Dec 2015 10:30:12 +0100
To: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <20151210093012.GG2246@jama>
References: <cover.1449737824.git.joshua.lock@collabora.co.uk>
	<accfe2aa0774602538c6a37d3ceb442547576fa5.1449737824.git.joshua.lock@collabora.co.uk>
MIME-Version: 1.0
In-Reply-To: <accfe2aa0774602538c6a37d3ceb442547576fa5.1449737824.git.joshua.lock@collabora.co.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 3/3] connman-conf: convert to an allarch package
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
X-List-Received-Date: Thu, 10 Dec 2015 09:28:29 -0000
X-Groupsio-MsgNum: 74556
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZFKeWUZP29EKQNE"
Content-Disposition: inline

--LZFKeWUZP29EKQNE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2015 at 09:01:43AM +0000, Joshua Lock wrote:
> This recipe just installs some data files and a script and isn't machine =
or
> architecture specific. Even though it was designed to be used only for qe=
mu
> machines there's no reason it can't be used elsewhere.

Sorry if I wasn't clear before.

I think it was better as machine specific.

We're using it in our layers to provide static configuration for connman
and that's often MACHINE specific (even the qemu config sets MAC which
you probably don't want to use the same across all MACHINEs built with
OE).

That's the reason why this recipe is in SIGGEN_EXCLUDERECIPES_ABISAFE.

This change also sets this static configuration for all builds, is
current wired.config really suitable for all devices? I don't think so.

> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> ---
>  meta/recipes-connectivity/connman/connman-conf.bb              | 10 ++++=
------
>  .../connman-conf/{qemuall =3D> }/wired-connection.service        |  0
>  .../connman/connman-conf/{qemuall =3D> }/wired-setup             |  0
>  .../connman/connman-conf/{qemuall =3D> }/wired.config            |  0
>  4 files changed, 4 insertions(+), 6 deletions(-)
>  rename meta/recipes-connectivity/connman/connman-conf/{qemuall =3D> }/wi=
red-connection.service (100%)
>  rename meta/recipes-connectivity/connman/connman-conf/{qemuall =3D> }/wi=
red-setup (100%)
>  rename meta/recipes-connectivity/connman/connman-conf/{qemuall =3D> }/wi=
red.config (100%)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/rec=
ipes-connectivity/connman/connman-conf.bb
> index bef9237..a8fdb8c 100644
> --- a/meta/recipes-connectivity/connman/connman-conf.bb
> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
> @@ -4,18 +4,16 @@ network interface for a qemu machine."
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-=
2.0;md5=3D801f80980d171dd6425610833a22dbe6"
> =20
> -inherit systemd
> +inherit systemd allarch
> =20
> -SRC_URI_append_qemuall =3D " file://wired.config \
> -                           file://wired-setup \
> -                           file://wired-connection.service \
> +SRC_URI =3D "file://wired.config \
> +           file://wired-setup \
> +           file://wired-connection.service \
>  "
>  PR =3D "r2"
> =20
>  S =3D "${WORKDIR}"
> =20
> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> -
>  FILES_${PN} =3D "${localstatedir}/* ${datadir}/*"
> =20
>  do_install() {
> diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired=
-connection.service b/meta/recipes-connectivity/connman/connman-conf/wired-=
connection.service
> similarity index 100%
> rename from meta/recipes-connectivity/connman/connman-conf/qemuall/wired-=
connection.service
> rename to meta/recipes-connectivity/connman/connman-conf/wired-connection=
=2Eservice
> diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired=
-setup b/meta/recipes-connectivity/connman/connman-conf/wired-setup
> similarity index 100%
> rename from meta/recipes-connectivity/connman/connman-conf/qemuall/wired-=
setup
> rename to meta/recipes-connectivity/connman/connman-conf/wired-setup
> diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired=
=2Econfig b/meta/recipes-connectivity/connman/connman-conf/wired.config
> similarity index 100%
> rename from meta/recipes-connectivity/connman/connman-conf/qemuall/wired.=
config
> rename to meta/recipes-connectivity/connman/connman-conf/wired.config
> --=20
> 2.5.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LZFKeWUZP29EKQNE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZpRiMACgkQN1Ujt2V2gByCLwCggzeTu2QtmuUgafz0PWfbfnao
VyUAoI1DkNum+Vad8ho90ySx8nBH7zcn
=LivX
-----END PGP SIGNATURE-----

--LZFKeWUZP29EKQNE--
