Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 879D57CECA;
	Sun,  9 Jun 2019 07:55:59 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id b17so6042891wrq.11;
	Sun, 09 Jun 2019 00:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Nrz8F+Y6arqdTtGyQZBnX4zewqO3ZexlXPyFlE3hk7Y=;
	b=PEidYXrfmNO4vxUsDhvee85+zdIW6RicVLkdpNZ9Cke8qUvwkY3t9iT2ZwN6Q2u9gK
	s9TbAQ+RZZEb/nmEoDznfOGH/qb1zoUJtMYSUII+nKRJ96JqUkDsg1ciwkhYLaYvTHXb
	ZxiBl1KaQIrNMEUfkejLJM3ZRGGyl3VPnJCFfONjovbtGMg5D4c7BCVd9Nbs/PZGJ3bF
	YCl+ruhNtdrkg3b/8Xv9Ea08fMyCbbiaakMNHxfKA0wg6McXkQK1JMfWZ10W/Qox78Fh
	FjScw1JUk3FNzzKSyV3Ax8WRueujg8qu3j+9jRKSrfp+1mLOatzfq6DSMYFd/OCJbqwK
	x0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Nrz8F+Y6arqdTtGyQZBnX4zewqO3ZexlXPyFlE3hk7Y=;
	b=dg535ao2rO1bPVW61US4aPXdXDVB/i7UzHubncXxNH9igGYEXsGCA9/l/zfB9IM2BP
	kFBOQ/3uOdrVS44UOPe0Yo/euJjHdcVuqHf6K9t/Qs5zkF0g8MlLmJqogQKkKZHct+fY
	65HeDp1b80TgfcJIBZzWcADAmxy3ocfFQ0g79DijHwNCk2DUijwWvMOKCs2cKk2tN+Od
	0kNxbUYxFIRGViql8sSnZcHGLAzFUpf06K9h0StbNqQDrbjQC23CYCBlwb5gMiZkLi2P
	y1cnKyeF2Ic3uS9yadrJODH7498S66XV4ltfU96SofS6bbhjQZeClObeeQKiGPiZw3dF
	Y99g==
X-Gm-Message-State: APjAAAUMPaR1AS6t/squ784izTl+rMeqfxGWGrZ/KLYPIKQ/86TO3kfK
	p58tXHzuTx7NzWNI6IemweQpOVJA
X-Google-Smtp-Source: APXvYqzQF7tRdTM58kGN8pricOs9YKo7JbkmOsjJzAd0lZ7xImlRzK+XG4khikqc7ErLGwgxwURJaw==
X-Received: by 2002:adf:c614:: with SMTP id n20mr27821973wrg.17.1560066959809; 
	Sun, 09 Jun 2019 00:55:59 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id h1sm6179191wrt.20.2019.06.09.00.55.58
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 09 Jun 2019 00:55:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 9 Jun 2019 09:56:00 +0200
To: openembedded-core@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190609075600.GA1487@jama>
References: <155991228929.29315.17511961768687888716@git.openembedded.org>
	<20190607125811.05DDB235A87@git.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20190607125811.05DDB235A87@git.openembedded.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 21/35: ptest: Add RDEPENDS frpm PN-ptest to PN package
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
X-List-Received-Date: Sun, 09 Jun 2019 07:55:59 -0000
X-Groupsio-MsgNum: 125547
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline

--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2019 at 12:58:30PM +0000, git@git.openembedded.org wrote:
> This is an automated email from the git hooks/post-receive script.
>=20
> rpurdie pushed a commit to branch warrior
> in repository openembedded-core.
>=20
> commit 1ad805984c8c9c9a505b6b0e8ad870b8233b13b2
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> AuthorDate: Tue May 14 12:22:14 2019 +0100
>=20
>     ptest: Add RDEPENDS frpm PN-ptest to PN package

Hi,

this in warrior is causing following do_rootfs error:

nothing provides dbus-test needed by dbus-test-ptest-1.12.12-r0

in images with dbus-test and ptest enabled.

you need to backport:
commit db4ef506b6b86e62a5ee1cbea8f12f97615dd0b8
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Tue May 14 17:28:08 2019 +0100

    dbus-test: Improve ptest dependencies dependencies

as well, to resolve this (will send it in separate e-mail).

>    =20
>     Many different ptests are breaking as they assume that ${PN}-ptest
>     depends on ${PN}. It doesn't currently but should. If we fix this, ma=
ny
>     different ptests start passing when they previously failed.
>    =20
>     It does depend on fixing an issue in the dbus-test recipe which is do=
ne
>     in the preceeding patch (mentioned in case this gets backported).
>    =20
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/classes/ptest.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
> index 936bf82..fa4c36e 100644
> --- a/meta/classes/ptest.bbclass
> +++ b/meta/classes/ptest.bbclass
> @@ -13,6 +13,7 @@ PTEST_ENABLED =3D "${@bb.utils.contains('DISTRO_FEATURE=
S', 'ptest', '1', '0', d)}"
>  PTEST_ENABLED_class-native =3D ""
>  PTEST_ENABLED_class-nativesdk =3D ""
>  PTEST_ENABLED_class-cross-canadian =3D ""
> +RDEPENDS_${PN}-ptest +=3D "${PN}"
>  RDEPENDS_${PN}-ptest_class-native =3D ""
>  RDEPENDS_${PN}-ptest_class-nativesdk =3D ""
>  RRECOMMENDS_${PN}-ptest +=3D "ptest-runner"
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXPy7jwAKCRA3VSO3ZXaA
HIp4AKCmw4PD8NULnQWvRo5/ElOmZx+tPQCeL6rvyv6j8OmruKdi+trn1CXyioA=
=iK8p
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
