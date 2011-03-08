Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Pwkr9-0002Nt-13
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 01:32:55 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Mar 2011 16:31:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,280,1297065600"; d="scan'208";a="717410554"
Received: from unknown (HELO localhost) ([10.255.12.99])
	by orsmga001.jf.intel.com with ESMTP; 07 Mar 2011 16:29:31 -0800
Message-Id: <21f294d9600a369fff5eafb0c7358694d9ff0221.1299544029.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299544029.git.sgw@linux.intel.com>
References: <cover.1299544029.git.sgw@linux.intel.com>
Old-Date: Sun, 6 Mar 2011 09:12:04 -0800
Date: Mon, 07 Mar 2011 16:29:31 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Tue, 08 Mar 2011 08:18:44 +0100
Cc: Koen Kooi <koen@dominion.thruhere.net>, Liping Ke <liping.ke@intel.com>,
	Dongxiao Xu <dongxiao.xu@intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>
Subject: [PATCH 2/8] attr: Added ncurses to depends
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
X-List-Received-Date: Tue, 08 Mar 2011 00:32:55 -0000

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



