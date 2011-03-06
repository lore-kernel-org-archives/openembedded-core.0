Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PwHdr-0001vJ-U5
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Mar 2011 18:21:16 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2011 09:19:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,272,1297065600"; d="scan'208";a="894350909"
Received: from unknown (HELO localhost) ([10.255.12.181])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2011 09:19:40 -0800
Message-Id: <21f294d9600a369fff5eafb0c7358694d9ff0221.1299431945.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299431945.git.sgw@linux.intel.com>
References: <cover.1299431945.git.sgw@linux.intel.com>
Old-Date: Sun, 6 Mar 2011 09:12:04 -0800
Date: Sun, 06 Mar 2011  9:19:39 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 2/2] attr: Added ncurses to depends
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
X-List-Received-Date: Sun, 06 Mar 2011 17:21:16 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/attr/attr.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index e9467d7..c110340 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -2,6 +2,8 @@ DESCRIPTION = "utilities for manipulating filesystem extended attributes"
 HOMEPAGE = "http://savannah.nongnu.org/projects/attr/"
 SECTION = "libs"
 
+DEPENDS = "ncurses"
+
 LICENSE = "LGPLv2.1+ & GPLv2+"
 LICENSE_${PN} = "GPLv2+"
 LICENSE_lib${PN} = "LGPLv2.1+"
-- 
1.7.1.1



