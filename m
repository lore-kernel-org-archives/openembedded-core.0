Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEI-0005Kp-9A
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2011 00:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="684550354"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2011 00:29:41 -0700
Message-Id: <3c8b7b28aa37fb4f7b76928d3505a6ada978a06c.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Wed, 20 Apr 2011 15:17:11 +0800
Date: Wed, 27 Apr 2011  0:29:41 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 20/52] cwautomacros: upgrade to version 20110201
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:10 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...macros_20090610.bb => cwautomacros_20110201.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cwautomacros/{cwautomacros_20090610.bb => cwautomacros_20110201.bb} (74%)

diff --git a/meta/recipes-extended/cwautomacros/cwautomacros_20090610.bb b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
similarity index 74%
rename from meta/recipes-extended/cwautomacros/cwautomacros_20090610.bb
rename to meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
index bc588d7..18efced 100644
--- a/meta/recipes-extended/cwautomacros/cwautomacros_20090610.bb
+++ b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
@@ -8,8 +8,8 @@ SRC_URI = http://download.berlios.de/cwautomacros/cwautomacros-${PV}.tar.bz2
 
 PR = "r0"
 
-SRC_URI[md5sum] = "352b295897ddb30c0d7d0acdd0b2313a"
-SRC_URI[sha256sum] = "8f683713baa63e6b5c2ea72067f77cbacf0bee7d4efa907951c6bb5ac1ffd6b0"
+SRC_URI[md5sum] = "074afcb50d0a8bff10786a2954b2b02d"
+SRC_URI[sha256sum] = "3115603b891f3a163c0bbb5fea2f3742113a183fa6745ee5e89e5f6d0e9f6121"
 
 do_install() {
 	oe_runmake CWAUTOMACROSPREFIX=${D}${prefix} install
-- 
1.7.1.1



