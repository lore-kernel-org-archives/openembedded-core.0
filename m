Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qfj27-0002bD-Cs
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Jul 2011 03:42:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2011 18:38:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,506,1304319600"; d="scan'208";a="26044873"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2011 18:38:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jul 2011 18:38:09 -0700
Message-Id: <13fca9a8bd2c2a88a920b24da4b509e0e2ad25a1.1310261708.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310261708.git.sgw@linux.intel.com>
References: <cover.1310261708.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310261708.git.sgw@linux.intel.com>
References: <cover.1310261708.git.sgw@linux.intel.com>
Subject: [RC2 PATCH 2/2] tcmode-default: update binutils version
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
X-List-Received-Date: Sun, 10 Jul 2011 01:42:07 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/include/tcmode-default.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index aded555..e27a1b4 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "4.6%"
 SDKGCCVERSION ?= "4.6%"
-BINUVERSION ?= "2.21"
+BINUVERSION ?= "2.21.1"
 GLIBCVERSION ?= "2.10.1"
 EGLIBCVERSION ?= "2.13"
 UCLIBCVERSION ?= "0.9.32"
-- 
1.7.3.4



