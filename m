Return-Path: <laurentiu.palcu@intel.com>
X-Greylist: delayed 613 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 May 2014 14:39:20 UTC
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 59EDD601A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 14:39:20 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 May 2014 07:29:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1035,1389772800"; d="scan'208";a="430987765"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2014 07:29:07 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 17:29:02 +0300
Message-Id: <fa467600cf1c4f30d489d77801f85c06fccb53b9.1399904787.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399904787.git.laurentiu.palcu@intel.com>
References: <cover.1399904787.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1399904787.git.laurentiu.palcu@intel.com>
References: <cover.1399904787.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] adt_installer: run autoreconf before configuring opkg
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
X-List-Received-Date: Mon, 12 May 2014 14:39:24 -0000

opkg fails to build on hosts with older autotools versions.

[YOCTO #6293]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../installer/adt-installer/adt_installer          |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index 1f2d039..7fc37f8 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -182,6 +182,7 @@ if [ ! -x "$LOCAL_OPKG_LOC/bin/opkg-cl" ]; then
   check_result
 
   echo_info "Configure opkg ...\n"
+  autoreconf
   ./configure --prefix=$parent_folder/$LOCAL_OPKG_LOC --with-opkglibdir=$OPKG_LIBDIR --enable-shared=no --disable-curl --disable-ssl-curl --disable-gpg --disable-shave >> $parent_folder/$YOCTOADT_INSTALL_LOG_FILE
   check_result
 
-- 
1.7.9.5


