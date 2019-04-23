Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id F10196C42C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 01:59:48 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id l23so1377179lja.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 18:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=8i0SSD97LtvFV65YW/tK/G5RuMGFSsLB2h0ReOg+v30=;
	b=ZCBrQPXJzDOej+7DOLToPf5M/wFwNSCAPMt/oAJLsgL3jYh/qqBwaD4np3qaUXOeU6
	w3dmzDax6+k8HCKUWAAt4r9K2YDST6MqwDbyGQl+8GyfpWQN5I6oOW5Yp6f4WiyfOOeY
	TMxlvP5FcWblJXYYL+8FrI04Qm2pt1IsQzmUWg8e4MR290XYmuqx3nblq0n5toA8j/KZ
	/rTJp5p+O00i/U3sMbAvrQPC+Wo+NEvoNEUqJ+rKQzCMYS4gR1fxEn0QiGrFSdQ5YQDg
	/cmkR4VW/uo3hCLDdTesoLLV1eq1PN/Or8GHJ/A7eshB0el21pU9j2S6GTH2UdL2XfTf
	WZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8i0SSD97LtvFV65YW/tK/G5RuMGFSsLB2h0ReOg+v30=;
	b=Gu5tzbgsUDmeEAFPQizwSWK8OAE3jDZiNALn/PR7ah/zC/iilUAjUPy5N+3XFhfwDl
	qTrfR2K6jvVvzjt2VrLP3tdBI+jorCeoR2nw2bSrQ03U5+VI/YHX2aECNA1AO7NgjfyT
	byQbCKhM4+yaHwRVFkLyMz9BltxhbPpQrvKeBqZeXkw8rgVBmRNlwgfpqfHRiyuj4xzJ
	isqzO27jvoAwCZ4y8D6A5TISTVOFT/jFPbUm5ynBUSv4m8UTwJXzzCMvzSUpeEZPaOeD
	co+jbNREuS/BqwkvwKIu7gG29gV0KFSIakLxw/4MA1uszFgThGSWPOgJLubh3njW+FFB
	xgOg==
X-Gm-Message-State: APjAAAVx81bCm703DM+D5H2XiD7Cwsj/IIdll+H5wrw82gqQpADgIppq
	eyQxgPxxAxki4cl5pVljJFnd2hZ4dNg=
X-Google-Smtp-Source: APXvYqz8kEb1v7nk3NWPrCinRsFUJa5YUweM2hwXXO0SHl41Be6J6rFYdSxtRQL70QFKSr4giMY3jg==
X-Received: by 2002:a2e:9a91:: with SMTP id p17mr11220509lji.127.1555984788555;
	Mon, 22 Apr 2019 18:59:48 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z13sm2965192ljk.41.2019.04.22.18.59.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 18:59:47 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 03:59:39 +0200
Message-Id: <20190423015939.24993-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] quota: update to 4.05
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
X-List-Received-Date: Tue, 23 Apr 2019 01:59:49 -0000

License checksum from quota.c was removed since according to the
project, copyrighted code in question has been replaced with own
implementation (see @bcbc0d08e5cd).

Removed patches were upstreamed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-extended/quota/quota/fcntl.patch |  48 ++---
 .../quota/quota/remove_non_posix_types.patch  | 198 ------------------
 .../quota/replace_getrpcbynumber_r.patch      |  32 ---
 .../quota/{quota_4.04.bb => quota_4.05.bb}    |  10 +-
 4 files changed, 20 insertions(+), 268 deletions(-)
 delete mode 100644 meta/recipes-extended/quota/quota/remove_non_posix_types.patch
 delete mode 100644 meta/recipes-extended/quota/quota/replace_getrpcbynumber_r.patch
 rename meta/recipes-extended/quota/{quota_4.04.bb => quota_4.05.bb} (76%)

diff --git a/meta/recipes-extended/quota/quota/fcntl.patch b/meta/recipes-extended/quota/quota/fcntl.patch
index 2d37971321..51a770ce6e 100644
--- a/meta/recipes-extended/quota/quota/fcntl.patch
+++ b/meta/recipes-extended/quota/quota/fcntl.patch
@@ -9,13 +9,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-ndex: quota-tools/quota.h
-===================================================================
-Index: quota-tools/quota.h
-===================================================================
---- quota-tools.orig/quota.h
-+++ quota-tools/quota.h
-@@ -165,6 +165,6 @@ enum {
+diff --git a/quota.h b/quota.h
+index 4c21411..d20c217 100644
+--- a/quota.h
++++ b/quota.h
+@@ -182,6 +182,6 @@ enum {
  	#endif
  #endif
  
@@ -23,10 +21,10 @@ Index: quota-tools/quota.h
 +long quotactl (int, const char *, qid_t, caddr_t);
  
  #endif /* _QUOTA_ */
-Index: quota-tools/quotacheck.c
-===================================================================
---- quota-tools.orig/quotacheck.c
-+++ quota-tools/quotacheck.c
+diff --git a/quotacheck.c b/quotacheck.c
+index 2cdf475..07c18a7 100644
+--- a/quotacheck.c
++++ b/quotacheck.c
 @@ -19,6 +19,7 @@
  #include <unistd.h>
  #include <stdlib.h>
@@ -35,10 +33,10 @@ Index: quota-tools/quotacheck.c
  
  #include <sys/stat.h>
  #include <sys/types.h>
-Index: quota-tools/quotaio.c
-===================================================================
---- quota-tools.orig/quotaio.c
-+++ quota-tools/quotaio.c
+diff --git a/quotaio.c b/quotaio.c
+index 94ae458..d57fc1a 100644
+--- a/quotaio.c
++++ b/quotaio.c
 @@ -12,6 +12,7 @@
  #include <string.h>
  #include <unistd.h>
@@ -47,22 +45,10 @@ Index: quota-tools/quotaio.c
  #include <sys/types.h>
  #include <sys/stat.h>
  #include <sys/file.h>
-Index: quota-tools/dqblk_v2.h
-===================================================================
---- quota-tools.orig/dqblk_v2.h
-+++ quota-tools/dqblk_v2.h
-@@ -7,6 +7,7 @@
- #ifndef GUARD_DQBLK_V2_H
- #define GUARD_DQBLK_V2_H
- 
-+#include <fcntl.h>
- #include <sys/types.h>
- #include "quota_tree.h"
- 
-Index: quota-tools/rquota_client.c
-===================================================================
---- quota-tools.orig/rquota_client.c
-+++ quota-tools/rquota_client.c
+diff --git a/rquota_client.c b/rquota_client.c
+index a3a4ae3..0ffe7a9 100644
+--- a/rquota_client.c
++++ b/rquota_client.c
 @@ -19,7 +19,9 @@
  
  #include "config.h"
diff --git a/meta/recipes-extended/quota/quota/remove_non_posix_types.patch b/meta/recipes-extended/quota/quota/remove_non_posix_types.patch
deleted file mode 100644
index 06ff13cb98..0000000000
--- a/meta/recipes-extended/quota/quota/remove_non_posix_types.patch
+++ /dev/null
@@ -1,198 +0,0 @@
-Use proper C99 integer types
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: quota-tools/bylabel.c
-===================================================================
---- quota-tools.orig/bylabel.c
-+++ quota-tools/bylabel.c
-@@ -20,6 +20,7 @@
- #include <ctype.h>
- #include <fcntl.h>
- #include <unistd.h>
-+#include <stdint.h>
- 
- #include "bylabel.h"
- #include "common.h"
-@@ -37,32 +38,32 @@ static struct uuidCache_s {
- 
- #define EXT2_SUPER_MAGIC	0xEF53
- struct ext2_super_block {
--	u_char s_dummy1[56];
--	u_char s_magic[2];
--	u_char s_dummy2[46];
--	u_char s_uuid[16];
--	u_char s_volume_name[16];
-+	uint8_t s_dummy1[56];
-+	uint8_t s_magic[2];
-+	uint8_t s_dummy2[46];
-+	uint8_t s_uuid[16];
-+	uint8_t s_volume_name[16];
- };
- 
--#define ext2magic(s)	((uint) s.s_magic[0] + (((uint) s.s_magic[1]) << 8))
-+#define ext2magic(s)	((uint32_t) s.s_magic[0] + (((uint32_t) s.s_magic[1]) << 8))
- 
- #define XFS_SUPER_MAGIC "XFSB"
- #define XFS_SUPER_MAGIC2 "BSFX"
- struct xfs_super_block {
--	u_char s_magic[4];
--	u_char s_dummy[28];
--	u_char s_uuid[16];
--	u_char s_dummy2[60];
--	u_char s_fsname[12];
-+	uint8_t s_magic[4];
-+	uint8_t s_dummy[28];
-+	uint8_t s_uuid[16];
-+	uint8_t s_dummy2[60];
-+	uint8_t s_fsname[12];
- };
- 
- #define REISER_SUPER_MAGIC	"ReIsEr2Fs"
- struct reiserfs_super_block {
--	u_char s_dummy1[52];
--	u_char s_magic[10];
--	u_char s_dummy2[22];
--	u_char s_uuid[16];
--	u_char s_volume_name[16];
-+	uint8_t s_dummy1[52];
-+	uint8_t s_magic[10];
-+	uint8_t s_dummy2[22];
-+	uint8_t s_uuid[16];
-+	uint8_t s_volume_name[16];
- };
- 
- static inline unsigned short swapped(unsigned short a)
-@@ -222,7 +223,7 @@ static char *get_spec_by_x(int n, const
- 	return NULL;
- }
- 
--static u_char fromhex(char c)
-+static uint8_t fromhex(char c)
- {
- 	if (isdigit(c))
- 		return (c - '0');
-@@ -234,7 +235,7 @@ static u_char fromhex(char c)
- 
- static char *get_spec_by_uuid(const char *s)
- {
--	u_char uuid[16];
-+	uint8_t uuid[16];
- 	int i;
- 
- 	if (strlen(s) != 36 || s[8] != '-' || s[13] != '-' || s[18] != '-' || s[23] != '-')
-Index: quota-tools/quot.c
-===================================================================
---- quota-tools.orig/quot.c
-+++ quota-tools/quot.c
-@@ -47,6 +47,7 @@
- #include <utmp.h>
- #include <pwd.h>
- #include <grp.h>
-+#include <stdint.h>
- 
- #include "pot.h"
- #include "quot.h"
-@@ -56,8 +57,8 @@
- #include "quotasys.h"
- 
- #define	TSIZE	500
--static __uint64_t sizes[TSIZE];
--static __uint64_t overflow;
-+static uint64_t sizes[TSIZE];
-+static uint64_t overflow;
- 
- static int aflag;
- static int cflag;
-@@ -72,7 +73,7 @@ static time_t now;
- char *progname;
- 
- static void mounttable(void);
--static char *idname(__uint32_t, int);
-+static char *idname(uint32_t, int);
- static void report(const char *, const char *, int);
- static void creport(const char *, const char *);
- 
-@@ -173,7 +174,7 @@ static int qcmp(du_t * p1, du_t * p2)
- static void creport(const char *file, const char *fsdir)
- {
- 	int i;
--	__uint64_t t = 0;
-+	uint64_t t = 0;
- 
- 	printf(_("%s (%s):\n"), file, fsdir);
- 	for (i = 0; i < TSIZE - 1; i++)
-@@ -219,7 +220,7 @@ static void report(const char *file, con
- 	}
- }
- 
--static idcache_t *getnextent(int type, __uint32_t id, int byid)
-+static idcache_t *getnextent(int type, uint32_t id, int byid)
- {
- 	struct passwd *pw;
- 	struct group  *gr;
-@@ -240,7 +241,7 @@ static idcache_t *getnextent(int type, _
- 	return &idc;
- }
- 
--static char *idname(__uint32_t id, int type)
-+static char *idname(uint32_t id, int type)
- {
- 	idcache_t *ncp, *idp;
- 	static idcache_t nc[2][NID];
-@@ -286,8 +287,8 @@ static void acctXFS(xfs_bstat_t *p)
- {
- 	register du_t *dp;
- 	du_t **hp;
--	__uint64_t size;
--	__uint32_t i, id;
-+	uint64_t size;
-+	uint32_t i, id;
- 
- 	if ((p->bs_mode & S_IFMT) == 0)
- 		return;
-Index: quota-tools/quot.h
-===================================================================
---- quota-tools.orig/quot.h
-+++ quota-tools/quot.h
-@@ -35,18 +35,18 @@
- #define	SEC24HR	(60*60*24)	/* seconds per day */
- 
- typedef struct {
--	__uint32_t id;
-+	uint32_t id;
- 	char name[UT_NAMESIZE + 1];
- } idcache_t;
- 
- typedef struct du {
- 	struct du *next;
--	__uint64_t blocks;
--	__uint64_t blocks30;
--	__uint64_t blocks60;
--	__uint64_t blocks90;
--	__uint64_t nfiles;
--	__uint32_t id;
-+	uint64_t blocks;
-+	uint64_t blocks30;
-+	uint64_t blocks60;
-+	uint64_t blocks90;
-+	uint64_t nfiles;
-+	uint32_t id;
- } du_t;
- 
- #define	NDU	60000
-Index: quota-tools/rquota_server.c
-===================================================================
---- quota-tools.orig/rquota_server.c
-+++ quota-tools/rquota_server.c
-@@ -60,7 +60,7 @@ extern char nfs_pseudoroot[PATH_MAX];
-  */
- extern struct authunix_parms *unix_cred;
- 
--int in_group(gid_t * gids, u_int len, gid_t gid)
-+int in_group(gid_t * gids, uint32_t len, gid_t gid)
- {
- 	gid_t *gidsp = gids + len;
- 
diff --git a/meta/recipes-extended/quota/quota/replace_getrpcbynumber_r.patch b/meta/recipes-extended/quota/quota/replace_getrpcbynumber_r.patch
deleted file mode 100644
index 4687ca06f5..0000000000
--- a/meta/recipes-extended/quota/quota/replace_getrpcbynumber_r.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a3808fd165847298d025971eb3c7be7d11caba9d Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Wed, 8 Nov 2017 11:56:55 +0200
-Subject: [PATCH] Replace getrpcbynumber_r with getrpcbynumber
-
-musl and uclibc dont implement it
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- svc_socket.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/svc_socket.c b/svc_socket.c
-index 8a44604..5bdaaa0 100644
---- a/svc_socket.c
-+++ b/svc_socket.c
-@@ -36,7 +36,8 @@ static int get_service_port(u_long number, const char *proto)
- 	struct servent servbuf, *servp = NULL;
- 	int ret;
- 
--	ret = getrpcbynumber_r(number, &rpcbuf, rpcdata, sizeof(rpcdata), &rpcp);
-+    rpcp = getrpcbynumber(number);
-+    ret = 0;
- 	if (ret == 0 && rpcp != NULL) {
- 		/* First try name */
- 		ret = getservbyname_r(rpcp->r_name, proto, &servbuf, servdata,
--- 
-2.4.0
-
diff --git a/meta/recipes-extended/quota/quota_4.04.bb b/meta/recipes-extended/quota/quota_4.05.bb
similarity index 76%
rename from meta/recipes-extended/quota/quota_4.04.bb
rename to meta/recipes-extended/quota/quota_4.05.bb
index 93f376286a..c5da1e71ed 100644
--- a/meta/recipes-extended/quota/quota_4.04.bb
+++ b/meta/recipes-extended/quota/quota_4.05.bb
@@ -3,18 +3,14 @@ SECTION = "base"
 HOMEPAGE = "http://sourceforge.net/projects/linuxquota/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=18136&atid=118136"
 LICENSE = "BSD & GPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://quota.c;beginline=1;endline=33;md5=331c7d77744bfe0ad24027f0651028ec \
-                    file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11c6f820f8fa62a5af71230f \
+LIC_FILES_CHKSUM = "file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11c6f820f8fa62a5af71230f \
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz \
            file://fcntl.patch \
-           file://remove_non_posix_types.patch \
           "
-SRC_URI_append_libc-musl = " file://replace_getrpcbynumber_r.patch"
-
-SRC_URI[md5sum] = "f46f3b0b5141f032f25684005dac49d3"
-SRC_URI[sha256sum] = "735be1887e7f51f54165e778ae43fc859c04e44d88834ecb2f470e91d4ef8edf"
+SRC_URI[md5sum] = "1c1dbd2cd3d680ccac661239b067e147"
+SRC_URI[sha256sum] = "ef3b5b5d1014ed1344b46c1826145e20cbef8db967b522403c9a060761cf7ab9"
 
 CVE_PRODUCT = "linux_diskquota"
 
-- 
2.17.1


