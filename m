Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8553B73772
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 16:59:01 +0000 (UTC)
Received: by wgfq1 with SMTP id q1so47862131wgf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 09:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SAPlNWntKC/zLg6bx5lSohLqMwvVvZUum2BF17GO8gA=;
	b=Vr223AYEV3iWmhJPYaz1FM+eJtKX11ig45w1439v8Df02uLpdxp25Saqv36J8gGfe6
	8dUtNYcvJqWv/s+B8xtXZHZOzSEP/9+cceYW7A4cNjuCbDLJSiMPW1y3PJJj+3q6LWb/
	Hw6CNXi2kH7sOWmB9Mkp6Mi3gk7STSmJDEUmgp+GRRXNcvjc4Un/3lnCRh+H0RJc88tW
	I/MXT8LVvSYJzbjUzUkJEI/f9bL5V2kZ7K0j3GTT7Xpbt/G2yuXaIlvvKQf/WnhDRmPs
	sZlJnEgzbOYR44FVXJEJ2e5aGdIW1wKt4GN7g9i0HPnrA4LSCwywS99G9+nZNtTVadF0
	U25A==
X-Received: by 10.180.81.70 with SMTP id y6mr8468081wix.14.1434733142077;
	Fri, 19 Jun 2015 09:59:02 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id uc14sm4542865wib.8.2015.06.19.09.59.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Jun 2015 09:59:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 19 Jun 2015 18:59:28 +0200
To: akuster808 <akuster808@gmail.com>
Message-ID: <20150619165928.GC2398@jama>
References: <5584374B.9040201@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5584374B.9040201@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: DIzzy - Call for patches for OE-core by June 26th
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
X-List-Received-Date: Fri, 19 Jun 2015 16:59:01 -0000
X-Groupsio-MsgNum: 66984
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Content-Disposition: inline

--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2015 at 08:37:47AM -0700, akuster808 wrote:
> thanks,
> Armin

Are these already included?

OE @ ~/openembedded-core $ git log origin/dizzy..contrib/jansa/dizzy-backpo=
rts  --oneline
11db5b7 license.bbclass: set dirs for do_populate_lic_setscene
777db3a perf: add LIBNUMA_DEFINES
d79409f squashfs-tools: build and install unsquashfs as well
f369677 e2fsprogs: install populate-extfs.sh
2dbb375 mesa: update --with-llvm-shared-libs configure option
d68cb5e test-dependencies.sh: strip only .bb suffix

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWESm4ACgkQN1Ujt2V2gBw9MwCeK0oZaRH2kp/YsxhwMA8i6tFT
Br0AoIjiKmcROcIzFSkNhr+OGoWCi6Ss
=WnVD
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--
