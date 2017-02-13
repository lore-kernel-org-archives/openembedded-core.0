Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id AA7F3731C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:06:03 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:06:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546736"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:06:03 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:05:56 +0200
Message-Id: <efd308bf3a5d400f117624415c9b69a199ffe7ba.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 26/36] package_rpm.bbclass: replace createrepo reference with createrepo_c
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
X-List-Received-Date: Mon, 13 Feb 2017 15:06:04 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/package_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 95a8b147c4e..1bf155a92ea 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -765,6 +765,6 @@ do_package_write_rpm[depends] += "${@oe.utils.build_depends_string(d.getVar('PAC
 addtask package_write_rpm after do_packagedata do_package
 
 PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
-PACKAGEINDEXDEPS += "createrepo-native:do_populate_sysroot"
+PACKAGEINDEXDEPS += "createrepo-c-native:do_populate_sysroot"
 
 do_build[recrdeptask] += "do_package_write_rpm"
-- 
2.11.0


