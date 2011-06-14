Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOd4-0001K5-8e
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283943"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:34 -0700
Message-Id: <c13161e05cb4226397422f024b756a55c6412c72.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/51] tcmode-default: fix PREFERRED_VERSION_gcc-cross-canadian
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
X-List-Received-Date: Tue, 14 Jun 2011 08:05:43 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

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
1.7.3.4



