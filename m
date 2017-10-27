Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E5F30782A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 11:05:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Oct 2017 04:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,304,1505804400"; d="scan'208";a="1210798493"
Received: from wrath.jf.intel.com ([10.54.70.9])
	by fmsmga001.fm.intel.com with ESMTP; 27 Oct 2017 04:05:53 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Oct 2017 04:05:03 -0700
Message-Id: <20171027110503.8293-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH] pigz: use archive tarball instead of Github generated tarball
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
X-List-Received-Date: Fri, 27 Oct 2017 11:05:53 -0000

Github-generated tarballs are known to change over time, so
use an archive tarball provided by zlib.net instead.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-extended/pigz/pigz_2.3.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/pigz/pigz_2.3.4.bb b/meta/recipes-extended/pigz/pigz_2.3.4.bb
index f4832dffe1..3dc4de3710 100644
--- a/meta/recipes-extended/pigz/pigz_2.3.4.bb
+++ b/meta/recipes-extended/pigz/pigz_2.3.4.bb
@@ -3,9 +3,9 @@ LIC_FILES_CHKSUM = "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17
 
 UPSTREAM_CHECK_URI = "http://zlib.net/${BPN}/"
 UPSTREAM_CHECK_REGEX = "pigz-(?P<pver>.*)\.tar"
-SRC_URI = "https://github.com/madler/pigz/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
-SRC_URI[md5sum] = "c109057050b15edf3eb9bb4d0805235e"
-SRC_URI[sha256sum] = "763f2fdb203aa0b7b640e63385e38e5dd4e5aaa041bc8e42aa96f2ef156b06e8"
+SRC_URI = "https://zlib.net/pigz/${BP}.tar.gz"
+SRC_URI[md5sum] = "08e6b2e682bbf65ccf12c8966d633fc6"
+SRC_URI[sha256sum] = "6f031fa40bc15b1d80d502ff91f83ba14f4b079e886bfb83221374f7bf5c8f9a"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.13.5


