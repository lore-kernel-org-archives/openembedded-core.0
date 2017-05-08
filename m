Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A680471DDE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 08:10:46 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 01:10:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,308,1491289200"; d="scan'208";a="98630739"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 08 May 2017 01:10:45 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 19F2E6A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 01:10:30 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 May 2017 11:11:22 +0300
Message-Id: <1494231086-31827-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1494231086-31827-1-git-send-email-maxin.john@intel.com>
References: <1494231086-31827-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 1/5] mc: upgrade to 4.8.19
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
X-List-Received-Date: Mon, 08 May 2017 08:10:50 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/mc/{mc_4.8.18.bb => mc_4.8.19.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.18.bb => mc_4.8.19.bb} (94%)

diff --git a/meta/recipes-extended/mc/mc_4.8.18.bb b/meta/recipes-extended/mc/mc_4.8.19.bb
similarity index 94%
rename from meta/recipes-extended/mc/mc_4.8.18.bb
rename to meta/recipes-extended/mc/mc_4.8.19.bb
index 17f3f73..23be048 100644
--- a/meta/recipes-extended/mc/mc_4.8.18.bb
+++ b/meta/recipes-extended/mc/mc_4.8.19.bb
@@ -9,8 +9,8 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            "
-SRC_URI[md5sum] = "cc56f0c9abd63c4caa3636bba3a08bfb"
-SRC_URI[sha256sum] = "5b591e10dcbea95233434da40cdad4663d360229adf89826576c319667c103cb"
+SRC_URI[md5sum] = "ef423f5b6f80a1a5a5fc53b8324cab70"
+SRC_URI[sha256sum] = "d0dddfae7149fac903f74ef55cfcb2a198e0f7004346c7bded43669d61ba436f"
 
 inherit autotools gettext pkgconfig
 
-- 
2.4.0


