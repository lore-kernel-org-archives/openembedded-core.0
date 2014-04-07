Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id E81DC6E81B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 02:29:39 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3N00A6P2X44JA0@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Sun, 06 Apr 2014 21:29:40 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 25795201AC; Sun,
	06 Apr 2014 22:29:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 06 Apr 2014 22:29:13 -0400
Message-id: <1396837755-4659-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.1
In-reply-to: <1396837755-4659-1-git-send-email-denis@denix.org>
References: <1396837755-4659-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/4] cryptodev-linux: create common .inc file to be shared by module and tests
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
X-List-Received-Date: Mon, 07 Apr 2014 02:29:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb | 11 ++---------
 meta/recipes-kernel/cryptodev/cryptodev_1.6.inc      | 11 +++++++++++
 2 files changed, 13 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-kernel/cryptodev/cryptodev_1.6.inc

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb
index 320716d..43f58f3 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb
@@ -1,13 +1,6 @@
-SUMMARY = "A /dev/crypto device driver"
-HOMEPAGE = "http://cryptodev-linux.org/"
+require cryptodev_${PV}.inc
 
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRC_URI = "http://download.gna.org/cryptodev-linux/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "eade38998313c25fd7934719cdf8a2ea"
-SRC_URI[sha256sum] = "75f1425c8ea1f8cae523905a5a046a35092327a6152800b0b86efc4e56fb3e2f"
+SUMMARY = "A /dev/crypto device driver header file"
 
 do_compile() {
 	:
diff --git a/meta/recipes-kernel/cryptodev/cryptodev_1.6.inc b/meta/recipes-kernel/cryptodev/cryptodev_1.6.inc
new file mode 100644
index 0000000..946faac
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/cryptodev_1.6.inc
@@ -0,0 +1,11 @@
+HOMEPAGE = "http://cryptodev-linux.org/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "http://download.gna.org/cryptodev-linux/cryptodev-linux-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "eade38998313c25fd7934719cdf8a2ea"
+SRC_URI[sha256sum] = "75f1425c8ea1f8cae523905a5a046a35092327a6152800b0b86efc4e56fb3e2f"
+
+S = "${WORKDIR}/cryptodev-linux-${PV}"
-- 
1.9.1


