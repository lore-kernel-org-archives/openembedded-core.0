Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id B55916AC33;
	Mon, 23 Mar 2015 16:43:22 +0000 (UTC)
Received: by wegp1 with SMTP id p1so142600669weg.1;
	Mon, 23 Mar 2015 09:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nZSJWIAaZISTzlIeDs99Fyl9YzYtWCeC7GoLzzREuDw=;
	b=FDdNUBYIc6WvEBE+EW+35JWoCdjREbSVm6hJ7E9xFQBzz7xuFDbkM6Yk7BsjvM9vgR
	Asa3Q8HtPPNoV2FWE95X2eFx9sz0oUutywFY4M+oWQ7JHEoH0f0tusgxuLAetdbjFsiP
	SmeSz7eYelCh9RV7HWfXJmvqJcbqloEiNQ/AI01ZNT0Llow7C/ZARSczZP7m4dj5J7MW
	dMY791Fi+j0F/gA/7+VEY7+DOxOjZM22HNRtH6BXIg5gbJ0p6zn4AJ8lQ0jsygf8JSg/
	kYKZaj7D4+xaQxgd9aLfY8T/HacYdtN1cLdx8Uj4ZqfU2BX8UmoZz6J9qAl95diHcgob
	jexA==
X-Received: by 10.180.75.103 with SMTP id b7mr8955652wiw.32.1427129003083;
	Mon, 23 Mar 2015 09:43:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dn7sm11977488wid.12.2015.03.23.09.43.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Mar 2015 09:43:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 23 Mar 2015 17:43:35 +0100
To: openembedded-core@lists.openembedded.org, Jonathan Liu <net147@gmail.com>
Message-ID: <20150323164335.GB3904@jama>
References: <20150323112736.11E9B50553@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150323112736.11E9B50553@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Jonathan Liu : systemd: fix firmware path to match linux-firmware
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
X-List-Received-Date: Mon, 23 Mar 2015 16:43:26 -0000
X-Groupsio-MsgNum: 63613
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline

--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2015 at 11:27:36AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: d3fcfe346b3472170641d9194243c4bbe06b8585
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dd3fcfe346b3472170641d9194243c4bbe06b8585
>=20
> Author: Jonathan Liu <net147@gmail.com>
> Date:   Mon Mar 23 22:18:46 2015 +1100
>=20
> systemd: fix firmware path to match linux-firmware
>=20
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-core/systemd/systemd_219.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core=
/systemd/systemd_219.bb
> index 5ecdda9..f2d3c13 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -112,7 +112,7 @@ EXTRA_OECONF =3D " --with-rootprefix=3D${rootprefix} \
>                   --enable-split-usr \
>                   --without-python \
>                   --with-sysvrcnd-path=3D${sysconfdir} \
> -                 --with-firmware-path=3D${rootlibdir}/firmware \
> +                 --with-firmware-path=3D/lib/firmware \

Is this false-possitive from QA check or is this change really ignored
by systemd build?

NOTE: recipe systemd-1_219+gitAUTOINC+a88abde721-r0: task do_configure: Sta=
rted
WARNING: QA Issue: systemd: configure was passed unrecognised options: --wi=
th-firmware-path [unknown-configure-option]
NOTE: recipe systemd-1_219+gitAUTOINC+a88abde721-r0: task do_configure: Suc=
ceeded

>                 "
>  # uclibc does not have NSS
>  EXTRA_OECONF_append_libc-uclibc =3D " --disable-myhostname "
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUQQrcACgkQN1Ujt2V2gBy3sQCglFPQytUgX0QujPgRF544Zxbo
M+0An2Re7T5IDmxRNXVlR41etcOBIfxI
=Gjhm
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
