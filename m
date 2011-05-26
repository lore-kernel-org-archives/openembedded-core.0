Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QPZ7P-00067K-BU
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 13:52:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2011 04:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,272,1304319600"; 
   d="scan'208";a="9277251"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2011 04:49:45 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 19:55:34 +0800
Message-Id: <9b059202eda57b89e4e793c50f394db0345f051d.1306401007.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <82b5b89412bfcac2d4586d183a3b6a516b5a0f35.1306401007.git.lianhao.lu@intel.com>
References: <82b5b89412bfcac2d4586d183a3b6a516b5a0f35.1306401007.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1306401007.git.lianhao.lu@intel.com>
References: <cover.1306401007.git.lianhao.lu@intel.com>
Subject: [PATCH 5/5] meta-yocto/local.conf.sample: Added PRSERV_HOST and PRSERV_PORT.
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
X-List-Received-Date: Thu, 26 May 2011 11:52:47 -0000

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



