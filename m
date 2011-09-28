Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R8mRf-0001ns-5o
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 07:12:35 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Sep 2011 22:07:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="71468337"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 27 Sep 2011 22:07:06 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 13:02:44 +0800
Message-Id: <d0813910bc4f199e96c692fc7ef30cd257a0d646.1317185969.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1317185969.git.edwin.zhai@intel.com>
References: <cover.1317185969.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1317185969.git.edwin.zhai@intel.com>
References: <cover.1317185969.git.edwin.zhai@intel.com>
Subject: [PATCH 2/4] libgsf: remove dependence on gnome-vfs
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
X-List-Received-Date: Wed, 28 Sep 2011 05:12:35 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../recipes-gnome/libgsf/libgsf_1.14.5.bb          |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-demoapps/recipes-gnome/libgsf/libgsf_1.14.5.bb b/meta-demoapps/recipes-gnome/libgsf/libgsf_1.14.5.bb
index 3ac7d6e..bf1b1ad 100644
--- a/meta-demoapps/recipes-gnome/libgsf/libgsf_1.14.5.bb
+++ b/meta-demoapps/recipes-gnome/libgsf/libgsf_1.14.5.bb
@@ -1,10 +1,14 @@
 DESCRIPTION = "GNOME Structured File Library"
 LICENSE = "GPL"
 SECTION = "libs"
-PR = "r1"
+PR = "r2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
+                    file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63 \
+                    file://gsf/gsf.h;endline=25;md5=15cf6d31ad023167779ab5f0bbb76f49"
 
 DEPENDS= "libxml2 bzip2 glib-2.0 zlib"
-RDEPENDS_${PN} = "gconf gnome-vfs"
+RDEPENDS_${PN} = "gconf"
 
 
 PACKAGES =+ "${PN}-gnome ${PN}-gnome-dev "
-- 
1.7.1



