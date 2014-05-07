Return-Path: <cristiana.voicu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC2060167
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 09:00:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 May 2014 01:55:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1001,1389772800"; d="scan'208";a="507520520"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.143])
	by orsmga001.jf.intel.com with ESMTP; 07 May 2014 02:00:23 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 May 2014 12:01:55 +0300
Message-Id: <cbc501bf2493abcd943565519c0faab6afcecc40.1399453279.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399453279.git.cristiana.voicu@intel.com>
References: <cover.1399453279.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1399453279.git.cristiana.voicu@intel.com>
References: <cover.1399453279.git.cristiana.voicu@intel.com>
Subject: [PATCH 2/2] kmod: update Upstream-Status for one patch
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
X-List-Received-Date: Wed, 07 May 2014 09:00:28 -0000

I will mark Inappropriate because the patch replaces some functions
unavailable in older versions of glibc.

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 ...alling-bswap_-instead-of-htobe-and-be-toh.patch |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch b/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
index 5b4c8fa..2320b92 100644
--- a/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
+++ b/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
@@ -8,6 +8,8 @@ available on older versions of glibc, For example, shipped on Centos 5.5.
 
 Change to directly calling bswap_* as defined in+byteswap.h.
 
+Upstream-Status: Inappropriate
+
 Signed-off-by: Ting Liu <b28495@freescale.com>
 ---
  libkmod/libkmod-signature.c |    3 ++-
-- 
1.7.9.5


