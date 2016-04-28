Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5C2336FF9D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 13:27:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 28 Apr 2016 06:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,546,1455004800"; d="scan'208";a="942100583"
Received: from jlock-mobl2.ger.corp.intel.com ([10.252.13.137])
	by orsmga001.jf.intel.com with ESMTP; 28 Apr 2016 06:27:49 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 14:27:45 +0100
Message-Id: <1461850065-8839-2-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1461850065-8839-1-git-send-email-joshua.g.lock@intel.com>
References: <1461850065-8839-1-git-send-email-joshua.g.lock@intel.com>
Subject: [PATCH 2/2] packagegroup-core-lsb: fix whitespace in meta-qt* warnings
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
X-List-Received-Date: Thu, 28 Apr 2016 13:27:48 -0000

Without these extra space characters the messages are ill-formatted, i.e:
'The meta-qt3 layer should be added, this layer provides Qt 3.xlibraries.
Its intended use is for passing LSB tests as Qt3 isa requirement for LSB.'

Changes to:
'The meta-qt3 layer should be added, this layer provides Qt 3.x libraries.
Its intended use is for passing LSB tests as Qt3 is a requirement for LSB.'

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index a29c3d7..fb533ce 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -206,8 +206,8 @@ def get_libqt3(d):
         if 'qt3' in d.getVar('BBFILE_COLLECTIONS', False) or "":
             return 'libqt-mt3'
 
-        bb.warn('The meta-qt3 layer should be added, this layer provides Qt 3.x' \
-                'libraries. Its intended use is for passing LSB tests as Qt3 is' \
+        bb.warn('The meta-qt3 layer should be added, this layer provides Qt 3.x ' \
+                'libraries. Its intended use is for passing LSB tests as Qt3 is ' \
                 'a requirement for LSB.')
     return ''
 
@@ -229,8 +229,8 @@ def get_libqt4(d):
         if 'qt4' in d.getVar('BBFILE_COLLECTIONS', False) or "":
             return d.getVar('QT4PKGS', False)
 
-        bb.warn('The meta-qt4 layer should be added, this layer provides Qt 4.x' \
-                'libraries. Its intended use is for passing LSB tests as Qt4 is' \
+        bb.warn('The meta-qt4 layer should be added, this layer provides Qt 4.x ' \
+                'libraries. Its intended use is for passing LSB tests as Qt4 is ' \
                 'a requirement for LSB.')
     return ''
 
-- 
2.5.5


