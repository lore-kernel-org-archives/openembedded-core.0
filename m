Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9082160939
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 11:48:28 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 04:48:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,337,1498546800"; d="scan'208";a="136607103"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 07 Aug 2017 04:48:29 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Aug 2017 14:44:59 +0300
Message-Id: <20170807114504.28410-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
References: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/7] libdnf: update to 0.9.3
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
X-List-Received-Date: Mon, 07 Aug 2017 11:48:28 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/libdnf/{libdnf_0.9.1.bb => libdnf_0.9.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.9.1.bb => libdnf_0.9.3.bb} (95%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.9.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.9.3.bb
similarity index 95%
rename from meta/recipes-devtools/libdnf/libdnf_0.9.1.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.9.3.bb
index e5c47bf8dbe..01d9346d9ad 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.9.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.9.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            "
 
-SRCREV = "d5ecb17c0fde4f99c6a80e6f162510465b8d28f9"
+SRCREV = "1b19950e82d88eec28d01b4e7c1da712c941201d"
 
 S = "${WORKDIR}/git"
 
-- 
2.13.2


