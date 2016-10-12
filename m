Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6354B60807
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 20:46:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Oct 2016 13:46:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,485,1473145200"; d="scan'208";a="1043871443"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.109])
	by orsmga001.jf.intel.com with ESMTP; 12 Oct 2016 13:46:52 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Oct 2016 21:46:42 +0100
Message-Id: <1476305202-10926-2-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476305202-10926-1-git-send-email-joshua.g.lock@intel.com>
References: <1476305202-10926-1-git-send-email-joshua.g.lock@intel.com>
Subject: [PATCH 2/2] local.conf.sample.extended: remove RM_OLD_IMAGE
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
X-List-Received-Date: Wed, 12 Oct 2016 20:46:53 -0000

RM_OLD_IMAGE has been removed so don't include this variable in
sample local.conf

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/conf/local.conf.sample.extended | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index da4820d..57f656a 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -266,9 +266,6 @@
 #COPYLEFT_RECIPE_TYPES = 'target'
 #
 
-# Remove the old image before the new one generated to save disk space
-#RM_OLD_IMAGE = "1"
-
 #
 # GCC/LD FLAGS to enable more secure code generation
 #
-- 
2.7.4


