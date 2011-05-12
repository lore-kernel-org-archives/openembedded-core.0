Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgY-0000Rk-0V
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2011 04:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="746178247"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2011 04:01:13 -0700
Message-Id: <723986dc7a9d5b09d14e2501e818fa059e35f0ae.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 09:58:07 +0800
Date: Thu, 12 May 2011 19:01:10 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 19/54] web-webkit: Add Upstream-Status
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 May 2011 11:04:03 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../web/web-webkit/link-with-g++.patch             |    3 +++
 meta/recipes-sato/web/web-webkit/make-382.patch    |    2 ++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-sato/web/web-webkit/link-with-g++.patch b/meta/recipes-sato/web/web-webkit/link-with-g++.patch
index 50d6e93..e0c6784 100644
--- a/meta/recipes-sato/web/web-webkit/link-with-g++.patch
+++ b/meta/recipes-sato/web/web-webkit/link-with-g++.patch
@@ -3,6 +3,9 @@ linking. The easiest way to achieve this is to add a dummy cpp file.
 This also means we have to add AC_PROG_CXX else libtool 2.2.2 gets upset.
 
 RP - 14/4/08 
+
+Upstream-Status: Inappropriate [configuration]
+
 --- webkit.orig/src/Makefile.am
 +++ webkit/src/Makefile.am
 @@ -1,11 +1,11 @@
diff --git a/meta/recipes-sato/web/web-webkit/make-382.patch b/meta/recipes-sato/web/web-webkit/make-382.patch
index 253743d..3689435 100644
--- a/meta/recipes-sato/web/web-webkit/make-382.patch
+++ b/meta/recipes-sato/web/web-webkit/make-382.patch
@@ -2,6 +2,8 @@ Make 3.82 does not allow 8 spaces instead of a tab
 
 JL - 15/12/10
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: webkit/Makefile.am
 ===================================================================
 --- webkit.orig/Makefile.am
-- 
1.7.1



