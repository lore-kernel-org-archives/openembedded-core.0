Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 85CCC731B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 15:11:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2015 07:11:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="875739917"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2015 07:11:27 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:08:45 +0200
Message-Id: <7f461ec11f222a76ab6ef5837da529bfb0e906ab.1450364672.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/17] msmtp: update to 1.6.3
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
X-List-Received-Date: Thu, 17 Dec 2015 15:11:27 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/msmtp/{msmtp_1.6.2.bb => msmtp_1.6.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.6.2.bb => msmtp_1.6.3.bb} (86%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.6.2.bb b/meta/recipes-extended/msmtp/msmtp_1.6.3.bb
similarity index 86%
rename from meta/recipes-extended/msmtp/msmtp_1.6.2.bb
rename to meta/recipes-extended/msmtp/msmtp_1.6.3.bb
index f9bf563..6dbd78f 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.6.2.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.6.3.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "http://sourceforge.net/projects/msmtp/files/msmtp/${PV}/${BPN}-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "3baca93c7e5f1aa9d36a2e5b38739ab9"
-SRC_URI[sha256sum] = "2f6ecd7cbfadf548fd55205bd24cb63b84bcbb1185efed917dd7800595a48789"
+SRC_URI[md5sum] = "6d9384c09405db9476beaa2237c56705"
+SRC_URI[sha256sum] = "f982be069c0772c3ee83925f552f5dac5fb307d2d1c68202f9926bb13b757355"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.6.2


