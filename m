Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3E32E726D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 16:31:03 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 17 Dec 2014 08:27:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="430206442"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.137])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Dec 2014 08:15:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Dec 2014 08:27:04 -0800
Message-Id: <1418833624-1640-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] vala: Add Upstream-Status to patch
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
X-List-Received-Date: Wed, 17 Dec 2014 16:31:08 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/vala/vala/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch b/meta/recipes-devtools/vala/vala/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
index e6c7941..ac9dc8c 100644
--- a/meta/recipes-devtools/vala/vala/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
+++ b/meta/recipes-devtools/vala/vala/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
@@ -7,6 +7,8 @@ Subject: [PATCH] git-version-gen: don't append -dirty if we're not in git
 * for example if we have some dirty directory and we unpack clean vala tarball in it, then it will append -dirty
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Upstream-Status: Inappropriate [OE-Specific]
 ---
  build-aux/git-version-gen |   25 ++++++++++++++-----------
  1 files changed, 14 insertions(+), 11 deletions(-)
-- 
1.8.3.1


