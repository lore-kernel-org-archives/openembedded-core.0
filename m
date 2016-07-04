Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CAAEB6011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 14:16:01 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jul 2016 07:16:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,575,1459839600"; d="scan'208";a="729488200"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Jul 2016 07:16:03 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id E2DAA6A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 07:15:56 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2016 17:16:03 +0300
Message-Id: <1467641763-25413-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2] libsolv: upgrade to 0.6.22
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
X-List-Received-Date: Mon, 04 Jul 2016 14:16:03 -0000

Update to version 0.6.22 and rename the recipe accordingly.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/libsolv/{libsolv_git.bb => libsolv_0.6.22.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-extended/libsolv/{libsolv_git.bb => libsolv_0.6.22.bb} (92%)

diff --git a/meta/recipes-extended/libsolv/libsolv_git.bb b/meta/recipes-extended/libsolv/libsolv_0.6.22.bb
similarity index 92%
rename from meta/recipes-extended/libsolv/libsolv_git.bb
rename to meta/recipes-extended/libsolv/libsolv_0.6.22.bb
index b41347d..bea207b 100644
--- a/meta/recipes-extended/libsolv/libsolv_git.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.22.bb
@@ -7,13 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
 DEPENDS = "expat zlib"
 
-PV = "0.6.21"
-
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
           "
 SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch"
 
-SRCREV = "bdb5c63245923ed95cf04086b65b2e5a5b5d7b04"
+SRCREV = "58655da7eccc0ba8e768f9df6482bb08b90f4da8"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


