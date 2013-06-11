Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 90D0E6AA19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 15:36:19 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b15so5210716eae.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IIbVh6PtD/BTgd5aV/DV0DIpD0ylKpKTT3aY64PMxUw=;
	b=K6D5QBUV9gpsDTcuZgXyfJBsGzEmrQ5w3FVfSmGs0H2ZeAeo/QHi5MOTM37oFZnWbk
	ez+R468AStL+UJQMvmnbTnL4Y8h6aBX+SH/qTavxoA6XZ6EwP3xDzswTV4RES5di5qFa
	I+DA5qp/JW6r2YX2t1O8ZMqIBfaLLm31WL6IHMNFgu7C1gwR6o3QeXeqAiJB3IQRKwf6
	R8bEE/3Xbu4juHKh8gde36HNCy7pS51WmN2LXUlb8QrXmY+PGHgtXI2dZKDpKmnTv/SW
	Rr4zeWmKsD8P/yaUD9DUii1zDZsh7MFhjsCP3wxPadBEpW5CABK7FuoiA8YuU3kuRaA9
	ahWg==
X-Received: by 10.15.90.139 with SMTP id q11mr17098171eez.137.1370964979978;
	Tue, 11 Jun 2013 08:36:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f9sm13036881eev.9.2013.06.11.08.36.18 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 08:36:19 -0700 (PDT)
Date: Tue, 11 Jun 2013 17:36:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130611153643.GG3233@jama>
References: <1370009480-32681-1-git-send-email-marcin@juszkiewicz.com.pl>
	<E947360C-AE06-42E4-AD51-2DA926D1448D@gmail.com>
	<1370963003.27750.80.camel@phil-desktop.brightsign>
	<CAMKF1srGhvZLyhEZbYbFepZADbAKF1kJM2ObBEjc8OevQ5CCqQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srGhvZLyhEZbYbFepZADbAKF1kJM2ObBEjc8OevQ5CCqQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] get minimal rootfs to be even smaller
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
X-List-Received-Date: Tue, 11 Jun 2013 15:36:19 -0000
X-Groupsio-MsgNum: 40483
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XaUbO9McV5wPQijU"
Content-Disposition: inline

--XaUbO9McV5wPQijU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2013 at 08:22:27AM -0700, Khem Raj wrote:
> On Tue, Jun 11, 2013 at 8:03 AM, Phil Blundell <pb@pbcl.net> wrote:
> > Er, don't RRECOMMENDS always go into the build dependency list?
>=20
> if they do then whats the difference between DEPENDS and RRECOMMENDS
> functionally.

RDEPENDS and RRECOMMENDS right?

> since now rrecommended packages will always be available and they will
> always make into images.

just the possibility to "blacklist" them with BAD_RECOMMENDATIONS.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XaUbO9McV5wPQijU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlG3RAsACgkQN1Ujt2V2gBwpGwCeLRcagOwtH2GTUsC6nNceN8NU
wIsAnRxF1G92WnUspHTBjmD3PXRiFOPW
=Ny24
-----END PGP SIGNATURE-----

--XaUbO9McV5wPQijU--
