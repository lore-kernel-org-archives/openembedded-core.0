Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 515E479DB4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 08:43:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Dec 2018 00:43:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,376,1539673200"; 
	d="scan'208,223";a="112046152"
Received: from lwong-mobl2.gar.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.137.224])
	by orsmga003.jf.intel.com with ESMTP; 20 Dec 2018 00:43:38 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 16:43:32 +0800
Message-Id: <20181220084336.7294-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/5] libsolv: upgrade 0.7.1 -> 0.7.2
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
X-List-Received-Date: Thu, 20 Dec 2018 08:43:38 -0000

From NEWS:

- bug fixes:
  * do not autouninstall packages because of forcebest updates
- new features:
  * support rpm's new '^' version separator
  * support set/get_considered_list in bindings
  * new experimental SOLVER_FLAG_ONLY_NAMESPACE_RECOMMENDED flag

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libsolv/{libsolv_0.7.1.bb => libsolv_0.7.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.1.bb => libsolv_0.7.2.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.1.bb b/meta/recipes-extended/libsolv/libsolv_0.7.2.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.1.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.2.bb
index 9e0952128e..6e3993b05e 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.1.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.2.bb
@@ -12,7 +12,7 @@ SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation
                              file://0002-Fixes-to-internal-fopencookie-implementation.patch \
                            "
 
-SRCREV = "aae08b819742abba7c44510797077c5f25f3ed00"
+SRCREV = "1c0141962a9eef7f4bc1fdcac7099f3f6a95ec23"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


