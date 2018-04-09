Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8BEDF75086
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 11:54:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 04:54:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,427,1517904000"; d="scan'208";a="215142438"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 09 Apr 2018 04:54:48 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 6F575580425
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 04:54:47 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 14:55:06 +0300
Message-Id: <1523274911-20401-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1523274911-20401-1-git-send-email-maxin.john@intel.com>
References: <1523274911-20401-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/8] libsolv: upgrade to version 0.6.34
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
X-List-Received-Date: Mon, 09 Apr 2018 11:54:47 -0000

Bug fix release

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/libsolv/{libsolv_0.6.33.bb => libsolv_0.6.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.6.33.bb => libsolv_0.6.34.bb} (94%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.33.bb b/meta/recipes-extended/libsolv/libsolv_0.6.34.bb
similarity index 94%
rename from meta/recipes-extended/libsolv/libsolv_0.6.33.bb
rename to meta/recipes-extended/libsolv/libsolv_0.6.34.bb
index 0401ced..5950194 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.33.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.34.bb
@@ -13,7 +13,7 @@ SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation
                              file://0002-Fixes-to-internal-fopencookie-implementation.patch \
                            "
 
-SRCREV = "69f1803978ba7a46a57928fa4be6430792419e4e"
+SRCREV = "f0ef172a591d9c1ca0e13e09955054ac9c473d67"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


