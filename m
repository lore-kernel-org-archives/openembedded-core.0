Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QW9Qx-0004yS-KT
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:52:11 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jun 2011 08:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,359,1304319600"; d="scan'208";a="17648248"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jun 2011 08:48:46 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 23:48:26 +0800
Message-Id: <d4faff15427f5ece20d771f086358c167de0776a.1307979545.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1307979545.git.dexuan.cui@intel.com>
References: <cover.1307979545.git.dexuan.cui@intel.com>
Subject: [PATCH 01/13] tcmode-default: fix PREFERRED_VERSION_gcc-cross-canadian
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
X-List-Received-Date: Mon, 13 Jun 2011 15:52:11 -0000

[YOCTO #1163]

For some test I need to back to use gcc-4.5, so I changed GCCVERSION and
SDKGCCVERSION to "4.5.1", but I found gcc-cross-canadian's 4.6.0, rather
than 4.5.1, would be built! Finally I made this patch to fix the issue.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/conf/distro/include/tcmode-default.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 6eb34ef..90282ee 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -37,7 +37,7 @@ PREFERRED_VERSION_gcc-cross-intermediate ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-intermediate ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-cross-canadian ?= "${GCCVERSION}"
+PREFERRED_VERSION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-runtime-nativesdk ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_libgcc ?= "${GCCVERSION}"
-- 
1.7.1



