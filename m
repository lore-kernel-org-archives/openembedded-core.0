Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S8cWN-0004dc-7W
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 20:09:03 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2012 12:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129848256"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2012 12:00:11 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 12:00:07 -0700
Message-Id: <d62c33f002619ec9c455f6fa2362f90f6ab69032.1331924359.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <29a1b86fa5383e17f311314c38972b78d760fd92.1331924359.git.nitin.a.kamble@intel.com>
References: <29a1b86fa5383e17f311314c38972b78d760fd92.1331924359.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1331924359.git.nitin.a.kamble@intel.com>
References: <cover.1331924359.git.nitin.a.kamble@intel.com>
Subject: [PATCH 5/7] python-pyrex: quite packaging warnings
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

This removes these packaging warnings:
WARNING: For recipe python-pyrex, the following files/directories were
installed but not shipped in any package:
WARNING:   /usr/share
WARNING:   /usr/share/lib
WARNING:   /usr/share/lib/python2.7
WARNING:   /usr/share/lib/python2.7/site-packages
WARNING:   /usr/share/lib/python2.7/site-packages/Pyrex
WARNING:   /usr/share/lib/python2.7/site-packages/Pyrex/Compiler
WARNING:   /usr/share/lib/python2.7/site-packages/Pyrex/Compiler/Lexicon.pickle

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/python/python-pyrex_0.9.9.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/python/python-pyrex_0.9.9.bb b/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
index 7d80554..568fb0d 100644
--- a/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
+++ b/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=771d472f53f933033f57eeee7808e5bd"
 SRCNAME = "Pyrex"
-PR = "ml2"
+PR = "r3"
 
 SRC_URI = "\
   http://www.cosc.canterbury.ac.nz/greg.ewing/python/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
@@ -17,3 +17,5 @@ SRC_URI[sha256sum] = "5f87df06831d0b3412eb4bc9d3fc2ee7bfae1b913d7da8c23ab2bf5699
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
+
+FILES_${PN} += "${datadir}${base_libdir}/${PYTHON_DIR}/site-packages/Pyrex/Compiler/Lexicon.pickle"
-- 
1.7.7.6



