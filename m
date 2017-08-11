Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A68C178276
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 09:48:40 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Aug 2017 02:48:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,356,1498546800"; d="scan'208";a="117958431"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 11 Aug 2017 02:48:41 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 12:45:18 +0300
Message-Id: <20170811094519.27645-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170811094519.27645-1-alexander.kanavin@linux.intel.com>
References: <20170811094519.27645-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/5] pax-utils: check upstream version from debian servers
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
X-List-Received-Date: Fri, 11 Aug 2017 09:48:40 -0000

Gentoo server can be very slow to list the tarball directory.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb b/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
index 476fa6f0743..c6c49e9b2d0 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz \
 
 SRC_URI[md5sum] = "a580468318f0ff42edf4a8cd314cc942"
 SRC_URI[sha256sum] = "7f4a7f8db6b4743adde7582fa48992ad01776796fcde030683732f56221337d9"
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/p/pax-utils/"
+UPSTREAM_CHECK_REGEX = "pax-utils_(?P<pver>\d+(\.\d+)+)\.orig\.tar"
 
 RDEPENDS_${PN} += "bash"
 
-- 
2.13.2


