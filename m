Return-Path: <pbarker@betafive.co.uk>
Received: from crash.betafive.co.uk (crash.betafive.co.uk [37.187.124.48])
	by mail.openembedded.org (Postfix) with ESMTP id B805D7169F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 18:13:05 +0000 (UTC)
Received: by crash.betafive.co.uk (Postfix, from userid 1000)
	id 324F03E0DCC; Thu,  8 Jan 2015 18:13:42 +0000 (GMT)
Date: Thu, 8 Jan 2015 18:13:42 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE Core <openembedded-core@lists.openembedded.org>
Message-ID: <20150108181342.GB28640@crash.betafive.co.uk>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [dylan] Backport request
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
X-List-Received-Date: Thu, 08 Jan 2015 18:13:05 -0000
X-Groupsio-MsgNum: 61184
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline

--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

I know dylan is old but it's still the recommended branch for the TI MCSDK.
We've ran into a problem automating deployment as symlinks aren't created f=
or
the modules archives when they are deployed. This was fixed by commit
ef9fad8fff1c413bc0eab15625f051d4e2d0a201 in openembedded-core which looks p=
retty
simple. I've tested this on the dylan branch in our builds and it works.

Could this be backported to the dylan branch please?

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUrsjWAAoJEBwoJlo7UPQDhpwH/i0o+y+gR3qmqxhk5bVX9B6A
/Be8SWRkIYuXRg05rM1sGms8/saJ8YauuncKKkVVMdgUqn4WF3v9iMTxxpi2JNNc
opyoPa/vKUwPPUKvlRsquAtDbEJn2D7h7ItwCkjDwhL+KRVMeAF6lgAZdS6jJvqo
sgynevApN4ucqjywfHMkq4WgmOaUWzZZBGQJj+8jVbKZ6YxQZOOjBBqfND6w5oxw
VcCF2eRq9Ho1vP5gRY7T0HfV2ZP/GHWkLoBPcItWx/idLNNwEeIDMNqRMJnVKjpC
TDWFKAfgP8XXh1M9mw9vcP4tbQUBhVHPvoNUqUfO8zn192mJc73KjT5l38wfFY4=
=lVDm
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
