Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2A29F6093A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 13:31:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 05:31:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,426,1508828400"; d="scan'208";a="188306972"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Dec 2017 05:31:39 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 15:26:03 +0200
Message-Id: <20171219132604.2493-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH 1/2] maintainers.inc: remove python recipes no longer provided in oe-core
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
X-List-Received-Date: Tue, 19 Dec 2017 13:31:39 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/maintainers.inc | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 1e7f249b611..68542bbed9a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -600,31 +600,14 @@ RECIPE_MAINTAINER_pn-pulseaudio-client-conf-sato = "Tanu Kaskinen <tanuk@iki.fi>
 RECIPE_MAINTAINER_pn-puzzles = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
 RECIPE_MAINTAINER_pn-python = "Alejandro Hernandez <alejandro.hernandez@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-native = "Alejandro Hernandez <alejandro.hernandez@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-async = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-distribute = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-git = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-gitdb = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-imaging = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-mako = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-native = "Alejandro Hernandez <alejandro.hernandez@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-nose = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-numpy = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-pexpect = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-ptyprocess = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-pycairo = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-pycurl = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-pygtk = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-pyrex = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-scons = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-scons-native = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-setuptools = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-six = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-smartpm = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-smmap = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3 = "Alejandro Hernandez <alejandro.hernandez@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-async = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-dbus = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3-distribute = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-docutils = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-git = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-gitdb = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-- 
2.15.1


