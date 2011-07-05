Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QeEWy-0006xt-Pu
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 00:55:49 +0200
Received: by rex (Postfix, from userid 1000)
	id E71CC31333; Tue,  5 Jul 2011 23:51:25 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 23:51:10 +0100
Message-Id: <914daf52ece9b4c14065cb26934eb52babbf6c0e.1309906154.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
References: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
References: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 09/17] telepathy-python: Remove unneeded and unpackaged files
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
X-List-Received-Date: Tue, 05 Jul 2011 22:55:49 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../telepathy/telepathy-python_0.15.19.bb          |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
index 8182362..0a483c4 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
@@ -9,7 +9,7 @@ RDEPENDS_${PN} += "python-dbus"
 SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${P}.tar.gz \
            file://parallel_make.patch"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools
 
@@ -20,3 +20,10 @@ FILES_${PN} += "\
     ${libdir}/python*/site-packages/telepathy/*.py \
     ${libdir}/python*/site-packages/telepathy/*/*.py \
     "
+
+do_install_append () {
+	rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyc
+	rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyo
+	rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyc
+	rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyo
+}
-- 
1.7.4.1



