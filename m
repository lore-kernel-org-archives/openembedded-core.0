Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S8cWN-0004dV-JH
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 20:09:03 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2012 12:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129848257"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2012 12:00:11 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 12:00:08 -0700
Message-Id: <b10ee19a1ab989049aafcb0f8eefadf8296dc900.1331924359.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <29a1b86fa5383e17f311314c38972b78d760fd92.1331924359.git.nitin.a.kamble@intel.com>
References: <29a1b86fa5383e17f311314c38972b78d760fd92.1331924359.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1331924359.git.nitin.a.kamble@intel.com>
References: <cover.1331924359.git.nitin.a.kamble@intel.com>
Subject: [PATCH 6/7] python-pycurl: fix packaging warnings
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
X-List-Received-Date: Fri, 16 Mar 2012 19:09:03 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This commit fixes these packaging warnings:
 WARNING: For recipe python-pycurl, the following files/directories were
installed but not shipped in any package:
 WARNING:   /usr/share/share

PR not bumber because no change in the output packages.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../python/python-pycurl_7.19.0.bb                 |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/python/python-pycurl_7.19.0.bb b/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
index d9fe465..8b849d7 100644
--- a/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
+++ b/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
@@ -29,3 +29,7 @@ export STAGING_INCDIR
 export STAGING_LIBDIR
 
 BBCLASSEXTEND = "native"
+
+do_install_append() {
+	rm -rf ${D}${datadir}/share
+}
-- 
1.7.7.6



