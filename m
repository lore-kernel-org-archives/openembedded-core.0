Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EBBE078229
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 11:48:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Aug 2017 04:48:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,444,1498546800"; d="scan'208";a="1008808177"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2017 04:48:27 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 14:45:25 +0300
Message-Id: <20170829114526.37559-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170829114526.37559-1-alexander.kanavin@linux.intel.com>
References: <20170829114526.37559-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/3] subversion: inherit pkgconfig, so that serf can be found
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
X-List-Received-Date: Tue, 29 Aug 2017 11:48:27 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/subversion/subversion_1.9.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/subversion/subversion_1.9.6.bb b/meta/recipes-devtools/subversion/subversion_1.9.6.bb
index b27115b981f..f49e26a5c8c 100644
--- a/meta/recipes-devtools/subversion/subversion_1.9.6.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.9.6.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://subversion.tigris.org"
 
 BBCLASSEXTEND = "native"
 
-inherit gettext
+inherit gettext pkgconfig
 
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://disable_macos.patch \
-- 
2.14.1


