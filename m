Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMpFv-0003uj-7d
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:30:15 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 15:27:18 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 15:27:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:26:32 -0700
Message-Id: <e100f4bf03df9d2deb4332e39316a2bcafb25bf1.1305756950.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
References: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305756950.git.sgw@linux.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 03/30] lsof: fix libc overrides
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
X-List-Received-Date: Wed, 18 May 2011 22:30:15 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/lsof/lsof_4.84.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.84.bb b/meta/recipes-extended/lsof/lsof_4.84.bb
index 960d837..9e76096 100644
--- a/meta/recipes-extended/lsof/lsof_4.84.bb
+++ b/meta/recipes-extended/lsof/lsof_4.84.bb
@@ -23,8 +23,8 @@ python do_unpack () {
 }
 
 export LSOF_OS = "${TARGET_OS}"
-LSOF_OS_linux-uclibc = "linux"
-LSOF_OS_linux-gnueabi = "linux"
+LSOF_OS_libc-uclibc = "linux"
+LSOF_OS_libc-glibc = "linux"
 export LSOF_INCLUDE = "${STAGING_INCDIR}"
 
 do_configure () {
-- 
1.7.3.4



