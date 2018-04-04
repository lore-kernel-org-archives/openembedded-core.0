Return-Path: <maxin.john@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id C121374C3D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 15:33:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 08:33:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,406,1517904000"; d="scan'208";a="217602134"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 04 Apr 2018 08:33:46 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 4158F5801C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 08:33:46 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 18:32:24 +0300
Message-Id: <1522855946-8702-8-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
References: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 08/10] libsoup-2.4: upgrade to version 2.62.0
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
X-List-Received-Date: Wed, 04 Apr 2018 15:33:46 -0000

2.60.3 -> 2.62.0

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libsoup/{libsoup-2.4_2.60.3.bb => libsoup-2.4_2.62.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.60.3.bb => libsoup-2.4_2.62.0.bb} (89%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.60.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.62.0.bb
similarity index 89%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.60.3.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.62.0.bb
index e2e7ff4..5c9dd19 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.60.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.62.0.bb
@@ -11,8 +11,8 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "4cf8937d161d3dd71a65f1684e317824"
-SRC_URI[sha256sum] = "1b0dc762f23abe4e0d29b77370e539fd35f31d8e8e0318d6ddccff395be68a22"
+SRC_URI[md5sum] = "750b6f6136e5fdd82ac07f60b4aea575"
+SRC_URI[sha256sum] = "ab7c7ae8d19d0a27ab3b6ae21599cec8c7f7b773b3f2b1090c5daf178373aaac"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
2.4.0


