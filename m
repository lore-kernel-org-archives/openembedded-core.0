Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UUkrn-0002jf-NH
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 23:35:13 +0200
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 865BFA620D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 23:17:29 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2013 23:17:27 +0200
Message-Id: <1366751847-24222-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [PATCH v2] subversion: upgrade to 1.7.9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Apr 2013 21:35:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
v2 : use -M ...

 .../{subversion-1.7.8 =3D> subversion-1.7.9}/fix-install-depends.patch  =
| 0
 .../subversion/{subversion-1.7.8 =3D> subversion-1.7.9}/libtool2.patch  =
| 0
 .../subversion/{subversion_1.7.8.bb =3D> subversion_1.7.9.bb}           =
| 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion-1.7.8 =3D> subversio=
n-1.7.9}/fix-install-depends.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.7.8 =3D> subversio=
n-1.7.9}/libtool2.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion_1.7.8.bb =3D> subver=
sion_1.7.9.bb} (88%)

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.8/fix-instal=
l-depends.patch b/meta/recipes-devtools/subversion/subversion-1.7.9/fix-i=
nstall-depends.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.7.8/fix-install=
-depends.patch
rename to meta/recipes-devtools/subversion/subversion-1.7.9/fix-install-d=
epends.patch
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.8/libtool2.p=
atch b/meta/recipes-devtools/subversion/subversion-1.7.9/libtool2.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.7.8/libtool2.pa=
tch
rename to meta/recipes-devtools/subversion/subversion-1.7.9/libtool2.patc=
h
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.8.bb b/meta/=
recipes-devtools/subversion/subversion_1.7.9.bb
similarity index 88%
rename from meta/recipes-devtools/subversion/subversion_1.7.8.bb
rename to meta/recipes-devtools/subversion/subversion_1.7.9.bb
index 1b1ca93..641655e 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.8.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.9.bb
@@ -13,8 +13,8 @@ SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.b=
z2 \
            file://libtool2.patch \
            file://fix-install-depends.patch \
 "
-SRC_URI[md5sum] =3D "454b9f398415c3504435bf8c3f6ed127"
-SRC_URI[sha256sum] =3D "fc83d4d98ccea8b7bfa8f5c20fff545c8baa7d035db93097=
7550c51c6ca23686"
+SRC_URI[md5sum] =3D "8d532025771a67c06c23f299699f056f"
+SRC_URI[sha256sum] =3D "f8454c585f99afed764232a5048d9b8bfd0a25a9ab8e339e=
a69fe1204c453ef4"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4a14fd2da3134e40a087eb4326a4e=
cd4"
=20
--=20
1.7.11.7



