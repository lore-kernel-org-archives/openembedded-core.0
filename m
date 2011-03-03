Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PvHMM-0005df-4l
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 23:51:05 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Mar 2011 14:49:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,260,1297065600"; d="scan'208";a="663636599"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by fmsmga002.fm.intel.com with ESMTP; 03 Mar 2011 14:49:20 -0800
Message-Id: <000fa8e757fd10f69c581f88e277a3daeeb6894c.1299192495.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299192495.git.sgw@linux.intel.com>
References: <cover.1299192495.git.sgw@linux.intel.com>
Old-Date: Thu, 3 Mar 2011 10:10:49 +0800
Date: Thu, 03 Mar 2011 14:49:19 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 05/10] Add libtool-nativesdk for ADT
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
X-List-Received-Date: Thu, 03 Mar 2011 22:51:05 -0000

From: Liping Ke <liping.ke@intel.com>

We need to add libtool native sdk support in ADT installer.
This patch fix #bug  791

Signed-off-by: Liping Ke <liping.ke@intel.com>
---
 .../adt-installer/scripts/adt_installer_internal   |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 9653284..b5e304d 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -101,6 +101,9 @@ check_result
 echo_info "Installing pkgconfig nativesdk ...\n"
 $OPKG_INSTALL_NATIVE_CMD pkgconfig-nativesdk &>> $YOCTOADT_INSTALL_LOG_FILE
 check_result
+echo_info "Installing libtool nativesdk ...\n"
+$OPKG_INSTALL_NATIVE_CMD libtool-nativesdk &>> $YOCTOADT_INSTALL_LOG_FILE
+check_result
 
 for native_target_type in $YOCTOADT_TARGETS; do
   native_target_type=`echo "$native_target_type" | sed -e 's/x86_64/x86-64/' -e 's/x86$/i586/'`
-- 
1.7.1.1



