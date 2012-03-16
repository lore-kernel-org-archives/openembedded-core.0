Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LHn-0001Vn-6D
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:44:51 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Mar 2012 17:36:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119576009"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by azsmga001.ch.intel.com with ESMTP; 15 Mar 2012 17:36:03 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:24 +0800
Message-Id: <f2e12204d0f39118302a5c2258b1fc3e21fcbf6e.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 27/60] apr: upgrade to 1.4.6
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
X-List-Received-Date: Fri, 16 Mar 2012 00:44:51 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../apr/{apr_1.4.5.bb => apr_1.4.6.bb}             |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/apr/{apr_1.4.5.bb => apr_1.4.6.bb} (91%)

diff --git a/meta/recipes-support/apr/apr_1.4.5.bb b/meta/recipes-support/apr/apr_1.4.6.bb
similarity index 91%
rename from meta/recipes-support/apr/apr_1.4.5.bb
rename to meta/recipes-support/apr/apr_1.4.6.bb
index 2374d30..c0ab4f1 100644
--- a/meta/recipes-support/apr/apr_1.4.5.bb
+++ b/meta/recipes-support/apr/apr_1.4.6.bb
@@ -8,15 +8,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
 
 BBCLASSEXTEND = "native"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://configure_fixes.patch \
            file://cleanup.patch \
            file://configfix.patch"
 
-SRC_URI[md5sum] = "8b53f5a5669d0597f2da889a2f576eb6"
-SRC_URI[sha256sum] = "38c61cacb39be649411cdab212979c71ce29495549c249c2e9a1b0d12480c93e"
+SRC_URI[md5sum] = "ffee70a111fd07372982b0550bbb14b7"
+SRC_URI[sha256sum] = "9b635e60feb163e6fc6c375721f71f44d7e26d6b9cd52f6b86b04e65d2481cbc"
 
 inherit autotools lib_package binconfig multilib_header
 
-- 
1.7.6



