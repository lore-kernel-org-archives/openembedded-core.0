Return-Path: <cristiana.voicu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8B7CC60167
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 09:00:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 May 2014 01:55:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1001,1389772800"; d="scan'208";a="507520513"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.143])
	by orsmga001.jf.intel.com with ESMTP; 07 May 2014 02:00:21 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 May 2014 12:01:54 +0300
Message-Id: <6a2675b822111bd9e5f9e5629ff79280facd5751.1399453279.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399453279.git.cristiana.voicu@intel.com>
References: <cover.1399453279.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1399453279.git.cristiana.voicu@intel.com>
References: <cover.1399453279.git.cristiana.voicu@intel.com>
Subject: [PATCH 1/2] openssl: update upstream status for a patch
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
X-List-Received-Date: Wed, 07 May 2014 09:00:26 -0000

The patch is not included in 1.0.1g, but it is included on 1.0.2
branch.

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../openssl/openssl/initial-aarch64-bits.patch     |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssl/openssl/initial-aarch64-bits.patch b/meta/recipes-connectivity/openssl/openssl/initial-aarch64-bits.patch
index 2185ff8..770097d 100644
--- a/meta/recipes-connectivity/openssl/openssl/initial-aarch64-bits.patch
+++ b/meta/recipes-connectivity/openssl/openssl/initial-aarch64-bits.patch
@@ -4,6 +4,7 @@ Subject: Initial aarch64 bits.
 X-Git-Url: http://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff_plain;h=039081b80977e2a5de84e1f88f8b4d025b559956
 
 Initial aarch64 bits.
+Upstream-Status: backport (will be included in 1.0.2)
 ---
  crypto/bn/bn_lcl.h       |    9 +++++++++
  crypto/md32_common.h     |   18 ++++++++++++++++++
-- 
1.7.9.5


