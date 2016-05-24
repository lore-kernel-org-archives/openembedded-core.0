Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AB68062132
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:54:12 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:54:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498201"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:54:14 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:54:23 +0300
Message-Id: <9e36a69793166a55ac44b7630e5fed6e5a4bd309.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 34/45] libnewt-python: move to Python 3
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
X-List-Received-Date: Tue, 24 May 2016 11:54:12 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/newt/libnewt-python_0.52.18.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/newt/libnewt-python_0.52.18.bb b/meta/recipes-extended/newt/libnewt-python_0.52.18.bb
index ba04757..20369ef 100644
--- a/meta/recipes-extended/newt/libnewt-python_0.52.18.bb
+++ b/meta/recipes-extended/newt/libnewt-python_0.52.18.bb
@@ -1,10 +1,10 @@
 require recipes-extended/newt/libnewt_${PV}.bb
 
 SUMMARY .= " - python"
-DEPENDS = "libnewt python"
-RDEPENDS_${PN} += "python-core"
+DEPENDS = "libnewt python3"
+RDEPENDS_${PN} += "python3-core"
 
-inherit pythonnative python-dir
+inherit python3native python3-dir
 
 EXTRA_OECONF += "--with-python"
 EXTRA_OEMAKE += "PYTHONVERS=${PYTHON_DIR}"
-- 
2.8.1


