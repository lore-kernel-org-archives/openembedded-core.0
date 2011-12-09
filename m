Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RZ5ZQ-00058b-SV for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 19:53:20 +0100
Received: from f053037064.adsl.alicedsl.de ([78.53.37.64]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RZ5Sy-0002uZ-8p; Fri, 09 Dec 2011 18:46:40 +0000
Message-ID: <1323456388.25802.8.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 09 Dec 2011 19:46:28 +0100
In-Reply-To: <2f2356128ec56b43a886c8004ad5c8aafb433153.1323454935.git.sgw@linux.intel.com>
References: <cover.1323454935.git.sgw@linux.intel.com>
	<2f2356128ec56b43a886c8004ad5c8aafb433153.1323454935.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 06/15] pulseaudio: fix compilation with x32 toolchain
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
X-List-Received-Date: Fri, 09 Dec 2011 18:53:20 -0000
X-Groupsio-MsgNum: 13969
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-U6S8FUxenGi+jk2846Qx"

--=-U6S8FUxenGi+jk2846Qx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Nitin,


Am Freitag, den 09.12.2011, 10:23 -0800 schrieb Saul Wold:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> This commit makes assembly syntax compatible with x32 toolchain
> to avoid x32 gcc errors.
>=20
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  .../pulseaudio/pulseaudo_fix_for_x32.patch         |  225 ++++++++++++++=
++++++
>  .../pulseaudio/pulseaudio_1.1.bb                   |    3 +-
>  2 files changed, 227 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/pulseau=
do_fix_for_x32.patch
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_=
for_x32.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix=
_for_x32.patch
> new file mode 100644
> index 0000000..22fe2e7
> --- /dev/null
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_for_x32=
.patch
> @@ -0,0 +1,225 @@
> +UpstreamStatus: Pending
> +
> +This patch makes assembly syntax compatible to the x32 toolchain.
> +
> +This fixes compilations errors with x32 gcc.

I would volunteer to send this patch upstream. A more elaborate commit
message also suited for non-OE users would be helpful. That means what
does the x32 tool chain do and a paste of the errors you got.

> +Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/03
> +Index: pulseaudio-1.1/src/pulsecore/svolume_mmx.c

[=E2=80=A6]

Please only merge this, when this has been improved.


Thanks,

Paul

--=-U6S8FUxenGi+jk2846Qx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7iV4QACgkQPX1aK2wOHVjrkQCeIa8+PqOPqYL9Iwqo6wqpLkqm
17oAn31Su1kp1aq7aHXEhtQgI4+cEqZv
=e5k9
-----END PGP SIGNATURE-----

--=-U6S8FUxenGi+jk2846Qx--
