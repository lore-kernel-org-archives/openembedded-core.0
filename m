Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5075F6C376
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 16:18:06 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id k8so5905689lja.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 09:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=wDQkmVR/YzD3X6Ld6uM82tNjYfNbLRZiN8a+3TDKogI=;
	b=edw8iEnH+Vuvut9wL5UU85LBCtHXlXvW3AZlCfIlbdqBAKxopugD/qb/tpA/DfTHpd
	+U0fPqR49UowcDuXkMOIfcal18Jtn9feZj3J5+IW/Ci8fSTAkkh4LyzXD0PsbLl2hzzd
	ZcIzQFOyxA34PXtmEeTfAQMoKtSYUzTTvj7lnoe8F0AJuCgoH+Pkk49mV0g8sGcYuDDM
	/8Pc7Qp+2OXiwjNLOn4c7rq6HZxpicRS3kNvAbUbTLgq+l+z0ikFAXBgDvtMOgTOAphX
	aTTEPVXar7blncqWdt/QCLYjTjcRN/b/5+Cf49PLTJ101o5WXKLfMPkLelFkTZaB3I+l
	uUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wDQkmVR/YzD3X6Ld6uM82tNjYfNbLRZiN8a+3TDKogI=;
	b=mksw47UCl0mELDlRogSFuxuBvhkwmf6S9rdEqkO5ttbTM8LMqkInkDuvG5ok88rhUl
	eKG/X997KN8YNgS++7rqUSPikIxZdtDEaMstlE0k2eMcKKHRLtr29+HYx9h8jK/8i+SJ
	piyh0ssaUrII/t83EiNhWG94eNz/oQWKP08ue4vVh0cS9vaXFonpU12/kSIi5++WPOLR
	HL9TvOjFxI6q2SsoxlJi3JQfRj1Y8nPNI4v21SiFNvhkCDlAf5iUnHRNz1O4p2AC1Rae
	gI8ara+ZNRnCYwG9v4OS29klqH0LkITUZDsK9QUEk1f1qsjVN6/eNstBcozVR5yn6LAW
	rMZA==
X-Gm-Message-State: APjAAAWsvX8TNRfLdl1beoqX/SWEiv+8f0R5grnFzWd3DMRxJZ4huLEY
	3HckU7urMk/Gz4En1RPauxFUHhHWAjY=
X-Google-Smtp-Source: APXvYqxgx0OMqVPOf03kxoVuxyalwdJXGD42lv/ucct8OboSO63tRgS75GG7ck3zTNTd0XLZTtMVXw==
X-Received: by 2002:a2e:9010:: with SMTP id h16mr23493938ljg.16.1554049086703; 
	Sun, 31 Mar 2019 09:18:06 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	v11sm1347878lfb.68.2019.03.31.09.18.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 09:18:06 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 31 Mar 2019 18:17:57 +0200
Message-Id: <20190331161757.12888-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] quote: update to 4.05
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
X-List-Received-Date: Sun, 31 Mar 2019 16:18:07 -0000

License checksum from quota.c was removed since according to the
project, copyrighted code in question has been replaced with own
implementation (see @bcbc0d08e5cd).

Removed patch has been upstreamed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../quota/quota/remove_non_posix_types.patch  | 198 ------------------
 .../quota/{quota_4.04.bb => quota_4.05.bb}    |   8 +-
 2 files changed, 3 insertions(+), 203 deletions(-)
 delete mode 100644 meta/recipes-extended/quota/quota/remove_non_posix_types.patch
 rename meta/recipes-extended/quota/{quota_4.04.bb => quota_4.05.bb} (80%)

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
diff --git a/meta/recipes-extended/quota/quota_4.04.bb b/meta/recipes-extended/quota/quota_4.05.bb
similarity index 80%
rename from meta/recipes-extended/quota/quota_4.04.bb
rename to meta/recipes-extended/quota/quota_4.05.bb
index 93f376286a..477d6b1a2a 100644
--- a/meta/recipes-extended/quota/quota_4.04.bb
+++ b/meta/recipes-extended/quota/quota_4.05.bb
@@ -3,18 +3,16 @@ SECTION = "base"
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
 SRC_URI_append_libc-musl = " file://replace_getrpcbynumber_r.patch"
 
-SRC_URI[md5sum] = "f46f3b0b5141f032f25684005dac49d3"
-SRC_URI[sha256sum] = "735be1887e7f51f54165e778ae43fc859c04e44d88834ecb2f470e91d4ef8edf"
+SRC_URI[md5sum] = "1c1dbd2cd3d680ccac661239b067e147"
+SRC_URI[sha256sum] = "ef3b5b5d1014ed1344b46c1826145e20cbef8db967b522403c9a060761cf7ab9"
 
 CVE_PRODUCT = "linux_diskquota"
 
-- 
2.17.1


