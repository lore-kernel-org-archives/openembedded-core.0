Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Q9U9b-0003Kf-7n
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2011 05:20:35 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Apr 2011 20:18:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,193,1301900400"; d="scan'208";a="677867065"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2011 20:18:20 -0700
Message-Id: <b2cf6a6558e9931f2be1e6ff142ef71fddcf7074.1302576423.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302576423.git.dexuan.cui@intel.com>
References: <cover.1302576423.git.dexuan.cui@intel.com>
Old-Date: Tue, 12 Apr 2011 00:57:27 +0800
Date: Tue, 12 Apr 2011 11:16:18 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 01/12] oprofileui: upgrade to latest git version
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
X-List-Received-Date: Tue, 12 Apr 2011 03:20:35 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../conf/distro/include/poky-default-revisions.inc |    2 +-
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/poky-default-revisions.inc b/meta/conf/distro/include/poky-default-revisions.inc
index 9a3ae7e..5e7ab66 100644
--- a/meta/conf/distro/include/poky-default-revisions.inc
+++ b/meta/conf/distro/include/poky-default-revisions.inc
@@ -146,7 +146,7 @@ SRCREV_pn-opkg-nogpg-native ??= "${OPKGSRCREV}"
 SRCREV_pn-opkg-nogpg-nativesdk ??= "${OPKGSRCREV}"
 SRCREV_pn-opkg-utils-native ??= "4747"
 SRCREV_pn-opkg-utils ??= "4747"
-SRCREV_pn-oprofileui ??= "2387488fb520725ca9cff888bc1ed25788276b13"
+SRCREV_pn-oprofileui ??= "0c3c32fa754c1d0b70e65767ea7048914f776396"
 SRCREV_pn-tcf-agent ??= "1078"
 SRCREV_pn-osc-native ??= "9096"
 SRCREV_pn-owl-video ??= "394"
diff --git a/meta/recipes-kernel/oprofile/oprofileui_git.bb b/meta/recipes-kernel/oprofile/oprofileui_git.bb
index c83d43c..44adcb7 100644
--- a/meta/recipes-kernel/oprofile/oprofileui_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui_git.bb
@@ -1,7 +1,7 @@
 require oprofileui.inc
 
 PV = "0.0+git${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.2



