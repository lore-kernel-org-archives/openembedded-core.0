Received: from elite.brightsigndigital.co.uk ([81.142.160.137])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>) id 1TJ5zD-0007Hh-Dg
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 19:10:23 +0200
Received: from lander.brightsign ([172.30.1.6])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1TJ5FR-0002EH-B7; Tue, 02 Oct 2012 17:23:05 +0100
Received: from mac by lander.brightsign with local (Exim 4.72)
	(envelope-from <mac@lander.brightsign>)
	id 1TJ5FN-0000WD-GX; Tue, 02 Oct 2012 17:23:03 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Oct 2012 17:22:49 +0100
Message-Id: <1349194969-31873-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Phil Blundell <philb@gnu.org>, Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] bitbake.conf: Add CCACHE_DISABLE to BS_HASHBASE_WHITELIST
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2012 17:10:23 -0000

If CCACHE is in the whitelist then CCACHE_DISABLE probably should be too.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e168ef1..e813fec 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -765,7 +765,7 @@ BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
 
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasicHash"
-BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE"
+BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_DISABLE"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SESSION_MANAGER DBUS_SESSION_BUS_ADDRESS SSH_AGENT_PID XDG_SESSION_COOKIE SSH_AUTH_SOCK XAUTHORITY PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS PARALLEL_MAKE BB_NUMBER_THREADS"
 BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc defaultval _append _prepend deps depends lockfiles type vardepsexclude \
                                vardeps vardepvalue file-checksums python func task export unexport noexec \
-- 
1.7.10.4



