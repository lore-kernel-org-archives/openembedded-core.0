Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 61629767C4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:32:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Aug 2015 01:32:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="787609111"
Received: from ljegan-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.54])
	by orsmga002.jf.intel.com with ESMTP; 20 Aug 2015 01:32:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 09:31:58 +0100
Message-Id: <8c771eed9a7ed518a99615f73d5c1bca09340ae8.1440059460.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440059460.git.paul.eggleton@linux.intel.com>
References: <cover.1440059460.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1440059460.git.paul.eggleton@linux.intel.com>
References: <cover.1440059460.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/5] hello-mod: drop PV and PR
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
X-List-Received-Date: Thu, 20 Aug 2015 08:32:09 -0000

* PR = "r0" is the default, no need to set it (and most people won't
  need to set it anyway with the PR service)
* PV = "0.1" is already set by virtue of 0.1 being in the filename

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
index c40b393..b140b0a 100644
--- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
+++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
@@ -4,9 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 inherit module
 
-PR = "r0"
-PV = "0.1"
-
 SRC_URI = "file://Makefile \
            file://hello.c \
            file://COPYING \
-- 
2.1.0


