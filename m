Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDAlY-0001oi-8j
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 09:27:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Apr 2011 00:24:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="423747743"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by azsmga001.ch.intel.com with ESMTP; 22 Apr 2011 00:24:30 -0700
Message-Id: <37d68b701e6c34ac25102fb70cae3ce156bf07bb.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
Old-Date: Tue, 19 Apr 2011 12:21:53 -0700
Date: Fri, 22 Apr 2011  0:24:29 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 09:33:35 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 01/33] slang: Fix host contamination issue
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
X-List-Received-Date: Fri, 22 Apr 2011 07:27:01 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/slang/slang_2.2.4.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
index 2b000a4..4257b05 100644
--- a/meta/recipes-extended/slang/slang_2.2.4.bb
+++ b/meta/recipes-extended/slang/slang_2.2.4.bb
@@ -24,7 +24,8 @@ inherit autotools
 SRC_URI[md5sum] = "7fcfd447e378f07dd0c0bae671fe6487"
 SRC_URI[sha256sum] = "9a8257a9a2a55099af858b13338dc8f3a06dd2069f46f0df2c9c3bb84a01d5db"
 
-EXTRA_OECONF += " --without-png"
+EXTRA_OECONF += " --without-z --without-png --x-includes=${STAGING_DIR_HOST}/usr/include/X11 --x-libraries=${STAGING_DIR_HOST}/usr/lib"
+
 do_install() {
 	oe_runmake install DESTDIR=${D} -e 'INST_LIB_DIR=${STAGING_DIR_HOST}/usr/lib'
 }
-- 
1.7.1



