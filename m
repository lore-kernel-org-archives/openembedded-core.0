Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QPqeA-0003tg-Aj
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 08:35:46 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2011 23:26:30 -0700
X-ExtLoop1: 1
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by orsmga002.jf.intel.com with ESMTP; 26 May 2011 23:26:30 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 14:31:47 +0800
Message-Id: <11bdc46c03cd63728822bb5d2888ece3e142b295.1306477652.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <93b575839974dfc9e49598a5c2db76ebabbb5bc0.1306477652.git.lianhao.lu@intel.com>
References: <93b575839974dfc9e49598a5c2db76ebabbb5bc0.1306477652.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1306477652.git.lianhao.lu@intel.com>
References: <cover.1306477652.git.lianhao.lu@intel.com>
Subject: [PATCH 03/11] meta-yocto/local.conf.sample: Added PRSERV_HOST and PRSERV_PORT.
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
X-List-Received-Date: Fri, 27 May 2011 06:35:46 -0000

Setting PRSERV_HOST and PRSERV_PORT would trigger the poky to use remote
PR network service. Leaving them unset allow the user to build image
without the PR network service

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta-yocto/conf/local.conf.sample |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
index a9b4998..359e510 100644
--- a/meta-yocto/conf/local.conf.sample
+++ b/meta-yocto/conf/local.conf.sample
@@ -216,3 +216,8 @@ NO32LIBS = "1"
 # GNOME, SCREEN, XTERM and KONSOLE
 #TERMCMD = "${KONSOLE_TERMCMD}"
 #TERMCMDRUN = "${KONSOLE_TERMCMDRUN}"
+
+
+# The network based PR service host and port
+#PRSERV_HOST = "localhost"
+#PRSERV_PORT = "8585"
-- 
1.7.0.4



