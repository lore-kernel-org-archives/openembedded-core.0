Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 104A865CC1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 17:28:51 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so7918296wiv.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 10:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Jp0biBsrvo7gYs1ObDlYc5zSWXsNWieE8AWeKKVO814=;
	b=uXYO6vVghmJVfVZv8ClnLwSa+9qdpJxdHen77xLUh5vG0GtA/Cm2jZJJxchBIEfmWy
	NF90p5aUcMyNot3IKyVTSqe57I17BZ0Iw0prJdWkeTmnrzjQDY8AJ44pC7acpr1KiOkc
	F47lzaj5CX9TMo0ox8b5LAjOysmo8nkAQ2rc5xrm3+TbuTfEbj/LdLGm1Uadw+gOSeAn
	VQH6cvuJkHvDdiRFME9SQ7SI8uwRR5D6aZSLdiatx9SAX5ZOqr/mUDnfUZNkTwoa/HmQ
	zJMpLBGZ9/d6HH08TwRtPOSBjRMGJiG1cfkAZFPElKlyQ3FHdAXPcA4iNNcuw3OLCD35
	RSSA==
X-Received: by 10.194.59.65 with SMTP id x1mr8253840wjq.60.1406741332288;
	Wed, 30 Jul 2014 10:28:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fs17sm6989166wjc.6.2014.07.30.10.28.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jul 2014 10:28:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Jul 2014 19:29:14 +0200
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20140730172914.GT16445@jama>
References: <53D91F3C.3050107@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <53D91F3C.3050107@mlbassoc.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: freetype-config broken?
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
X-List-Received-Date: Wed, 30 Jul 2014 17:28:54 -0000
X-Groupsio-MsgNum: 55773
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="59coWm5189RNS6mf"
Content-Disposition: inline

--59coWm5189RNS6mf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 10:37:16AM -0600, Gary Thomas wrote:
> The behaviour of 'freetype-config' (from freetype-native) has
> changed since this commit:
>    commit 3476a49b10093c58b2f89e3d9a8527224f1bd7f6
>    Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>    Date:   Thu May 22 10:59:33 2014 +0100
>      binconfig-disabled: Add class and use
>=20
> This is breaking my build of mplayer which uses freetype-config
> to determine how to use the freetype library (in ./configure)
>=20
> The comment in the commit indicates that this is an improvement
> and the path forward, but I don't see how to change the recipes
> (and scripts, etc) that rely on this functionality to work in
> this new mode.
>=20
> Any suggestions?

See git log for many examples how it was fixed in other recipes.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--59coWm5189RNS6mf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPZK2oACgkQN1Ujt2V2gBzSfACgo75lyBRYXJdhrYFMt2pAqMrP
QfMAn3q7UBs6MU0jU2JTBobeoKmw3B6E
=8vvX
-----END PGP SIGNATURE-----

--59coWm5189RNS6mf--
