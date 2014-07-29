Return-Path: <max.eliaser@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 264C065C7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 18:09:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Jul 2014 11:09:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,758,1400050800"; d="scan'208";a="580767810"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.64])
	by orsmga002.jf.intel.com with ESMTP; 29 Jul 2014 11:09:15 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jul 2014 11:07:06 -0700
Message-Id: <6a3f9323a44bb547ee327cb8849923cb466b1a2d.1406657048.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1406657048.git.max.eliaser@intel.com>
References: <cover.1406657048.git.max.eliaser@intel.com>
In-Reply-To: <cover.1406657048.git.max.eliaser@intel.com>
References: <cover.1406657048.git.max.eliaser@intel.com>
Subject: [PATCH 1/2] python: python-pycairo: add python-pycairo-native
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
X-List-Received-Date: Tue, 29 Jul 2014 18:09:15 -0000

A -native variant of python-pycairo will be necessary for running the native
version of pybootchartgui. It may also come in handy for running other Python
utilities from the native sysroot.

Signed-off-by: Max Eliaser <max.eliaser@intel.com>
---
 meta/recipes-devtools/python/python-pycairo_1.10.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python-pycairo_1.10.0.bb b/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
index 5b59b6c..70fe25c 100644
--- a/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
+++ b/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
@@ -20,6 +20,8 @@ S = "${WORKDIR}/py2cairo-${PV}"
 
 inherit distutils pkgconfig
 
+BBCLASSEXTEND = "native"
+
 do_configure() {
 	BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} ./waf configure --prefix=${D}${prefix} --libdir=${D}${libdir}
 }
-- 
1.8.3.2


