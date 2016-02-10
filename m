Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id AC2257318D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 21:13:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 10 Feb 2016 13:13:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,427,1449561600"; d="scan'208";a="912600186"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2016 13:13:12 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 21:13:52 +0000
Message-Id: <1455138832-41400-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] python-setuptools: Add python-compile on RDEPENDS
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
X-List-Received-Date: Wed, 10 Feb 2016 21:13:23 -0000

When trying to install packages using python-setuptools, compilation
may fail complaining about the py_compile module not existing, this
presented itself when installing pyephem for example, this patch
adds python-compile to setuptools RDEPENDS to fix the issue.

[YOCTO 9009]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-setuptools_19.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python-setuptools_19.4.bb b/meta/recipes-devtools/python/python-setuptools_19.4.bb
index 86bbebf..c172039 100644
--- a/meta/recipes-devtools/python/python-setuptools_19.4.bb
+++ b/meta/recipes-devtools/python/python-setuptools_19.4.bb
@@ -23,6 +23,7 @@ RDEPENDS_${PN} = "\
   python-ctypes \
   python-subprocess \
   python-unittest \
+  python-compile \
 "
 
 RDEPENDS_${PN}_class-native = "\
-- 
2.6.2


