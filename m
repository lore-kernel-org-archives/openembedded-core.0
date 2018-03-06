Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5093C789D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 08:38:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2018 00:38:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,430,1515484800"; d="scan'208";a="32745797"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 06 Mar 2018 00:38:48 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 1485758042F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 00:38:47 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2018 10:41:56 +0200
Message-Id: <1520325716-19589-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1520325716-19589-1-git-send-email-maxin.john@intel.com>
References: <1520325716-19589-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] libsolv: update to version 0.6.33
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
X-List-Received-Date: Tue, 06 Mar 2018 08:38:48 -0000

0.6.32 -> 0.6.33

* new Selection.clone() method in the bindings
* new pool.parserpmrichdep() method in the bindings
* fix bad assignment in solution refinement that led to a memory leak
* use license tag instead of doc in the spec file [bnc#1082318]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/libsolv/{libsolv_0.6.32.bb => libsolv_0.6.33.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.6.32.bb => libsolv_0.6.33.bb} (94%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.32.bb b/meta/recipes-extended/libsolv/libsolv_0.6.33.bb
similarity index 94%
rename from meta/recipes-extended/libsolv/libsolv_0.6.32.bb
rename to meta/recipes-extended/libsolv/libsolv_0.6.33.bb
index 77481f6..0401ced 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.32.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.33.bb
@@ -13,7 +13,7 @@ SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation
                              file://0002-Fixes-to-internal-fopencookie-implementation.patch \
                            "
 
-SRCREV = "b8e6eda168f672949cc2fabf591897be7f3b4495"
+SRCREV = "69f1803978ba7a46a57928fa4be6430792419e4e"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


