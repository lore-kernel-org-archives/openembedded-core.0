Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpOrO-0004vE-NA
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 19:43:18 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Jan 2012 10:34:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59212162"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.82])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Jan 2012 10:34:34 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 10:34:11 -0800
Message-Id: <f834148e3806fe22f75682a8ae5f3790488e3848.1327343524.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
Subject: [PATCH v2 06/21] sysfsutils: refactor packages for staticdev
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
X-List-Received-Date: Mon, 23 Jan 2012 18:43:18 -0000

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



