Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMc01-0000ea-1M
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:20:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2011 01:17:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,230,1304319600"; 
   d="scan'208";a="228927"
Received: from unknown (HELO localhost) ([10.255.12.160])
	by orsmga001.jf.intel.com with ESMTP; 18 May 2011 01:17:57 -0700
Message-Id: <0d7ad905b16850eb812d5751bd06a43bcb73acd6.1305702436.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305702436.git.sgw@linux.intel.com>
References: <cover.1305702436.git.sgw@linux.intel.com>
Old-Date: Tue, 17 May 2011 11:00:06 -0700
Date: Wed, 18 May 2011  1:17:57 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Robert Yang <liezhi.yang@windriver.com>
Subject: [PATCH 10/15] tcmode-default: switch to gcc 4.6.0 for x86, x86-64 & arm
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
X-List-Received-Date: Wed, 18 May 2011 08:20:57 -0000

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



