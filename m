Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9886011F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 21:09:18 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l65so112733205wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 13:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1mYqLhV11ZNKHuY90c4DIvG272SIbS21x4cw33b9y14=;
	b=dyMXel8I7orTlYH8fW6YkIaMYi2dycN1jwoVAn+IPB4/VoHk2TI3T3kidI6LiXHPyV
	Kd00Zrrf2JlXMm7m87nDpQlx62Txaa3UIkwOQtTOUBRqb7PbjOP6I2vvJkJSw1euxMYt
	40N0V1tfK0y/VXLHli/lnasyALcEKzTUDFDJ1yselPGBcNqD6y6AEY2KXmTLwjTJ0MIf
	x/vIrYAj59Arj1y7h+k1a6L/vgOcdaCXG3b5p0kSgIi4YA2cLs/WD2KTKuuT+VXps1ml
	p07F210D3YQVbD/P0Y6zGGoUJ2QSR2a2+m2VBNjZ+zwPMhehg/QGLyVFPFu0RhiY1AG5
	ErCw==
X-Received: by 10.28.88.210 with SMTP id m201mr19645740wmb.76.1452200958908;
	Thu, 07 Jan 2016 13:09:18 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	n129sm15318252wmb.1.2016.01.07.13.09.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 13:09:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 7 Jan 2016 22:09:43 +0100
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20160107210943.GH2512@jama>
References: <1452199993-3885-1-git-send-email-armccurdy@gmail.com>
	<1452199993-3885-2-git-send-email-armccurdy@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1452199993-3885-2-git-send-email-armccurdy@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] qemu.bbclass: duplicate armv7a over-ride for armv7ve
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
X-List-Received-Date: Thu, 07 Jan 2016 21:09:19 -0000
X-Groupsio-MsgNum: 75595
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GBDnBH7+ZvLx8QD4"
Content-Disposition: inline

--GBDnBH7+ZvLx8QD4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2016 at 12:53:10PM -0800, Andre McCurdy wrote:
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/classes/qemu.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> index 315c17f..4ec7657 100644
> --- a/meta/classes/qemu.bbclass
> +++ b/meta/classes/qemu.bbclass
> @@ -43,6 +43,7 @@ QEMU_OPTIONS[vardeps] +=3D "QEMU_EXTRAOPTIONS_${PACKAGE=
_ARCH}"
>  QEMU_EXTRAOPTIONS_iwmmxt    =3D " -cpu pxa270-c5"
>  QEMU_EXTRAOPTIONS_armv6     =3D " -cpu arm1136"
>  QEMU_EXTRAOPTIONS_armv7a    =3D " -cpu cortex-a8"
> +QEMU_EXTRAOPTIONS_armv7ve   =3D " -cpu cortex-a8"

would it make sense to use cortex-a15 here? It's supported at least in qemu=
-2.5.0

>  QEMU_EXTRAOPTIONS_ppce500v2 =3D " -cpu e500v2"
>  QEMU_EXTRAOPTIONS_ppce500mc =3D " -cpu e500mc"
>  QEMU_EXTRAOPTIONS_ppce5500 =3D " -cpu e5500"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GBDnBH7+ZvLx8QD4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaO1BYACgkQN1Ujt2V2gBwiCQCgtGXfBlhxY81ZBH0gR0wBqBe2
g6EAn2lb2axuapC9yABwQ6w6oCz+SCGi
=ZVUi
-----END PGP SIGNATURE-----

--GBDnBH7+ZvLx8QD4--
