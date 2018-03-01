Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 819D4788E5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 14:07:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 06:07:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,408,1515484800"; d="scan'208";a="35134167"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 01 Mar 2018 06:07:01 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 16:00:49 +0200
Message-Id: <20180301140052.1388-12-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
References: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/15] vala: upgrade 0.38.6 -> 0.38.8
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
X-List-Received-Date: Thu, 01 Mar 2018 14:07:00 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/vala/{vala_0.38.6.bb => vala_0.38.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.38.6.bb => vala_0.38.8.bb} (64%)

diff --git a/meta/recipes-devtools/vala/vala_0.38.6.bb b/meta/recipes-devtools/vala/vala_0.38.8.bb
similarity index 64%
rename from meta/recipes-devtools/vala/vala_0.38.6.bb
rename to meta/recipes-devtools/vala/vala_0.38.8.bb
index b0b8e00824f..e2baf655596 100644
--- a/meta/recipes-devtools/vala/vala_0.38.6.bb
+++ b/meta/recipes-devtools/vala/vala_0.38.8.bb
@@ -6,5 +6,5 @@ SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pa
 	     file://0001-Disable-valadoc.patch \
 "
 
-SRC_URI[md5sum] = "e0e834869f636fde981ba63d46f31c9c"
-SRC_URI[sha256sum] = "8c676b8307a12fba3420f861463c7e40b2743b0d6fef91f9516a3441ea25029a"
+SRC_URI[md5sum] = "37edd0467d056fd9e3937d0bbceda80b"
+SRC_URI[sha256sum] = "2fa746b51cd66e43577d1da06a80b708c2875cadaafee77e9700ea35cf23882c"
-- 
2.15.1


