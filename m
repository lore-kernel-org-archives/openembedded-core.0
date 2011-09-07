Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R1Boc-0003FD-TT
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 08:40:55 +0200
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id C1945D1A4B9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2011 08:35:53 +0200 (CEST)
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 06B28A61F1;
	Wed,  7 Sep 2011 08:35:48 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 08:35:43 +0200
Message-Id: <1315377343-5259-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6
MIME-Version: 1.0
Subject: resolvconf: switch to 1.59 as 1.58 was removed from debian ftp
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
X-List-Received-Date: Wed, 07 Sep 2011 06:40:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../{resolvconf_1.58.bb =3D> resolvconf_1.59.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.58.bb =3D> res=
olvconf_1.59.bb} (88%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.58.bb b/me=
ta/recipes-connectivity/resolvconf/resolvconf_1.59.bb
similarity index 88%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.58.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.59.bb
index 46040a0..94231e0 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.58.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.59.bb
@@ -15,8 +15,8 @@ PR =3D "r0"
=20
 SRC_URI =3D "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
=20
-SRC_URI[md5sum] =3D "6232b336e6bb05282791b5506bbbfa42"
-SRC_URI[sha256sum] =3D "853016a2ef16a8fdd6d1e29ac94bc6391199033235aa8e3b=
373345979c617431"
+SRC_URI[md5sum] =3D "59b20258bb8a3c25b8c4083fc0279547"
+SRC_URI[sha256sum] =3D "37691677cea24da66d6664c98668b5f16667c0133f17feb1=
66f246ee923ad756"
=20
 do_compile () {
 	:
--=20
1.7.6



