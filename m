Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C02DC6B289
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 23:55:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Apr 2014 16:55:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,798,1389772800"; d="scan'208";a="507313968"
Received: from unknown (HELO localhost) ([10.255.12.73])
	by fmsmga001.fm.intel.com with ESMTP; 04 Apr 2014 16:05:39 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Apr 2014 18:05:38 -0500
Message-Id: <90763f03a4f1dfc1220c805689af08940740dbca.1396652540.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1396652540.git.tom.zanussi@linux.intel.com>
References: <cover.1396652540.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1] systemtap: Move to current HEAD
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
X-List-Received-Date: Fri, 04 Apr 2014 23:55:53 -0000

This moves the systemtap recipe to the current HEAD commit, in order
to get users past some bugs affecting ppc and arm.

Fixes [YOCTO #6016]

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 56db7b2..db9d910 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,6 +1,6 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "508059f04842ed85d10bfbec8a9c688d57368860"
+SRCREV = "ae91e3d552aff4f0e74662d055dae06ea55eb6bc"
 PV = "2.5+git${SRCPV}"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
-- 
1.8.3.1


