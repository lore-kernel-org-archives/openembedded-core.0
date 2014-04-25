Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo01.lge.com (lgeamrelo01.lge.com [156.147.1.125])
	by mail.openembedded.org (Postfix) with ESMTP id 4173E60D71
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 00:46:56 +0000 (UTC)
Received: from unknown (HELO changhyeok.bae) (10.177.232.191)
	by 156.147.1.125 with ESMTP; 25 Apr 2014 09:46:51 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: Changhyeok Bae <changhyeok.bae@lge.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Apr 2014 09:46:46 +0900
Message-Id: <1398386806-12058-1-git-send-email-changhyeok.bae@lge.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] mirrors.bbclass: Add mirror site
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
X-List-Received-Date: Fri, 25 Apr 2014 00:46:58 -0000

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
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 1fd7cd8..a632032 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -45,6 +45,8 @@ ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://sunsite.ualberta.ca/pub/M
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://the.wiretapped.net/pub/security/host-security/lsof/ \n \
 http://www.apache.org/dist  http://archive.apache.org/dist \n \
 http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc/ \n \
+http://download.savannah.nongnu.org/releases/ http://download-mirror.savannah.gnu.org/releases/ \n \
+http://download.savannah.gnu.org/releases/ http://download-mirror.savannah.gnu.org/releases/ \n \
 cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
-- 
1.7.9.5


