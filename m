Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4A81660116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 13:33:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Dec 2015 05:33:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,464,1444719600"; d="scan'208";a="876769949"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Dec 2015 05:33:06 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 15:30:17 +0200
Message-Id: <1450791017-3176-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] mirrors: add archive.apache.org to Apache mirrors
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
X-List-Received-Date: Tue, 22 Dec 2015 13:33:12 -0000

Historical releases may disappear from the main mirrors, so
then we need to fall back to the archive (which, in turn, may
not carry the current release, and so can't be the primary mirror).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/mirrors.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 0f98479..488b86d 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -40,7 +40,8 @@ ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.tux.org/pub/sites/vic
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://gd.tuwien.ac.at/utils/admin-tools/lsof/ \n \
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://sunsite.ualberta.ca/pub/Mirror/lsof/ \n \
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://the.wiretapped.net/pub/security/host-security/lsof/ \n \
-http://www.eu.apache.org/dist  http://www.us.apache.org/dist \n \
+${APACHE_MIRROR}  http://www.us.apache.org/dist \n \
+${APACHE_MIRROR}  http://archive.apache.org/dist \n \
 http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc/ \n \
 ${SAVANNAH_GNU_MIRROR} http://download-mirror.savannah.gnu.org/releases \n \
 ${SAVANNAH_NONGNU_MIRROR} http://download-mirror.savannah.nongnu.org/releases \n \
-- 
2.6.4


