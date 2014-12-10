Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C09757232B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 05:44:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2014 21:44:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,550,1413270000"; d="scan'208";a="645258203"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2014 21:44:52 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Dec 2014 21:44:46 -0800
Message-Id: <086229980390cca38fc7c2857f5aa0ec9d9cd4f6.1418190099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1418190099.git.sgw@linux.intel.com>
References: <cover.1418190099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1418190099.git.sgw@linux.intel.com>
References: <cover.1418190099.git.sgw@linux.intel.com>
Subject: [PATCH 1/4] python-pip: Add version 1.5.6
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
X-List-Received-Date: Wed, 10 Dec 2014 05:44:57 -0000

Imported from meta-python

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/python/python-pip_1.5.6.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-pip_1.5.6.bb

diff --git a/meta/recipes-devtools/python/python-pip_1.5.6.bb b/meta/recipes-devtools/python/python-pip_1.5.6.bb
new file mode 100644
index 0000000..0c240e4
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pip_1.5.6.bb
@@ -0,0 +1,15 @@
+SUMMARY = "PIP is a tool for installing and managing Python packages"
+LICENSE = "MIT & LGPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=45665b53032c02b35e29ddab8e61fa91"
+
+SRC_URI = "https://pypi.python.org/packages/source/p/pip/pip-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "01026f87978932060cc86c1dc527903e"
+SRC_URI[sha256sum] = "b1a4ae66baf21b7eb05a5e4f37c50c2706fa28ea1f8780ce8efe14dcd9f1726c"
+
+S = "${WORKDIR}/pip-${PV}"
+
+inherit setuptools
+
+# Since PIP is like CPAN for PERL we need to drag in all python modules to ensure everything works
+RDEPENDS_${PN} = "python-modules"
-- 
1.8.3.1


