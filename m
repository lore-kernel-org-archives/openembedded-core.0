Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 0309761AD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 07:44:07 +0000 (UTC)
Received: from e6520eb.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id C32C34B00A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 09:44:04 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 09:44:02 +0200
Message-Id: <1369899843-3318-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Subject: [PATCH 1/2] hicolor-icon-theme: keep inherited dependencies
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
X-List-Received-Date: Thu, 30 May 2013 07:44:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

else, if an image installs hicolor-icon-theme without any other
gnome package, the dependency on gdk-pixbuf-native will be missing
and if it exists, the host gdk-pixbuf-query-loaders binary will be
used and it will try to update the host's cache

[YOCTO #4572]

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
this patch will need some testing as it's not clear to me why this dependency was forced to "". At least that fix the problem described in the bug report.
 meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
index 7c911e0..8d48dec 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
@@ -8,8 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426"
 SECTION = "unknown"
 inherit gnome allarch
 
-DEPENDS = ""
-
 PR = "r1"
 
 SRC_URI = "http://icon-theme.freedesktop.org/releases/${BPN}-${PV}.tar.gz \
-- 
1.8.1.4


