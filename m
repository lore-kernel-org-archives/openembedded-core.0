Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 552AC6F8EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 19:20:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Mar 2014 12:20:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,697,1389772800"; d="scan'208";a="504026386"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.182])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2014 12:19:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 19:19:39 +0000
Message-Id: <694f3d38d824ddd89121bc3b5b3333db01a0928b.1395343129.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1395343129.git.paul.eggleton@linux.intel.com>
References: <cover.1395343129.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1395343129.git.paul.eggleton@linux.intel.com>
References: <cover.1395343129.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 2/2] x264: add perlnative to inherit
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
X-List-Received-Date: Thu, 20 Mar 2014 19:20:04 -0000

perl is run as part of the configure process, so we should ensure that
it's available.

Should fix [YOCTO #5768].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 0e305ea..d192c30 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -18,7 +18,7 @@ PV = "r2265+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit lib_package pkgconfig
+inherit lib_package pkgconfig perlnative
 
 X264_DISABLE_ASM = ""
 X264_DISABLE_ASM_armv4 = "--disable-asm"
-- 
1.8.5.3


