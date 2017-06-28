Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C794B77FF9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 01:43:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5S1hg0K009398
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 18:43:42 -0700 (PDT)
Received: from yow-rmacleod-lx3.wrs.com (128.224.56.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 27 Jun 2017 18:43:42 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Jun 2017 21:35:06 -0400
Message-ID: <1498613706-16641-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] binutils: update SRCREV to fix powerpc gold link bug
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
X-List-Received-Date: Wed, 28 Jun 2017 01:43:40 -0000
Content-Type: text/plain

Update to the latest commit on the 2.28 branch to pick up:
   a3e00a8 [GOLD] Avoid duplicate PLT stub symbols on ppc32
along with several backported bug fixes for arm*, etc.

This resolves the systemd link error for qemuppc
with the error message:
   .../powerpc-oe-linux-ld.gold:
   error: invalid STB_LOCAL symbol in external symbols
   error: linker defined: multiple definition of '00000001.plt_call.memcpy+8000'
   command line: previous definition here

described in:

[YOCTO #11696]

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 47bfa1a..477bcb2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -18,7 +18,7 @@ BINUPV = "${@binutils_branch_version(d)}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV = "cb44d42ce6ef0c7a4eed7e2a3c272ac102166850"
+SRCREV = "7ea1464297eadebe62aae92ad9bebb33f92c2454"
 SRC_URI = "\
      git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
      file://0004-Point-scripts-location-to-libdir.patch \
-- 
2.7.4


