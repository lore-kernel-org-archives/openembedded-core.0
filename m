Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id BF26E7803F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 10:12:01 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k67so31017998wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 03:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=42a0Gej3fTY9AOS2TDlmqOd2D4HiLGWj/TpnH6OoDZI=;
	b=rWHmOiRLbJJGREEhGlvdm87uZpYeIjkmiV1vsFJzbQa5lwc/eP+uVsR58SjOFLRG1Z
	HsAb7lYU14RU1Vd7OukwYPrcKkbgD1isfW2NMlfVigUHPIz+O8odfRLXSXMeIYEfplaO
	UPAdukn0wcr3ACBFhdTcJGvO6eua/DbtVbXI/B2i5Ar2mY3D7+7BAVrv6LcZPFqX8dmY
	aAN+M0BQ8BuQu3o7RwdpAPmqGavB2oiISWuW5qRaBoYHLA7ib089f0/t6ILoBoqFX8Fc
	cPY05OQ9H/RjShVpQsunclgBSz6xZ4wrCNjG9dqayeA6oNXUbNEUdI1wHro/OkgMkQQi
	pc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=42a0Gej3fTY9AOS2TDlmqOd2D4HiLGWj/TpnH6OoDZI=;
	b=UJJVt5+FRruU33m9fdXCHjGNFvXXAsrVghLaiq5hC8c2gRvHcOc8D7I6zlwIHOev7/
	/KHhm/G3pCw+cfgxzBZzFOYijhI7z9aMY1KN4Kq74LP71xcOUj42V/j2KIGqd4Lsy2Tx
	QbcGmUxa1jgNmW5E4UjOAqK/FcPPMdHP8f+WJFCTp998pU9HMa+FOUK37t54NTKtusdI
	1F+0gVQyrYwRkOYmELlQ1Ss7KN/iQuVzZDmBfoR6qMhK3PLwtqMA4GkZ8na1ZivV3mqB
	BHxriLIfZ7GkvxNW9D3+ztT3VfEKlTQ5RGHANoeAxilxS65A0lEP56SwvcRlGMRjvpWj
	nySw==
X-Gm-Message-State: AIVw112/ab9D5UrhZ/sNHHDVkjvxtl+jnYC2RS/2huDBNo33ub3slWH/
	33aBqIFm3dTLfw==
X-Received: by 10.28.45.197 with SMTP id t188mr9847090wmt.78.1499767923157;
	Tue, 11 Jul 2017 03:12:03 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	n31sm16468170wrn.59.2017.07.11.03.12.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Jul 2017 03:12:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 11 Jul 2017 12:12:41 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170711101241.GB3263@jama>
References: <20170709073537.16106-1-soren.brinkmann@xilinx.com>
	<CAJTo0Lb6wS0cYqDmg87_sXh3+SV4mR+kmMA26XUKtscZ4B36GQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb6wS0cYqDmg87_sXh3+SV4mR+kmMA26XUKtscZ4B36GQ@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] valgrind: Update 3.12.0 -> 3.13.0
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
X-List-Received-Date: Tue, 11 Jul 2017 10:12:03 -0000
X-Groupsio-MsgNum: 99968
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline

--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2017 at 09:43:24AM +0100, Burton, Ross wrote:
> On 9 July 2017 at 08:35, Soren Brinkmann <soren.brinkmann@xilinx.com> wro=
te:
>=20
> > Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> > ---
> > v3:
> >  - rebased onto latest master branch
> > v2:
> >  - no change
> >
>=20
> Fails to build on PPC if ptest is enabled:
> http://errors.yoctoproject.org/Errors/Details/147237/

ptest was broken for all architectures even before 3.13.0 upgrade, wasn't i=
t?

http://lists.openembedded.org/pipermail/openembedded-core/2017-July/139357.=
html

http://www.openembedded.org/wiki/Bitbake_World_Status_Rocko shows it's brok=
en since 2017-06-16

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWWSkmQAKCRA3VSO3ZXaA
HDMaAJ0TwkrEOLXBJ9QWqN44s/Q6m/m6nwCgh0Pn8H9hF/e6W0W9QAqwGT3aoP0=
=rhI1
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--
