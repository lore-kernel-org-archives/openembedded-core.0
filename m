Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B35F473D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 03:30:40 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Oct 2015 20:30:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,185,1444719600"; d="scan'208";a="670011199"
Received: from bitbang.jf.intel.com ([10.7.199.99])
	by orsmga003.jf.intel.com with ESMTP; 22 Oct 2015 20:30:42 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 20:30:34 -0700
Message-Id: <4b16c77c29407f38c4c17f5bddbaec2cd5339c82.1445570852.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <cover.1445570852.git.randy.e.witt@linux.intel.com>
References: <cover.1445570852.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 1/5] Add 850 codepage to uninative-tarball
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
X-List-Received-Date: Fri, 23 Oct 2015 03:30:42 -0000

---
 meta/recipes-core/meta/uninative-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 41f7927..21f3bd9 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -7,6 +7,7 @@ TOOLCHAIN_TARGET_TASK = ""
 
 TOOLCHAIN_HOST_TASK = "\
     nativesdk-glibc \
+    nativesdk-glibc-gconv-ibm850 \
     nativesdk-patchelf \
     "
 
-- 
2.4.3


