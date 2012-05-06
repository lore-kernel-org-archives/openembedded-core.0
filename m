Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SQvpr-0005sJ-8O
	for openembedded-core@lists.openembedded.org;
	Sun, 06 May 2012 09:24:52 +0200
Received: by wgbdr1 with SMTP id dr1so3367696wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 May 2012 00:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=DfonPIFlqxC/PBNtY8J8MDqJCc+D1lxrZN/TvCGqnh0=;
	b=GHsGFO8C9akflL+8Hn7dYsUUeY56TWJVvzZy1sMQ/kC6otz19J0CXUEJxhzradmVNp
	mjdihRlBwN1Stz9K0n5PDrWSYqjv8OCaqmROdIGMGHJ+ZL3jB0sR6RSSjmZoAkNgeCfN
	F24inUtArm4/SkDrFRpRT59AShPAJOS6buuyEQsRVSOcLbAHe44XsZBozIIv+w+H9Alz
	FwntyimwnP+0USRJwLaQPuCWBoQScAX/1juMh4ItvsMnFSf00HJ4incz2JwcGoJR6dcz
	p/wMyijZ2r2m3qEOCOHjmx6xf75OeQvsu/4yS+IZoAkWIwEnbWFiEwWf2lLc5/XSFsay
	Uejw==
Received: by 10.180.85.69 with SMTP id f5mr25684525wiz.18.1336288502447;
	Sun, 06 May 2012 00:15:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n20sm18408338wiw.5.2012.05.06.00.15.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 May 2012 00:15:01 -0700 (PDT)
Date: Sun, 6 May 2012 09:15:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120506071506.GA3141@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: meta-demoapps layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 06 May 2012 07:24:52 -0000
X-Groupsio-MsgNum: 21751
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

What's the point of this layer in oe-core repo?

Seems like nobody is using that, recipes there seems to have low quality,=
=20
no checksums, do not build and newer or fixed versions of many are in=20
different layers already.

Can someone:
0) drop whole layer
1) drop broken stuff
2) drop recipes which exist elsewhere
3) merge fixes from other layers (e.g. meta-oe/meta-shr)

?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+mJPoACgkQN1Ujt2V2gBx8OQCggLxLbMcM6cb1dU8bB/bJ0OD0
b0sAn1FgM/q4GDYSOV6fHkTnUpjxz9NX
=+tHS
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
