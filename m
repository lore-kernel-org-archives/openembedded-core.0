Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo04.lge.com (lgeamrelo04.lge.com [156.147.1.127])
	by mail.openembedded.org (Postfix) with ESMTP id C210465D05
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 01:57:43 +0000 (UTC)
Received: from unknown (HELO changhyeok.bae) (10.177.232.191)
	by 156.147.1.127 with ESMTP; 25 Apr 2014 10:57:43 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: Changhyeok Bae <changhyeok.bae@lge.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Apr 2014 10:57:46 +0900
Message-Id: <1398391066-30575-1-git-send-email-changhyeok.bae@lge.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] mirrors.bbclass: Add mirror site for savannah
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Apr 2014 01:57:45 -0000

* The SRC_URI is not accessible.
  So need to add mirror site referred by the original site.
* The problem is that
  http://download.savannah.nongnu.org/releases and
  http://download.savannah.gnu.org/releases redirects to closest mirror
  and few mirrors (e.g. .jp) weren't working correctly while
  http://download-mirror.savannah.gnu.org/releases/ seems to be reliable.

Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
---
 meta/classes/mirrors.bbclass |    2 ++
 meta/conf/bitbake.conf       |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 1fd7cd8..5c5f8b6 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -45,6 +45,8 @@ ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://sunsite.ualberta.ca/pub/M
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://the.wiretapped.net/pub/security/host-security/lsof/ \n \
 http://www.apache.org/dist  http://archive.apache.org/dist \n \
 http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc/ \n \
+${SAVANNAH_GNU_MIRROR} http://download-mirror.savannah.gnu.org/releases \n \
+${SAVANNAH_NONGNU_MIRROR} http://download-mirror.savannah.gnu.org/releases \n \
 cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b3786a7..4a08fac 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -568,6 +568,8 @@ KERNELORG_MIRROR = "http://kernel.org/pub"
 SOURCEFORGE_MIRROR = "http://downloads.sourceforge.net"
 XLIBS_MIRROR = "http://xlibs.freedesktop.org/release"
 XORG_MIRROR = "http://xorg.freedesktop.org/releases"
+SAVANNAH_GNU_MIRROR = "http://download.savannah.gnu.org/releases"
+SAVANNAH_NONGNU_MIRROR = "http://download.savannah.nongnu.org/releases"
 
 # You can use the mirror of your country to get faster downloads by putting
 #  export DEBIAN_MIRROR = "ftp://ftp.de.debian.org/debian/pool"
-- 
1.7.9.5


