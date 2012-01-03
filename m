Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rhxr2-0004Kv-Mo
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:12 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752127"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:45 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:18:58 -0800
Message-Id: <09b1dc8bd886c8cd2a5d4085d8bb4b73ece1f5b0.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 012/113] base.bbclass: Allow buildstats to be optionally supplied
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:13 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Buildstats should be allowed to be optionally enabled.  It's
recommended that it be enabled via the USER_CLASSES setting.

Alternatively it could be enabled via the INHERIT_DISTRO or
similar mechanism.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/base.bbclass   |    1 -
 meta/conf/local.conf.sample |    3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index fbcaefb..e65a722 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -7,7 +7,6 @@ inherit mirrors
 inherit utils
 inherit utility-tasks
 inherit metadata_scm
-inherit buildstats
 inherit logging
 
 OE_IMPORTS += "os sys time oe.path oe.utils oe.data oe.packagegroup"
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 73ab9f8..7d52d0e 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -134,12 +134,13 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
 # The following is a list of additional classes to use when building images which
 # enable extra features. Some available options which can be included in this variable 
 # are:
+#   - 'buildstats' collect build statistics
 #   - 'image-mklibs' to reduce shared library files size for an image
 #   - 'image-prelink' in order to prelink the filesystem image
 #   - 'image-swab' to perform host system intrusion detection
 # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
 # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
-USER_CLASSES ?= "image-mklibs image-prelink"
+USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 
 #
 # Runtime testing of images
-- 
1.7.6.4



