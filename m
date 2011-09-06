Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R0zUw-00037C-SJ
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 19:31:48 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Sep 2011 10:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,339,1312182000"; d="scan'208";a="49562721"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.39])
	by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2011 10:26:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 10:26:23 -0700
Message-Id: <e98f0d82605ebbad5a061058cbe7164a14cb1154.1315329511.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315329511.git.sgw@linux.intel.com>
References: <cover.1315329511.git.sgw@linux.intel.com>
In-Reply-To: <cover.1315329511.git.sgw@linux.intel.com>
References: <cover.1315329511.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 3/5] scripts/oe-buildenv-internal: Add SOCKS5_{USER, PASSWD} to BB_ENV_EXTRAWHITE
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
X-List-Received-Date: Tue, 06 Sep 2011 17:31:49 -0000

From: Kumar Gala <galak@kernel.crashing.org>

If a SOCKS5 gateway is needed for a proxy access like git it might also
require authentication to the proxy via a password and username.  Adding
SOCKS5_USER & SOCKS5_PASSWD to BB_ENV_EXTRAWHITE allow for automation
of the authentication request to occur when something like a git fetch
is going through the proxy.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 scripts/oe-buildenv-internal |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 61ac18c..5e0eb6e 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -71,4 +71,4 @@ unset BITBAKEDIR
 export BUILDDIR
 export PATH
 
-export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND"
+export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND SOCKS5_PASSWD SOCSK5_USER"
-- 
1.7.6



