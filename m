Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB8A6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 13:27:12 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2016 06:26:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,517,1455004800"; d="scan'208";a="89994855"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 22 Apr 2016 06:26:52 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Apr 2016 16:26:44 +0300
Message-Id: <d0ca3b62bef9534383af9cbaa6b6a4e1e8a15862.1461329608.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b0e90c378280d55e73abbb3464b08c77bde64867.1461329608.git.jussi.kukkonen@intel.com>
References: <b0e90c378280d55e73abbb3464b08c77bde64867.1461329608.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1461329608.git.jussi.kukkonen@intel.com>
References: <cover.1461329608.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] gcc-sanitizers: Depend on target gcc
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
X-List-Received-Date: Fri, 22 Apr 2016 13:27:12 -0000

Without this the target gcc might not be in the sysroot
leading to configure failure.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 6091a0b..df4e297 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -50,7 +50,7 @@ do_install () {
 
 INHIBIT_DEFAULT_DEPS = "1"
 ALLOW_EMPTY_${PN} = "1"
-DEPENDS = "gcc-runtime"
+DEPENDS = "gcc-runtime virtual/${TARGET_PREFIX}gcc"
 
 BBCLASSEXTEND = "nativesdk"
 
-- 
2.1.4


