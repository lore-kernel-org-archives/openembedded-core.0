Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RWu73-0002cb-N6 for openembedded-core@lists.openembedded.org;
	Sat, 03 Dec 2011 19:15:01 +0100
Received: from f053044125.adsl.alicedsl.de ([78.53.44.125]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RWu0m-0007v4-5z for openembedded-core@lists.openembedded.org;
	Sat, 03 Dec 2011 18:08:32 +0000
Message-ID: <1322935698.3532.21.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 03 Dec 2011 19:08:18 +0100
In-Reply-To: <b224881df056580c35e265c2b3db311a1f366409.1322856805.git.nitin.a.kamble@intel.com>
References: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
	<b224881df056580c35e265c2b3db311a1f366409.1322856805.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH 02/11] mdadm: fix CC definition in the Makefile
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
X-List-Received-Date: Sat, 03 Dec 2011 18:15:01 -0000
X-Groupsio-MsgNum: 13598
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-3xFadeE3Xd/nylwfvHM7"

--=-3xFadeE3Xd/nylwfvHM7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Nitin,


thank you for your patch.

Am Freitag, den 02.12.2011, 12:20 -0800 schrieb nitin.a.kamble@intel.com:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> By hardcoding CC's definition in the Makefile, all the gcc parameters
> set by tune settings are lost. Causing compile failure with x32 toolchain
>=20
> As the bitbake defined CC is good, there is no need to redfine CC in the

red*e*fine

> make file, hence removed it to fix the issue.
>=20
> This fixes bug: [YOCTO #1414]
>=20
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  .../mdadm/files/mdadm_fix_for_x32.patch            |   24 ++++++++++++++=
++++++
>  meta/recipes-extended/mdadm/mdadm_3.2.2.bb         |    3 +-
>  2 files changed, 26 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-extended/mdadm/files/mdadm_fix_for_x32.p=
atch
>=20
> diff --git a/meta/recipes-extended/mdadm/files/mdadm_fix_for_x32.patch b/=
meta/recipes-extended/mdadm/files/mdadm_fix_for_x32.patch
> new file mode 100644
> index 0000000..898e70b
> --- /dev/null
> +++ b/meta/recipes-extended/mdadm/files/mdadm_fix_for_x32.patch
> @@ -0,0 +1,24 @@
> +UpstreamStatus: pending
> +
> +By hardcoding CC's definition in the Makefile, all the gcc parameters=
=20
> +set by tune settings are lost. Causing compile failure with x32 toolchai=
n
> +
> +As the bitbake defined CC is good, there is no need to redfine CC in the=
=20
> +make file, hence removed it to fix the issue.
> +
> +Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> +2011/12/01
> +
> +Index: mdadm-3.2.2/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- mdadm-3.2.2.orig/Makefile
> ++++ mdadm-3.2.2/Makefile
> +@@ -40,7 +40,7 @@ KLIBC=3D/home/src/klibc/klibc-0.77
> +=20
> + KLIBC_GCC =3D gcc -nostdinc -iwithprefix include -I$(KLIBC)/klibc/inclu=
de -I$(KLIBC)/linux/include -I$(KLIBC)/klibc/arch/i386/include -I$(KLIBC)/k=
libc/include/bits32
> +=20
> +-CC =3D $(CROSS_COMPILE)gcc
> ++#CC =3D $(CROSS_COMPILE)gcc

I would prefer to fix this the way it can be applied upstream. I could
even ask them to apply it.

> + CXFLAGS =3D -ggdb
> + CWFLAGS =3D -Wall -Werror -Wstrict-prototypes -Wextra -Wno-unused-param=
eter
> + ifdef WARN_UNUSED

[=E2=80=A6]


Thanks,

Paul

--=-3xFadeE3Xd/nylwfvHM7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7aZZIACgkQPX1aK2wOHVgT3ACeN7jrZrHcuTuf71lJVqT/koK9
/5wAniGYCv44X6YDIM67h1mlFLJDbJXz
=p8N8
-----END PGP SIGNATURE-----

--=-3xFadeE3Xd/nylwfvHM7--
