Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 51B8E60761
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:37:35 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2016 05:37:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="36412269"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 05:37:36 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 15:34:24 +0200
Message-Id: <3cd1426f289d7e19d35c71b608091c863c541499.1480333940.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/18] npth: update to 1.3
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
X-List-Received-Date: Mon, 28 Nov 2016 13:37:35 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/npth/{npth_1.2.bb => npth_1.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/npth/{npth_1.2.bb => npth_1.3.bb} (81%)

diff --git a/meta/recipes-support/npth/npth_1.2.bb b/meta/recipes-support/npth/npth_1.3.bb
similarity index 81%
rename from meta/recipes-support/npth/npth_1.2.bb
rename to meta/recipes-support/npth/npth_1.3.bb
index 66aa347..d4fc064 100644
--- a/meta/recipes-support/npth/npth_1.2.bb
+++ b/meta/recipes-support/npth/npth_1.3.bb
@@ -11,8 +11,8 @@ SRC_URI = "${GNUPG_MIRROR}/npth/npth-${PV}.tar.bz2 \
            file://pkgconfig.patch \
           "
 
-SRC_URI[md5sum] = "226bac7374b9466c6ec26b1c34dab844"
-SRC_URI[sha256sum] = "6ddbdddb2cf49a4723f9d1ad6563c480d6760dcb63cb7726b8fc3bc2e1b6c08a"
+SRC_URI[md5sum] = "efe1524c53670b5755dc27893d2d68a0"
+SRC_URI[sha256sum] = "bca81940436aed0734eb8d0ff8b179e04cc8c087f5625204419f5f45d736a82a"
 
 BINCONFIG = "${bindir}/npth-config"
 
-- 
2.10.2


