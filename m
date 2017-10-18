Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 54397606B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 19:31:00 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Oct 2017 12:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,397,1503385200"; d="scan'208";a="162045576"
Received: from jgperezc-mobl1.zpn.intel.com ([10.219.4.33])
	by orsmga005.jf.intel.com with ESMTP; 18 Oct 2017 12:31:01 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Oct 2017 14:34:48 -0500
Message-Id: <20171018193448.28349-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] lsb/lsbtests: Update package lists to use latest version of binary
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
X-List-Received-Date: Wed, 18 Oct 2017 19:31:01 -0000

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Currently  package list is pointing to  "lsb-setup-4.1.0-1.noarch.rpm"
which is not available anymore on
http://ftp.linuxfoundation.org/pub/lsb/base/released-all/binary/ hence
BASE_PACKAGES_LIST is updated to point to the latest available version.

[YOCTO #12240]

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 meta/recipes-extended/lsb/lsbtest/packages_list | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsbtest/packages_list b/meta/recipes-extended/lsb/lsbtest/packages_list
index 959f931504..1a6c11699a 100644
--- a/meta/recipes-extended/lsb/lsbtest/packages_list
+++ b/meta/recipes-extended/lsb/lsbtest/packages_list
@@ -1,7 +1,7 @@
 LSB_RELEASE="released-5.0"
 LSB_ARCH="lsbarch"
 
-BASE_PACKAGES_LIST="lsb-setup-4.1.0-1.noarch.rpm"
+BASE_PACKAGES_LIST="lsb-setup-5.0.0-2.noarch.rpm"
 
 RUNTIME_BASE_PACKAGES_LIST="lsb-dist-checker-5.0.0.1-1.targetarch.rpm \
 	lsb-tet3-lite-3.7-27.lsb5.targetarch.rpm \
-- 
2.11.0


