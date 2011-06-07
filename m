Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTqLg-0003im-Ml
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 09:05:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jun 2011 00:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,331,1304319600"; 
   d="scan'208";a="8299003"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.99])
	by azsmga001.ch.intel.com with ESMTP; 07 Jun 2011 00:01:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2011 00:01:39 -0700
Message-Id: <40030433662c8a43c89e20099330aa5172ac0c27.1307429530.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [CONSOLIDATED PULL 03/13] grep: upgrade to v2.8
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
X-List-Received-Date: Tue, 07 Jun 2011 07:05:13 -0000

From: Scott Garman <scott.a.garman@intel.com>

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../grep/{grep_2.7.bb => grep_2.8.bb}              |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/grep/{grep_2.7.bb => grep_2.8.bb} (84%)

diff --git a/meta/recipes-extended/grep/grep_2.7.bb b/meta/recipes-extended/grep/grep_2.8.bb
similarity index 84%
rename from meta/recipes-extended/grep/grep_2.7.bb
rename to meta/recipes-extended/grep/grep_2.8.bb
index c3e0986..7e58ff8 100644
--- a/meta/recipes-extended/grep/grep_2.7.bb
+++ b/meta/recipes-extended/grep/grep_2.8.bb
@@ -1,7 +1,8 @@
-DESCRIPTION = "grep GNU utility"
+DESCRIPTION = "GNU grep utility"
 HOMEPAGE = "http://savannah.gnu.org/projects/grep/"
 BUGTRACKER = "http://savannah.gnu.org/bugs/?group=grep"
 SECTION = "console/utils"
+PRIORITY = "optional"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8006d9c814277c1bfc4ca22af94b59ee"
 
@@ -9,8 +10,8 @@ PR = "r0"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "e848f07e3e79aa7899345d17c7e4115e"
-SRC_URI[sha256sum] = "ad14831015a79cea36785aa47415f6c0653a6ac4eaf9c15456f0d9d09c9e1bad"
+SRC_URI[md5sum] = "cb2dfc502c5afc7a4a6e5f6cefd6850e"
+SRC_URI[sha256sum] = "da48d0e20bceaacc7d05bfcbccb34c3dee0c50bd7e80de5222fd5e319809af27"
 
 inherit autotools gettext
 
-- 
1.7.3.4



