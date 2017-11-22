Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B7E977873D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 16:32:14 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2017 08:32:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,436,1505804400"; d="scan'208";a="179367908"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 22 Nov 2017 08:32:14 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 18:32:30 +0200
Message-Id: <20171122163233.10292-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171122163233.10292-1-alexander.kanavin@linux.intel.com>
References: <20171122163233.10292-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/6] m4-native: fix upstream version check
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
X-List-Received-Date: Wed, 22 Nov 2017 16:32:14 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/m4/m4-native_1.4.18.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/m4/m4-native_1.4.18.bb b/meta/recipes-devtools/m4/m4-native_1.4.18.bb
index 06d8aa244e5..407ad89330e 100644
--- a/meta/recipes-devtools/m4/m4-native_1.4.18.bb
+++ b/meta/recipes-devtools/m4/m4-native_1.4.18.bb
@@ -11,3 +11,4 @@ do_configure()  {
 	oe_runconf
 }
 
+UPSTREAM_CHECK_URI = "${GNU_MIRROR}/m4/"
-- 
2.15.0


