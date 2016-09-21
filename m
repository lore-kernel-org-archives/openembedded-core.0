Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F3E906FFC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 18:44:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 21 Sep 2016 11:44:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,374,1470726000"; d="scan'208";a="1034330920"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.83])
	by orsmga001.jf.intel.com with ESMTP; 21 Sep 2016 11:44:55 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 19:44:47 +0100
Message-Id: <1474483487-15285-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] buildtools-tarball: add SDKMACHINE to stamps-extra-info
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
X-List-Received-Date: Wed, 21 Sep 2016 18:44:55 -0000

Otherwise the stamps for x86-64 and i686 uninative tarballs match
and we can't deploy both to the DEPLOYDIR.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index e84efab..2e738e6 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -43,7 +43,7 @@ inherit meta
 inherit populate_sdk
 inherit toolchain-scripts
 
-do_populate_sdk[stamp-extra-info] = ""
+do_populate_sdk[stamp-extra-info] = "${SDKMACHINE}"
 
 create_sdk_files_append () {
 	rm -f ${SDK_OUTPUT}/${SDKPATH}/site-config-*
-- 
2.7.4


