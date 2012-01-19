Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKV-0004Cz-Ej
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:30:47 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:22:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472095"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:22:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:30 -0800
Message-Id: <28191449636ef2554e82459038a2d67915e9a022.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/33] chkconfig: Update package from v1.3.55 to v1.3.57
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
X-List-Received-Date: Thu, 19 Jan 2012 09:30:48 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../{chkconfig_1.3.55.bb => chkconfig_1.3.57.bb}   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/chkconfig/{chkconfig_1.3.55.bb => chkconfig_1.3.57.bb} (84%)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.55.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.57.bb
similarity index 84%
rename from meta/recipes-extended/chkconfig/chkconfig_1.3.55.bb
rename to meta/recipes-extended/chkconfig/chkconfig_1.3.57.bb
index 0e50936..b8ef2f6 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.55.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.57.bb
@@ -16,8 +16,8 @@ PR = "r0"
 
 SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "de562d5bff5116d1acf2d3191603096b"
-SRC_URI[sha256sum] = "ac5e8f6c5ed83f5b65a3dd9187f8c534f167193446082e6a6576a0d9f72ba968"
+SRC_URI[md5sum] = "35a2d0630f1cb5c251e749eefde70afd"
+SRC_URI[sha256sum] = "6a95472873984a0a8e99dca23ce9efe0ffe9db06d9990ce325575f8506babc1c"
 
 inherit autotools gettext
 
-- 
1.7.6.5



