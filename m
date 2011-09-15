Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@eukrea.com>) id 1R48IH-00023A-9P
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 11:31:41 +0200
Received: from PCDEV1.lan (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 76CCC4B018D;
	Thu, 15 Sep 2011 11:26:28 +0200 (CEST)
From: Denis Carikli <denis@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 11:26:16 +0200
Message-Id: <1316078776-19890-3-git-send-email-denis@eukrea.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1316078776-19890-1-git-send-email-denis@eukrea.com>
References: <1316078776-19890-1-git-send-email-denis@eukrea.com>
Subject: [PATCH 2/2] qt4(embedded and x11): disable neon for armv6-vfp
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
X-List-Received-Date: Thu, 15 Sep 2011 09:31:41 -0000

without the -no-neon flag, neon is "autodetected"
  by looking if the compiler is capable of compiling
  a neon test, and succeed, and neon is then enabled
  during the compilation.

Signed-off-by: Denis Carikli <denis@eukrea.com>
---
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb |    3 ++-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
index c3f6713..61c679e 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
@@ -1,9 +1,10 @@
 require qt-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
+QT_CONFIG_FLAGS_append_armv6-vfp = " -no-neon "
 
 QT_CONFIG_FLAGS += " \
  -exceptions \
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
index 75c6314..6c8db17 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
@@ -1,9 +1,10 @@
 require qt4-x11-free.inc
 require qt-${PV}.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
+QT_CONFIG_FLAGS_append_armv6-vfp = " -no-neon "
 
 QT_CONFIG_FLAGS += " \
  -no-embedded \
-- 
1.7.4.1



