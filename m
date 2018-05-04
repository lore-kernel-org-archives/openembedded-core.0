Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7A89074C60
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 12:38:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2018 05:38:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,362,1520924400"; d="scan'208";a="39254266"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 04 May 2018 05:38:39 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:32:33 +0300
Message-Id: <20180504123244.43049-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/14] vala: update to 0.40.4
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
X-List-Received-Date: Fri, 04 May 2018 12:38:39 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/vala/{vala_0.40.2.bb => vala_0.40.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.40.2.bb => vala_0.40.4.bb} (64%)

diff --git a/meta/recipes-devtools/vala/vala_0.40.2.bb b/meta/recipes-devtools/vala/vala_0.40.4.bb
similarity index 64%
rename from meta/recipes-devtools/vala/vala_0.40.2.bb
rename to meta/recipes-devtools/vala/vala_0.40.4.bb
index 3176a9127e1..759781379f5 100644
--- a/meta/recipes-devtools/vala/vala_0.40.2.bb
+++ b/meta/recipes-devtools/vala/vala_0.40.4.bb
@@ -6,5 +6,5 @@ SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pa
 	     file://0001-Disable-valadoc.patch \
 "
 
-SRC_URI[md5sum] = "e7d05683bcac0306fc8d7c875eb3fef1"
-SRC_URI[sha256sum] = "75a3dc2de36873d8ceab168b2fde1b2c378a1f7104a3b3391ba3acf579c674b3"
+SRC_URI[md5sum] = "a690209e202be7aa6234aaa4e48fe3fb"
+SRC_URI[sha256sum] = "379354a2a2f7ee5c4d6e0f5e88b0e32620dcd5f51972baf6d90d9f18eb689198"
-- 
2.16.1


