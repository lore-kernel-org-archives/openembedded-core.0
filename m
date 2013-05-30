Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 4869C6041D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 20:40:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id F2045A628C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 22:40:37 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 22:40:29 +0200
Message-Id: <1369946430-12959-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Subject: [PATCH v2 1/2] hicolor-icon-theme: keep inherited dependencies and switch to gnomebase
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
X-List-Received-Date: Thu, 30 May 2013 20:40:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- switching to gnomebase removes postinst and postrm scripts that
gtk-icon-cache was bringing (and which are not necessary) else, if an
image installs hicolor-icon-theme without any other gnome package,
the dependency on gdk-pixbuf-native was missing and if it exists,
the host gdk-pixbuf-query-loaders binary was be
used and it will try to update the host's cache

- keep inherited dependencies as these are only native ones
DEPENDS = autoconf-native automake-native gnome-common-native
gnu-config-native libtool-native pkgconfig-native

[YOCTO #4572]

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
index 7c911e0..9a8e5a6 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
@@ -6,9 +6,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426"
 
 SECTION = "unknown"
-inherit gnome allarch
-
-DEPENDS = ""
+inherit gnomebase allarch
 
 PR = "r1"
 
-- 
1.8.1.4


