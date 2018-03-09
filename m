Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7168A78917
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:02:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:02:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32651855"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:02:56 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:41 +0200
Message-Id: <20180309185614.31113-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/36] u-boot: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:02:55 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch b/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
index cea52b79e6a..ecaa1796a49 100644
--- a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
+++ b/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
@@ -5,15 +5,15 @@ Upstream-Status: Pending
 
 Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
 
-diff --git a/configs/MPC8315ERDB_defconfig b/configs/MPC8315ERDB_defconfig
-index 4e2b705..b02ab1f 100644
---- a/configs/MPC8315ERDB_defconfig
-+++ b/configs/MPC8315ERDB_defconfig
-@@ -9,6 +9,7 @@ CONFIG_HUSH_PARSER=y
- CONFIG_CMD_I2C=y
+Index: git/configs/MPC8315ERDB_defconfig
+===================================================================
+--- git.orig/configs/MPC8315ERDB_defconfig
++++ git/configs/MPC8315ERDB_defconfig
+@@ -12,6 +12,7 @@ CONFIG_CMD_PCI=y
+ CONFIG_CMD_SATA=y
  CONFIG_CMD_USB=y
  # CONFIG_CMD_SETEXPR is not set
 +CONFIG_CMD_DHCP=y
  CONFIG_CMD_MII=y
  CONFIG_CMD_PING=y
- CONFIG_CMD_EXT2=y
+ CONFIG_CMD_DATE=y
-- 
2.16.1


