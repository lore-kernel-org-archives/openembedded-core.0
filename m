Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QODkc-0000tB-Tq
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 20:51:43 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 May 2011 11:48:44 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by orsmga002.jf.intel.com with ESMTP; 22 May 2011 11:48:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 May 2011 11:48:32 -0700
Message-Id: <8c10a7c6a23949e0e824a255dae56a16c1859c0d.1306089781.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306089781.git.sgw@linux.intel.com>
References: <cover.1306089781.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306089781.git.sgw@linux.intel.com>
References: <cover.1306089781.git.sgw@linux.intel.com>
Subject: [PATCH 8/9] tcmode-default: switch to gcc 4.6.0 for ppc & mips also
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
X-List-Received-Date: Sun, 22 May 2011 18:51:43 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Now the kernel issues related to gcc 4.6.0 for mips & ppc are fixed.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/distro/include/tcmode-default.inc |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index c2c9efe..d279231 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -18,10 +18,6 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "4.6.0"
 SDKGCCVERSION ?= "4.6.0"
-GCCVERSION_mips ?= "4.5.1"
-SDKGCCVERSION_mips ?= "4.5.1"
-GCCVERSION_ppc ?= "4.5.1"
-SDKGCCVERSION_ppc ?= "4.5.1"
 BINUVERSION ?= "2.21"
 GLIBCVERSION ?= "2.10.1"
 EGLIBCVERSION ?= "2.13"
-- 
1.7.3.4



