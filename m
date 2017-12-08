Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5E3F371ADD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 22:45:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Dec 2017 14:45:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,379,1508828400"; 
   d="scan'208";a="1306942"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Dec 2017 14:45:54 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 14:45:17 -0800
Message-Id: <3241d2bc89227cc61a309ebfded182bd51077a40.1512765771.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
References: <cover.1512765771.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH v2 05/19] python-scons: Remove python-importlib dependency
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
X-List-Received-Date: Fri, 08 Dec 2017 22:45:52 -0000

From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>

With the new manifest python-importlib became part of python-core
(it was being installed anyway), so now the package cant be found
and it shouldnt be listed as a dependency, this patch fixes
python-scons RDEPENDS to avoid dependency errors.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-scons_3.0.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-scons_3.0.0.bb b/meta/recipes-devtools/python/python-scons_3.0.0.bb
index 8fe74f4b3c1..e780c542e4a 100644
--- a/meta/recipes-devtools/python/python-scons_3.0.0.bb
+++ b/meta/recipes-devtools/python/python-scons_3.0.0.bb
@@ -24,5 +24,4 @@ RDEPENDS_${PN} = "\
   python-subprocess \
   python-shell \
   python-pprint \
-  python-importlib \
   "
-- 
2.13.6


