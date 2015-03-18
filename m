Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F1E0160034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 23:57:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Mar 2015 16:57:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,425,1422950400"; d="scan'208";a="682180303"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.44])
	by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2015 16:57:27 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 17:57:27 -0600
Message-Id: <1426723047-13091-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] python-distribute: Adds netclient, email and shell runtime dependencies necessary to
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
X-List-Received-Date: Wed, 18 Mar 2015 23:57:28 -0000

run python-distribute out of the box

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-distribute_0.6.32.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/python/python-distribute_0.6.32.bb b/meta/recipes-devtools/python/python-distribute_0.6.32.bb
index 7000145..aa07633 100644
--- a/meta/recipes-devtools/python/python-distribute_0.6.32.bb
+++ b/meta/recipes-devtools/python/python-distribute_0.6.32.bb
@@ -50,6 +50,14 @@ RDEPENDS_${PN} = "\
   python-compression \
 "
 
+RDEPENDS_${PN}_class-target = "\
+  python-distutils \
+  python-compression \
+  python-netclient \
+  python-email \
+  python-shell \
+"
+
 RPROVIDES_${PN} += "python-setuptools"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


