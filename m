Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A282C04FE2
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:41:58 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.7591.1690875708998498311
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="105999770"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="105999770"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:41:46 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4590CC68E6
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:44 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FB8AD5E9F
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:43 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 869922FC8177;
	Tue,  1 Aug 2023 16:41:42 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] tar: upgrade 1.34 -> 1.35
Date: Tue,  1 Aug 2023 15:41:18 +0800
Message-Id: <1690875687-21573-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
References: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27786.005
X-TMASE-Result: 10--9.865200-10.000000
X-TMASE-MatchedRID: mL9wGNQYBVujz0nOeth/yTo39wOA02LhMVx/3ZYby79k2pD+AcfxBK4r
	mQIDoB6STV0yKzX+AoNvh0tbnNYRAYgrKnsJ1GRggvmNrsT46HJh0Eb5uGGI1LSCAnwdeRu/JvB
	KacYtpwepfgIfMZFSvNOyvufbI8C3H/XdxG/McYHece0aRiX9WhokPBiBBj9/1YzbHoRn9L25ay
	CZP+bpqmczHbi+TJ8/LpoiZivHUwznh/3XW7KYedZfgYyzPJbKTJDl9FKHbrmkob0Y35+HFOvn/
	O99cHKFCC8aAmGeO6nqXvXKPBg5BmVjCRquYdk+EXjPIvKd74BSuvtBzlaEqDUvQN19brjgzv0+
	UmYCZcOJu2OlwFv1q3pDJOuqM/eDj56IjTnLR+nfSQNpZkETVKn/3nyhTdZw8IjVm/BgtuSyxsS
	RJfpzSVqtf84XcQkCjnWUjoc8fIczPB7mzXyiQzsKXyzHgcEbQuLGuwInWNPBILqohnmeSaPFjJ
	EFr+olX8emX/Nw6OXkwjHXXC/4I+JGF26G8SWypfzLa08EuFB4hSS8obnmc/MdZYllCJ/q47kMx
	FU1YGN7HJapCAY597c6cJ4uYUQo
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185201

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2022-48303.patch
removed since it's included in 1.35

License-Update: http changed to https

Changelog:
===========
* Fail when building GNU tar, if the platform supports 64-bit time_t
  but the build uses only 32-bit time_t.
* Leave the devmajor and devminor fields empty (rather than zero) for
  non-special files, as this is more compatible with traditional tar.
* Bug fixes
** Fix interaction of --update with --wildcards.
** When extracting archives into an empty directory, do not create
   hard links to files outside that directory.
** Handle partial reads from regular files.
** Warn "file changed as we read it" less often.
** Fix --ignore-failed-read to ignore file-changed read errors
** Fix --remove-files to not remove a file that changed while we read it.
** Fix --atime-preserve=replace to not fail if there was no need to replace,
   either because we did not read the file, or the atime did not change.
** Fix race when creating a parent directory while another process is
   also doing so.
** Fix handling of prefix keywords not followed by "." in pax headers.
** Fix handling of out-of-range sparse entries in pax headers.
** Fix handling of --transform='s/s/@/2'.
** Fix treatment of options ending in / in files-from list.
** Fix crash on 'tar --checkpoint-action exec=\"'.
** Fix low-memory crash when reading incremental dumps.
** Fix --exclude-vcs-ignores memory allocation misuse.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tar/tar/CVE-2022-48303.patch              | 43 -------------------
 .../tar/{tar_1.34.bb => tar_1.35.bb}          |  8 ++--
 2 files changed, 3 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-extended/tar/tar/CVE-2022-48303.patch
 rename meta/recipes-extended/tar/{tar_1.34.bb => tar_1.35.bb} (87%)

diff --git a/meta/recipes-extended/tar/tar/CVE-2022-48303.patch b/meta/recipes-extended/tar/tar/CVE-2022-48303.patch
deleted file mode 100644
index b2f40f3e64..0000000000
--- a/meta/recipes-extended/tar/tar/CVE-2022-48303.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 3da78400eafcccb97e2f2fd4b227ea40d794ede8 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Sat, 11 Feb 2023 11:57:39 +0200
-Subject: Fix boundary checking in base-256 decoder
-
-* src/list.c (from_header): Base-256 encoding is at least 2 bytes
-long.
-
-Upstream-Status: Backport [see reference below]
-CVE: CVE-2022-48303
-
-Reference to upstream patch:
-https://savannah.gnu.org/bugs/?62387
-https://git.savannah.gnu.org/cgit/tar.git/patch/src/list.c?id=3da78400eafcccb97e2f2fd4b227ea40d794ede8
-
-Signed-off-by: Rodolfo Quesada Zumbado <rodolfo.zumbado@windriver.com>
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- src/list.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)Signed-off-by: Rodolfo Quesada Zumbado <rodolfo.zumbado@windriver.com>
-
-
-(limited to 'src/list.c')
-
-diff --git a/src/list.c b/src/list.c
-index 9fafc42..86bcfdd 100644
---- a/src/list.c
-+++ b/src/list.c
-@@ -881,8 +881,9 @@ from_header (char const *where0, size_t digs, char const *type,
- 	  where++;
- 	}
-     }
--  else if (*where == '\200' /* positive base-256 */
--	   || *where == '\377' /* negative base-256 */)
-+  else if (where <= lim - 2
-+	   && (*where == '\200' /* positive base-256 */
-+	       || *where == '\377' /* negative base-256 */))
-     {
-       /* Parse base-256 output.  A nonnegative number N is
- 	 represented as (256**DIGS)/2 + N; a negative number -N is
--- 
-cgit v1.1
-
diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.35.bb
similarity index 87%
rename from meta/recipes-extended/tar/tar_1.34.bb
rename to meta/recipes-extended/tar/tar_1.35.bb
index 1ef5fe221e..4dbd418b60 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -4,13 +4,11 @@ or disk archive, and can restore individual files from the archive."
 HOMEPAGE = "http://www.gnu.org/software/tar/"
 SECTION = "base"
 LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
-           file://CVE-2022-48303.patch \
-"
+SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b1862a511079255646ff"
+SRC_URI[sha256sum] = "7edb8886a3dc69420a1446e1e2d061922b642f1cf632d2cd0f9ee7e690775985"
 
 inherit autotools gettext texinfo
 
-- 
2.34.1


