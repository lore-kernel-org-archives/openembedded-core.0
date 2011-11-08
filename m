Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RNtpm-0002nh-1o for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 23:07:58 +0100
Received: from f053044161.adsl.alicedsl.de ([78.53.44.161]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RNtjp-0001hy-Rj for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 22:01:50 +0000
Message-ID: <1320789704.12955.12.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 08 Nov 2011 23:01:44 +0100
In-Reply-To: <1320788033.10843.116.camel@ted>
References: <1320788033.10843.116.camel@ted>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH] Allow use of dash as /bin/sh
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
X-List-Received-Date: Tue, 08 Nov 2011 22:07:58 -0000
X-Groupsio-MsgNum: 12158
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-QFpd28z1EOwBG7SUcr/N"

--=-QFpd28z1EOwBG7SUcr/N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Richard,


Am Dienstag, den 08.11.2011, 21:33 +0000 schrieb Richard Purdie:
> We've had the check for dash as /bin/sh for a long time. Dash has been
> around long enough now that most major issues have been identified and
> fixed from  build perspective.
>=20
> This patch fixes a bashism in the openjade-native recipe. It also
> adjusts libtool so that the header at the script is used and not the
> value of $SHELL. This is because many Makefiles change $SHELL so dash
> can get used to execute what is otherwise configured as a bash shell
> script. Since we don't need to execute scipts this way on any system I'm

sc*r*ipts

> aware of us building upon, the simplest fix is just to remove $SHELL.
>=20
> With these two changes the dash check can be removed and we can allow
> builds with dash as /bin/sh

Could also have been separate changes. But does not matter much.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>

> [Note: I know I need to add the description of the libtool change above
> into the prefix.patch]
> ---

[=E2=80=A6]


Thanks,

Paul

--=-QFpd28z1EOwBG7SUcr/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk65psgACgkQPX1aK2wOHVhJNQCdEWjezv0Uxud7h/3uiiUHAjeA
iE8An1+/EA/H4+4ZcXHHr+soGpsakIEE
=WNC8
-----END PGP SIGNATURE-----

--=-QFpd28z1EOwBG7SUcr/N--
