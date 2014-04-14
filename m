Return-Path: <B40290@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe001.messaging.microsoft.com [216.32.180.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA4F65D97
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Apr 2014 06:13:51 +0000 (UTC)
Received: from mail186-va3-R.bigfish.com (10.7.14.242) by
	VA3EHSOBE006.bigfish.com (10.7.40.26) with Microsoft SMTP Server id
	14.1.225.22; Mon, 14 Apr 2014 06:13:17 +0000
Received: from mail186-va3 (localhost [127.0.0.1])	by
	mail186-va3-R.bigfish.com (Postfix) with ESMTP id CD78310024C	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 14 Apr 2014 06:13:17 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zze0eahzz1f42h2148h1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6h208chzz1de098h8275bh8275dh1de097hz2dh2a8h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh26d3h1155h)
Received: from mail186-va3 (localhost.localdomain [127.0.0.1]) by mail186-va3
	(MessageSwitch) id 1397455995861235_10028;
	Mon, 14 Apr 2014 06:13:15 +0000 (UTC)
Received: from VA3EHSMHS019.bigfish.com (unknown [10.7.14.242])	by
	mail186-va3.bigfish.com (Postfix) with ESMTP id CC5E740047;
	Mon, 14 Apr 2014 06:13:15 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS019.bigfish.com
	(10.7.99.29) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Mon, 14 Apr 2014 06:13:15 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.174.2; Mon, 14 Apr 2014 06:13:48 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.136])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s3E6Djio028346;
	Sun, 13 Apr 2014 23:13:46 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Apr 2014 14:13:43 +0800
Message-ID: <1397456023-21015-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] lttng-modules: update to 2.4.1 version
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
X-List-Received-Date: Mon, 14 Apr 2014 06:13:54 -0000
Content-Type: text/plain

    *This updates lttng-modules for 2.4.1 and
     it also fixes the build with 3.13 Linux kernel.

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../lttng/lttng-modules/bio-bvec-iter.patch        | 156 ---------------------
 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb   |  38 -----
 meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb   |  38 +++++
 3 files changed, 38 insertions(+), 194 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb

diff --git a/meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch b/meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
deleted file mode 100644
index d6c66e4..0000000
--- a/meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-Upstream-Status: Pending
-
-In 3.14, bi_sector and bi_size were moved into an iterator, thus
-breaking any tracepoints that still expect them in the bio.  Fix up
-the lttng-module tracepoints to use the new scheme when the kernel
-version is >= 3.14.
-
-Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
-
-diff --git a/instrumentation/events/lttng-module/block.h b/instrumentation/events/lttng-module/block.h
-index f3b8bff..0a61543 100644
---- a/instrumentation/events/lttng-module/block.h
-+++ b/instrumentation/events/lttng-module/block.h
-@@ -341,9 +341,15 @@ TRACE_EVENT(block_bio_bounce,
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev ?
- 					  bio->bi_bdev->bd_dev : 0)
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
- 
-@@ -385,14 +391,24 @@ TRACE_EVENT(block_bio_complete,
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
-+
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,38))
- 		tp_assign(error, error)
- #else
- 		tp_assign(error, 0)
- #endif
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 	),
- 
- 	TP_printk("%d,%d %s %llu + %u [%d]",
-@@ -419,9 +435,15 @@ DECLARE_EVENT_CLASS(block_bio_merge,
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
- 
-@@ -485,9 +507,15 @@ TRACE_EVENT(block_bio_queue,
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
- 
-@@ -513,9 +541,15 @@ DECLARE_EVENT_CLASS(block_bio,
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev ? bio->bi_bdev->bd_dev : 0)
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
- 
-@@ -587,10 +621,17 @@ DECLARE_EVENT_CLASS(block_get_rq,
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio ? bio->bi_bdev->bd_dev : 0)
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio ? bio->bi_iter.bi_sector : 0)
-+		tp_assign(nr_sector, bio ? bio->bi_iter.bi_size >> 9 : 0)
-+		blk_fill_rwbs(rwbs, bio ? bio->bi_rw : 0,
-+			      bio ? bio->bi_iter.bi_size >> 9 : 0)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio ? bio->bi_sector : 0)
- 		tp_assign(nr_sector, bio ? bio->bi_size >> 9 : 0)
- 		blk_fill_rwbs(rwbs, bio ? bio->bi_rw : 0,
- 			      bio ? bio->bi_size >> 9 : 0)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
-         ),
- 
-@@ -759,9 +800,15 @@ TRACE_EVENT(block_split,
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(new_sector, new_sector)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(new_sector, new_sector)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
- 
-@@ -805,11 +852,19 @@ TRACE_EVENT(block_remap,
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		tp_assign(old_dev, dev)
-+		tp_assign(old_sector, from)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
- 		tp_assign(old_dev, dev)
- 		tp_assign(old_sector, from)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 	),
- 
- 	TP_printk("%d,%d %s %llu + %u <- (%d,%d) %llu",
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
deleted file mode 100644
index aa01a8d..0000000
--- a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SECTION = "devel"
-SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
-DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
-LICENSE = "LGPLv2.1 & GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1412caf5a1aa90d6a48588a4794c0eac \
-                    file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
-                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
-
-DEPENDS = "virtual/kernel"
-
-inherit module
-
-SRCREV = "fb2c37799306d16fb590aebee6fad8be431264b7"
-PV = "2.4.0"
-
-# lttng currently blacklists arm with gcc-4.8
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
-
-SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.4 \
-           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
-           file://bio-bvec-iter.patch"
-
-export INSTALL_MOD_DIR="kernel/lttng-modules"
-export KERNEL_SRC="${STAGING_KERNEL_DIR}"
-
-
-S = "${WORKDIR}/git"
-
-do_install_append() {
-	# Delete empty directories to avoid QA failures if no modules were built
-	find ${D}/lib -depth -type d -empty -exec rmdir {} \;
-}
-
-python do_package_prepend() {
-    if not os.path.exists(os.path.join(d.getVar('D', True), 'lib/modules')):
-        bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN', True))
-}
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
new file mode 100644
index 0000000..4ef74dd
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
@@ -0,0 +1,38 @@
+SECTION = "devel"
+SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
+DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1412caf5a1aa90d6a48588a4794c0eac \
+                    file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
+                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
+
+DEPENDS = "virtual/kernel"
+
+inherit module
+
+SRCREV = "afdc6b155161f209fcfadc5288dc017ceab56353"
+PV = "2.4.1"
+
+# lttng currently blacklists arm with gcc-4.8
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
+
+SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.4 \
+           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
+           "
+
+export INSTALL_MOD_DIR="kernel/lttng-modules"
+export KERNEL_SRC="${STAGING_KERNEL_DIR}"
+
+
+S = "${WORKDIR}/git"
+
+do_install_append() {
+	# Delete empty directories to avoid QA failures if no modules were built
+	find ${D}/lib -depth -type d -empty -exec rmdir {} \;
+}
+
+python do_package_prepend() {
+    if not os.path.exists(os.path.join(d.getVar('D', True), 'lib/modules')):
+        bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN', True))
+}
+
-- 
1.8.3.2



