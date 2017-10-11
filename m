Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6C02771A6B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:38:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945768"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:37 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:08 +0300
Message-Id: <05c5ac7a3866398b76a9c272c9c718a802b46e01.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 16/50] libdnf: update to 0.11.0
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
X-List-Received-Date: Wed, 11 Oct 2017 15:38:36 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/libdnf/{libdnf_0.9.3.bb => libdnf_0.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.9.3.bb => libdnf_0.11.0.bb} (95%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.9.3.bb b/meta/recipes-devtools/libdnf/libdnf_0.11.0.bb
similarity index 95%
rename from meta/recipes-devtools/libdnf/libdnf_0.9.3.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.11.0.bb
index 01d9346d9ad..23ecb13a7cc 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.9.3.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.11.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            "
 
-SRCREV = "1b19950e82d88eec28d01b4e7c1da712c941201d"
+SRCREV = "fbe2c1796d0d5c61f64b0106c9f13ae7cf26974d"
 
 S = "${WORKDIR}/git"
 
-- 
2.14.1


