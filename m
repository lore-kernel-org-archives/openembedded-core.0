Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QTRoE-0003nW-Gq
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 06:53:02 +0200
Received: from localhost.localdomain (c-76-115-40-57.hsd1.or.comcast.net
	[76.115.40.57])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 24C4C2FF69;
	Mon,  6 Jun 2011 00:49:43 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Jun 2011 21:49:31 -0700
Message-Id: <49ebd44fbb84dfc3c82bbd45b3b387ef0e79f69a.1307331820.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1307331820.git.scott.a.garman@intel.com>
References: <cover.1307331820.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1307331820.git.scott.a.garman@intel.com>
References: <cover.1307331820.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 24C4C2FF69.79BE5
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 2/4] grep: upgrade to v2.8
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
X-List-Received-Date: Mon, 06 Jun 2011 04:53:02 -0000

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
1.7.1



