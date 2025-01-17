Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155A3C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 06:34:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5511.1737095644423883522
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 22:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3112575f3e=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50H53gES024045
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 06:34:03 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 446wf7h7dg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 06:34:03 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 16 Jan 2025 22:34:01 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 16 Jan 2025 22:34:00 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCH 1/1] rsync: upgrade 3.3.0 -> 3.4.1
Date: Fri, 17 Jan 2025 06:33:58 +0000
Message-ID: <20250117063358.731606-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 9yXhhjjzrqSIGosuf_xfxyEOGrW-t1jF
X-Authority-Analysis: v=2.4 cv=X8moKHTe c=1 sm=1 tr=0 ts=6789f9db cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=hGzw-44bAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8
 a=nAfzVDAiAAAA:8 a=zYeTIwrI00KFcQGnOAIA:9 a=F7mDGgsl5lMA:10 a=HvKuF1_PTVFglORKqfwH:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=6NcUnlDuP-xAuRjE5D5D:22
X-Proofpoint-GUID: 9yXhhjjzrqSIGosuf_xfxyEOGrW-t1jF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_02,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501170050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 06:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209976

From: Archana Polampalli <archana.polampalli@windriver.com>

CVEs addressed in this release:
CVE-2024-12084
CVE-2024-12085
CVE-2024-12086
CVE-2024-12087
CVE-2024-12088
CVE-2024-12747

Refreshed below patches:
makefile-no-rebuild.patch
determism.patch
0001-Add-missing-prototypes-to-function-declarations.patch

Changelog:
https://github.com/RsyncProject/rsync/blob/v3.4.1/NEWS.md
https://github.com/RsyncProject/rsync/blob/v3.4.0/NEWS.md

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...-prototypes-to-function-declarations.patch | 69 ++++---------------
 .../rsync/files/determism.patch               | 20 ++++--
 .../rsync/files/makefile-no-rebuild.patch     | 10 +--
 .../rsync/{rsync_3.3.0.bb => rsync_3.4.1.bb}  |  2 +-
 4 files changed, 32 insertions(+), 69 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.3.0.bb => rsync_3.4.1.bb} (96%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index 2379de84f2..3011308c61 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 2beb35c34c45320144f37b12ef4d72fb8734280e Mon Sep 17 00:00:00 2001
+From 073caa67f2aa221de113a21f8105940421a2da90 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -15,21 +15,19 @@ Fixes errors like
 
 Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/032858.html]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
- checksum.c       | 2 +-
- exclude.c        | 2 +-
- hlink.c          | 3 +--
- lib/pool_alloc.c | 2 +-
- log.c            | 2 +-
- main.c           | 2 +-
- syscall.c        | 4 ++--
- zlib/crc32.c     | 2 +-
- zlib/trees.c     | 2 +-
- zlib/zutil.c     | 4 ++--
- 10 files changed, 12 insertions(+), 13 deletions(-)
+ checksum.c   | 2 +-
+ exclude.c    | 2 +-
+ log.c        | 2 +-
+ main.c       | 2 +-
+ zlib/crc32.c | 2 +-
+ zlib/trees.c | 2 +-
+ zlib/zutil.c | 4 ++--
+ 7 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/checksum.c b/checksum.c
-index cb21882..736818b 100644
+index 66e8089..b24b202 100644
 --- a/checksum.c
 +++ b/checksum.c
 @@ -779,7 +779,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
@@ -54,33 +52,6 @@ index 87edbcf..ae0de2f 100644
  {
  	if (partial_string_buf) {
  		if (partial_string_len)
-diff --git a/hlink.c b/hlink.c
-index 20291f2..5c26a6b 100644
---- a/hlink.c
-+++ b/hlink.c
-@@ -117,8 +117,7 @@ static void match_gnums(int32 *ndx_list, int ndx_count)
- 	struct ht_int32_node *node = NULL;
- 	int32 gnum, gnum_next;
- 
--	qsort(ndx_list, ndx_count, sizeof ndx_list[0], (int (*)()) hlink_compare_gnum);
--
-+	qsort(ndx_list, ndx_count, sizeof ndx_list[0], (int (*)(const void *, const void *)) hlink_compare_gnum);
- 	for (from = 0; from < ndx_count; from++) {
- 		file = hlink_flist->sorted[ndx_list[from]];
- 		gnum = F_HL_GNUM(file);
-diff --git a/lib/pool_alloc.c b/lib/pool_alloc.c
-index a1a7245..4eae062 100644
---- a/lib/pool_alloc.c
-+++ b/lib/pool_alloc.c
-@@ -9,7 +9,7 @@ struct alloc_pool
- 	size_t			size;		/* extent size		*/
- 	size_t			quantum;	/* allocation quantum	*/
- 	struct pool_extent	*extents;	/* top extent is "live" */
--	void			(*bomb)();	/* called if malloc fails */
-+	void			(*bomb)(const char *, const char *, int);	/* called if malloc fails */
- 	int			flags;
- 
- 	/* statistical data */
 diff --git a/log.c b/log.c
 index e4ba1cc..8482b71 100644
 --- a/log.c
@@ -95,7 +66,7 @@ index e4ba1cc..8482b71 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index 0c60b86..4bc664a 100644
+index 4f070ac..f59eaec 100644
 --- a/main.c
 +++ b/main.c
 @@ -246,7 +246,7 @@ void read_del_stats(int f)
@@ -107,22 +78,6 @@ index 0c60b86..4bc664a 100644
  {
  	char *gname;
  	uid_t uid;
-diff --git a/syscall.c b/syscall.c
-index d92074a..92ca86d 100644
---- a/syscall.c
-+++ b/syscall.c
-@@ -389,9 +389,9 @@ OFF_T do_lseek(int fd, OFF_T offset, int whence)
- {
- #ifdef HAVE_LSEEK64
- #if !SIZEOF_OFF64_T
--	OFF_T lseek64();
-+	OFF_T lseek64(int fd, OFF_T offset, int whence);
- #else
--	off64_t lseek64();
-+	off64_t lseek64(int fd, off64_t offset, int whence);
- #endif
- 	return lseek64(fd, offset, whence);
- #else
 diff --git a/zlib/crc32.c b/zlib/crc32.c
 index 05733f4..50c6c02 100644
 --- a/zlib/crc32.c
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
index e3494fdded..f915d658c8 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,7 +1,12 @@
+From 41b859a9df9611b7b3f6cbe28af47118d947080f Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Sun, 21 Feb 2021 09:45:48 +0000
+Subject: [PATCH] rsync: Fix a file sorting determinism issue
+
 The Makefile calls awk on a "*.c" glob. The results of this glob are sorted
 but the order depends on the locale settings, particularly whether
 "util.c" and "util2.c" sort before or after each other. In en_US.UTF-8
-they sort one way, in C, they sort the other. The sorting order changes 
+they sort one way, in C, they sort the other. The sorting order changes
 the output binaries. The behaviour also changes dependning on whether
 SHELL (/bin/sh) is dash or bash.
 
@@ -15,12 +20,15 @@ Upstream-Status: Backport [ish, see below]
 After discussion upstream renamed util.c to util1.c which avoids the problem
 in a different way. This patch can be dropped when we upgrade to include:
 https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
+---
+ Makefile.in | 5 +++++
+ 1 file changed, 5 insertions(+)
 
-Index: rsync-3.2.3/Makefile.in
-===================================================================
---- rsync-3.2.3.orig/Makefile.in
-+++ rsync-3.2.3/Makefile.in
-@@ -26,6 +26,11 @@ MKDIR_P=@MKDIR_P@
+diff --git a/Makefile.in b/Makefile.in
+index 1d13e8c..2c5cf99 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -27,6 +27,11 @@ MKDIR_P=@MKDIR_P@
  VPATH=$(srcdir)
  SHELL=/bin/sh
  
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 0c9ce8b8e3..42af4c55d0 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From f446686c26c499e15ef17d495a93cfbc20e16090 Mon Sep 17 00:00:00 2001
+From 603e5862cca832ae925d0c92a8654a57caff5910 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,12 +13,12 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index a1253e5..a084935 100644
+index 7c75c26..1d13e8c 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -192,60 +192,6 @@ gensend: gen
- 	fi
- 	rsync -aic $(GENFILES) git-version.h $${SAMBA_HOST-samba.org}:/home/ftp/pub/rsync/generated-files/ || true
+@@ -184,60 +184,6 @@ conf: configure.sh config.h.in
+ .PHONY: gen
+ gen: conf proto.h man git-version.h
  
 -aclocal.m4: $(srcdir)/m4/*.m4
 -	aclocal -I $(srcdir)/m4
diff --git a/meta/recipes-devtools/rsync/rsync_3.3.0.bb b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
similarity index 96%
rename from meta/recipes-devtools/rsync/rsync_3.3.0.bb
rename to meta/recipes-devtools/rsync/rsync_3.4.1.bb
index c03bb270d4..2cf87d379a 100644
--- a/meta/recipes-devtools/rsync/rsync_3.3.0.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            "
-SRC_URI[sha256sum] = "7399e9a6708c32d678a72a63219e96f23be0be2336e50fd1348498d07041df90"
+SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
 
 # Doesn't use automake
 inherit autotools-brokensep
-- 
2.40.0


