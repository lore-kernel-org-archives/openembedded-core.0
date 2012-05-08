Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SRoP9-0005b9-TK
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 19:40:56 +0200
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 6E1D64B018F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2012 19:31:02 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 19:30:43 +0200
Message-Id: <1336498243-14896-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1336497947-28128-1-git-send-email-eric@eukrea.com>
References: <1336497947-28128-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [PATCH v2] zlib: upgrade to 1.2.7
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
X-List-Received-Date: Tue, 08 May 2012 17:40:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

1.2.6 is no more fetchable and 1.2.7 fix some bugs, full changelog is
available here : http://zlib.net/ChangeLog.txt

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
v2 : remove PR=3Dr1

 .../remove.ldconfig.call.patch                     |    0
 .../zlib/{zlib_1.2.6.bb =3D> zlib_1.2.7.bb}          |    6 ++----
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-core/zlib/{zlib-1.2.6 =3D> zlib-1.2.7}/remove.ldconf=
ig.call.patch (100%)
 rename meta/recipes-core/zlib/{zlib_1.2.6.bb =3D> zlib_1.2.7.bb} (80%)

diff --git a/meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.call.patch=
 b/meta/recipes-core/zlib/zlib-1.2.7/remove.ldconfig.call.patch
similarity index 100%
rename from meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.call.patch
rename to meta/recipes-core/zlib/zlib-1.2.7/remove.ldconfig.call.patch
diff --git a/meta/recipes-core/zlib/zlib_1.2.6.bb b/meta/recipes-core/zli=
b/zlib_1.2.7.bb
similarity index 80%
rename from meta/recipes-core/zlib/zlib_1.2.6.bb
rename to meta/recipes-core/zlib/zlib_1.2.7.bb
index 54f8abf..803fec3 100644
--- a/meta/recipes-core/zlib/zlib_1.2.6.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.7.bb
@@ -6,13 +6,11 @@ SECTION =3D "libs"
 LICENSE =3D "Zlib"
 LIC_FILES_CHKSUM =3D "file://zlib.h;beginline=3D4;endline=3D23;md5=3D94d=
1b5a40dadd127f3351471727e66a9"
=20
-PR =3D "r1"
-
 SRC_URI =3D "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
            file://remove.ldconfig.call.patch \
            "
-SRC_URI[md5sum] =3D "dc2cfa0d2313ca77224b4d932b2911e9"
-SRC_URI[sha256sum] =3D "fa3e3e4881fa5810b8903f2c7e0dcd5a0a673535f0438021=
c4bbb5db1b918c8e"
+SRC_URI[md5sum] =3D "2ab442d169156f34c379c968f3f482dd"
+SRC_URI[sha256sum] =3D "49e2e9658dfb036900da6ea0267a737fa3c4eee6666776d3=
78c79d52e9334934"
=20
 do_configure (){
 	./configure --prefix=3D${prefix} --shared --libdir=3D${libdir}
--=20
1.7.0.4



