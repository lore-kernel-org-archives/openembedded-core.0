Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJP-0001rQ-Jv
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:28 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 May 2011 16:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="687688479"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga002.fm.intel.com with ESMTP; 03 May 2011 16:44:47 -0700
Message-Id: <09f4e6ecd954d53d6ed58727d59f6ca48c75d5d7.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Fri, 29 Apr 2011 17:34:52 +0800
Date: Tue, 03 May 2011 16:44:47 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 20/33] task-core-lsb.bb: Add packages liberation-fonts to lsb-imag
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
X-List-Received-Date: Tue, 03 May 2011 23:47:28 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add font set to lsb-image to solve bugs from lsb test

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-extended/tasks/task-core-lsb.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/tasks/task-core-lsb.bb b/meta/recipes-extended/tasks/task-core-lsb.bb
index ed705f1..6de24b4 100644
--- a/meta/recipes-extended/tasks/task-core-lsb.bb
+++ b/meta/recipes-extended/tasks/task-core-lsb.bb
@@ -165,6 +165,7 @@ RDEPENDS_task-core-lsb-graphic-add = "\
     gdk-pixbuf-loader-ico \
     gdk-pixbuf-loader-bmp \
     gdk-pixbuf-loader-ani \
+    liberation-fonts \
 "
 
 RDEPENDS_task-core-lsb-graphic-add_qemux86 = "\
-- 
1.7.4.1



