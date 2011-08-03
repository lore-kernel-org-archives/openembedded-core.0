Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoivZ-0002CB-30
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 23:24:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2011 14:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; d="scan'208";a="34056992"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2011 14:19:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 14:19:43 -0700
Message-Id: <0e7816a7b85fd9ba7cdaf7914b1997651d4292c7.1312394851.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 30/33] glibc: Remove unused version
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
X-List-Received-Date: Wed, 03 Aug 2011 21:24:33 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/include/tcmode-default.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index dce76db..0d0af38 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -19,7 +19,6 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "4.6%"
 SDKGCCVERSION ?= "4.6%"
 BINUVERSION ?= "2.21.1"
-GLIBCVERSION ?= "2.10.1"
 EGLIBCVERSION ?= "2.13"
 UCLIBCVERSION ?= "0.9.32"
 LINUXLIBCVERSION ?= "2.6.37.2"
-- 
1.7.3.4



