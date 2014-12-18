Return-Path: <pbarker@betafive.co.uk>
Received: from crash.betafive.co.uk (crash.betafive.co.uk [37.187.124.48])
	by mail.openembedded.org (Postfix) with ESMTP id 86513728B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 21:05:27 +0000 (UTC)
Received: by crash.betafive.co.uk (Postfix, from userid 1000)
	id B0F8F3E1F47; Thu, 18 Dec 2014 21:06:16 +0000 (GMT)
Date: Thu, 18 Dec 2014 21:06:16 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20141218210616.GA31810@crash.betafive.co.uk>
References: <1418914454-24213-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1418914454-24213-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] powertop: Fix build for !uclibc
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
X-List-Received-Date: Thu, 18 Dec 2014 21:05:33 -0000
X-Groupsio-MsgNum: 60639
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline

--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2014 at 03:54:14PM +0100, Martin Jansa wrote:
> * EXTRA_LDFLAGS isn't defined for !uclibc and configure fails
>   when it reads it unexpanded, see config.log snippet:
>=20
>   configure:4177: checking whether the C compiler works
>   configure:4199: i586-oe-linux-gcc  -m32 -march=3Di586 --sysroot=3D/OE/s=
ysroots/qemux86  -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,-=
-hash-style=3Dgnu -Wl,--as-needed ${EXTRA_LDFLAGS} conftest.c  >&5
>   i586-oe-linux-gcc: error: ${EXTRA_LDFLAGS}: No such file or directory
>   configure:4203: $? =3D 1
>   configure:4241: result: no
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I hit this issue myself, can confirm that applying this patch fixes it.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUk0HIAAoJEBwoJlo7UPQDxJ4H/idqUTYQYxc5xluO0CkxkJYw
Uywde6osfNclLjBdzrvliZmWeaCl9hJlIEcq+JF+9suiSkkGL2kl2/Mth4ueq29e
DkMx5DCcbHJ/GJFvzXe/E6XQYuRVwHaSqWD2RRNovzEn0cP3pho5NVThZgxZTmAh
Kts6kTRpB315XIshgkj2RdeEv+33XTNfNSel5rM+9M3F/HqUWox+soTCZKEWb8J+
uStL6UB01jV0N6PORaZ1LW54gtlxxtTT9F3H9hlgLUeA54MXLPBvl8npeWLjVTaL
DuBO8KmIDP5tRVtRlsqQ3c4hao6PBFycROxA/ctnaVRWAOHGEH4J7gJVTk1vYaQ=
=HH4f
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
