Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzQA-0006Az-CH
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:55:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Apr 2011 23:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="679865267"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2011 23:53:35 -0700
Message-Id: <83244d8fdf973380a2dfa80f3a169a787fad78f4.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 16:04:47 +0800
Date: Fri, 15 Apr 2011 23:53:35 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 10/58] telepathy-mission-control: upgrade to version 5.7.9
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
X-List-Received-Date: Sat, 16 Apr 2011 06:55:54 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...5.7.1.bb => telepathy-mission-control_5.7.9.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.7.1.bb => telepathy-mission-control_5.7.9.bb} (92%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.7.1.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.7.9.bb
similarity index 92%
rename from meta/recipes-connectivity/telepathy/telepathy-mission-control_5.7.1.bb
rename to meta/recipes-connectivity/telepathy/telepathy-mission-control_5.7.9.bb
index f5c2745..7805db6 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.7.1.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.7.9.bb
@@ -40,5 +40,5 @@ FILES_libmissioncontrol-dbg = "${libdir}/.debug/libmissioncontrol.so.*"
 FILES_libmissioncontrol-config-dbg = "${libdir}/.debug/libmissioncontrol-config.so.*"
 FILES_libmissioncontrol-server-dbg = "${libdir}/.debug/libmissioncontrol-server.so.*"
 
-SRC_URI[md5sum] = "9688a3f75c080eaa2dbf6b4d75876dc9"
-SRC_URI[sha256sum] = "c58f07ee801b023bc5d5a8ec0fce49058a0372b6727e6516fb56d100dacd07fe"
+SRC_URI[md5sum] = "df7e63d857676fab9ec2261cffe5eb4a"
+SRC_URI[sha256sum] = "bc430238d2fb6663d8376702a43251000a75b741ab55af88006cbdb37d8cc086"
-- 
1.7.1.1



