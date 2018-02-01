Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 1F40C7882D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 18:02:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2018 10:02:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,444,1511856000"; d="scan'208";a="200465191"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2018 10:02:20 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 20:01:59 +0200
Message-Id: <20180201180210.21652-9-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/20] vala: update to 0.38.6
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
X-List-Received-Date: Thu, 01 Feb 2018 18:02:20 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/vala/{vala_0.38.2.bb => vala_0.38.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.38.2.bb => vala_0.38.6.bb} (64%)

diff --git a/meta/recipes-devtools/vala/vala_0.38.2.bb b/meta/recipes-devtools/vala/vala_0.38.6.bb
similarity index 64%
rename from meta/recipes-devtools/vala/vala_0.38.2.bb
rename to meta/recipes-devtools/vala/vala_0.38.6.bb
index 18751fe81a7..b0b8e00824f 100644
--- a/meta/recipes-devtools/vala/vala_0.38.2.bb
+++ b/meta/recipes-devtools/vala/vala_0.38.6.bb
@@ -6,5 +6,5 @@ SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pa
 	     file://0001-Disable-valadoc.patch \
 "
 
-SRC_URI[md5sum] = "720846116448fc20b0ab3c0921e19798"
-SRC_URI[sha256sum] = "20d5d9c4fbd17877969dbce27e6428da67138e116b1717cc07b5b75fd6ab78a7"
+SRC_URI[md5sum] = "e0e834869f636fde981ba63d46f31c9c"
+SRC_URI[sha256sum] = "8c676b8307a12fba3420f861463c7e40b2743b0d6fef91f9516a3441ea25029a"
-- 
2.15.1


