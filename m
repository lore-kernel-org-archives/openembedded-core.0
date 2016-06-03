Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CD56B774FF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440278"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:32 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:15:00 +0300
Message-Id: <1a1b23083f6ecfe49c54fb6f1398aa913df0e16a.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 23/25] msmtp: update to 1.6.5
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:31 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/msmtp/{msmtp_1.6.4.bb => msmtp_1.6.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.6.4.bb => msmtp_1.6.5.bb} (86%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.6.4.bb b/meta/recipes-extended/msmtp/msmtp_1.6.5.bb
similarity index 86%
rename from meta/recipes-extended/msmtp/msmtp_1.6.4.bb
rename to meta/recipes-extended/msmtp/msmtp_1.6.5.bb
index fe64184..d0c39eb 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.6.4.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.6.5.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "http://sourceforge.net/projects/msmtp/files/msmtp/${PV}/${BPN}-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "aa829b5e9faeca5139f7983e6637f0d6"
-SRC_URI[sha256sum] = "9b49c022a5440d41b6782c97ef2977d0346c3dae05aa8836243a9953e982d1cd"
+SRC_URI[md5sum] = "50a8c9bb72f8222779db6b4aae2965e0"
+SRC_URI[sha256sum] = "76a0d60693c7e65d0c7a12f01d300882d280b1e1be0202f54730ae44d44a5006"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.8.1


