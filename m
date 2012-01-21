Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RoTT8-0001lA-6u
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 06:26:26 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2012 21:18:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="101117507"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.79])
	by orsmga002.jf.intel.com with ESMTP; 20 Jan 2012 21:18:42 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 21:18:24 -0800
Message-Id: <3374bef3ea57de0daf86db37e435f6c85adf6fbd.1327123057.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327123057.git.sgw@linux.intel.com>
References: <cover.1327123057.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327123057.git.sgw@linux.intel.com>
References: <cover.1327123057.git.sgw@linux.intel.com>
Subject: [PATCH 06/20] sysfsutils: refactor packages for staticdev
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
X-List-Received-Date: Sat, 21 Jan 2012 05:26:26 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
index 0b3f04a..3e4fdda 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
@@ -8,7 +8,7 @@ LICENSE_libsysfs = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3d06403ea54c7574a9e581c6478cc393 \
                     file://cmd/GPL;md5=d41d4e2e1e108554e0388ea4aecd8d27 \
                     file://lib/LGPL;md5=b75d069791103ffe1c0d6435deeff72e"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/linux-diag/sysfsutils-${PV}.tar.gz \
 	  file://sysfsutils-2.0.0-class-dup.patch \
@@ -20,6 +20,7 @@ S = "${WORKDIR}/sysfsutils-${PV}"
 
 inherit autotools
 
-PACKAGES_prepend = "libsysfs libsysfs-dev "
-FILES_libsysfs = "${libdir}/*.so.*"
-FILES_libsysfs-dev = "${libdir}/* ${includedir}"
+PACKAGES =+ "libsysfs libsysfs-dev libsysfs-staticdev"
+FILES_libsysfs = "${libdir}/lib*${SOLIBS}"
+FILES_libsysfs-dev = "${libdir}/lib*${SOLIBSDEV} ${includedir}"
+FILES_libsysfs-staticdev = "${libdir}/lib*.a"
-- 
1.7.6.5



