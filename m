Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id F1FF07EC95
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 04:48:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Aug 2019 21:48:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,352,1559545200"; d="scan'208";a="349308684"
Received: from anmitta2-mobl1.png.intel.com ([172.30.199.133])
	by orsmga005.jf.intel.com with ESMTP; 05 Aug 2019 21:48:01 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2019 12:47:56 +0800
Message-Id: <20190806044759.4927-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/4] gmmlib: build for native as well
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
X-List-Received-Date: Tue, 06 Aug 2019 04:48:02 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 recipes-graphics/gmmlib/gmmlib_19.2.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-graphics/gmmlib/gmmlib_19.2.3.bb b/recipes-graphics/gmmlib/gmmlib_19.2.3.bb
index 8e1dcc4e..a91b1688 100644
--- a/recipes-graphics/gmmlib/gmmlib_19.2.3.bb
+++ b/recipes-graphics/gmmlib/gmmlib_19.2.3.bb
@@ -19,3 +19,5 @@ UPSTREAM_CHECK_GITTAGREGEX = "^intel-gmmlib-(?P<pver>(\d+(\.\d+)+))$"
 inherit pkgconfig cmake
 
 EXTRA_OECMAKE += "-DRUN_TEST_SUITE=OFF"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.21.0


