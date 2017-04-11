Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AB35D77D0A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 10:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491907676; x=1523443676; h=from:to:subject:date:message-id;
	bh=kc/PFvtnfkpzoAYLEsWh2uexQ0oUqw2X1shjKqPGyC0=;
	b=Gk9ws+lQWjqijmtqBMpe/hbZi2VnB8BpxsBZNog3JrdnmhocKcg95Y6l
	FNA9Gy0T8VNidlV+OyieybGgsCXg/A==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Apr 2017 03:47:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,185,1488873600"; d="scan'208";a="844503918"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2017 03:47:55 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 8E6546A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 03:47:45 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 13:47:52 +0300
Message-Id: <1491907672-363-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2] ed: update SRC_URI to yoctoproject mirror
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
X-List-Received-Date: Tue, 11 Apr 2017 10:47:54 -0000

Upstream has removed the 1.14.1 release from ftp.gnu.org and
moved to the latest 1.14.2. Since we don't want to upgrade at
this point of time, temporarily move the SRC_URI to yoctoproject
mirror.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/ed/ed_1.14.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ed/ed_1.14.1.bb b/meta/recipes-extended/ed/ed_1.14.1.bb
index 5d89a87..7e6bde4 100644
--- a/meta/recipes-extended/ed/ed_1.14.1.bb
+++ b/meta/recipes-extended/ed/ed_1.14.1.bb
@@ -11,7 +11,9 @@ SECTION = "base"
 # LSB states that ed should be in /bin/
 bindir = "${base_bindir}"
 
-SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.lz"
+# Upstream regularly removes previous releases from https://ftp.gnu.org/gnu/ed/
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.lz"
+UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
 SRC_URI[md5sum] = "7f4a54fa7f366479f03654b8af645fd0"
 SRC_URI[sha256sum] = "ffb97eb8f2a2b5a71a9b97e3872adce953aa1b8958e04c5b7bf11d556f32552a"
-- 
2.4.0


