Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id EAC247856A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 15:53:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 07:54:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,535,1511856000"; d="scan'208";a="29136662"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 19 Feb 2018 07:54:00 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 5E130580382
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 07:53:59 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 17:56:34 +0200
Message-Id: <1519055794-21177-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519055794-21177-1-git-send-email-maxin.john@intel.com>
References: <1519055794-21177-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] libsolv: upgrade to version 0.6.32
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
X-List-Received-Date: Mon, 19 Feb 2018 15:53:59 -0000

0.6.31 -> 0.6.32

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/libsolv/{libsolv_0.6.31.bb => libsolv_0.6.32.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.6.31.bb => libsolv_0.6.32.bb} (94%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.31.bb b/meta/recipes-extended/libsolv/libsolv_0.6.32.bb
similarity index 94%
rename from meta/recipes-extended/libsolv/libsolv_0.6.31.bb
rename to meta/recipes-extended/libsolv/libsolv_0.6.32.bb
index 96c366b..77481f6 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.31.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.32.bb
@@ -13,7 +13,7 @@ SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation
                              file://0002-Fixes-to-internal-fopencookie-implementation.patch \
                            "
 
-SRCREV = "bef46d75f6d2537060114eea0f3a892e958ad5e0"
+SRCREV = "b8e6eda168f672949cc2fabf591897be7f3b4495"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


