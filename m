Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id EB7A5784A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Feb 2018 20:28:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Feb 2018 12:28:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,480,1511856000"; d="scan'208";a="25838113"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 08 Feb 2018 12:28:53 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Feb 2018 22:22:28 +0200
Message-Id: <20180208202228.20850-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180208202228.20850-1-alexander.kanavin@linux.intel.com>
References: <20180208202228.20850-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/3] python-numpy: fix upstream version check
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
X-List-Received-Date: Thu, 08 Feb 2018 20:28:53 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/python-numpy/python-numpy_1.13.1.bb  | 1 +
 meta/recipes-devtools/python-numpy/python3-numpy_1.13.3.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.13.1.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.13.1.bb
index 13e8f4fa230..b6ec2308e41 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy_1.13.1.bb
+++ b/meta/recipes-devtools/python-numpy/python-numpy_1.13.1.bb
@@ -16,6 +16,7 @@ SRC_URI[md5sum] = "6d459e4a24f5035f720dda3c57716a92"
 SRC_URI[sha256sum] = "de020ec06f1e9ce1115a50161a38bf8d4c2525379900f9cb478cc613a1e7cd93"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
 CONFIGFILESURI ?= ""
 
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.13.3.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.13.3.bb
index 277c21f9da4..553b0fac7f2 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.13.3.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.13.3.bb
@@ -15,6 +15,7 @@ SRC_URI[md5sum] = "c1d433e5973e548809e80c9118474b73"
 SRC_URI[sha256sum] = "4c6b4eef790528bebb7ec9590d74cc193868940fe68e4109a91c196df72d8094"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
 CONFIGFILESURI ?= ""
 
-- 
2.15.1


