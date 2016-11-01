Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 708A371A23
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 15:27:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2016 08:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,580,1473145200"; d="scan'208";a="780876160"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2016 08:27:53 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:25:11 +0200
Message-Id: <103bbeb25da3e3fa88a9414c28dbd89e408ec75d.1478013701.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/13] nspr: update to 4.13.1
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
X-List-Received-Date: Tue, 01 Nov 2016 15:27:52 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/nspr/{nspr_4.13.bb => nspr_4.13.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nspr/{nspr_4.13.bb => nspr_4.13.1.bb} (96%)

diff --git a/meta/recipes-support/nspr/nspr_4.13.bb b/meta/recipes-support/nspr/nspr_4.13.1.bb
similarity index 96%
rename from meta/recipes-support/nspr/nspr_4.13.bb
rename to meta/recipes-support/nspr/nspr_4.13.1.bb
index c616035..4a13f39 100644
--- a/meta/recipes-support/nspr/nspr_4.13.bb
+++ b/meta/recipes-support/nspr/nspr_4.13.1.bb
@@ -21,8 +21,8 @@ CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[md5sum] = "74ef1def8a9ff311e32e7648e2c5c8ce"
-SRC_URI[sha256sum] = "19c33334bb3fa6d24800ffa65d7d806c54ad5f8c3758a5c11352ad43212ab181"
+SRC_URI[md5sum] = "9c44298a6fc478b3c0a4e98f4f9981ed"
+SRC_URI[sha256sum] = "5e4c1751339a76e7c772c0c04747488d7f8c98980b434dc846977e43117833ab"
 
 S = "${WORKDIR}/nspr-${PV}/nspr"
 
-- 
2.10.1


