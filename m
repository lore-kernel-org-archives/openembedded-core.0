Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 069EB78DF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:25:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2018 04:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,214,1526367600"; d="scan'208";a="47120319"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2018 04:26:01 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 737B0580116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 04:26:00 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 14:18:12 +0300
Message-Id: <1528802295-11278-9-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
References: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 09/12] mc: upgrade to 4.8.21
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
X-List-Received-Date: Tue, 12 Jun 2018 11:26:00 -0000

4.8.20 -> 4.8.21

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/mc/{mc_4.8.20.bb => mc_4.8.21.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.20.bb => mc_4.8.21.bb} (93%)

diff --git a/meta/recipes-extended/mc/mc_4.8.20.bb b/meta/recipes-extended/mc/mc_4.8.21.bb
similarity index 93%
rename from meta/recipes-extended/mc/mc_4.8.20.bb
rename to meta/recipes-extended/mc/mc_4.8.21.bb
index 70d1b5e..c6a4500 100644
--- a/meta/recipes-extended/mc/mc_4.8.20.bb
+++ b/meta/recipes-extended/mc/mc_4.8.21.bb
@@ -9,8 +9,8 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            "
-SRC_URI[md5sum] = "dcfc7aa613c62291a0f71f6b698d8267"
-SRC_URI[sha256sum] = "2d85daaa6ab26e524946df4823ac2f69802bc16bc967781b5e28d5b86fc3b979"
+SRC_URI[md5sum] = "63d2b90e2198ee79d08eb4a8989220e2"
+SRC_URI[sha256sum] = "251d9f0ef9309ef3eea0fdc4c12b8b61149e5056bef1b2de2ccc7f015d973444"
 
 inherit autotools gettext pkgconfig
 
-- 
2.4.0


