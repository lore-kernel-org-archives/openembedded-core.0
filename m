Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R2TxU-00055D-KO
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 22:15:24 +0200
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id D83CFA6230;
	Sat, 10 Sep 2011 22:10:16 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Sep 2011 22:10:11 +0200
Message-Id: <1315685411-20031-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6
MIME-Version: 1.0
Subject: [meta-intel] meta-emenlow: update qt4 to 4.7.4
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
X-List-Received-Date: Sat, 10 Sep 2011 20:15:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

once oe-core is update to 4.7.4

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend     |    2 --
 .../recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend     |    2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)
 delete mode 100644 meta-emenlow/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappe=
nd
 create mode 100644 meta-emenlow/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappe=
nd

diff --git a/meta-emenlow/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend b/me=
ta-emenlow/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend
deleted file mode 100644
index 92eabf2..0000000
--- a/meta-emenlow/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-QT_GLFLAGS_emenlow =3D "-opengl"
-
diff --git a/meta-emenlow/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend b/me=
ta-emenlow/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend
new file mode 100644
index 0000000..92eabf2
--- /dev/null
+++ b/meta-emenlow/recipes-qt/qt4/qt4-x11-free_4.7.4.bbappend
@@ -0,0 +1,2 @@
+QT_GLFLAGS_emenlow =3D "-opengl"
+
--=20
1.7.6



