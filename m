Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SAJXZ-0000w1-W6
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 12:17:18 +0100
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id E4821A6279
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 12:08:22 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 12:08:21 +0100
Message-Id: <1332328101-22779-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Subject: [PATCH] speex: fix FILES variables
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
X-List-Received-Date: Wed, 21 Mar 2012 11:17:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

actually FILES_${PN} and FILES_${PN}-dev match the same files.
these files are supposed to go into ${PN} so remove the other entry.

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta/recipes-multimedia/speex/speex_1.2rc1.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/speex/speex_1.2rc1.bb b/meta/recipes=
-multimedia/speex/speex_1.2rc1.bb
index fe46a00..7370134 100644
--- a/meta/recipes-multimedia/speex/speex_1.2rc1.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D314649d8ba9dd7=
045dfb6683f298d0a8 \
                     file://include/speex/speex.h;beginline=3D1;endline=3D=
34;md5=3Da68129f78d7fe66e07163f73aba143b3"
 DEPENDS =3D "libogg"
=20
-PR =3D "r0"
+PR =3D "r1"
=20
 SRC_URI =3D "http://downloads.us.xiph.org/releases/speex/speex-1.2rc1.ta=
r.gz"
=20
@@ -24,5 +24,4 @@ EXTRA_OECONF =3D " --enable-fixed-point --with-ogg-libr=
aries=3D${STAGING_LIBDIR} \
=20
 PACKAGES +=3D "${PN}-bin"
 FILES_${PN} =3D "${libdir}/lib*.so.*"
-FILES_${PN}-dev +=3D "${libdir}/lib*.so.*"
 FILES_${PN}-bin =3D "${bindir}"
--=20
1.7.7.6



