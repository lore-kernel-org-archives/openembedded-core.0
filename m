Return-Path: <martin.jansa@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5996F719A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 13:26:14 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id s49so14960650qta.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 06:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=DPkaVccfkZRlOnTlqfZQ4uFoSEesPXpYjwKm4P/2TYE=;
	b=eJYCKD4RjlzoLgH3eEkUJfXi/uKzlw9QOTrCChJS7sxvOBnoOyyVQnjKvyeP2n8sUV
	QzCMmka2hTEZa5U6F861lQietIKAB4Oml09U0dHm6m7ptFFSFI5jotiRKR8vwEXHxgbd
	dfL0TcIHdyxc3Ad4Fdy3Z0txu+oVZzwaNCPzMvWMyd2IOSCdWt1NUmXLfDim2vUaPX3n
	ys7JJtFJ+EzIZGXOdnTwxhKL1DP/IDz0yOylWrAXkfQqTkNWHQQs04Cxzd0wmPH6upPZ
	MIm2U+0j3eJhCBtOltuuI0ImVizOM/pC8HXCCy/SpMKv3jN7XAKYOOCU/k3vydI4p3XK
	NBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=DPkaVccfkZRlOnTlqfZQ4uFoSEesPXpYjwKm4P/2TYE=;
	b=PMbpqrKvNrdM8S6+iBizPfC8oXpYTtew9OSW+bLBTkbwUIO7ExMJsPHL95YgaWD+Nd
	OxRxjPRWu5TBh2uBtMj9EWNBx8fLw22xu2J56C/ObZcnCadti+HCbRceHQ+kKMVzegmP
	r+ZG/NQsR7D+wUPeFHzd8OaPqXHmrAfoNdmKMyIz2LNsukFrZRLiH8inj3FfPTbA3zgm
	I3ZlcD1eJjQnS+fdm+DNIVRClZomDi1zQ6+aYrKMw6qkjnNmeBHZbhdsvU8trxq2Zc2b
	DKZYmVRD2a8IZLiwHO91Rg33BV+D4EG0RKoFJGjAQt3RT3enZLczwUa1+HX+PR55mpcC
	5teA==
X-Gm-Message-State: AA6/9RnuXy7C7cmcjQuW3x2yA8uRYtz9sHPMs9Cz2bxfoTFETbEiuaeWHuLEX6az/kZuXw==
X-Received: by 10.194.243.104 with SMTP id wx8mr1448942wjc.229.1476278775893; 
	Wed, 12 Oct 2016 06:26:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	e2sm12918333wjw.14.2016.10.12.06.26.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 12 Oct 2016 06:26:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 12 Oct 2016 15:26:15 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20161012132615.GC2923@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: SDK_OLDEST_KERNEL vs OLDEST_KERNEL
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
X-List-Received-Date: Wed, 12 Oct 2016 13:26:15 -0000
X-Groupsio-MsgNum: 88124
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Content-Disposition: inline

--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

is this separate variable working correctly?

It was introduced in:
commit 522ba4c51fff53566678b2689d0d63c393e417b3
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Fri Sep 11 13:25:46 2015 +0100

    populate_sdk_base: Fix aarch64 OLDEST_KERNEL sdk issues

    aarch64 sets OLDEST_KERNEL to 3.14. This stops the aarch64 SDK installi=
ng on
    anything with an older kernel which is clearly incorrect.

    I attempted to extract the correct non-overridden version from the data=
 store
    but it proved problematic and I was running into data store issues. Tho=
se
    are a separate problem but there isn't time to fix this right now.

    Instead just code the SDK kernel version separately to work around this=
 for
    now (and fix the autobuilder tests and SDK usage).

But when I'm using:
OLDEST_KERNEL =3D "3.2" (default)
SDK_OLDEST_KERNEL =3D "2.6.32"
because we would like to use SDK on host with older kernel, then SDK_OLDEST=
_KERNEL
helped to bypass the uname check in environment-setup script, but then gcc =
cannot
be used, because it fails immediately with:

FATAL: kernel too old

So I'm not sure what this variable are trying to achieve, maybe autobuilder=
 tests
were only testing setup script and not the actual $CC?

The other option is that it works only when sdk toolchain is built with def=
ault
OLDEST_KERNEL (which is lower than OLDEST_KERNEL_aarch64) and only target b=
its use
OLDEST_KERNEL_aarch64, but those aren't executed on host using SDK.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlf+OfYACgkQN1Ujt2V2gBzPKwCgtr3UK3c40Y8233GvrEAxdMhC
R6oAnRd1YBfRWBAPVhC664DviEja5IJ2
=v+aH
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--
