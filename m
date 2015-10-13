Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5F83A73CBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 15:19:39 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so62997680wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 08:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iZ9PtIhTQXqR2BimwLtuNikPGL/nFHU6ShsCqls+6XY=;
	b=K21jojJE2ZsWFAUhxTEbHJs6n3+PLEsUZeNPPOZjl7jHvwTXe/H4tIbc9Wae15WRlr
	swL1usAqSqxcFa0//p/DKaoWOxK0xUj4X0lLc98GL2sZYBtnHYAbUxpBuTorYaE3E70i
	cvAUKMNuojN5IAaV9/EGDTToFqW7JONLzUGtCTW7eYylJP3HBltJrsbi6Qm2NtgLJS1g
	coV4hAzvMlF5JwecE56WTJtiCNCFUneybYHAn7hwfbF/c1dtt+FcNWvpd/Un1e3DzSJH
	lPgTXsFf06QjoJguhtKLgjpIevnQCpDoPX6hKnpNU4tz2ROJjcY/oknAfu+WHV/RYgIM
	V1Tw==
X-Received: by 10.194.48.102 with SMTP id k6mr42676173wjn.124.1444749562035;
	Tue, 13 Oct 2015 08:19:22 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r4sm15419877wia.19.2015.10.13.08.19.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 08:19:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 Oct 2015 17:19:25 +0200
To: Matt Porter <mporter@konsulko.com>
Message-ID: <20151013151925.GG2396@jama>
References: <1444749211-30044-1-git-send-email-mporter@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <1444749211-30044-1-git-send-email-mporter@konsulko.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Tom Rini <trini@konsulko.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libsdl: enable fbcon video when fbdev distro feature is present
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
X-List-Received-Date: Tue, 13 Oct 2015 15:19:41 -0000
X-Groupsio-MsgNum: 72115
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="APlYHCtpeOhspHkB"
Content-Disposition: inline

--APlYHCtpeOhspHkB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2015 at 11:13:31AM -0400, Matt Porter wrote:
> The fbcon video backend is always disabled. Use the fbdev distro
> feature flag to enable/disable the fbcon video backend.
>=20
> Signed-off-by: Matt Porter <mporter@konsulko.com>
> Reviewed-by: Tom Rini <trini@konsulko.com>
> ---
>  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes=
-graphics/libsdl/libsdl_1.2.15.bb
> index c0d5c6a..c604c6a 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> @@ -13,6 +13,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D27818cd7fd83=
877a8e3ef82b82798ef4"
>  PROVIDES =3D "virtual/libsdl"

Can we please use PACKAGECONFIG here?

>  DEPENDS =3D "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'direct=
fb', '', d)} \
> +	   ${@bb.utils.contains('DISTRO_FEATURES', 'fbdev', 'fbdev', '', d)} \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/li=
bgl', '', d)} \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx1=
1 libxext libxrandr libxrender', '', d)} \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'libglu=
', '', d)} \
> @@ -40,10 +41,11 @@ EXTRA_OECONF =3D "--disable-static --enable-cdrom --e=
nable-threads --enable-timers
>                  --enable-file --disable-oss --disable-esd --disable-arts=
 \
>                  --disable-diskaudio --disable-nas --disable-esd-shared -=
-disable-esdtest \
>                  --disable-mintaudio --disable-nasm --disable-video-dga \
> -                --disable-video-fbcon --disable-video-ps2gs --disable-vi=
deo-ps3 \
> +                --disable-video-ps2gs --disable-video-ps3 \
>                  --disable-xbios --disable-gem --disable-video-dummy \
>                  --enable-input-events --enable-input-tslib --enable-pthr=
eads \
>                  ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', '--e=
nable-video-directfb', '--disable-video-directfb', d)} \
> +		${@bb.utils.contains('DISTRO_FEATURES', 'fbdev', '--enable-video-fbcon=
', '--disable-video-fbcon', d)} \
>                  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--ena=
ble-video-opengl', '--disable-video-opengl', d)} \
>                  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--enable=
-video-x11', '--disable-video-x11', d)} \
>                  --disable-video-svga \
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--APlYHCtpeOhspHkB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYdIP0ACgkQN1Ujt2V2gBwJ9wCgq5G0LCkZPxXRJUH18UFxcydZ
qvEAnjWC4LsaYAtxpaxmmTLEK1nMKAgt
=wt/I
-----END PGP SIGNATURE-----

--APlYHCtpeOhspHkB--
