Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 24DE171E01
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 08:10:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 01:10:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,308,1491289200"; d="scan'208";a="1166010254"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 08 May 2017 01:10:46 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 255536A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 01:10:31 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 May 2017 11:11:23 +0300
Message-Id: <1494231086-31827-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1494231086-31827-1-git-send-email-maxin.john@intel.com>
References: <1494231086-31827-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/5] minicom: upgrade to 2.7.1
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
X-List-Received-Date: Mon, 08 May 2017 08:10:51 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/minicom/{minicom_2.7.bb => minicom_2.7.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/minicom/{minicom_2.7.bb => minicom_2.7.1.bb} (87%)

diff --git a/meta/recipes-extended/minicom/minicom_2.7.bb b/meta/recipes-extended/minicom/minicom_2.7.1.bb
similarity index 87%
rename from meta/recipes-extended/minicom/minicom_2.7.bb
rename to meta/recipes-extended/minicom/minicom_2.7.1.bb
index 3118686..92cf5f9 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.1.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://alioth.debian.org/frs/download.php/latestfile/3/${BP}.tar.gz
            file://0001-Fix-build-issus-surfaced-due-to-musl.patch \
           "
 
-SRC_URI[md5sum] = "7044ca3e291268c33294f171d426dc2d"
-SRC_URI[sha256sum] = "9ac3a663b82f4f5df64114b4792b9926b536c85f59de0f2d2b321c7626a904f4"
+SRC_URI[md5sum] = "9021cb8c5445f6e6e74b2acc39962d62"
+SRC_URI[sha256sum] = "532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1"
 
 UPSTREAM_CHECK_URI = "https://alioth.debian.org/frs/?group_id=30018"
 
-- 
2.4.0


