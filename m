Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7316FF78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:25:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2018 04:25:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,214,1526367600"; d="scan'208";a="207381405"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 12 Jun 2018 04:25:55 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 060AA580116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 04:25:54 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 14:18:07 +0300
Message-Id: <1528802295-11278-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
References: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 04/12] cronie: upgrade to 1.5.2
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
X-List-Received-Date: Tue, 12 Jun 2018 11:25:54 -0000

1.5.1 -> 1.5.2

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/cronie/{cronie_1.5.1.bb => cronie_1.5.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cronie/{cronie_1.5.1.bb => cronie_1.5.2.bb} (95%)

diff --git a/meta/recipes-extended/cronie/cronie_1.5.1.bb b/meta/recipes-extended/cronie/cronie_1.5.2.bb
similarity index 95%
rename from meta/recipes-extended/cronie/cronie_1.5.1.bb
rename to meta/recipes-extended/cronie/cronie_1.5.2.bb
index cfb8c21..3abca7f 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.1.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.2.bb
@@ -25,8 +25,8 @@ SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[md5sum] = "910e6effcc032998b0a49fbd46322e18"
-SRC_URI[sha256sum] = "6c73666102a6b5d35e2eaf1bd06925f2d4b0cef8d3323c37286dda3089a85338"
+SRC_URI[md5sum] = "703314f58a49ea136e9966d3937d9bf4"
+SRC_URI[sha256sum] = "370bf34641691489330e708bd4cdbd779267296a030668a12f77b7e36872fd75"
 
 inherit autotools update-rc.d useradd systemd
 
-- 
2.4.0


