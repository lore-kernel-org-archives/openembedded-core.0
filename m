Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B76C977AA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:40:28 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 21 Apr 2017 05:40:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,229,1488873600"; d="scan'208";a="251889284"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2017 05:40:29 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 15:40:01 +0300
Message-Id: <044bb6a17d9a89462f7bb2020d455cb625551545.1492777818.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
References: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/11] python3-iniparse: fix upstream version check
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
X-List-Received-Date: Fri, 21 Apr 2017 12:40:28 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/python/python3-iniparse_0.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-iniparse_0.4.bb b/meta/recipes-devtools/python/python3-iniparse_0.4.bb
index 44e3c37f850..f51ce647c9b 100644
--- a/meta/recipes-devtools/python/python3-iniparse_0.4.bb
+++ b/meta/recipes-devtools/python/python3-iniparse_0.4.bb
@@ -8,6 +8,7 @@ SRC_URI = "https://files.pythonhosted.org/packages/source/i/iniparse/iniparse-${
            file://0001-Add-python-3-compatibility.patch "
 SRC_URI[md5sum] = "5e573e9e9733d97623881ce9bbe5eca6"
 SRC_URI[sha256sum] = "abc1ee12d2cfb2506109072d6c21e40b6c75a3fe90a9c924327d80bc0d99c054"
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/iniparse/"
 
 inherit distutils3
 
-- 
2.11.0


