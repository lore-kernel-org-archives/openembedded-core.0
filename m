Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CC1DB78681
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 14:42:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Feb 2018 06:42:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,469,1511856000"; d="scan'208";a="17504186"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2018 06:42:23 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Feb 2018 16:42:25 +0200
Message-Id: <20180206144225.7869-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] iputils: add missing Upstream-Status to patch
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
X-List-Received-Date: Tue, 06 Feb 2018 14:42:23 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch b/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
index c86dafc0380..ce8cfebbb03 100644
--- a/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
+++ b/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] Fix build on MUSL
 Add missing AI_IDN and NI_IDN declarations.
 
 Bug: https://bugs.gentoo.org/503914
+
+Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  arping.c      |  7 +++++++
-- 
2.15.1


