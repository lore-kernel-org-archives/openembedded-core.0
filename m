Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 18D49731C4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:34:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 11 Jul 2016 07:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,346,1464678000"; d="scan'208";a="1004642500"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2016 07:34:55 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 17:33:52 +0300
Message-Id: <1468247633-24172-7-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1468247633-24172-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1468247633-24172-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 7/8] python-numpy: fix upstream version check
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
X-List-Received-Date: Mon, 11 Jul 2016 14:34:55 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/python-numpy/python-numpy_1.11.0.bb  | 1 +
 meta/recipes-devtools/python-numpy/python3-numpy_1.11.0.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.11.0.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.11.0.bb
index 51ef171..7c70a10 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy_1.11.0.bb
+++ b/meta/recipes-devtools/python-numpy/python-numpy_1.11.0.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://files.pythonhosted.org/packages/source/n/${SRCNAME}/${SRCNAME
            file://remove-build-path-in-comments.patch \
            file://fix_shebang_f2py.patch \
            ${CONFIGFILESURI} "
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/numpy/files/"
 
 CONFIGFILESURI ?= ""
 
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.11.0.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.11.0.bb
index 218909b..3cca223 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.11.0.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.11.0.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://files.pythonhosted.org/packages/source/n/${SRCNAME}/${SRCNAME
            file://remove-build-path-in-comments.patch \
            file://fix_shebang_f2py.patch \
            ${CONFIGFILESURI} "
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/numpy/files/"
 
 CONFIGFILESURI ?= ""
 
-- 
2.8.1


