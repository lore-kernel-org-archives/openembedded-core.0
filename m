Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7C736784B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:57:45 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:57:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402135"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:57:46 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:30 +0200
Message-Id: <20171114145754.9643-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/27] python-scons: fix upstream version check
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
X-List-Received-Date: Tue, 14 Nov 2017 14:57:45 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/python/python-scons_3.0.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-scons_3.0.0.bb b/meta/recipes-devtools/python/python-scons_3.0.0.bb
index 33bfb45e2e4..8fe74f4b3c1 100644
--- a/meta/recipes-devtools/python/python-scons_3.0.0.bb
+++ b/meta/recipes-devtools/python/python-scons_3.0.0.bb
@@ -10,7 +10,8 @@ SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME
 SRC_URI[md5sum] = "7ca558edaaa1942fe38f3105ca2400fb"
 SRC_URI[sha256sum] = "aa5afb33c2bbd33c311e47e912412195739e9ffb2e933534a31f85fba8f3470e"
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/SCons/"
+UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.15.0


