Return-Path: <Qiang.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 52B896D433
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 02:18:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAI2IS3q026757
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 18:18:28 -0800 (PST)
Received: from optiplex-780.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 17 Nov 2013 18:18:27 -0800
From: <qiang.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Nov 2013 10:18:32 +0800
Message-ID: <1384741112-20630-1-git-send-email-qiang.chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] util-linux: collect libs for related libxx-dev package
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
X-List-Received-Date: Mon, 18 Nov 2013 02:18:26 -0000
Content-Type: text/plain

From: Qiang Chen <qiang.chen@windriver.com>

Commit 91c0f9e3 moves library files to base_libdir for safe while
symbol link libblkid.so, libmount.so and libuuid.so are placed in
libdir, not base_libdir.

Meanwhile, libblkid.la, libmount.la and libuuid.la are placed in
libdir too.

Thus they are missed by related develop package and
collected by util-linux's develop package at last. Fix it.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index daf0a3e..449c816 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -74,11 +74,11 @@ FILES_util-linux-reset = "${base_bindir}/reset"
 FILES_util-linux-partx = "${sbindir}/partx"
 
 FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
-FILES_util-linux-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
+FILES_util-linux-libblkid-dev = "${libdir}/libblkid.so ${libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
 FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
-FILES_util-linux-libmount-dev = "${base_libdir}/libmount.so ${base_libdir}/libmount.la ${includedir}/libmount ${libdir}/pkgconfig/mount.pc"
+FILES_util-linux-libmount-dev = "${libdir}/libmount.so ${libdir}/libmount.la ${includedir}/libmount ${libdir}/pkgconfig/mount.pc"
 FILES_util-linux-libuuid = "${base_libdir}/libuuid.so.*"
-FILES_util-linux-libuuid-dev = "${base_libdir}/libuuid.so ${base_libdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
+FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${libdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
 FILES_util-linux-fsck = "${base_sbindir}/fsck*"
-- 
1.7.9.5


