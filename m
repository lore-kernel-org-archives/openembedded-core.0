Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 597FE77160
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 03:34:41 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1J007M0J9D2850@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 25 Jan 2016 21:34:26 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8	a=fxJcL_dCAAAA:8
	a=yf3pfmU5zXhuSwtnu4IA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 30DC5161E18;	Mon,
	25 Jan 2016 22:34:25 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 22:34:24 -0500
Message-id: <1453779264-8652-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] stress-ng: add 0.05.09
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
X-List-Received-Date: Tue, 26 Jan 2016 03:34:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

A clean room re-implementation and extension of the original stress tool.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb b/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb
new file mode 100644
index 0000000..2e92c53
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A tool to load and stress a computer system"
+HOMEPAGE = "http://kernel.ubuntu.com/~cking/stress-ng/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "fe65047991f654ffaac3c59ea9537763"
+SRC_URI[sha256sum] = "d785b5f2df042d42c43ddfd5bbafa19151ed96f0c483d7f44c737f492b52ddd6"
+
+CFLAGS += "-Wall -Wextra -DVERSION='"$(VERSION)"' -O2"
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+}
-- 
2.2.0


