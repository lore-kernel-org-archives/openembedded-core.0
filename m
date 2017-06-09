Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id BD05B7828F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 07:36:21 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 09 Jun 2017 00:36:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="111086294"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 09 Jun 2017 00:36:22 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id D52155800E6;
	Fri,  9 Jun 2017 00:36:20 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 10:36:17 +0300
Message-Id: <0c83f6d3e761aa93c07528c5a3730e2ddc43d748.1496993458.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496993458.git.jussi.kukkonen@intel.com>
References: <cover.1496993458.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] Enable parallel compilation for python3-numpy
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
X-List-Received-Date: Fri, 09 Jun 2017 07:36:21 -0000

Support for "-j N" does not seem like a generic distutils thing
but numpy supports it.

This improves compile time by 2 minutes (real time).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-devtools/python-numpy/python3-numpy_1.11.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.11.2.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.11.2.bb
index d5fe50c..9a9c4cf 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.11.2.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.11.2.bb
@@ -69,6 +69,8 @@ CONFIGFILESURI_mipsarchn32el = " \
 
 S = "${WORKDIR}/numpy-${PV}"
 
+DISTUTILS_BUILD_ARGS += "${PARALLEL_MAKE}"
+
 inherit setuptools3
 
 # Make the build fail and replace *config.h with proper one
-- 
2.1.4


