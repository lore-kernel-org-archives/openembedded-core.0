Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id DEA9A7733D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 03:47:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 19 Dec 2016 19:47:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,377,1477983600"; d="scan'208";a="914246777"
Received: from cdu2-mobl1.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.186.22])
	by orsmga003.jf.intel.com with ESMTP; 19 Dec 2016 19:47:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Dec 2016 16:47:49 +1300
Message-Id: <f6aeb6238456fb923b1717c4522bc23b0b05bac3.1482205653.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1482205653.git.paul.eggleton@linux.intel.com>
References: <cover.1482205653.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] packagegroup-core-standalone-sdk-target: add libssp
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
X-List-Received-Date: Tue, 20 Dec 2016 03:47:57 -0000

If you want to be able to use -fstack-protector then you need the
runtime support - you can either write this yourself or use libssp
supplied with GCC. If you're using GCC then it seems likely that you'd
just be using libssp, so include in the SDK by default; however use
RRECOMMENDS just in case it's been disabled or you aren't using GCC.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../packagegroups/packagegroup-core-standalone-sdk-target.bb         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 274e11a..43fc599 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -12,3 +12,8 @@ RDEPENDS_${PN} = "\
     libstdc++-dev \
     ${LIBC_DEPENDENCIES} \
     "
+
+RRECOMMENDS_${PN} = "\
+    libssp \
+    libssp-dev \
+    "
-- 
2.5.5


