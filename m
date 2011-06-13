Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QW167-0002J6-Ur
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 08:58:08 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2011 23:54:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,356,1304319600"; d="scan'208";a="17500618"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2011 23:54:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jun 2011 23:54:26 -0700
Message-Id: <22f849c8a4e592ed6a828d85a353dcfaf1e558be.1307947593.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
Cc: Phil Blundell <philb@gnu.org>
Subject: [*RFC CONSOLIDATED PULL RFC* 16/23] uclibc: remove PACKAGE_ARCH, fix compilation on i586
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
X-List-Received-Date: Mon, 13 Jun 2011 06:58:08 -0000

From: Phil Blundell <pb@pbcl.net>

There is no good reason for uclibc to be machine specific.  Remove local
assignment to PACKAGE_ARCH so that it gets the default target
architecture and bump PR for that change.

See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/003064.html

Signed-off-by: Phil Blundell <philb@gnu.org>
Acked-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc_git.bb |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index f5c861b..b8f58f0 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -2,11 +2,9 @@ SRCREV="71d63ed75648da9b0b71afabb9c60aaad792c55c"
 
 require uclibc.inc
 PV = "0.9.31+0.9.32rc3"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
-#recent versions uclibc require real kernel headers
-PACKAGE_ARCH = "${MACHINE_ARCH}"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
 
 SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
-- 
1.7.3.4



