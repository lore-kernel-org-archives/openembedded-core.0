Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 09D92773B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:03:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2016 08:02:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="659220053"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2016 08:02:25 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 17:59:21 +0200
Message-Id: <549d5d18a9fe89af398559b3f8df60bb66643392.1456415870.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/19] nspr: update to 4.12
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
X-List-Received-Date: Thu, 25 Feb 2016 16:03:05 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/nspr/{nspr_4.11.bb => nspr_4.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nspr/{nspr_4.11.bb => nspr_4.12.bb} (96%)

diff --git a/meta/recipes-support/nspr/nspr_4.11.bb b/meta/recipes-support/nspr/nspr_4.12.bb
similarity index 96%
rename from meta/recipes-support/nspr/nspr_4.11.bb
rename to meta/recipes-support/nspr/nspr_4.12.bb
index a38e20c..2fd801f 100644
--- a/meta/recipes-support/nspr/nspr_4.11.bb
+++ b/meta/recipes-support/nspr/nspr_4.12.bb
@@ -26,8 +26,8 @@ SRC_URI_append_libc-musl = "\
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[md5sum] = "4f24b2fb88ca03b5d6d6931d6a67ef9a"
-SRC_URI[sha256sum] = "cb320a9eee7028275ac0fce7adc39dee36f14f02fd8432fce1b7e1aa5e3685c2"
+SRC_URI[md5sum] = "0de760c1e00a92e180e611cf06ce9589"
+SRC_URI[sha256sum] = "e0b10a1e569153668ff8bdea6c7e491b389fab69c2f18285a1ebf7c2ea4269de"
 
 S = "${WORKDIR}/nspr-${PV}/nspr"
 
-- 
2.7.0


