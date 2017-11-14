Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 48016784ED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:58:09 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:58:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402269"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:58:09 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:47 +0200
Message-Id: <20171114145754.9643-20-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 20/27] expect: update to 5.45.3
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
X-List-Received-Date: Tue, 14 Nov 2017 14:58:09 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/expect/{expect_5.45.bb => expect_5.45.3.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/expect/{expect_5.45.bb => expect_5.45.3.bb} (95%)

diff --git a/meta/recipes-devtools/expect/expect_5.45.bb b/meta/recipes-devtools/expect/expect_5.45.3.bb
similarity index 95%
rename from meta/recipes-devtools/expect/expect_5.45.bb
rename to meta/recipes-devtools/expect/expect_5.45.3.bb
index c9f5aba8970..445eca5742d 100644
--- a/meta/recipes-devtools/expect/expect_5.45.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.3.bb
@@ -18,8 +18,6 @@ RDEPENDS_${PN} = "tcl"
 
 inherit autotools update-alternatives
 
-PR = "r1"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://0001-configure.in.patch \
            file://0002-tcl.m4.patch \
@@ -28,8 +26,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://0001-Resolve-string-formatting-issues.patch \
            file://0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch \
           "
-SRC_URI[md5sum] = "44e1a4f4c877e9ddc5a542dfa7ecc92b"
-SRC_URI[sha256sum] = "b28dca90428a3b30e650525cdc16255d76bb6ccd65d448be53e620d95d5cc040"
+SRC_URI[md5sum] = "a8855cd41c1ef004b9794db9e2a57a9d"
+SRC_URI[sha256sum] = "c520717b7195944a69ce1492ec82ca0ac3f3baf060804e6c5ee6d505ea512be9"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/expect/files/Expect/"
 UPSTREAM_CHECK_REGEX = "/Expect/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.15.0


