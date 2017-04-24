Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 10C2977A65
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 13:16:02 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Apr 2017 06:16:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,244,1488873600"; d="scan'208";a="93097186"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 24 Apr 2017 06:16:03 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Apr 2017 16:15:48 +0300
Message-Id: <20170424131551.2212-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/4] boost: fix upstream version check
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
X-List-Received-Date: Mon, 24 Apr 2017 13:16:07 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/boost/boost-1.64.0.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost-1.64.0.inc b/meta/recipes-support/boost/boost-1.64.0.inc
index 2fa63dca6c7..dc7b1a9c015 100644
--- a/meta/recipes-support/boost/boost-1.64.0.inc
+++ b/meta/recipes-support/boost/boost-1.64.0.inc
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
 SRC_URI[md5sum] = "93eecce2abed9d2442c9676914709349"
 SRC_URI[sha256sum] = "7bcc5caace97baa948931d712ea5f37038dbb1c5d89b43ad4def4ed7cb683332"
 
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/boost/files/"
+UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
+UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
 
 S = "${WORKDIR}/${BOOST_P}"
-- 
2.11.0


