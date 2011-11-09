Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RODuh-0007mO-0R for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 20:34:24 +0100
Received: from f053032093.adsl.alicedsl.de ([78.53.32.93]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RODol-0005nG-Gp for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 19:28:15 +0000
Message-ID: <1320866887.4622.60.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 09 Nov 2011 20:28:07 +0100
In-Reply-To: <65800b1433cf95084cb7541fbc14419086234470.1320839130.git.paul.eggleton@linux.intel.com>
References: <cover.1320839130.git.paul.eggleton@linux.intel.com>
	<65800b1433cf95084cb7541fbc14419086234470.1320839130.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] busybox: add grep to temporary links during uninstall
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
X-List-Received-Date: Wed, 09 Nov 2011 19:34:24 -0000
X-Groupsio-MsgNum: 12242
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-rAcjEObniNJ7/PFii9ek"

--=-rAcjEObniNJ7/PFii9ek
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 09.11.2011, 12:05 +0000 schrieb Paul Eggleton:
> In the busybox package prerm we set up some temporary links and modify
> PATH so that certain utilities are provided for the purpose of running
> update-alternatives; if grep is not among these then you get errors when
> removing busybox, so add a temporary link for grep as well.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-core/busybox/busybox.inc       |    1 +
>  meta/recipes-core/busybox/busybox_1.18.5.bb |    2 +-
>  2 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
> index acd635b..f8fee51 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -270,6 +270,7 @@ pkg_prerm_${PN} () {
>  	ln -s /bin/busybox $tmpdir/rm
>  	ln -s /bin/busybox $tmpdir/sed
>  	ln -s /bin/busybox $tmpdir/sort
> +	ln -s /bin/busybox $tmpdir/grep

Should it be sorted?

[=E2=80=A6]


Thanks,

Paul

--=-rAcjEObniNJ7/PFii9ek
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk661EgACgkQPX1aK2wOHVjUywCdHCxoePOz6Gw+1AxMKXV0Jlt7
Ra0AnRUNiG3loSDsxU59/Roan2goVgxE
=pD+x
-----END PGP SIGNATURE-----

--=-rAcjEObniNJ7/PFii9ek--
