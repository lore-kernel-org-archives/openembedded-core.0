Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5319D60E07
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:53:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2014 16:53:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="442600435"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 21 Jan 2014 16:53:09 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Poky <poky@yoctoproject.org>
Date: Tue, 21 Jan 2014 16:58:47 -0800
Message-Id: <40c00bdeaf8203b3c9fd6cd30600e137b0eace30.1390351667.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
References: <e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1390351667.git.dvhart@linux.intel.com>
References: <cover.1390351667.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: [PATCH 02/19] i586: Only add the current tune to PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Wed, 22 Jan 2014 00:53:08 -0000

The generic x86 build supports i586 by default, so this specific tune
file technically doesn't add any specific ARCHes to PACKAGE_EXTRA_ARCHS.
For consistency, append the current tune to PACKAGE_EXTRA_ARCHS.

Since we do not have specific tune files for i386 and i486, just drop
them.

These could be added to tune-x86 version if there is a need to
maintain them, but they really do not belong here.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>
Cc: Nitin Kamble <nitin.a.kamble@intel.com>
Cc: Mark Hatle <mark.hatle@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta/conf/machine/include/tune-i586.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-i586.inc b/meta/conf/machine/include/tune-i586.inc
index a315b35..5fbb3c7 100644
--- a/meta/conf/machine/include/tune-i586.inc
+++ b/meta/conf/machine/include/tune-i586.inc
@@ -11,4 +11,4 @@ AVAILTUNES += "i586"
 TUNE_FEATURES_tune-i586 = "${TUNE_FEATURES_tune-x86} i586"
 BASE_LIB_tune-i586 = "lib"
 TUNE_PKGARCH_tune-i586 = "i586"
-PACKAGE_EXTRA_ARCHS_tune-i586 = "${PACKAGE_EXTRA_ARCHS_tune-x86} i386 i486 i586"
+PACKAGE_EXTRA_ARCHS_tune-i586 = "${PACKAGE_EXTRA_ARCHS_tune-x86} i586"
-- 
1.7.9.5


