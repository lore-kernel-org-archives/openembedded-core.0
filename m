Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNrMH-0002iP-U1
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 20:29:22 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Nov 2011 11:23:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,477,1315206000"; d="scan'208";a="34587149"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 11:23:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 11:22:51 -0800
Message-Id: <49dcb301ab39327554d86d23cf6f8d435d7a7351.1320780004.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/17] Add new IMAGE_CLASSES variable for classes for image generation
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
X-List-Received-Date: Tue, 08 Nov 2011 19:29:22 -0000

From: Matthew McClintock <msm@freescale.com>

Allows us to import classes only for images and not to the global
namespace

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/image.bbclass           |    3 ++-
 meta/conf/local.conf.sample.extended |    6 ++++++
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 48b78da..14726d2 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -109,7 +109,8 @@ def get_devtable_list(d):
         str += " %s" % bb.which(bb.data.getVar('BBPATH', d, 1), devtable)
     return str
 
-inherit image_types
+IMAGE_CLASSES ?= "image_types"
+inherit ${IMAGE_CLASSES}
 
 IMAGE_POSTPROCESS_COMMAND ?= ""
 MACHINE_POSTPROCESS_COMMAND ?= ""
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 0c3197d..e9935ce 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -114,3 +114,9 @@
 # The network based PR service host and port
 #PRSERV_HOST = "localhost"
 #PRSERV_PORT = "8585"
+
+# Additional image generation features
+#
+# The following is a list of classes to import to use in the generation of images
+# currently an example class is image_types_uboot
+# IMAGE_CLASSES = " image_types_uboot"
-- 
1.7.6.4



