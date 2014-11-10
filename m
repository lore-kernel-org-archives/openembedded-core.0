Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4283665D3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 23:20:18 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id r20so228104wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 15:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wgImVA7QczN0OH8m8Xwzfm96rHB4iilVTC/q9BjcjbE=;
	b=qn9ui1nR9vA3RlXi1T+mhCw5jxXtWFwHo77kFexS00rNUrv+i1OePcwjbqfrBlhHD3
	+GoCtP5sr71xINHh2N/qsm832IpMwLxEgTT/rq9u0r1jBHnosa9yZ/Om//TTIvM/7yAn
	GKzk2DvQcPHICfCOSyDj7FFZDpX4MU3GzYwlN0JnDCnQpk/t0Ci/gyevZcq+0daYcR96
	/9wJjlsTwlBXDVuh1a4Kdup70wKw6q40/THu0hS4scKTX9Tn4nQkxk5uOVxZBP/+Qy47
	56lPwT3CARbQV1r50PV1022pXv367D/TZgLRICU9Q1SZm6QQc+29Tz2Q7Xss3M04rprM
	9WpA==
X-Received: by 10.180.104.2 with SMTP id ga2mr35370794wib.64.1415661619030;
	Mon, 10 Nov 2014 15:20:19 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hh14sm15176556wib.13.2014.11.10.15.20.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Nov 2014 15:20:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 11 Nov 2014 00:20:28 +0100
To: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <20141110232028.GE2440@jama>
References: <cover.1415647839.git.pab@pabigot.com>
	<18b73e0cfd55891ca28f46e17ce4af9ca1535245.1415647839.git.pab@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <18b73e0cfd55891ca28f46e17ce4af9ca1535245.1415647839.git.pab@pabigot.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 06/14] pulseaudio: switch to virtual/bluez
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
X-List-Received-Date: Mon, 10 Nov 2014 23:20:19 -0000
X-Groupsio-MsgNum: 59504
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V4b9U9vrdWczvw78"
Content-Disposition: inline

--V4b9U9vrdWczvw78
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2014 at 03:13:03PM -0600, Peter A. Bigot wrote:
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
> index db144a9..f06b15c 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -31,7 +31,7 @@ EXTRA_OECONF =3D "\
>                  ac_cv_header_valgrind_memcheck_h=3Dno \
>  "
> =20
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, 'bluez4', '', d)} \
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, 'virtual/bluez', '', d)} \

This has to be wrong.

>                     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 's=
ystemd', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '=
avahi', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11',=
 '', d)}"
> --=20
> 1.8.5.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V4b9U9vrdWczvw78
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRhSDwACgkQN1Ujt2V2gBy8xACfdXlPeM3EpPaTcL6gakAK9nwo
ebAAniLKXVgZ1l0mhR1rkJd4m0kckBTf
=a8tH
-----END PGP SIGNATURE-----

--V4b9U9vrdWczvw78--
