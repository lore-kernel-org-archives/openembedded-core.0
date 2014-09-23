Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id DA1FB71558
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 19:32:17 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCD00MP1CXCQQC0@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 23 Sep 2014 14:32:01 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 98062200E2; Tue,
	23 Sep 2014 15:32:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Sep 2014 15:31:52 -0400
Message-id: <1411500714-17508-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/3] libinput: add 0.6.0 version
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
X-List-Received-Date: Tue, 23 Sep 2014 19:32:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

libinput is an optional dependency for Weston to handle input devices
externally, which provides better support especially for touch devices.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-graphics/wayland/libinput_0.6.0.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/libinput_0.6.0.bb

diff --git a/meta/recipes-graphics/wayland/libinput_0.6.0.bb b/meta/recipes-graphics/wayland/libinput_0.6.0.bb
new file mode 100644
index 0000000..c3bbb7b
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput_0.6.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Library to handle input devices in Wayland compositors"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=673e626420c7f859fbe2be3a9c13632d"
+
+DEPENDS = "libevdev udev mtdev"
+
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
+SRC_URI[md5sum] = "3afaf9f66d8796323a79edb879c10ba3"
+SRC_URI[sha256sum] = "30b555771e7cb921ccb9430c4a86940aa3938d05506e81d2417c03e30451bfbc"
+
+inherit autotools pkgconfig
-- 
2.0.4


