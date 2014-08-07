Return-Path: <max.eliaser@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9F662701D0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 20:15:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Aug 2014 13:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,820,1400050800"; d="scan'208";a="555356295"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.63])
	by orsmga001.jf.intel.com with ESMTP; 07 Aug 2014 13:15:07 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Aug 2014 13:12:34 -0700
Message-Id: <6a3f9323a44bb547ee327cb8849923cb466b1a2d.1407442264.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1407442264.git.max.eliaser@intel.com>
References: <cover.1407442264.git.max.eliaser@intel.com>
In-Reply-To: <cover.1407442264.git.max.eliaser@intel.com>
References: <cover.1407442264.git.max.eliaser@intel.com>
Subject: [PATCH 1/3] python: python-pycairo: add python-pycairo-native
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
X-List-Received-Date: Thu, 07 Aug 2014 20:15:07 -0000

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


