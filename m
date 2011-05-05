Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHtU5-0003Qz-0s
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 10:00:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 May 2011 00:57:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="638340053"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by orsmga002.jf.intel.com with ESMTP; 05 May 2011 00:57:28 -0700
Message-Id: <2763fcb89af04e4faeef89858f76060ef4788cbe.1304581770.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304581769.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 08:32:59 +0800
Date: Thu, 05 May 2011  0:57:28 -0700
To: openembedded-core@lists.openembedded.org,bruce.ashfield@windriver.com
From: Saul Wold <sgw@linux.intel.com>
Cc: Kyle McMartin <kyle@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 21/26] yaffs2-utils_cvs: fix the SRCDATE typo
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
X-List-Received-Date: Thu, 05 May 2011 08:00:30 -0000

From: Yu Ke <ke.yu@intel.com>

SRCDAT should be SRCDATE, thanks Frans to point out

Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Signed-off-by: Yu Ke <ke.yu@intel.com>

Update to 20110505

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb b/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb
index c729c7c..6414bd2 100644
--- a/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb
+++ b/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb
@@ -1,4 +1,4 @@
 require yaffs2-utils.inc
 PR = "r1"
 
-SRCDAT = "20071107"
+SRCDATE = "20110505"
-- 
1.7.1.1



