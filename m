Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QRlNL-0007Bc-6d
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 15:22:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Jun 2011 06:19:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,303,1304319600"; d="scan'208";a="10343795"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2011 06:19:07 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2011 21:18:32 +0800
Message-Id: <806387a97c6c01bb724c29f51de511ed43688bb0.1306931848.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
Subject: [RFC v1 PATCH 01/16] native.bbclass: allow a native package to be populated into its own dir
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
X-List-Received-Date: Wed, 01 Jun 2011 13:22:19 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/classes/native.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index e06f02a..8a3c294 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -67,6 +67,11 @@ base_prefix = "${STAGING_DIR_NATIVE}"
 prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
 exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
 
+PACKAGE_OWN_DIR = ""
+bindir .= "${PACKAGE_OWN_DIR}"
+libdir .= "${PACKAGE_OWN_DIR}"
+libexecdir .= "${PACKAGE_OWN_DIR}"
+
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_NATIVE}"
 do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_NATIVE}"
 
-- 
1.7.2



