Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Td4e7-0000Gu-1r
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 20:47:11 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6309801eei.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 11:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=lmvLjQ0kl8aaa3ucKvMQ0EaWbRQbxyKrcLCwaalD+OQ=;
	b=T62nLwBJI25blzAki14g+Z3dZ9p2ofuhI2Mr9ub7aVgTWl4cWZnh/fq4+Vgfuv4n+A
	zwsEtkhwxxjp8JzYkYSPNwS9YDWUhpiH9FGhTdmecZaL82/TwAPF8OiaHKkJjN0Yz3fN
	ROPbKB/3XqfEcX1jlQto1oxJYGtBSVRalAFzF1ICKHT+68ZiIgb4TmbnuAj5HwNAPEgS
	F+xp18imhHrG6Ap9Xrifg6g7g2ozONZuHSs9lW300IQ8eoz8yvmyDoVtc2LzsZmFtorY
	1G251drsS51yY/hkdufQdGZ4QtXhLxuNK+LsbiYDGvxxme8EHQ+lFzWbon5bT2ZBXqvL
	S9xQ==
Received: by 10.14.172.195 with SMTP id t43mr49139502eel.17.1353958378635;
	Mon, 26 Nov 2012 11:32:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a45sm35382956eep.16.2012.11.26.11.32.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Nov 2012 11:32:58 -0800 (PST)
Date: Mon, 26 Nov 2012 20:33:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20121126193304.GD18943@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Flanagan@jama.jama.net
Subject: Including license metadata in target package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2012 19:47:11 -0000
X-Groupsio-MsgNum: 31769
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="osDK9TLjxFScVI/L"
Content-Disposition: inline

--osDK9TLjxFScVI/L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

we'll have to provide some proprietary packages for our feed/images and
because of that we're thinking about adding functionality to package
LICENSE files (referenced by LIC_FILES_CHKSUM) to PN (something like=20
${datadir}/licenses/${PN}/file), probably reusing some code from=20
license.bbclass

Does something like this already exist somewhere or does it look
usefull for someone else too, so it could be integrated into
license.bbclass and controlled by some variable (per package=20
or by distro config)?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--osDK9TLjxFScVI/L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCzw/AACgkQN1Ujt2V2gBwmegCfQyYO0NvSXl3h2EbKbiAgK0lv
hoYAnjfKwpaYUv6ufWfgUyfm/RYKuWbX
=Ja2j
-----END PGP SIGNATURE-----

--osDK9TLjxFScVI/L--
