Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6F172820;
	Thu, 18 Dec 2014 12:56:19 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so1694525wid.11;
	Thu, 18 Dec 2014 04:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gOoh4kbcVoHUjQ2fwh8trWZnfaHuNxX86BpiEJhjyDE=;
	b=B8vV+MacnSTk0VLSNKF3PVkoCfNamltxbhkBELLo685Q1btbc+mOGh/a+X2wjJWwC2
	DB7m3JV5ESxEmz7mpQd/6LkgNyWzHnxHV5+Uvnvig7eHJbyyIwbBqoCpfuq9yTunDg/f
	sXvHcZtTsint7a6MEwJS1o8/zPwpOeS6DSNyZLMefSerdVcZVpdHSGCnVEzwRrMjfMFk
	qiUKgIh6/d+Cz4QPgwsABXKXMq/c5s1xvFp/XdfeSB13ZbxOq7QFN1bw4NabT2NRg96y
	s05bIzdYmAV5nwoQPuBGtNortNPuiO7yY0p13coklL21VKlfjWUbAnwnAo1PxoGdrTGT
	/QaQ==
X-Received: by 10.180.211.196 with SMTP id ne4mr23831123wic.71.1418907380135; 
	Thu, 18 Dec 2014 04:56:20 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h8sm9885761wiy.17.2014.12.18.04.56.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 04:56:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 18 Dec 2014 13:56:23 +0100
To: openembedded-core@lists.openembedded.org,
	Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20141218125623.GD2462@jama>
References: <20141120140839.39E515031C@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20141120140839.39E515031C@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : wpa-supplicant: upgrade to 2.3
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
X-List-Received-Date: Thu, 18 Dec 2014 12:56:26 -0000
X-Groupsio-MsgNum: 60613
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HWvPVVuAAfuRc6SZ"
Content-Disposition: inline

--HWvPVVuAAfuRc6SZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2014 at 02:08:39PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: f600e77bbdc1d6a0f29bf8bd775b79dc01bc0b4d
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Df600e77bbdc1d6a0f29bf8bd775b79dc01bc0b4d
>=20
> Author: Cristian Iorga <cristian.iorga@intel.com>
> Date:   Tue Nov 11 10:46:22 2014 +0200
>=20
> wpa-supplicant: upgrade to 2.3
>=20
> - P2P WiFi improvements;
> - Bug fixes.
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  .../recipes-connectivity/wpa-supplicant/wpa-supplicant.inc |  4 ++--
>  .../wpa-supplicant/fix-libnl3-host-contamination.patch     | 14 +++++++-=
------
>  .../{wpa-supplicant_2.2.bb =3D> wpa-supplicant_2.3.bb}       |  0
>  3 files changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc =
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
> index 3abcf86..2bc9339 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
> @@ -26,8 +26,8 @@ SRC_URI =3D "http://hostap.epitest.fi/releases/wpa_supp=
licant-${PV}.tar.gz \
>             file://99_wpa_supplicant \
>             file://fix-libnl3-host-contamination.patch \
>            "
> -SRC_URI[md5sum] =3D "238e8e888bbd558e1a57e3eb28d1dd07"
> -SRC_URI[sha256sum] =3D "e0d8b8fd68a659636eaba246bb2caacbf53d22d53b2b6b90=
eb4b4fef0993c8ed"
> +SRC_URI[md5sum] =3D "f2ed8fef72cf63d8d446a2d0a6da630a"
> +SRC_URI[sha256sum] =3D "eaaa5bf3055270e521b2dff64f2d203ec8040f71958b8588=
269a82c00c9d7b6a"

Why do we have version specific checksums in generic .inc file?

>  S =3D "${WORKDIR}/wpa_supplicant-${PV}"
> =20
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/fix-=
libnl3-host-contamination.patch b/meta/recipes-connectivity/wpa-supplicant/=
wpa-supplicant/fix-libnl3-host-contamination.patch
> index eb8036f..e899c16 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/fix-libnl3-=
host-contamination.patch
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/fix-libnl3-=
host-contamination.patch
> @@ -15,15 +15,15 @@ diff --git a/src/drivers/drivers.mak b/src/drivers/dr=
ivers.mak
>  index 68ff910..1f38f57 100644
>  --- a/src/drivers/drivers.mak
>  +++ b/src/drivers/drivers.mak
> -@@ -30,7 +30,7 @@ NEED_RFKILL=3Dy
> +@@ -35,7 +35,7 @@ NEED_RFKILL=3Dy
>   ifdef CONFIG_LIBNL32
>     DRV_LIBS +=3D -lnl-3
>     DRV_LIBS +=3D -lnl-genl-3
>  -  DRV_CFLAGS +=3D -DCONFIG_LIBNL20 -I/usr/include/libnl3
>  +  DRV_CFLAGS +=3D -DCONFIG_LIBNL20
> - else
> -   ifdef CONFIG_LIBNL_TINY
> -     DRV_LIBS +=3D -lnl-tiny
> + ifdef CONFIG_LIBNL3_ROUTE
> +   DRV_LIBS +=3D -lnl-route-3
> +   DRV_CFLAGS +=3D -DCONFIG_LIBNL3_ROUTE
>  diff --git a/src/drivers/drivers.mk b/src/drivers/drivers.mk
>  index db8561a..c93e88d 100644
>  --- a/src/drivers/drivers.mk
> @@ -34,9 +34,9 @@ index db8561a..c93e88d 100644
>     DRV_LIBS +=3D -lnl-genl-3
>  -  DRV_CFLAGS +=3D -DCONFIG_LIBNL20 -I/usr/include/libnl3
>  +  DRV_CFLAGS +=3D -DCONFIG_LIBNL20
> - else
> -   ifdef CONFIG_LIBNL_TINY
> -     DRV_LIBS +=3D -lnl-tiny
> + ifdef CONFIG_LIBNL3_ROUTE
> +   DRV_LIBS +=3D -lnl-route-3
> +   DRV_CFLAGS +=3D -DCONFIG_LIBNL3_ROUTE
>  --=20
>  1.7.10.4
> =20
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.2.=
bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.3.bb
> similarity index 100%
> rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.2.bb
> rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.3.bb
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HWvPVVuAAfuRc6SZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSSzvcACgkQN1Ujt2V2gBzMZwCfb+q3qKa65WsfQWhYjzhPRAEw
JqEAoKla+3mhFQFneG8NcYe7f3g0N/Gf
=B7yk
-----END PGP SIGNATURE-----

--HWvPVVuAAfuRc6SZ--
