Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJJA6-0000oX-9Q
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 09:14:30 +0200
Received: by wgbdq11 with SMTP id dq11so4682671wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 00:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=syDXUPD3HPqbr/o2azKULcHpzKGuMN8N7ML/Eoz0xgs=;
	b=JEva0t1jnb7+mVQoI2pAsyMVOtU794KyIIntdTN+jZymiDLBg4vSHFvfxlB4A6EtRm
	Sbpm/TsWfhjxkA3wEWEfqKTZp2Rxj/XsacUtlC0fel5is7upQ8bCUpyMG07ELJj49Sor
	QF096K7whdtnH6dYO7RcGXjfvAzRWfvBMD6yvpNJihkF+Q+UOL7Y/n+5H9NEJeElhG7b
	6IA1vsSeCLIBxVJ6aFAZCBWaBVDh/FHl+7rdYh5ETbYoi1a8lLgd6Q0YH2ScMBmCbO3E
	nogHhCCVg+2r00I4/ynAsFDXLJJ5CC1clwhvHB3iiTv1+A8QBbzgaLknPBYEI5PUWZ4y
	/rEg==
Received: by 10.180.86.202 with SMTP id r10mr2738477wiz.12.1349247691024;
	Wed, 03 Oct 2012 00:01:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f1sm7920997wiy.2.2012.10.03.00.01.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 00:01:29 -0700 (PDT)
Date: Wed, 3 Oct 2012 09:01:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20121003070128.GI15881@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: PN-dbg now RRECOMMENDS all PACKAGES?
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
X-List-Received-Date: Wed, 03 Oct 2012 07:14:30 -0000
X-Groupsio-MsgNum: 30286
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2xeD/fx0+7k8I/QN"
Content-Disposition: inline

--2xeD/fx0+7k8I/QN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yesterday I did build from scratch to test something and buildhistory
shows a lot of RRECOMMENDS changes like this:

packages/armv7a-vfp-neon-oe-linux-gnueabi/automake/automake-dbg/latest
-RRECOMMENDS =3D automake (=3D 1.12.3-r1)
+RRECOMMENDS =3D automake (=3D 1.12.3-r1) automake-doc-dbg automake-locale-=
dbg automake-staticdev-dbg

I don't think any of those added -dbg exist (which is not fatal for
RRECOMMENDS), but why are they added now?

Whole commit:
https://github.com/shr-distribution/buildhistory/commit/df0fb2d40018ac6b39f=
981aea02412f9a5d8b073

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2xeD/fx0+7k8I/QN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBr4sgACgkQN1Ujt2V2gBw6BACgpUNrFKCZohfIbEnOrwrG/NvR
QTgAn1dmFU+jC2DB1D9DuVYVS180xue6
=S16C
-----END PGP SIGNATURE-----

--2xeD/fx0+7k8I/QN--
