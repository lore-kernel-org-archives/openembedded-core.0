Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 550067271B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 21:41:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Dec 2014 13:41:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,634,1413270000"; d="scan'208";a="628413107"
Received: from aeadams-mobl.ger.corp.intel.com (HELO localhost.intel.com)
	([10.255.13.204])
	by orsmga001.jf.intel.com with ESMTP; 23 Dec 2014 13:41:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Dec 2014 13:41:04 -0800
Message-Id: <1419370864-2092-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] elfutils: Update PREFERRED_VERSION after upgrade
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
X-List-Received-Date: Tue, 23 Dec 2014 21:41:08 -0000

Since we normally fix the version of elfutils in tcmode-default, this
needs to be updated after we upgrade the recipe itself.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index bc98c8b..2b41090 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -59,7 +59,7 @@ PREFERRED_VERSION_nativesdk-glibc-initial  ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_cross-localedef-native   ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_uclibc                   ?= "${UCLIBCVERSION}"
 PREFERRED_VERSION_uclibc-initial           ?= "${UCLIBCVERSION}"
-PREFERRED_VERSION_elfutils ?= "0.148"
+PREFERRED_VERSION_elfutils ?= "0.160"
 # don't use version earlier than 1.4 for gzip-native, as it's necessary for
 # some packages using an archive format incompatible with earlier gzip
 PREFERRED_VERSION_gzip-native ?= "1.6"
-- 
2.1.0


