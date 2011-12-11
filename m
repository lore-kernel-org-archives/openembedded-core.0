Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RZda7-0006KM-RQ for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 08:12:19 +0100
Received: from f053043131.adsl.alicedsl.de ([78.53.43.131]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RZdTi-0007nq-O9 for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 07:05:43 +0000
Message-ID: <1323587119.8919.4.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Dec 2011 08:05:19 +0100
In-Reply-To: <71f6cb63e711721a1a03cfc1c0f1d054472241fe.1323554268.git.sgw@linux.intel.com>
References: <cover.1323554268.git.sgw@linux.intel.com>
	<71f6cb63e711721a1a03cfc1c0f1d054472241fe.1323554268.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH 3/5] self-hosted: Add ext2 utilites and perl-pod for building
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
X-List-Received-Date: Sun, 11 Dec 2011 07:12:19 -0000
X-Groupsio-MsgNum: 14041
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-tGVvlFcNvD9wD3X/ztrP"

--=-tGVvlFcNvD9wD3X/ztrP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Saul,


Am Samstag, den 10.12.2011, 14:01 -0800 schrieb Saul Wold:
> Add self-hosted-host-tools for non-build related tools
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-core/tasks/task-self-hosted.bb |   54 +++++++++++++++------=
-----
>  1 files changed, 31 insertions(+), 23 deletions(-)
>=20
> diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-c=
ore/tasks/task-self-hosted.bb
> index b3a68b4..b9bdd21 100644
> --- a/meta/recipes-core/tasks/task-self-hosted.bb
> +++ b/meta/recipes-core/tasks/task-self-hosted.bb
> @@ -3,7 +3,7 @@
>  #
> =20
>  DESCRIPTION =3D "Create Basic Image Tasks"
> -PR =3D "r1"
> +PR =3D "r2"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58 \
>                      file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
> @@ -14,6 +14,7 @@ PACKAGES =3D "\
>      task-self-hosted-sdk \
>      task-self-hosted-extended \
>      task-self-hosted-graphics \
> +    task-self-hosted-host-tools \
>      "
> =20
>  ALLOW_EMPTY =3D "1"
> @@ -23,13 +24,26 @@ RDEPENDS_task-self-hosted =3D "\
>      task-self-hosted-sdk \
>      task-self-hosted-extended \
>      task-self-hosted-graphics \
> +    task-self-hosted-host-tools \
> +    "
> +
> +RDEPENDS_task-self-hosted-host-tools =3D "\
> +    e2fsprogs \
> +    dhcp-client \
> +    genext2fs \
> +    hdparm \
> +    iptables \
> +    kernel-module-tun \
> +    kernel-module-iptable-raw \
> +    kernel-module-iptable-nat \
> +    kernel-module-iptable-mangle \
> +    kernel-module-iptable-filter \
> +    mc \
> +    screen \
>      "

[=E2=80=A6]

I find this patch quite hard to review, since it reorders the
variables(?). Is there a trick to review this or are two separate
patches better.

Could you also please check your pull request script to send

    <openembedded-core@lists.openembedded.org>

instead of

    <openembedded-core@openembedded.org>

and therefore answering to all messages are sent twice to the list.


Thanks,

Paul

--=-tGVvlFcNvD9wD3X/ztrP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7kVjAACgkQPX1aK2wOHVhYIACeLFgYCRsQtcZjDsES26We3IDQ
1RIAn33zMANBqCMaWh0Y3LxX2oIb5d9H
=uaBp
-----END PGP SIGNATURE-----

--=-tGVvlFcNvD9wD3X/ztrP--
