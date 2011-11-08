Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RNtnG-0002fW-4Q for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 23:05:22 +0100
Received: from f053044161.adsl.alicedsl.de ([78.53.44.161]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RNthJ-0001hU-KF for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 21:59:13 +0000
Message-ID: <1320789542.12955.10.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 08 Nov 2011 22:59:02 +0100
In-Reply-To: <77fe9dd8fa0393132ac6aba00d5659c6781fbbde.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
	<77fe9dd8fa0393132ac6aba00d5659c6781fbbde.1320780004.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 01/17] pseudo: Uprev pseudo to version 1.2
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
X-List-Received-Date: Tue, 08 Nov 2011 22:05:22 -0000
X-Groupsio-MsgNum: 12157
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Lig1vdj/BOkYQtAOEaLX"

--=-Lig1vdj/BOkYQtAOEaLX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Mark,


Am Dienstag, den 08.11.2011, 11:22 -0800 schrieb Saul Wold:
> From: Mark Hatle <mark.hatle@windriver.com>

I had to read several times to find out the meaning of =C2=BBUprev=C2=AB. M=
aybe
using Update or Upgrade is easier for not native speakers.

Also the second =C2=BBpseudo=C2=AB can be dropped in the commit summary.

> This adds a new feature, PSEUDO_UNLOAD, which can be used to eliminate
> overhead of LD_PRELOAD when no longer necessary.
>=20
> Also the, clone(2), support on Linux has been updated to resolve some
> potential defects in the previous implementation.
>=20
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>

> ---
>  .../conf/distro/include/distro_tracking_fields.inc |    6 +-
>  .../pseudo/pseudo/realpath_fix.patch               |  165 --------------=
------
>  .../pseudo/{pseudo_1.1.1.bb =3D> pseudo_1.2.bb}      |    7 +-
>  meta/recipes-devtools/pseudo/pseudo_git.bb         |    6 +-
>  4 files changed, 9 insertions(+), 175 deletions(-)
>  delete mode 100644 meta/recipes-devtools/pseudo/pseudo/realpath_fix.patc=
h
>  rename meta/recipes-devtools/pseudo/{pseudo_1.1.1.bb =3D> pseudo_1.2.bb}=
 (48%)

[=E2=80=A6]


Thanks,

Paul

--=-Lig1vdj/BOkYQtAOEaLX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk65piYACgkQPX1aK2wOHVicpwCggz/WqiXZWIRzCYDBIcNQ0oPJ
OZIAn3kgZXJsVS9UyeqeMVKr+hPnRS2m
=qRSg
-----END PGP SIGNATURE-----

--=-Lig1vdj/BOkYQtAOEaLX--
