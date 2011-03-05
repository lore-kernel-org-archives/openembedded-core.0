Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Pvxbp-0000ZM-QF
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Mar 2011 20:57:50 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Mar 2011 11:56:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,269,1297065600"; d="scan'208";a="609465939"
Received: from unknown (HELO localhost) ([10.255.12.181])
	by orsmga002.jf.intel.com with ESMTP; 05 Mar 2011 11:56:17 -0800
Message-Id: <3feaae28d4e2f5df8a94b6866d316522ff961b05.1299354907.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299354907.git.sgw@linux.intel.com>
References: <cover.1299354907.git.sgw@linux.intel.com>
Old-Date: Sat, 5 Mar 2011 11:49:00 -0800
Date: Sat, 05 Mar 2011 11:56:16 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 1/2] elfutils: add bzip2 to DEPENDS
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
X-List-Received-Date: Sat, 05 Mar 2011 19:57:50 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.148.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 44b3c52..b2f700e 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -4,7 +4,7 @@ SECTION = "base"
 LICENSE = "GPLv2 with exceptions"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
                     file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
-DEPENDS = "libtool zlib"
+DEPENDS = "libtool bzip2 zlib"
 
 PR = "r1"
 
-- 
1.7.1.1



