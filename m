Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F152C6E69F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 18:34:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Feb 2015 10:28:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,514,1418112000"; d="scan'208";a="672175766"
Received: from lzavalam-mobl.amr.corp.intel.com (HELO
	swold-mobl5.amr.corp.intel.com) ([10.252.252.168])
	by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2015 10:34:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Feb 2015 10:34:28 -0800
Message-Id: <3fbe4e875002e0e8dbbfe7d280ee24e348c95c56.1422988163.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1422988163.git.sgw@linux.intel.com>
References: <cover.1422988163.git.sgw@linux.intel.com>
In-Reply-To: <cover.1422988163.git.sgw@linux.intel.com>
References: <cover.1422988163.git.sgw@linux.intel.com>
Subject: [PATCH 2/6] nspr: Upgrade to 4.10.8
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
X-List-Received-Date: Tue, 03 Feb 2015 18:35:02 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/nspr/{nspr_4.10.7.bb => nspr_4.10.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nspr/{nspr_4.10.7.bb => nspr_4.10.8.bb} (96%)

diff --git a/meta/recipes-support/nspr/nspr_4.10.7.bb b/meta/recipes-support/nspr/nspr_4.10.8.bb
similarity index 96%
rename from meta/recipes-support/nspr/nspr_4.10.7.bb
rename to meta/recipes-support/nspr/nspr_4.10.8.bb
index de28197..944994e 100644
--- a/meta/recipes-support/nspr/nspr_4.10.7.bb
+++ b/meta/recipes-support/nspr/nspr_4.10.8.bb
@@ -13,8 +13,8 @@ SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-$
 
 SRC_URI += "file://nspr.pc.in"
 
-SRC_URI[md5sum] = "6e06919e4b56efed501e05d8b45ec10e"
-SRC_URI[sha256sum] = "389af5cfa863ea9bc6de7b30c15f8a4f9bddd8002f8c6fdc8b33caef43893938"
+SRC_URI[md5sum] = "8d7c5bd0a5b0a7d0e705be66479030a0"
+SRC_URI[sha256sum] = "507ea57c525c0c524dae4857a642b4ef5c9d795518754c7f83422d22fe544a15"
 
 S = "${WORKDIR}/nspr-${PV}/nspr"
 
-- 
2.1.0


