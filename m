Return-Path: <maxin.john@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id D769D60750
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 17:13:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 09:13:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,503,1511856000"; d="scan'208";a="203572562"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 12 Feb 2018 09:13:11 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 165BA5803A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 09:13:10 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 19:15:36 +0200
Message-Id: <1518455737-34537-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v3 1/2] fontconfig: fix upstream version check
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
X-List-Received-Date: Mon, 12 Feb 2018 17:13:11 -0000

In the case of fontconfig, version x.x.9x are release candidates
for next version.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
index fa5f0ee..d4cbce8 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
 SRC_URI[md5sum] = "00e748c67fad11e7057a71ed385e8bdb"
 SRC_URI[sha256sum] = "064b9ebf060c9e77011733ac9dc0e2ce92870b574cca2405e11f5353a683c334"
 
+UPSTREAM_CHECK_REGEX = "fontconfig-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
 do_configure_prepend() {
     # work around https://bugs.freedesktop.org/show_bug.cgi?id=101280
-- 
2.4.0


