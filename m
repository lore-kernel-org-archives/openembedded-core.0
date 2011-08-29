Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qy6wU-00008A-Jw
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 20:52:19 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Aug 2011 11:47:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,297,1312182000"; d="scan'208";a="12194771"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.171])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Aug 2011 11:47:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2011 19:47:19 +0100
Message-Id: <92808484b1dfa55afa1af3a365898aab6d45f746.1314643520.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1314643520.git.paul.eggleton@linux.intel.com>
References: <cover.1314643520.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1314643520.git.paul.eggleton@linux.intel.com>
References: <cover.1314643520.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] tcmode-default: update binutils version
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
X-List-Received-Date: Mon, 29 Aug 2011 18:52:19 -0000

binutils is now at version 2.21.1a.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/distro/include/tcmode-default.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 0d0af38..2857215 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "4.6%"
 SDKGCCVERSION ?= "4.6%"
-BINUVERSION ?= "2.21.1"
+BINUVERSION ?= "2.21.1a"
 EGLIBCVERSION ?= "2.13"
 UCLIBCVERSION ?= "0.9.32"
 LINUXLIBCVERSION ?= "2.6.37.2"
-- 
1.7.4.1



