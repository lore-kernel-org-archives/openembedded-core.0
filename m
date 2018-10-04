Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0886278A99
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 06:56:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Oct 2018 23:56:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,338,1534834800"; d="scan'208";a="262748593"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.255])
	by orsmga005.jf.intel.com with ESMTP; 03 Oct 2018 23:56:30 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2018 14:56:28 +0800
Message-Id: <20181004065628.14388-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] e2fsprogs: add bzip2 to RDEPENDS
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
X-List-Received-Date: Thu, 04 Oct 2018 06:56:31 -0000

A lot of tests in e2fsprogs-ptest package expect bzip2 to be present.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
index d7391ee6df..823d18bc3f 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
@@ -112,7 +112,7 @@ ALTERNATIVE_LINK_NAME[mkfs.ext2] = "${base_sbindir}/mkfs.ext2"
 ALTERNATIVE_${PN}-tune2fs = "tune2fs"
 ALTERNATIVE_LINK_NAME[tune2fs] = "${base_sbindir}/tune2fs"
 
-RDEPENDS_${PN}-ptest += "${PN} ${PN}-tune2fs coreutils procps bash"
+RDEPENDS_${PN}-ptest += "${PN} ${PN}-tune2fs coreutils procps bash bzip2"
 
 do_compile_ptest() {
 	oe_runmake -C ${B}/tests
-- 
2.17.1


