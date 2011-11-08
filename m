Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RNtw0-000338-4d for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 23:14:24 +0100
Received: from f053044161.adsl.alicedsl.de ([78.53.44.161]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RNtq4-0001j4-10 for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 22:08:16 +0000
Message-ID: <1320790090.12955.16.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 08 Nov 2011 23:08:10 +0100
In-Reply-To: <fb19df5b21e551c5dfdfa340438952560c5fa528.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
	<fb19df5b21e551c5dfdfa340438952560c5fa528.1320780004.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 07/17] libarchive: update to 2.8.5
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
X-List-Received-Date: Tue, 08 Nov 2011 22:14:24 -0000
X-Groupsio-MsgNum: 12159
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-HTkbVs6HIxJ5TnmmLoBe"

--=-HTkbVs6HIxJ5TnmmLoBe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Xiaofeng,


do I need to put people in CC?

Am Dienstag, den 08.11.2011, 11:22 -0800 schrieb Saul Wold:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> Remove patch "0003-Patch-from-upstream-rev-2516.patch" because it has bee=
n merged
> to source codes.

Mentioning of the SRC_URI change would be also nice.

> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  ...rchive_2.8.4.yocto.1.bb =3D> libarchive_2.8.5.bb} |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-extended/libarchive/{libarchive_2.8.4.yocto.1.bb =3D=
> libarchive_2.8.5.bb} (76%)
>=20
> diff --git a/meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb=
 b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
> similarity index 76%
> rename from meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb
> rename to meta/recipes-extended/libarchive/libarchive_2.8.5.bb
> index 94d261b..1bc49e2 100644
> --- a/meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
> @@ -9,19 +9,19 @@ DEPENDS =3D "libxml2"
> =20
>  # We need to repack the tarball due undistributable content on the upstr=
eam one.
>  # More details at http://code.google.com/p/libarchive/issues/detail?id=
=3D162
> -SRC_URI =3D "http://autobuilder.yoctoproject.org/sources/libarchive-${PV=
}.tar.gz \
> +SRC_URI =3D "http://libarchive.googlecode.com/files/libarchive-${PV}.tar=
.gz \

Reading the issues mentioned in the comment, I guess

    I've just deleted them from libarchive/2.8 branch as well.

means this landed in version 2.8.5? Please remove the comment then.

>             file://0001-Patch-from-upstream-revision-1990.patch \
>             file://0002-Patch-from-upstream-revision-1991.patch \
> -           file://0003-Patch-from-upstream-rev-2516.patch \
>             file://0004-Patch-from-upstream-rev-2514.patch \
>             file://0005-Patch-from-upstream-rev-2520.patch \
>             file://0006-Patch-from-upstream-rev-2521.patch \
>             file://0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Close=
s-5.patch \
>             "
> =20
> -SRC_URI[md5sum] =3D "71242da5191f1218f13dd520d95a870e"
> -SRC_URI[sha256sum] =3D "8cd55db11b1d6001ff8007e4d22b6f4a4bb215e70750e19a=
b44b84b99ab76053"
> +SRC_URI[md5sum] =3D "9caf51dcf6213e9c9f5a1c27448b9c90"
> +SRC_URI[sha256sum] =3D "13993e0ffbd121ccda46ea226b1f8eac218de0fa8da7d8b1=
f998093d5c32a72d"
> =20
>  inherit autotools lib_package
> =20
>  BBCLASSEXTEND =3D "nativesdk"
> +

No new line please.


Thanks,

Paul

--=-HTkbVs6HIxJ5TnmmLoBe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk65qEoACgkQPX1aK2wOHVjt6wCfSnC8yM+7Z9AZNtZLySURCDu6
7vEAoIT0U/OTMe8ybaxd/iE7xHXPtZVC
=j9MO
-----END PGP SIGNATURE-----

--=-HTkbVs6HIxJ5TnmmLoBe--
