Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RoUVj-0003rF-Ad
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 07:33:11 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Jan 2012 22:25:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="98235466"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 20 Jan 2012 22:25:26 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 22:25:24 -0800
Message-Id: <d55da7d9a8c1f3202ce6746d7b73b2f01df686ae.1327127051.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <ffc4c2baa9ed5116336b1d5c2d6110f7e4163c27.1327127051.git.nitin.a.kamble@intel.com>
References: <ffc4c2baa9ed5116336b1d5c2d6110f7e4163c27.1327127051.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1327127051.git.nitin.a.kamble@intel.com>
References: <cover.1327127051.git.nitin.a.kamble@intel.com>
Subject: [PATCH 4/4] python-pyrex: force recompilation
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
X-List-Received-Date: Sat, 21 Jan 2012 06:33:11 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

distutils.bbclass is updated to fix files getting installed in wrong
libdir to fix following warnings.

WARNING: For recipe python-pyrex, the following files/directories were
installed but not shipped in any package:
WARNING:   /usr/share
WARNING:   /usr/share/lib
WARNING:   /usr/share/lib/python2.7
WARNING:   /usr/share/lib/python2.7/site-packages
WARNING:   /usr/share/lib/python2.7/site-packages/Pyrex
WARNING:   /usr/share/lib/python2.7/site-packages/Pyrex/Compiler
WARNING:
/usr/share/lib/python2.7/site-packages/Pyrex/Compiler/Lexicon.pickle

Just bump PR to force recompilation

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/python/python-pyrex_0.9.9.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/python/python-pyrex_0.9.9.bb b/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
index 7d80554..ae1a93b 100644
--- a/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
+++ b/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=771d472f53f933033f57eeee7808e5bd"
 SRCNAME = "Pyrex"
-PR = "ml2"
+PR = "r2"
 
 SRC_URI = "\
   http://www.cosc.canterbury.ac.nz/greg.ewing/python/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-- 
1.7.6.4



