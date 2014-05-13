Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B3C65605B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 11:02:44 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2014 04:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1043,1389772800"; d="scan'208";a="531050131"
Received: from hpatters-mobl.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.37])
	by fmsmga001.fm.intel.com with ESMTP; 13 May 2014 04:02:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 May 2014 12:01:03 +0100
Message-Id: <d0bf7e2ab538c7f43072d4cec58f5baac8811439.1399978792.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1399978792.git.paul.eggleton@linux.intel.com>
References: <cover.1399978792.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1399978792.git.paul.eggleton@linux.intel.com>
References: <cover.1399978792.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/6] dropbear: add missing patch header
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
X-List-Received-Date: Tue, 13 May 2014 11:02:44 -0000

* Add a brief subject mentioning what the patch is for
* Add Upstream-Status

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/dropbear/dropbear/0003-configure.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dropbear/dropbear/0003-configure.patch b/meta/recipes-core/dropbear/dropbear/0003-configure.patch
index 2baf665..c53ab01 100644
--- a/meta/recipes-core/dropbear/dropbear/0003-configure.patch
+++ b/meta/recipes-core/dropbear/dropbear/0003-configure.patch
@@ -1,7 +1,9 @@
 From c5f5c5054c1b15539dccf866e2c3faba7ed68456 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Thu, 25 Apr 2013 00:27:25 +0200
-Subject: [PATCH 3/6] configure
+Subject: [PATCH 3/6] configure: add a variable to allow openpty check to be cached
+
+Upstream-Status: Pending
 
 ---
  configure.ac | 11 ++++++++---
-- 
1.9.0


