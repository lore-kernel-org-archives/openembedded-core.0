Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 995FB7CCEC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 14:14:47 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y15so9119377wma.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 06:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=DEWQgEdaNq95rkbF7yuDimA/traA87sctE1z7zZuG1Y=;
	b=pEY4sFIKjMLw+2kGgBvajBiYY+WLsSO+M4hperf9B37cqg9nGFFSYigsvBujx8AMig
	P9SCgYEruZdzDgotmvp4x9rb5u6AP0af7crvM4HZaaRHfPgH+hEC2ZS+XTk/CuM/8Sew
	wNXdKI5rF6vawSKuCk/v056zq8vvm21yF7F359YcRBZmo5eee4fXF8b35SzbupZCaFGQ
	WYVjQBkQs3qgcTdr+VtAG7sPXeZUYE/YrOtDRSqyth9ilMdZB/Zvv+gvGg1UbX41C6/U
	p2vR8DU2x5BJzuLQGOHZuckSjuSusI77lo1XGfZV/Z0UkeydL8Gqp3RAJ6E8cF2knwm8
	oYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=DEWQgEdaNq95rkbF7yuDimA/traA87sctE1z7zZuG1Y=;
	b=sy9vQhNxXVvlNNeJ6E2x9LMYEafIPnOcPII6xsSutiMFuzFm+RAFZLoo6IiSEoMmCV
	faEgFW3rOVYGeCt4160RJhSbV2iue8g5loIlz8VERTXJkSJKGj9ToT+XqzNKt0iIsG80
	uj+t5cCr9oSs4DFdZH66xFKGUyjkc8pDa3WgYp0/jgeXMXuc6U1RJUFx0GbmF3c//5qL
	Bnk74MBem8u1AXYW1b+hNvkec0BazJia4DHQcR2EtRIKTh9bIxjcLzWqlarcedfACrJX
	wiZuI0/JIASgFjeu0aa6X1jLFZgLciFBpgk9Xrom7/vj00H/N4vcPb0gyMy4dLBN+jlB
	P52g==
X-Gm-Message-State: APjAAAVLlIQz80yVNah2Xy0pXMJzkr4X1RUF/WeEIWrxgKi7mpDAt1en
	abhFvD2opQZcy5cykR3BEAU=
X-Google-Smtp-Source: AHgI3Ib+lXGBQz5j0KP3z+/VIiFfXd/mpezEJQlu3W8Y6Y0isQ00lUBiO32F3pr1EE/eFpJUsWVJug==
X-Received: by 2002:a1c:6589:: with SMTP id z131mr3013641wmb.120.1551363288127;
	Thu, 28 Feb 2019 06:14:48 -0800 (PST)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	v10sm15734079wrn.26.2019.02.28.06.14.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Feb 2019 06:14:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 Feb 2019 15:14:47 +0100
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190228141447.GB1503@jama>
References: <20190228131510.43557-1-alex.kanavin@gmail.com>
	<20190228131510.43557-7-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190228131510.43557-7-alex.kanavin@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/8] runqemu: add an option to choose the SDL frontend instead of Gtk+ default
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
X-List-Received-Date: Thu, 28 Feb 2019 14:14:47 -0000
X-Groupsio-MsgNum: 121748
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline

--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 28, 2019 at 02:15:09PM +0100, Alexander Kanavin wrote:
> When Gtk+ and SDL are both enabled, qemu defaults to Gtk+.
> This option allows to revert to the 'classic' frontend.
>=20
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  scripts/runqemu | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/scripts/runqemu b/scripts/runqemu
> index ec6188ba4a2..bbf539a8e67 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -74,6 +74,7 @@ of the following environment variables (in any order):
>    MACHINE - the machine name (optional, autodetected from KERNEL filenam=
e if unspecified)
>    Simplified QEMU command-line options can be passed with:
>      nographic - disable video console
> +    sdl - choose the SDL frontend instead of the Gtk+ default
>      gl - enable virgl-based GL acceleration

can we call this gtk-gl

>      gl-es - enable virgl-based GL acceleration, using OpenGL ES

and gtk-gl-es

to make it easier to add sdl-gl?

>      egl-headless - enable headless EGL output; use vnc or spice to see it
> @@ -404,6 +405,8 @@ class BaseConfig(object):
>              elif arg =3D=3D 'nographic':
>                  self.qemu_opt_script +=3D ' -nographic'
>                  self.kernel_cmdline_script +=3D ' console=3DttyS0'
> +            elif arg =3D=3D 'sdl':
> +                self.qemu_opt_script +=3D ' -display sdl'
>              elif arg =3D=3D 'gl':
>                  self.qemu_opt_script +=3D ' -vga virtio -display gtk,gl=
=3Don'
>              elif arg =3D=3D 'gl-es':
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXHfs1gAKCRA3VSO3ZXaA
HPEPAJ9OO65C7mRzPO60C8EfBppc/oCtBACgl6sdiG/UvWYmI3viWOW41Db/moI=
=PgNA
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
