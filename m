Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNr7k-0000fO-AF
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 20:42:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 May 2011 11:39:05 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.39])
	by orsmga002.jf.intel.com with ESMTP; 21 May 2011 11:39:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 May 2011 11:38:01 -0700
Message-Id: <abb1d586cb4c0d9dbbb89686df2c573afc965d41.1306002889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306002889.git.sgw@linux.intel.com>
References: <cover.1306002889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306002889.git.sgw@linux.intel.com>
References: <cover.1306002889.git.sgw@linux.intel.com>
Subject: [PATCH 5/8] tcmode-default: Update Eglibc to 2.13
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
X-List-Received-Date: Sat, 21 May 2011 18:42:04 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/include/tcmode-default.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4541508..d279231 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -20,7 +20,7 @@ GCCVERSION ?= "4.6.0"
 SDKGCCVERSION ?= "4.6.0"
 BINUVERSION ?= "2.21"
 GLIBCVERSION ?= "2.10.1"
-EGLIBCVERSION ?= "2.12"
+EGLIBCVERSION ?= "2.13"
 LINUXLIBCVERSION ?= "2.6.37.2"
 
 # Temporary preferred version overrides for PPC
-- 
1.7.3.4



