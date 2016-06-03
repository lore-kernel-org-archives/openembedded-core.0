Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E257777515
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440237"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:26 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:14:54 +0300
Message-Id: <79d4322ae6cf4bd0018f920b4f00f065d18f08d1.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 17/25] mc: update to 4.8.17
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:26 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/mc/{mc_4.8.16.bb => mc_4.8.17.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.16.bb => mc_4.8.17.bb} (93%)

diff --git a/meta/recipes-extended/mc/mc_4.8.16.bb b/meta/recipes-extended/mc/mc_4.8.17.bb
similarity index 93%
rename from meta/recipes-extended/mc/mc_4.8.16.bb
rename to meta/recipes-extended/mc/mc_4.8.17.bb
index 16ed6a9..a5c4ece 100644
--- a/meta/recipes-extended/mc/mc_4.8.16.bb
+++ b/meta/recipes-extended/mc/mc_4.8.17.bb
@@ -8,8 +8,8 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            "
-SRC_URI[md5sum] = "b93706dfe66ffe4f61c1a2650798d207"
-SRC_URI[sha256sum] = "c37ea495df93f6d375a3ce59cdcf0f3a3690338526205347b03a316daebdaaf8"
+SRC_URI[md5sum] = "6e9c07066e40af06b263a13fad17a07f"
+SRC_URI[sha256sum] = "66d0cb37baaed8ef930f8ad25a634adad4f264eb61820893920ac87b9dfb783b"
 
 inherit autotools gettext pkgconfig
 
-- 
2.8.1


