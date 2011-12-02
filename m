Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWN8n-0002ay-Qm
	for openembedded-core@openembedded.org; Fri, 02 Dec 2011 08:02:38 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 22:55:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,282,1320652800"; d="scan'208";a="43189763"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Dec 2011 22:55:50 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 22:55:33 -0800
Message-Id: <483abca9a5875b3e6ff5048121ee0f4cec188e7b.1322808632.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/18] logrotate: Add dependency on popt lib.
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
X-List-Received-Date: Fri, 02 Dec 2011 07:02:38 -0000

From: Stefan Schmidt <stefan@datenfreihafen.org>

Without this logrotate may fail like this:
 compilation terminated.
| config.c:9:18: fatal error: popt.h: No such file or directory

Signed-off-by: Stefan Schmidt <stefan@datenfreihafen.org>
---
 meta/recipes-extended/logrotate/logrotate_3.7.9.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.7.9.bb b/meta/recipes-extended/logrotate/logrotate_3.7.9.bb
index b736593..8dc0504 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.7.9.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.7.9.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Rotates, compresses, removes and mails system log files"
 SECTION = "console/utils"
 HOMEPAGE = "https://fedorahosted.org/releases/l/o/logrotate"
 LICENSE = "GPLv2"
-PR = "r0"
+PR = "r1"
 
-DEPENDS="coreutils"
+DEPENDS="coreutils popt"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
-- 
1.7.6.4



