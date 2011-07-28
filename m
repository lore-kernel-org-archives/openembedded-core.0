Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/+3TvMtxu9sxAea0JcScgT/1n7PcGkV5o=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmQQC-0008Jp-0I
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 15:14:40 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6SDAOZ2027548
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 08:10:24 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 08:10:24 -0500
Message-Id: <1311858624-3686-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] scripts/oe-buildenv-internal: Add SOCKS5_{USER, PASSWD} to BB_ENV_EXTRAWHITE
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
X-List-Received-Date: Thu, 28 Jul 2011 13:14:40 -0000

If a SOCKS5 gateway is needed for a proxy access like git it might also
require authentication to the proxy via a password and username.  Adding
SOCKS5_USER & SOCKS5_PASSWD to BB_ENV_EXTRAWHITE allow for automation
of the authentication request to occur when something like a git fetch
is going through the proxy.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
* Fixes issue with a git fetch request failing to get pass a firewall

 scripts/oe-buildenv-internal |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index c13fc40..b223292 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -55,4 +55,4 @@ unset BITBAKEDIR
 export BUILDDIR
 export PATH
 
-export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND"
+export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND SOCKS5_PASSWD SOCSK5_USER"
-- 
1.7.3.4



