Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0AAAE766E1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 17:00:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 22 Aug 2015 10:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,728,1432623600"; d="scan'208";a="753503618"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2015 10:00:11 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Sat, 22 Aug 2015 09:55:19 -0700
Message-Id: <1440262519-13582-6-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440262519-13582-1-git-send-email-juro.bystricky@intel.com>
References: <1440262519-13582-1-git-send-email-juro.bystricky@intel.com>
Subject: [PATCH 5/5] cross-canadian.bbclass: support for TCLIBC="baremetal"
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
X-List-Received-Date: Sat, 22 Aug 2015 17:00:12 -0000

Allow "baremetal" builds.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/cross-canadian.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 80fb472..65ba457 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -29,6 +29,9 @@ python () {
     if d.getVar("MODIFYTOS", True) != "1":
         return
 
+    if d.getVar("TCLIBC", True) == "baremetal":
+        return
+
     tos = d.getVar("TARGET_OS", True)
     whitelist = []
     for variant in ["", "spe", "x32", "eabi", "n32"]:
-- 
1.9.1


