Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D328C6FFF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 14:01:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2016 07:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,367,1459839600"; d="scan'208";a="975020305"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2016 07:01:13 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 17:00:48 +0300
Message-Id: <ef3b7f7c549c5a1f59e854b34aebde43febfeae2.1464271067.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
References: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
References: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/6] msmtp: upgrade to 1.6.4
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
X-List-Received-Date: Thu, 26 May 2016 14:01:13 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/msmtp/{msmtp_1.6.3.bb => msmtp_1.6.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.6.3.bb => msmtp_1.6.4.bb} (86%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.6.3.bb b/meta/recipes-extended/msmtp/msmtp_1.6.4.bb
similarity index 86%
rename from meta/recipes-extended/msmtp/msmtp_1.6.3.bb
rename to meta/recipes-extended/msmtp/msmtp_1.6.4.bb
index 6dbd78f..fe64184 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.6.3.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.6.4.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "http://sourceforge.net/projects/msmtp/files/msmtp/${PV}/${BPN}-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "6d9384c09405db9476beaa2237c56705"
-SRC_URI[sha256sum] = "f982be069c0772c3ee83925f552f5dac5fb307d2d1c68202f9926bb13b757355"
+SRC_URI[md5sum] = "aa829b5e9faeca5139f7983e6637f0d6"
+SRC_URI[sha256sum] = "9b49c022a5440d41b6782c97ef2977d0346c3dae05aa8836243a9953e982d1cd"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.8.1


