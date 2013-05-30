Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id D267D6041D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 20:41:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id A229FA621E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 22:40:44 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 22:40:30 +0200
Message-Id: <1369946430-12959-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1369946430-12959-1-git-send-email-eric@eukrea.com>
References: <1369946430-12959-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/2] gtk-icon-cache pixbufcache: add a clear dependency on gdk-pixbuf-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 May 2013 20:41:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

not really sure if the dependency is always inherited but at least
there won't be bad surprise.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 meta/classes/gtk-icon-cache.bbclass | 2 +-
 meta/classes/pixbufcache.bbclass    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 789fa38..8ed7feb 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,6 +1,6 @@
 FILES_${PN} += "${datadir}/icons/hicolor"
 
-DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk-update-icon-cache-native"
+DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk-update-icon-cache-native gdk-pixbuf-native"
 
 gtk_icon_cache_postinst() {
 if [ "x$D" != "x" ]; then
diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 274d67d..4ac17ee 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -3,7 +3,7 @@
 # packages.
 #
 
-DEPENDS += "qemu-native"
+DEPENDS += "qemu-native gdk-pixbuf-native"
 inherit qemu
 
 PIXBUF_PACKAGES ??= "${PN}"
-- 
1.8.1.4


