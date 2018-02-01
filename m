Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 3CF1A786C1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 18:02:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2018 10:02:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,444,1511856000"; d="scan'208";a="200465236"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2018 10:02:34 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 20:02:10 +0200
Message-Id: <20180201180210.21652-20-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 20/20] libmpc: fix upstream version check
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
X-List-Received-Date: Thu, 01 Feb 2018 18:02:33 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/libmpc/libmpc_1.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libmpc/libmpc_1.0.3.bb b/meta/recipes-support/libmpc/libmpc_1.0.3.bb
index 4f1f5242fb1..9c8c5f643f7 100644
--- a/meta/recipes-support/libmpc/libmpc_1.0.3.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.0.3.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz"
 SRC_URI[md5sum] = "d6a1d5f8ddea3abd2cc3e98f58352d26"
 SRC_URI[sha256sum] = "617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3"
 
-UPSTREAM_CHECK_URI = "http://www.multiprecision.org/index.php?prog=mpc&page=download"
+UPSTREAM_CHECK_URI = "http://www.multiprecision.org/mpc/download.html"
 
 S = "${WORKDIR}/mpc-${PV}"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.15.1


