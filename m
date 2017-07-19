Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C3A53782CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 15:01:11 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 08:00:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,381,1496127600"; d="scan'208";a="128573785"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 19 Jul 2017 08:00:44 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 1609D5808F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 08:00:43 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 18:01:21 +0300
Message-Id: <1500476485-20310-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1500476485-20310-1-git-send-email-maxin.john@intel.com>
References: <1500476485-20310-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/6] libsolv: upgrade to 0.6.28
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
X-List-Received-Date: Wed, 19 Jul 2017 15:01:11 -0000

0.6.27 -> 0.6.28

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/libsolv/{libsolv_0.6.27.bb => libsolv_0.6.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.6.27.bb => libsolv_0.6.28.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.27.bb b/meta/recipes-extended/libsolv/libsolv_0.6.28.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.6.27.bb
rename to meta/recipes-extended/libsolv/libsolv_0.6.28.bb
index 7ddd533..3a48f22 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.27.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.28.bb
@@ -13,7 +13,7 @@ SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation
                              file://0002-Fixes-to-internal-fopencookie-implementation.patch \
                            "
 
-SRCREV = "9fa1535e2fc60609c29633925e692603782b477b"
+SRCREV = "b8a9ddd88eb4e0ab351eb55a53186b5dc5ac0825"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


