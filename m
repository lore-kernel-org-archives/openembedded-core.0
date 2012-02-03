Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RtNLe-00047E-3R for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 18:54:58 +0100
Received: from f053033232.adsl.alicedsl.de ([78.53.33.232]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RtNE8-00015W-QU; Fri, 03 Feb 2012 17:47:13 +0000
Message-ID: <1328291196.4220.3.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 03 Feb 2012 18:46:36 +0100
In-Reply-To: <1328214086-6824-1-git-send-email-tworaz666@gmail.com>
References: <1328214086-6824-1-git-send-email-tworaz666@gmail.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] busybox: Add flock utility to default configuration.
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
X-List-Received-Date: Fri, 03 Feb 2012 17:54:58 -0000
X-Groupsio-MsgNum: 17002
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-ydIoWMKrlw2NabPBREsL"

--=-ydIoWMKrlw2NabPBREsL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 02.02.2012, 21:21 +0100 schrieb Peter Tworek:
> Flock is required by by pm-utils package to function properly

One =C2=BBby=C2=AB too much.

> (/usr/lib/pm-utils/functions). It's shipped in both busybox and
> util-linux. Both versions work fine with pm-utils. Enabling it
> in busybox seems like simpliest solution for the problem.

simplest

> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> ---
>  meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/re=
cipes-core/busybox/busybox-1.19.3/defconfig
> index b474ad4..fa9c078 100644
> --- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
> +++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
> @@ -540,7 +540,7 @@ CONFIG_FEATURE_FDISK_WRITABLE=3Dy
>  # CONFIG_FEATURE_GPT_LABEL is not set
>  # CONFIG_FEATURE_FDISK_ADVANCED is not set
>  # CONFIG_FINDFS is not set
> -# CONFIG_FLOCK is not set
> +CONFIG_FLOCK=3Dy
>  # CONFIG_FREERAMDISK is not set
>  CONFIG_FSCK_MINIX=3Dy
>  # CONFIG_MKFS_EXT2 is not set

People are always interested in the size changes of the package when
such programs are added to the default configuration. Do you have such
numbers?

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-ydIoWMKrlw2NabPBREsL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk8sHXwACgkQPX1aK2wOHVh60gCgiUJKT3Wc12BGeWBeMY/iUT80
Ys8An1s93EbVsuaE6qqxpqxTPoshkRL3
=TKQJ
-----END PGP SIGNATURE-----

--=-ydIoWMKrlw2NabPBREsL--
