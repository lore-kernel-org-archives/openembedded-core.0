Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RNv6j-0006iG-Cm for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 00:29:33 +0100
Received: from f053044161.adsl.alicedsl.de ([78.53.44.161]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RNv0l-0001sQ-Ck; Tue, 08 Nov 2011 23:23:23 +0000
Message-ID: <1320794597.12955.22.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 09 Nov 2011 00:23:17 +0100
In-Reply-To: <1320790090.12955.16.camel@mattotaupa>
References: <cover.1320780004.git.sgw@linux.intel.com>
	<fb19df5b21e551c5dfdfa340438952560c5fa528.1320780004.git.sgw@linux.intel.com>
	<1320790090.12955.16.camel@mattotaupa>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: [PATCH] libarchive: Remove obsolete comment and empty line at the end
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
X-List-Received-Date: Tue, 08 Nov 2011 23:29:33 -0000
X-Groupsio-MsgNum: 12166
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-HeqWeYwT6Dac/4siNqqO"

--=-HeqWeYwT6Dac/4siNqqO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Wed, 9 Nov 2011 00:17:22 +0100

This is a fix up for

        commit fb19df5b21e551c5dfdfa340438952560c5fa528
        Author: Xiaofeng Yan <xiaofeng.yan@windriver.com>
        Date:   Mon Nov 7 20:03:53 2011 +0800
       =20
            libarchive: update to 2.8.5
       =20
            Remove patch "0003-Patch-from-upstream-rev-2516.patch" because =
it has been merged
            to source codes.
       =20
            Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>

removing a now obsolete comment because the undistributable content was rem=
oved [1] from upstream=E2=80=99s tarball.

Also remove an empty line at the end introduced in the above commit.

[1] http://code.google.com/p/libarchive/issues/detail?id=3D162

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 .../libarchive/libarchive_2.8.5.bb                 |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_2.8.5.bb b/meta/re=
cipes-extended/libarchive/libarchive_2.8.5.bb
index 1bc49e2..5cf13e6 100644
--- a/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
+++ b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
@@ -7,8 +7,6 @@ PR =3D "r0"
=20
 DEPENDS =3D "libxml2"
=20
-# We need to repack the tarball due undistributable content on the upstrea=
m one.
-# More details at http://code.google.com/p/libarchive/issues/detail?id=3D1=
62
 SRC_URI =3D "http://libarchive.googlecode.com/files/libarchive-${PV}.tar.g=
z \
            file://0001-Patch-from-upstream-revision-1990.patch \
            file://0002-Patch-from-upstream-revision-1991.patch \
@@ -24,4 +22,3 @@ SRC_URI[sha256sum] =3D "13993e0ffbd121ccda46ea226b1f8eac2=
18de0fa8da7d8b1f998093d5c
 inherit autotools lib_package
=20
 BBCLASSEXTEND =3D "nativesdk"
-
--=20
1.7.7.2

--=-HeqWeYwT6Dac/4siNqqO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk65ueUACgkQPX1aK2wOHVg/AQCfQpAkxekm7aYyQM4NFhImZI/v
VGwAniamqY8K2XRzXit+04ksIPajAolk
=AWrh
-----END PGP SIGNATURE-----

--=-HeqWeYwT6Dac/4siNqqO--
