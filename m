Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNJqr-00083M-LQ
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 09:10:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 May 2011 00:07:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,241,1304319600"; d="scan'208";a="439578193"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.39])
	by azsmga001.ch.intel.com with ESMTP; 20 May 2011 00:07:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2011 00:06:51 -0700
Message-Id: <238244d33de6d2b48eeb98c4dc8f7191ea44fbed.1305874831.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1305874831.git.sgw@linux.intel.com>
References: <cover.1305874831.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305874831.git.sgw@linux.intel.com>
References: <cover.1305874831.git.sgw@linux.intel.com>
Subject: [PATCH 01/12] tcmode-default: switch to gcc 4.6.0 for x86, x86-64 & arm
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
X-List-Received-Date: Fri, 20 May 2011 07:10:26 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

mips & ppc are not ready yet. Waiting for kernel issues to be fixed.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/distro/include/tcmode-default.inc |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 584da9b..ae6f272 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -16,8 +16,12 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
 PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-initial-nativesdk = "${TCLIBC}-initial-nativesdk"
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "4.5.1"
-SDKGCCVERSION ?= "4.5.1"
+GCCVERSION ?= "4.6.0"
+SDKGCCVERSION ?= "4.6.0"
+GCCVERSION_mips ?= "4.5.1"
+SDKGCCVERSION_mips ?= "4.5.1"
+GCCVERSION_ppc ?= "4.5.1"
+SDKGCCVERSION_ppc ?= "4.5.1"
 BINUVERSION ?= "2.21"
 GLIBCVERSION ?= "2.10.1"
 EGLIBCVERSION ?= "2.12"
-- 
1.7.3.4



