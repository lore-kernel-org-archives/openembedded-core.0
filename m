Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Pxs02-0006uN-JN
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Mar 2011 03:22:42 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Mar 2011 18:21:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,300,1297065600"; d="scan'208";a="611596560"
Received: from unknown (HELO localhost) ([10.255.17.57])
	by orsmga002.jf.intel.com with ESMTP; 10 Mar 2011 18:21:01 -0800
Message-Id: <bf9a8b3a18b95a6225e2d2c9959a30601d681a83.1299809859.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299809859.git.sgw@linux.intel.com>
References: <cover.1299809859.git.sgw@linux.intel.com>
Old-Date: Thu, 10 Mar 2011 16:22:33 -0800
Date: Thu, 10 Mar 2011 18:20:59 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 11/12] poky-image-lsb: add ssh-server to IMAGE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Mar 2011 02:22:42 -0000

From: Scott Garman <scott.a.garman@intel.com>

And set the default IMAGE_SSH_PROVIDER to openssh.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-extended/images/poky-image-lsb-dev.bb |    4 +++-
 meta/recipes-extended/images/poky-image-lsb-sdk.bb |    4 +++-
 meta/recipes-extended/images/poky-image-lsb.bb     |    4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/images/poky-image-lsb-dev.bb b/meta/recipes-extended/images/poky-image-lsb-dev.bb
index d490ee5..0c73ff3 100644
--- a/meta/recipes-extended/images/poky-image-lsb-dev.bb
+++ b/meta/recipes-extended/images/poky-image-lsb-dev.bb
@@ -1,4 +1,6 @@
-IMAGE_FEATURES += "apps-console-core dev-pkgs "
+IMAGE_SSH_PROVIDER = "openssh"
+
+IMAGE_FEATURES += "apps-console-core dev-pkgs ssh-server"
 
 IMAGE_INSTALL = "\
     ${POKY_BASE_INSTALL} \
diff --git a/meta/recipes-extended/images/poky-image-lsb-sdk.bb b/meta/recipes-extended/images/poky-image-lsb-sdk.bb
index 184b5d7..e4634b6 100644
--- a/meta/recipes-extended/images/poky-image-lsb-sdk.bb
+++ b/meta/recipes-extended/images/poky-image-lsb-sdk.bb
@@ -1,4 +1,6 @@
-IMAGE_FEATURES += "apps-console-core tools-debug tools-profile tools-sdk dev-pkgs"
+IMAGE_SSH_PROVIDER = "openssh"
+
+IMAGE_FEATURES += "apps-console-core tools-debug tools-profile tools-sdk dev-pkgs ssh-server"
 
 IMAGE_INSTALL = "\
     ${POKY_BASE_INSTALL} \
diff --git a/meta/recipes-extended/images/poky-image-lsb.bb b/meta/recipes-extended/images/poky-image-lsb.bb
index 8424d91..4504bb7 100644
--- a/meta/recipes-extended/images/poky-image-lsb.bb
+++ b/meta/recipes-extended/images/poky-image-lsb.bb
@@ -1,4 +1,6 @@
-IMAGE_FEATURES += "apps-console-core "
+IMAGE_SSH_PROVIDER = "openssh"
+
+IMAGE_FEATURES += "apps-console-core ssh-server"
 
 IMAGE_INSTALL = "\
     ${POKY_BASE_INSTALL} \
-- 
1.7.1.1



