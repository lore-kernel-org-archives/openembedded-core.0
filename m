Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 24DF27702B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 15:28:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 06 Nov 2015 07:28:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="595304003"
Received: from bdiacone-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.207])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Nov 2015 07:28:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 15:28:29 +0000
Message-Id: <abe11612abe94507c66bda3bb85f993a3d9e7960.1446823542.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1446823542.git.paul.eggleton@linux.intel.com>
References: <cover.1446823542.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1446823542.git.paul.eggleton@linux.intel.com>
References: <cover.1446823542.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/11] swig: set SUMMARY instead of DESCRIPTION
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
X-List-Received-Date: Fri, 06 Nov 2015 15:28:50 -0000

We only have a short description, so set SUMMARY and DESCRIPTION
will be defaulted from it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/swig/swig.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/swig/swig.inc
index 9821fa5..9da40df 100644
--- a/meta/recipes-devtools/swig/swig.inc
+++ b/meta/recipes-devtools/swig/swig.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "SWIG - Simplified Wrapper and Interface Generator"
+SUMMARY = "SWIG - Simplified Wrapper and Interface Generator"
 HOMEPAGE = "http://swig.sourceforge.net/"
 LICENSE = "BSD & GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
-- 
2.1.0


