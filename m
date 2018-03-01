Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 405B778855
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 14:07:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 06:07:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,408,1515484800"; d="scan'208";a="35134177"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 01 Mar 2018 06:07:03 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 16:00:51 +0200
Message-Id: <20180301140052.1388-14-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
References: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/15] expect: upgrade 5.45.3 -> 5.45.4
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
X-List-Received-Date: Thu, 01 Mar 2018 14:07:03 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/expect/{expect_5.45.3.bb => expect_5.45.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/expect/{expect_5.45.3.bb => expect_5.45.4.bb} (95%)

diff --git a/meta/recipes-devtools/expect/expect_5.45.3.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
similarity index 95%
rename from meta/recipes-devtools/expect/expect_5.45.3.bb
rename to meta/recipes-devtools/expect/expect_5.45.4.bb
index 445eca5742d..96eacd92934 100644
--- a/meta/recipes-devtools/expect/expect_5.45.3.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -26,8 +26,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://0001-Resolve-string-formatting-issues.patch \
            file://0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch \
           "
-SRC_URI[md5sum] = "a8855cd41c1ef004b9794db9e2a57a9d"
-SRC_URI[sha256sum] = "c520717b7195944a69ce1492ec82ca0ac3f3baf060804e6c5ee6d505ea512be9"
+SRC_URI[md5sum] = "00fce8de158422f5ccd2666512329bd2"
+SRC_URI[sha256sum] = "49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/expect/files/Expect/"
 UPSTREAM_CHECK_REGEX = "/Expect/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.15.1


