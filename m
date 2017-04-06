Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4F77760E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 08:14:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 06 Apr 2017 01:14:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,283,1488873600"; d="scan'208";a="1151838828"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 06 Apr 2017 01:14:26 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 7D7DD6A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 01:14:17 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 11:14:11 +0300
Message-Id: <1491466451-16820-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] ed: update SRC_URI to yoctoproject mirror
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
X-List-Received-Date: Thu, 06 Apr 2017 08:14:26 -0000

Upstream has removed the 1.14.1 release from ftp.gnu.org and
moved on to the latest 1.14.2. Since we don't want to upgrade
at this point of time, temporarily move the SRC_URI to yoctoproject
mirror.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/ed/ed_1.14.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ed/ed_1.14.1.bb b/meta/recipes-extended/ed/ed_1.14.1.bb
index 5d89a87..23d1f5a 100644
--- a/meta/recipes-extended/ed/ed_1.14.1.bb
+++ b/meta/recipes-extended/ed/ed_1.14.1.bb
@@ -11,7 +11,8 @@ SECTION = "base"
 # LSB states that ed should be in /bin/
 bindir = "${base_bindir}"
 
-SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.lz"
+#SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.lz"
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.lz"
 
 SRC_URI[md5sum] = "7f4a54fa7f366479f03654b8af645fd0"
 SRC_URI[sha256sum] = "ffb97eb8f2a2b5a71a9b97e3872adce953aa1b8958e04c5b7bf11d556f32552a"
-- 
2.4.0


