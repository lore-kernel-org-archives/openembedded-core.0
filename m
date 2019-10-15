Return-Path: <prvs=184014d2e=alistair.francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 62DBD7F33F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 00:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571100483; x=1602636483;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=ihf102CbdDhXAwo4wgMXbULeNuW/Z45tyCEcDEC6FvU=;
	b=o0winLXy8+wKpls9gP6QC/rckK92uLbzzquKCOAI7v/y3DNsluvGd8tu
	ciHK6zfBIj8oSQFtyQdDss2IxwhPKQaoE7RIlRl70u022x9Yw1NlNj/p/
	fbL+39JPWskD/1cnEWwgRsg7uGSz9rIGciTliE7WMvkD3x7QCUM2cDj/l
	cM3DG9QosQ3GvYuuoltVT0YCA5vLNEOaCBugP761Hf53ImzVGmgfJAiS3
	D+c4THwyV0OlzNbp0qnmreBWfce5FvB0S9TVMT5OP7qpyJUfO1lVw4NcX
	S0Tro3he+BZ9g+XH2Wq6V8f8+LlpsbSgZbLKDG1j38UKi4ac8t5sXO9Am Q==;
IronPort-SDR: SqsGmNfQWSa943mIAHYldhJFU7S+jj6QRVbtiL+UJw7asd755u4KyxylPlsY6S7RKKeczzGoRz
	9SDwGKMftj0hlTFI6syJlJ5p8/anzR3xoWUXjCA6igWD7t6+qxMfJLkegsOLOpQ84T58mXRhaJ
	3bpUf0ZTDkMAsHhbL9mbzQu2rkIUz+LM9GeWbpiFiVSKWUqLLDGBqbv1D7jgHdu+zkS45y4QAh
	w3t3jLKvoBiOrrnBE9PK5EtF0S2cmIl7F9BlL3LUzQOX6YYRtNT+OMtjveDtjOixfmFwZ9Zw/g
	MKw=
X-IronPort-AV: E=Sophos;i="5.67,297,1566835200"; d="scan'208";a="121308666"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 15 Oct 2019 08:47:57 +0800
IronPort-SDR: CvrV6I5r+eqR2vql0CbdJc7RXJrE7JERkWjtr5smzYGEK8qGZsNcKXW8riWXDnuOSMqt7GJjQq
	wxI4ObKiq6ldl79z/mvVWdUp6z6nKLWgy5AyeOc1m3+GJjMb63aBgx2U73BQrQjG/pLe1PnT6G
	oYsYarezcCQH2A57vChyfs7yc3Dj2JNhEV9y/ZNHXy2vao55QfExDmR96EwGrHfvXYU7FnW6jb
	tpwkqPmB3C9QYM7NUfPkx/GneWQiWs/IB2+cDQnO0zP/d8l3SndYGf6F2+O9uHb8ClBdMjiViT
	h8UbguKr6JceAoXGzpOKPWFK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	14 Oct 2019 17:43:46 -0700
IronPort-SDR: xB53yoTaeNjBn2jnzJgdgPVL5h8qRScGrquYWgExVoGVXSMZUfrcBM2JbFV5OO2iEAPSzfYBsv
	/7/+NRMDgqj2SuBuJ+SSYyzf1isCrijsCCClJ2tkvCEvemI6PBRbKAo7TFx3CygAcQiPFpOVcY
	r66Zg1dK/7psKUM3mM/3FfZTLwIwBOjL2ljXJH3FozH0wMW96qRTmcANMn4rLH/Yia7ua8HwmX
	yskJvlhEMyd+vbrAU5mshGzyAmPq+Oqj+dxVvBjjQ3uXaIgIw+guseDnBABXEpAveSiZjHFkLm
	m3c=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip02.wdc.com with ESMTP; 14 Oct 2019 17:47:56 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2019 17:43:16 -0700
Message-Id: <20191015004317.21230-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/2] u-boot: Bump from 2019.07 to 2019.10
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
X-List-Received-Date: Tue, 15 Oct 2019 00:48:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v2:
 - Fix musl build failure for u-boot-fw-utils

 .../u-boot/files/0001-CVE-2019-13103.patch    | 69 -------------------
 ...nclude-env.h-Ensure-ulong-is-defined.patch | 31 +++++++++
 .../u-boot/files/0002-CVE-2019-13104.patch    | 49 -------------
 .../u-boot/files/0003-CVE-2019-13105.patch    | 37 ----------
 .../u-boot/files/0004-CVE-2019-13106.patch    | 56 ---------------
 .../0005-CVE-2019-14192-14193-14199.patch     | 43 ------------
 ...-14197-14200-14201-14202-14203-14204.patch | 44 ------------
 .../files/0007-CVE-2019-14194-14198.patch     | 42 -----------
 .../u-boot/files/0008-CVE-2019-14195.patch    | 42 -----------
 .../u-boot/files/0009-CVE-2019-14196.patch    | 48 -------------
 meta/recipes-bsp/u-boot/u-boot-common.inc     | 13 +---
 ..._2019.07.bb => u-boot-fw-utils_2019.10.bb} |  2 +
 ...ols_2019.07.bb => u-boot-tools_2019.10.bb} |  0
 .../{u-boot_2019.07.bb => u-boot_2019.10.bb}  |  0
 14 files changed, 35 insertions(+), 441 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-CVE-2019-13103.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defined.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/0002-CVE-2019-13104.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/0003-CVE-2019-13105.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/0004-CVE-2019-13106.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/0005-CVE-2019-14192-14193-14199.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/0006-CVE-2019-14197-14200-14201-14202-14203-14204.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/0007-CVE-2019-14194-14198.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/0008-CVE-2019-14195.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/0009-CVE-2019-14196.patch
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2019.07.bb => u-boot-fw-utils_2019.10.bb} (93%)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2019.07.bb => u-boot-tools_2019.10.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2019.07.bb => u-boot_2019.10.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/files/0001-CVE-2019-13103.patch b/meta/recipes-bsp/u-boot/files/0001-CVE-2019-13103.patch
deleted file mode 100644
index 1a5d1eb996..0000000000
--- a/meta/recipes-bsp/u-boot/files/0001-CVE-2019-13103.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 39a759494f734c4cdc3e2b919671bfb3134b41ae Mon Sep 17 00:00:00 2001
-From: Paul Emge <paulemge@forallsecure.com>
-Date: Mon, 8 Jul 2019 16:37:03 -0700
-Subject: [PATCH 1/9] CVE-2019-13103: disk: stop infinite recursion in DOS
- Partitions
-
-part_get_info_extended and print_partition_extended can recurse infinitely
-while parsing a self-referential filesystem or one with a silly number of
-extended partitions. This patch adds a limit to the number of recursive
-partitions.
-
-Signed-off-by: Paul Emge <paulemge@forallsecure.com>
-
-Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
-                 h=232e2f4fd9a24bf08215ddc8c53ccadffc841fb5]
-
-CVE: CVE-2019-13103
-
-Signed-off-by: Meng Li <Meng.Li@windriver.com>
----
- disk/part_dos.c | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
-
-diff --git a/disk/part_dos.c b/disk/part_dos.c
-index 936cee0d36..aae9d95906 100644
---- a/disk/part_dos.c
-+++ b/disk/part_dos.c
-@@ -23,6 +23,10 @@
- 
- #define DOS_PART_DEFAULT_SECTOR 512
- 
-+/* should this be configurable? It looks like it's not very common at all
-+ * to use large numbers of partitions */
-+#define MAX_EXT_PARTS 256
-+
- /* Convert char[4] in little endian format to the host format integer
-  */
- static inline unsigned int le32_to_int(unsigned char *le32)
-@@ -126,6 +130,13 @@ static void print_partition_extended(struct blk_desc *dev_desc,
- 	dos_partition_t *pt;
- 	int i;
- 
-+	/* set a maximum recursion level */
-+	if (part_num > MAX_EXT_PARTS)
-+	{
-+		printf("** Nested DOS partitions detected, stopping **\n");
-+		return;
-+    }
-+
- 	if (blk_dread(dev_desc, ext_part_sector, 1, (ulong *)buffer) != 1) {
- 		printf ("** Can't read partition table on %d:" LBAFU " **\n",
- 			dev_desc->devnum, ext_part_sector);
-@@ -191,6 +202,13 @@ static int part_get_info_extended(struct blk_desc *dev_desc,
- 	int i;
- 	int dos_type;
- 
-+	/* set a maximum recursion level */
-+	if (part_num > MAX_EXT_PARTS)
-+	{
-+		printf("** Nested DOS partitions detected, stopping **\n");
-+		return -1;
-+    }
-+
- 	if (blk_dread(dev_desc, ext_part_sector, 1, (ulong *)buffer) != 1) {
- 		printf ("** Can't read partition table on %d:" LBAFU " **\n",
- 			dev_desc->devnum, ext_part_sector);
--- 
-2.17.1
-
diff --git a/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defined.patch b/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defined.patch
new file mode 100644
index 0000000000..b9118164df
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defined.patch
@@ -0,0 +1,31 @@
+From 0565a080d153d5baaaacfeb5045a832e126f4f9e Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Mon, 14 Oct 2019 17:37:30 -0700
+Subject: [PATCH] include/env.h: Ensure ulong is defined
+
+To fix these failures when building with musl:
+   include/env.h:166:1: error: unknown type name 'ulong'; did you mean 'long'?
+ensure that ulong is defined.
+
+Upstream-Status: Pending
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ include/env.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/env.h b/include/env.h
+index b72239f6a5..5ca49a3456 100644
+--- a/include/env.h
++++ b/include/env.h
+@@ -13,6 +13,8 @@
+ #include <stdbool.h>
+ #include <linux/types.h>
+ 
++typedef unsigned long           ulong;
++
+ struct environment_s;
+ 
+ /* Value for environment validity */
+-- 
+2.23.0
+
diff --git a/meta/recipes-bsp/u-boot/files/0002-CVE-2019-13104.patch b/meta/recipes-bsp/u-boot/files/0002-CVE-2019-13104.patch
deleted file mode 100644
index de122b27d0..0000000000
--- a/meta/recipes-bsp/u-boot/files/0002-CVE-2019-13104.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 1d36545e43003f4b1bb3a303a3b468abd482fa2f Mon Sep 17 00:00:00 2001
-From: Paul Emge <paulemge@forallsecure.com>
-Date: Mon, 8 Jul 2019 16:37:05 -0700
-Subject: [PATCH 2/9] CVE-2019-13104: ext4: check for underflow in
- ext4fs_read_file
-
-in ext4fs_read_file, it is possible for a broken/malicious file
-system to cause a memcpy of a negative number of bytes, which
-overflows all memory. This patch fixes the issue by checking for
-a negative length.
-
-Signed-off-by: Paul Emge <paulemge@forallsecure.com>
-
-Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
-                 h=878269dbe74229005dd7f27aca66c554e31dad8e]
-
-CVE: CVE-2019-13104
-
-Signed-off-by: Meng Li <Meng.Li@windriver.com>
----
- fs/ext4/ext4fs.c | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/fs/ext4/ext4fs.c b/fs/ext4/ext4fs.c
-index 26db677a1f..c8c8655ed8 100644
---- a/fs/ext4/ext4fs.c
-+++ b/fs/ext4/ext4fs.c
-@@ -66,13 +66,15 @@ int ext4fs_read_file(struct ext2fs_node *node, loff_t pos,
- 
- 	ext_cache_init(&cache);
- 
--	if (blocksize <= 0)
--		return -1;
--
- 	/* Adjust len so it we can't read past the end of the file. */
- 	if (len + pos > filesize)
- 		len = (filesize - pos);
- 
-+	if (blocksize <= 0 || len <= 0) {
-+		ext_cache_fini(&cache);
-+		return -1;
-+	}
-+
- 	blockcnt = lldiv(((len + pos) + blocksize - 1), blocksize);
- 
- 	for (i = lldiv(pos, blocksize); i < blockcnt; i++) {
--- 
-2.17.1
-
diff --git a/meta/recipes-bsp/u-boot/files/0003-CVE-2019-13105.patch b/meta/recipes-bsp/u-boot/files/0003-CVE-2019-13105.patch
deleted file mode 100644
index f525147e57..0000000000
--- a/meta/recipes-bsp/u-boot/files/0003-CVE-2019-13105.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 4e937d0de669ee69cf41c20494cbf66c339c3174 Mon Sep 17 00:00:00 2001
-From: Paul Emge <paulemge@forallsecure.com>
-Date: Mon, 8 Jul 2019 16:37:04 -0700
-Subject: [PATCH 3/9] CVE-2019-13105: ext4: fix double-free in ext4_cache_read
-
-ext_cache_read doesn't null cache->buf, after freeing, which results
-in a later function double-freeing it. This patch fixes
-ext_cache_read to call ext_cache_fini instead of free.
-
-Signed-off-by: Paul Emge <paulemge@forallsecure.com>
-
-Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
-                 h=6e5a79de658cb1c8012c86e0837379aa6eabd024]
-
-CVE: CVE-2019-13105
-
-Signed-off-by: Meng Li <Meng.Li@windriver.com>
----
- fs/ext4/ext4fs.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/fs/ext4/ext4fs.c b/fs/ext4/ext4fs.c
-index c8c8655ed8..e2b740cac4 100644
---- a/fs/ext4/ext4fs.c
-+++ b/fs/ext4/ext4fs.c
-@@ -288,7 +288,7 @@ int ext_cache_read(struct ext_block_cache *cache, lbaint_t block, int size)
- 	if (!cache->buf)
- 		return 0;
- 	if (!ext4fs_devread(block, 0, size, cache->buf)) {
--		free(cache->buf);
-+		ext_cache_fini(cache);
- 		return 0;
- 	}
- 	cache->block = block;
--- 
-2.17.1
-
diff --git a/meta/recipes-bsp/u-boot/files/0004-CVE-2019-13106.patch b/meta/recipes-bsp/u-boot/files/0004-CVE-2019-13106.patch
deleted file mode 100644
index 8e1a1a9943..0000000000
--- a/meta/recipes-bsp/u-boot/files/0004-CVE-2019-13106.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 1307dabf5422372483f840dda3963f9dbd2e8e6f Mon Sep 17 00:00:00 2001
-From: Paul Emge <paulemge@forallsecure.com>
-Date: Mon, 8 Jul 2019 16:37:07 -0700
-Subject: [PATCH 4/9] CVE-2019-13106: ext4: fix out-of-bounds memset
-
-In ext4fs_read_file in ext4fs.c, a memset can overwrite the bounds of
-the destination memory region. This patch adds a check to disallow
-this.
-
-Signed-off-by: Paul Emge <paulemge@forallsecure.com>
-
-Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
-                 h=e205896c5383c938274262524adceb2775fb03ba]
-
-CVE: CVE-2019-13106
-
-Signed-off-by: Meng Li <Meng.Li@windriver.com>
----
- fs/ext4/ext4fs.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/fs/ext4/ext4fs.c b/fs/ext4/ext4fs.c
-index e2b740cac4..37b31d9f0f 100644
---- a/fs/ext4/ext4fs.c
-+++ b/fs/ext4/ext4fs.c
-@@ -61,6 +61,7 @@ int ext4fs_read_file(struct ext2fs_node *node, loff_t pos,
- 	lbaint_t delayed_skipfirst = 0;
- 	lbaint_t delayed_next = 0;
- 	char *delayed_buf = NULL;
-+	char *start_buf = buf;
- 	short status;
- 	struct ext_block_cache cache;
- 
-@@ -139,6 +140,7 @@ int ext4fs_read_file(struct ext2fs_node *node, loff_t pos,
- 			}
- 		} else {
- 			int n;
-+			int n_left;
- 			if (previous_block_number != -1) {
- 				/* spill */
- 				status = ext4fs_devread(delayed_start,
-@@ -153,8 +155,9 @@ int ext4fs_read_file(struct ext2fs_node *node, loff_t pos,
- 			}
- 			/* Zero no more than `len' bytes. */
- 			n = blocksize - skipfirst;
--			if (n > len)
--				n = len;
-+			n_left = len - ( buf - start_buf );
-+			if (n > n_left)
-+				n = n_left;
- 			memset(buf, 0, n);
- 		}
- 		buf += blocksize - skipfirst;
--- 
-2.17.1
-
diff --git a/meta/recipes-bsp/u-boot/files/0005-CVE-2019-14192-14193-14199.patch b/meta/recipes-bsp/u-boot/files/0005-CVE-2019-14192-14193-14199.patch
deleted file mode 100644
index a19545a2d3..0000000000
--- a/meta/recipes-bsp/u-boot/files/0005-CVE-2019-14192-14193-14199.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From e8e602f4a4b2aacfb3da32bb8a838be15ea70e7b Mon Sep 17 00:00:00 2001
-From: "liucheng (G)" <liucheng32@huawei.com>
-Date: Thu, 29 Aug 2019 13:47:33 +0000
-Subject: [PATCH 5/9] CVE: net: fix unbounded memcpy of UDP packet
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch adds a check to udp_len to fix unbounded memcpy for
-CVE-2019-14192, CVE-2019-14193 and CVE-2019-14199.
-
-Signed-off-by: Cheng Liu <liucheng32@huawei.com>
-Reviewed-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
-Reported-by: Fermín Serna <fermin@semmle.com>
-Acked-by: Joe Hershberger <joe.hershberger@ni.com>
-
-Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
-                 h=fe7288069d2e6659117049f7d27e261b550bb725]
-
-CVE: CVE-2019-14192, CVE-2019-14193 and CVE-2019-14199
-
-Signed-off-by: Meng Li <Meng.Li@windriver.com>
----
- net/net.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/net/net.c b/net/net.c
-index 58b0417cbe..38105f1142 100644
---- a/net/net.c
-+++ b/net/net.c
-@@ -1252,6 +1252,9 @@ void net_process_received_packet(uchar *in_packet, int len)
- 			return;
- 		}
- 
-+		if (ntohs(ip->udp_len) < UDP_HDR_SIZE || ntohs(ip->udp_len) > ntohs(ip->ip_len))
-+			return;
-+
- 		debug_cond(DEBUG_DEV_PKT,
- 			   "received UDP (to=%pI4, from=%pI4, len=%d)\n",
- 			   &dst_ip, &src_ip, len);
--- 
-2.17.1
-
diff --git a/meta/recipes-bsp/u-boot/files/0006-CVE-2019-14197-14200-14201-14202-14203-14204.patch b/meta/recipes-bsp/u-boot/files/0006-CVE-2019-14197-14200-14201-14202-14203-14204.patch
deleted file mode 100644
index 04a09e46df..0000000000
--- a/meta/recipes-bsp/u-boot/files/0006-CVE-2019-14197-14200-14201-14202-14203-14204.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 261658ddaf24bb35edd477cf09ec055569fd9894 Mon Sep 17 00:00:00 2001
-From: "liucheng (G)" <liucheng32@huawei.com>
-Date: Thu, 29 Aug 2019 13:47:40 +0000
-Subject: [PATCH 6/9] CVE: nfs: fix stack-based buffer overflow in some
- nfs_handler reply helper functions
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch adds a check to nfs_handler to fix buffer overflow for CVE-2019-14197,
-CVE-2019-14200, CVE-2019-14201, CVE-2019-14202, CVE-2019-14203 and CVE-2019-14204.
-
-Signed-off-by: Cheng Liu <liucheng32@huawei.com>
-Reported-by: Fermín Serna <fermin@semmle.com>
-Acked-by: Joe Hershberger <joe.hershberger@ni.com>
-
-Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
-                 h=741a8a08ebe5bc3ccfe3cde6c2b44ee53891af21]
-
-CVE: CVE-2019-14197, CVE-2019-14200, CVE-2019-14201, CVE-2019-14202,
-     CVE-2019-14203 and CVE-2019-14204
-
-Signed-off-by: Meng Li <Meng.Li@windriver.com>
----
- net/nfs.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/net/nfs.c b/net/nfs.c
-index d6a7f8e827..b7cf3b3a18 100644
---- a/net/nfs.c
-+++ b/net/nfs.c
-@@ -732,6 +732,9 @@ static void nfs_handler(uchar *pkt, unsigned dest, struct in_addr sip,
- 
- 	debug("%s\n", __func__);
- 
-+	if (len > sizeof(struct rpc_t))
-+		return;
-+
- 	if (dest != nfs_our_port)
- 		return;
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-bsp/u-boot/files/0007-CVE-2019-14194-14198.patch b/meta/recipes-bsp/u-boot/files/0007-CVE-2019-14194-14198.patch
deleted file mode 100644
index b3e3b72ebf..0000000000
--- a/meta/recipes-bsp/u-boot/files/0007-CVE-2019-14194-14198.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From fb6dc193bf2685b7574b218f7ca558aa54659e11 Mon Sep 17 00:00:00 2001
-From: "liucheng (G)" <liucheng32@huawei.com>
-Date: Thu, 29 Aug 2019 13:47:48 +0000
-Subject: [PATCH 7/9] CVE-2019-14194/CVE-2019-14198: nfs: fix unbounded memcpy
- with a failed length check at nfs_read_reply
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch adds a check to rpc_pkt.u.reply.data at nfs_read_reply.
-
-Signed-off-by: Cheng Liu <liucheng32@huawei.com>
-Reported-by: Fermín Serna <fermin@semmle.com>
-Acked-by: Joe Hershberger <joe.hershberger@ni.com>
-
-Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
-                 h=aa207cf3a6d68f39d64cd29057a4fb63943e9078]
-
-CVE: CVE-2019-14194 and CVE-2019-14198
-
-Signed-off-by: Meng Li <Meng.Li@windriver.com>
----
- net/nfs.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/net/nfs.c b/net/nfs.c
-index b7cf3b3a18..11941fad1a 100644
---- a/net/nfs.c
-+++ b/net/nfs.c
-@@ -701,6 +701,9 @@ static int nfs_read_reply(uchar *pkt, unsigned len)
- 			&(rpc_pkt.u.reply.data[4 + nfsv3_data_offset]);
- 	}
- 
-+	if (((uchar *)&(rpc_pkt.u.reply.data[0]) - (uchar *)(&rpc_pkt) + rlen) > len)
-+			return -9999;
-+
- 	if (store_block(data_ptr, nfs_offset, rlen))
- 			return -9999;
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-bsp/u-boot/files/0008-CVE-2019-14195.patch b/meta/recipes-bsp/u-boot/files/0008-CVE-2019-14195.patch
deleted file mode 100644
index bf9fb0ef52..0000000000
--- a/meta/recipes-bsp/u-boot/files/0008-CVE-2019-14195.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 2236973b8a173ff54ae1ebf8ec2300928e69bd1b Mon Sep 17 00:00:00 2001
-From: "liucheng (G)" <liucheng32@huawei.com>
-Date: Thu, 29 Aug 2019 13:47:54 +0000
-Subject: [PATCH 8/9] CVE-2019-14195: nfs: fix unbounded memcpy with
- unvalidated length at nfs_readlink_reply
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch adds a check to rpc_pkt.u.reply.data at nfs_readlink_reply.
-
-Signed-off-by: Cheng Liu <liucheng32@huawei.com>
-Reported-by: Fermín Serna <fermin@semmle.com>
-Acked-by: Joe Hershberger <joe.hershberger@ni.com>
-
-Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
-                 h=cf3a4f1e86ecdd24f87b615051b49d8e1968c230]
-
-CVE: CVE-2019-14195
-
-Signed-off-by: Meng Li <Meng.Li@windriver.com>
----
- net/nfs.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/net/nfs.c b/net/nfs.c
-index 11941fad1a..915acd95cf 100644
---- a/net/nfs.c
-+++ b/net/nfs.c
-@@ -634,6 +634,9 @@ static int nfs_readlink_reply(uchar *pkt, unsigned len)
- 	/* new path length */
- 	rlen = ntohl(rpc_pkt.u.reply.data[1 + nfsv3_data_offset]);
- 
-+	if (((uchar *)&(rpc_pkt.u.reply.data[0]) - (uchar *)(&rpc_pkt) + rlen) > len)
-+		return -NFS_RPC_DROP;
-+
- 	if (*((char *)&(rpc_pkt.u.reply.data[2 + nfsv3_data_offset])) != '/') {
- 		int pathlen;
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-bsp/u-boot/files/0009-CVE-2019-14196.patch b/meta/recipes-bsp/u-boot/files/0009-CVE-2019-14196.patch
deleted file mode 100644
index f06e025297..0000000000
--- a/meta/recipes-bsp/u-boot/files/0009-CVE-2019-14196.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 74c468caa95c86cdb12c4b8073e154c435ac0bf7 Mon Sep 17 00:00:00 2001
-From: "liucheng (G)" <liucheng32@huawei.com>
-Date: Thu, 29 Aug 2019 13:48:02 +0000
-Subject: [PATCH 9/9] CVE-2019-14196: nfs: fix unbounded memcpy with a failed
- length check at nfs_lookup_reply
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch adds a check to rpc_pkt.u.reply.data at nfs_lookup_reply.
-
-Signed-off-by: Cheng Liu <liucheng32@huawei.com>
-Reported-by: Fermín Serna <fermin@semmle.com>
-Acked-by: Joe Hershberger <joe.hershberger@ni.com>
-
-Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
-                 h=5d14ee4e53a81055d34ba280cb8fd90330f22a96]
-
-CVE: CVE-2019-14196
-
-Signed-off-by: Meng Li <Meng.Li@windriver.com>
----
- net/nfs.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/net/nfs.c b/net/nfs.c
-index 915acd95cf..89952aeb66 100644
---- a/net/nfs.c
-+++ b/net/nfs.c
-@@ -566,11 +566,15 @@ static int nfs_lookup_reply(uchar *pkt, unsigned len)
- 	}
- 
- 	if (supported_nfs_versions & NFSV2_FLAG) {
-+		if (((uchar *)&(rpc_pkt.u.reply.data[0]) - (uchar *)(&rpc_pkt) + NFS_FHSIZE) > len)
-+			return -NFS_RPC_DROP;
- 		memcpy(filefh, rpc_pkt.u.reply.data + 1, NFS_FHSIZE);
- 	} else {  /* NFSV3_FLAG */
- 		filefh3_length = ntohl(rpc_pkt.u.reply.data[1]);
- 		if (filefh3_length > NFS3_FHSIZE)
- 			filefh3_length  = NFS3_FHSIZE;
-+		if (((uchar *)&(rpc_pkt.u.reply.data[0]) - (uchar *)(&rpc_pkt) + filefh3_length) > len)
-+			return -NFS_RPC_DROP;
- 		memcpy(filefh, rpc_pkt.u.reply.data + 2, filefh3_length);
- 	}
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index f63dfa3b73..c3e458e925 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,18 +12,9 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "e5aee22e4be75e75a854ab64503fc80598bc2004"
+SRCREV = "61ba1244b548463dbfb3c5285b6b22e7c772c5bd"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
-           file://0001-CVE-2019-13103.patch \
-           file://0002-CVE-2019-13104.patch \
-           file://0003-CVE-2019-13105.patch \
-           file://0004-CVE-2019-13106.patch \
-           file://0005-CVE-2019-14192-14193-14199.patch \
-           file://0006-CVE-2019-14197-14200-14201-14202-14203-14204.patch \
-           file://0007-CVE-2019-14194-14198.patch \
-           file://0008-CVE-2019-14195.patch \
-           file://0009-CVE-2019-14196.patch \
-"
+          "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.10.bb
similarity index 93%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.10.bb
index b5ce56847b..04321b7b66 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.10.bb
@@ -3,6 +3,8 @@ require u-boot-common.inc
 SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
 DEPENDS += "mtd-utils"
 
+SRC_URI += "file://0001-include-env.h-Ensure-ulong-is-defined.patch"
+
 INSANE_SKIP_${PN} = "already-stripped"
 EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" V=1'
 EXTRA_OEMAKE_class-cross = 'HOSTCC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2019.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2019.10.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2019.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2019.10.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2019.07.bb b/meta/recipes-bsp/u-boot/u-boot_2019.10.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2019.07.bb
rename to meta/recipes-bsp/u-boot/u-boot_2019.10.bb
-- 
2.23.0


