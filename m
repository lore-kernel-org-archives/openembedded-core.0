Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RvQ54-0000uf-Ki for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 10:14:19 +0100
Received: from f053033192.adsl.alicedsl.de ([78.53.33.192]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RvPxM-00033z-Tx; Thu, 09 Feb 2012 09:06:21 +0000
Message-ID: <1328778363.5379.3.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 09 Feb 2012 10:06:03 +0100
In-Reply-To: <92a87a54f47245d723727bd190c35323e66ad3ea.1328774359.git.xiaofeng.yan@windriver.com>
References: <cover.1328774359.git.xiaofeng.yan@windriver.com>
	<92a87a54f47245d723727bd190c35323e66ad3ea.1328774359.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] libx11-1.4.4: Add patch makekeys_crosscompile.patch
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
X-List-Received-Date: Thu, 09 Feb 2012 09:14:19 -0000
X-Groupsio-MsgNum: 17331
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-lkKhryv3xR5tAPVtF4Da"

--=-lkKhryv3xR5tAPVtF4Da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Xiaofeng,


Am Donnerstag, den 09.02.2012, 16:05 +0800 schrieb Xiaofeng Yan:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> LSB 4.1 complain a host contamination error from libx11 because of absent
> patch "makekeys_crosscompile.patch" from libx11-trim-1.4.4.
>=20
> [YOCTO #1970]

could you squash both patches please?

Also please add the output from the cover letter to the commit message.

> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  .../libx11-1.4.4/makekeys_crosscompile.patch       |   45 ++++++++++++++=
++++++
>  1 files changed, 45 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_=
crosscompile.patch
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_crossco=
mpile.patch b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_crosscom=
pile.patch
> new file mode 100644
> index 0000000..e5eacf0
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_crosscompile.p=
atch
> @@ -0,0 +1,45 @@
> +Because the size of "unsigned long" is different between 32-bit
> +and 64-bit, judge whether target is 32-bit or 64-bit and tell
> +"makekey".=20

Trailing space at the end.

Could you also add the error message to the patch file in a *separate*
patch please. Preferably before copying it.

> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: dbuitenh@windriver.com
> +
> +--- libX11-1.3.4.orig/src/util/makekeys.c	2010-01-15 09:11:36.000000000 =
+0800
> ++++ libX11-1.3.4/src/util/makekeys.c	2011-05-24 19:04:25.454774908 +0800

[=E2=80=A6]


Thanks,

Paul

--=-lkKhryv3xR5tAPVtF4Da
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk8zjHwACgkQPX1aK2wOHViI+QCfQ6QGypP6mNP25TAWhqkivccZ
mwIAn2RRk37qjupfLn6JNRlYlPQrWqn0
=8pwm
-----END PGP SIGNATURE-----

--=-lkKhryv3xR5tAPVtF4Da--
