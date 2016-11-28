Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 50A8071AA9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:37:34 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2016 05:37:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="36412263"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 05:37:35 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 15:34:23 +0200
Message-Id: <61c0ee97b6b5f0ae2f65c9b2e4ca23a5b1545e2b.1480333940.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/18] msmtp: update to 1.6.6
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
X-List-Received-Date: Mon, 28 Nov 2016 13:37:34 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/msmtp/{msmtp_1.6.5.bb => msmtp_1.6.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.6.5.bb => msmtp_1.6.6.bb} (86%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.6.5.bb b/meta/recipes-extended/msmtp/msmtp_1.6.6.bb
similarity index 86%
rename from meta/recipes-extended/msmtp/msmtp_1.6.5.bb
rename to meta/recipes-extended/msmtp/msmtp_1.6.6.bb
index d0c39eb..e172193 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.6.5.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.6.6.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "http://sourceforge.net/projects/msmtp/files/msmtp/${PV}/${BPN}-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "50a8c9bb72f8222779db6b4aae2965e0"
-SRC_URI[sha256sum] = "76a0d60693c7e65d0c7a12f01d300882d280b1e1be0202f54730ae44d44a5006"
+SRC_URI[md5sum] = "82b0520b57db4b2cf05333d11fb5974d"
+SRC_URI[sha256sum] = "da15db1f62bd0201fce5310adb89c86188be91cd745b7cb3b62b81a501e7fb5e"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.10.2


