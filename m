Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1T948i-0001mM-Iu
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 03:10:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Sep 2012 17:58:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,371,1344236400"; d="scan'208";a="196873536"
Received: from envy.jf.intel.com (HELO envy) ([10.7.201.159])
	by orsmga002.jf.intel.com with ESMTP; 04 Sep 2012 17:57:49 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id q850ujv7031763;
	Tue, 4 Sep 2012 17:56:45 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q850ujKN031762;
	Tue, 4 Sep 2012 17:56:45 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2012 17:56:43 -0700
Message-Id: <13aa995f2094ce4ed224f6c72e7f42c7c85be8b0.1346806132.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346806132.git.elizabeth.flanagan@intel.com>
References: <cover.1346806132.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/1] adt-installer: Add adt-installer-dev.bb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 01:10:44 -0000

This adds an adt-installer-dev for QA and autobuilder use.
It repoints the ADTREPO url to adtrepo-dev.yp.org.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 .../installer/adt-installer-dev_1.0.bb             |   26 ++++++++++++++++++++
 .../installer/adt-installer/adt_installer.conf     |    2 +-
 2 files changed, 27 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/installer/adt-installer-dev_1.0.bb

diff --git a/meta/recipes-devtools/installer/adt-installer-dev_1.0.bb b/meta/recipes-devtools/installer/adt-installer-dev_1.0.bb
new file mode 100644
index 0000000..7679038
--- /dev/null
+++ b/meta/recipes-devtools/installer/adt-installer-dev_1.0.bb
@@ -0,0 +1,26 @@
+# Yocto ADT Installer bb file
+#
+# Copyright 2010-2011 by Intel Corp.
+#
+# Permission is hereby granted, free of charge, to any person obtaining a copy 
+# of this software and associated documentation files (the "Software"), to deal 
+# in the Software without restriction, including without limitation the rights 
+# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
+# copies of the Software, and to permit persons to whom the Software is 
+# furnished to do so, subject to the following conditions:
+
+# The above copyright notice and this permission notice shall be included in 
+# all copies or substantial portions of the Software.
+
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
+# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
+# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
+# THE SOFTWARE.
+
+require recipes-devtools/installer/adt-installer_${PV}.bb
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/adt-installer:"
+ADTREPO = "http://adtrepo-dev.yoctoproject.org/${SDK_VERSION}"
diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
index afc69a4..171d2ac 100644
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
@@ -23,7 +23,7 @@
 
 # Your yocto distro repository, this should include IPKG based packages and root filesystem files where the installation is based on
 
-YOCTOADT_REPO="http://adtrepo.yoctoproject.org/YOCTOADT_VERSION"
+YOCTOADT_REPO="ADTREPO"
 
 # The following are for system wide setup
 # Target architectures that you want to setup host cross dev environment for
-- 
1.7.5.4



