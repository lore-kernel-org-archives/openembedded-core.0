Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5E62171E02
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 08:10:45 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 08 May 2017 01:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,308,1491289200"; d="scan'208";a="84821435"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 08 May 2017 01:10:47 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 388C56A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 01:10:33 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 May 2017 11:11:24 +0300
Message-Id: <1494231086-31827-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1494231086-31827-1-git-send-email-maxin.john@intel.com>
References: <1494231086-31827-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/5] libsolv: upgrade to 0.6.27
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
X-List-Received-Date: Mon, 08 May 2017 08:10:51 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/libsolv/{libsolv_0.6.26.bb => libsolv_0.6.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.6.26.bb => libsolv_0.6.27.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.26.bb b/meta/recipes-extended/libsolv/libsolv_0.6.27.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.6.26.bb
rename to meta/recipes-extended/libsolv/libsolv_0.6.27.bb
index a33c251..7ddd533 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.26.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.27.bb
@@ -13,7 +13,7 @@ SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation
                              file://0002-Fixes-to-internal-fopencookie-implementation.patch \
                            "
 
-SRCREV = "ba32f8286d3deec6faaabc79762a4760e9af0a07"
+SRCREV = "9fa1535e2fc60609c29633925e692603782b477b"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


