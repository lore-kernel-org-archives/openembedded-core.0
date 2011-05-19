Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QN0Rt-0005yx-PW
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 12:27:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 May 2011 03:24:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,236,1304319600"; 
   d="scan'208";a="3912460"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by fmsmga002.fm.intel.com with ESMTP; 19 May 2011 03:24:27 -0700
Message-Id: <e108c5c1272fb8fd574838285565ae4c133c264c.1305800693.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1305800693.git.lianhao.lu@intel.com>
References: <cover.1305800693.git.lianhao.lu@intel.com>
Old-Date: Wed, 18 May 2011 21:18:05 +0800
Date: Thu, 19 May 2011 18:29:29 +0800
To: openembedded-core@lists.openembedded.org
From: Lianhao Lu <lianhao.lu@intel.com>
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
X-List-Received-Date: Thu, 19 May 2011 10:27:24 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta-yocto/conf/local.conf.sample |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
index a9b4998..85c26ee 100644
--- a/meta-yocto/conf/local.conf.sample
+++ b/meta-yocto/conf/local.conf.sample
@@ -216,3 +216,8 @@ NO32LIBS = "1"
 # GNOME, SCREEN, XTERM and KONSOLE
 #TERMCMD = "${KONSOLE_TERMCMD}"
 #TERMCMDRUN = "${KONSOLE_TERMCMDRUN}"
+
+
+# The network based PR service host and port
+PRSERV_HOST = "localhost"
+PRSERV_PORT = "8585"
-- 
1.7.0.4



