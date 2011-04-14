Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QAIQC-0000Da-8B
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Apr 2011 11:01:04 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Apr 2011 01:58:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,210,1301900400"; d="scan'208";a="909425368"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2011 01:58:49 -0700
Message-Id: <dc2b7b09baaee3ef172e41edfb2eedfe065b0006.1302770941.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302770941.git.dexuan.cui@intel.com>
References: <cover.1302770941.git.dexuan.cui@intel.com>
Old-Date: Tue, 12 Apr 2011 10:39:42 +0800
Date: Thu, 14 Apr 2011 16:56:44 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [v2 12/12] gnu-config-native: add dependency on perl-native
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
X-List-Received-Date: Thu, 14 Apr 2011 09:01:04 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Fixes [YOCTO #968]

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../gnu-config/gnu-config_20080123.bb              |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb b/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
index e0a8155..2ad0834 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
@@ -3,7 +3,9 @@ DESCRIPTION = "Tool that installs the GNU config.guess / config.sub into a direc
 SECTION = "devel"
 LICENSE = "GPLv1+"
 LIC_FILES_CHKSUM = "file://config.guess;endline=39;md5=a089987af4a25cb0419d1c2fd6d495e3"
-DEPENDS = ""
+
+DEPENDS_virtclass-native = "perl-native"
+
 INHIBIT_DEFAULT_DEPS = "1"
 
 FIXEDSRCDATE = "${@bb.data.getVar('FILE', d, 1).split('_')[-1].split('.')[0]}"
-- 
1.7.2



