Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzQb-0006Cw-VK
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:56:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Apr 2011 23:54:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="679865421"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2011 23:54:02 -0700
Message-Id: <94b4606eaaf4fee32227b2ad70bc2dc818884088.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Tue, 12 Apr 2011 00:57:27 +0800
Date: Fri, 15 Apr 2011 23:54:02 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 20/58] oprofileui: upgrade to latest git version
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
X-List-Received-Date: Sat, 16 Apr 2011 06:56:22 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../conf/distro/include/poky-default-revisions.inc |    2 +-
 .../oprofileui/dso_linking_change_build_fix.patch  |    2 ++
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

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
diff --git a/meta/recipes-kernel/oprofile/oprofileui/dso_linking_change_build_fix.patch b/meta/recipes-kernel/oprofile/oprofileui/dso_linking_change_build_fix.patch
index 4b44c69..39ceb22 100644
--- a/meta/recipes-kernel/oprofile/oprofileui/dso_linking_change_build_fix.patch
+++ b/meta/recipes-kernel/oprofile/oprofileui/dso_linking_change_build_fix.patch
@@ -7,6 +7,8 @@ With dso linking change in gcc, all the libraries are needed to be explicitely s
 | collect2: ld returned 1 exit status^M
 | make[2]: *** [oprofile-viewer] Error 1^M
 
+Upstream-Status: Inappropriate [configuration]
+
 Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2011/01/11
 
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
1.7.1.1



