Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UbUO3-0005W9-QI
	for openembedded-core@lists.openembedded.org;
	Sun, 12 May 2013 13:24:21 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2013 04:04:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,657,1363158000"; d="scan'208";a="335731219"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.12.35])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2013 04:05:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 May 2013 04:05:39 -0700
Message-Id: <1368356739-17625-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [RFC] tcmode-default: Set 4.8 as default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 May 2013 11:24:24 -0000

This changes the default GCC to 4.8, it has been tested with OE-Core
and a number of layers have been testing with it for the last few weeks.

There are some minor issues outside of OE-Core. These will be addressed
with time.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Cc: Khem Raj <raj.khem@gmail.com>

---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 88d109b..f3942b5 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -17,7 +17,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
 PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial = "nativesdk-${TCLIBC}-initial"
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "4.7%"
+GCCVERSION ?= "4.8%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.23.2"
 EGLIBCVERSION ?= "2.17"
-- 
1.8.0.2



