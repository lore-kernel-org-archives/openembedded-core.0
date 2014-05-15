Return-Path: <cristiana.voicu@intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1711461F16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 14:19:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 May 2014 07:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1059,1389772800"; d="scan'208";a="540973875"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.143])
	by orsmga002.jf.intel.com with ESMTP; 15 May 2014 07:18:41 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 May 2014 17:20:24 +0300
Message-Id: <1400163625-13176-1-git-send-email-cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] packagegroup-core-lsb: fix warning text
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
X-List-Received-Date: Thu, 15 May 2014 14:19:12 -0000

There should be just one warning thrown, instead of 3.

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../packagegroups/packagegroup-core-lsb.bb         |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 553befd..0c9d4dc 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -196,9 +196,9 @@ def get_libqt3(d):
         if 'qt3' in d.getVar('BBFILE_COLLECTIONS') or "":
             return 'libqt-mt3'
 
-        bb.warn('The meta-qt3 layer should be added, this layer provides Qt 3.x')
-        bb.warn('libraries. Its intended use is for passing LSB tests as Qt3 is')
-        bb.warn('a requirement for LSB')
+        bb.warn('The meta-qt3 layer should be added, this layer provides Qt 3.x' \
+                'libraries. Its intended use is for passing LSB tests as Qt3 is' \
+                'a requirement for LSB.')
     return ''
 
 QT4PKGS = " \
-- 
1.7.9.5


