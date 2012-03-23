Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SB6HE-00063o-J1
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 16:19:40 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Mar 2012 08:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144031356"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2012 08:10:43 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 23:08:30 +0800
Message-Id: <23b1d2686e2fb9d3714ef007dff5f2ef467e7e4c.1332514975.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1332514975.git.dongxiao.xu@intel.com>
References: <cover.1332514975.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1332514975.git.dongxiao.xu@intel.com>
References: <cover.1332514975.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/2] bitbake.conf: Add XAUTHORITY into config white list
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
X-List-Received-Date: Fri, 23 Mar 2012 15:19:41 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 36f71d6..b1d6360 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -739,7 +739,7 @@ BB_CONSOLELOG ?= "${TMPDIR}/cooker.log.${DATETIME}"
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasic"
 BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN"
-BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SESSION_MANAGER DBUS_SESSION_BUS_ADDRESS SSH_AGENT_PID XDG_SESSION_COOKIE SSH_AUTH_SOCK"
+BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SESSION_MANAGER DBUS_SESSION_BUS_ADDRESS SSH_AGENT_PID XDG_SESSION_COOKIE SSH_AUTH_SOCK XAUTHORITY"
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
-- 
1.7.4.1



