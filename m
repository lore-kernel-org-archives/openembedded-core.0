Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D53F2779CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 15:13:34 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d79so25835725wmi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 08:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FD708juLZLWgRPQLf3so6Zv9X7WrWSI+fSy9ILGiMg0=;
	b=m4WkpSSETf39A2T5tAAKx7pGv9GaKNJVuTsNSKc9vCskNl8/o/WjovCaSyEDFsw8Ph
	Y/2nq8OJimILHPyNFFxnk3SQLVrNcY6tZshuEpeJKzrMSm44A0etTLVKLF9h7QECv9Uo
	ilfMZDJC/P+OlmD6+RSwLSm3IjW4U/gfPFXxe6oxuxZKdk7d/woXwbSs37gWDlX7NCh2
	BaiO/vnE1AyzTn9ko8x6VfOQ16y9AmCZAS0zjfL5O6Bg7de2Jrv3hgucDQHrJ/SToLBg
	EfBIbmgDa3PodkOt2MaTVfIMxwhqiNFH4fAwVmmAf/QKSZdOggkKbrO7YmxnHB9DIY/9
	Kcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FD708juLZLWgRPQLf3so6Zv9X7WrWSI+fSy9ILGiMg0=;
	b=g7b2Xl3bVBkn11/Z/W99nAYNowJDPSLXhMJM1wcr6vzSoNOLeoGrU8o36WLaql6IVF
	HtmYgLZ1mW/VkMI4J/kQbhFahdqOYBMDptLlV/h6qDRvhJHSG4RGWZJX6LScguRBCqrP
	sV1SjoxOnRlaI2HezkP8m2s42L14OyaddLthBZZ66YC7aeMIRVGt2SFb1SiQlpxA81as
	5OadyO7+smW6SEoON7SqTgjRWcE1V2PeVn5ljoIF3E6i3wc0mnUGN3a1XeJhqXFhceoN
	5MbF1ly2Q6+A7bJCODWnt60C6Jk4sRLRTqbOHyci5VLcWocCV+mD9jMrtSwil6VmmhbM
	jbZA==
X-Gm-Message-State: AN3rC/4YCcyaaqEM04/hCX1TJ8UoB5OvjtwUHQQCgcH6OLSJakK6jRiW
	2MDFgSogfTqM6bXB
X-Received: by 10.28.111.213 with SMTP id c82mr2305277wmi.11.1493133215547;
	Tue, 25 Apr 2017 08:13:35 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	92sm26570636wra.18.2017.04.25.08.13.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Apr 2017 08:13:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 25 Apr 2017 17:13:50 +0200
To: Marc Ferland <ferlandm@amotus.ca>
Message-ID: <20170425151350.GC28641@jama>
References: <1493131720-19456-1-git-send-email-ferlandm@amotus.ca>
	<1493131720-19456-5-git-send-email-ferlandm@amotus.ca>
MIME-Version: 1.0
In-Reply-To: <1493131720-19456-5-git-send-email-ferlandm@amotus.ca>
User-Agent: Mutt/1.8.2 (2017-04-18)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv4 4/7] bluez5: add PACKAGECONFIG option for systemd
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
X-List-Received-Date: Tue, 25 Apr 2017 15:13:35 -0000
X-Groupsio-MsgNum: 96673
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Content-Disposition: inline

--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2017 at 10:48:37AM -0400, Marc Ferland wrote:
> Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index 687656e..71a5016 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -12,11 +12,12 @@ RPROVIDES_${PN} +=3D "bluez-hcidump"
> =20
>  RCONFLICTS_${PN} =3D "bluez4"
> =20
> -PACKAGECONFIG ??=3D "obex-profiles readline"
> +PACKAGECONFIG ??=3D "obex-profiles readline ${@bb.utils.filter('DISTRO_F=
EATURES', 'systemd', d)}"
>  PACKAGECONFIG[obex-profiles] =3D "--enable-obex,--disable-obex,libical"
>  PACKAGECONFIG[readline] =3D "--enable-client,--disable-client,readline,"
>  PACKAGECONFIG[testing] =3D "--enable-testing,--disable-testing"
>  PACKAGECONFIG[midi] =3D "--enable-midi,--disable-midi,alsa-lib"
> +PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd"
> =20
>  SRC_URI =3D "\
>      ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
> @@ -36,7 +37,6 @@ EXTRA_OECONF =3D "\
>    --disable-cups \
>    --enable-test \
>    --enable-datafiles \
> -  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd',=
 '--disable-systemd', d)} \

Why not use just the options from PACKAGECONFIG?

>    --enable-library \
>  "
> =20
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWP9nrQAKCRA3VSO3ZXaA
HPwHAJ90i5lzWR7eikTscbPOKXxkdlk1mwCfebI9It+t+dCfWQuEuny8Ib9vbDU=
=I246
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--
