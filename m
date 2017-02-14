Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 77B2E73214
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 09:55:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2017 01:55:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,160,1484035200"; d="scan'208";a="44181015"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 14 Feb 2017 01:55:17 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 8BE6A6A4080;
	Tue, 14 Feb 2017 01:54:15 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2017 11:55:02 +0200
Message-Id: <6ef9855dfa11089e17efa6b33d206407734dae8d.1487065337.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487065337.git.jussi.kukkonen@intel.com>
References: <cover.1487065337.git.jussi.kukkonen@intel.com>
Subject: [PATCH 05/11] xauth: Upgrade 1.0.9 -> 1.0.10
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
X-List-Received-Date: Tue, 14 Feb 2017 09:55:24 -0000

Small bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-app/{xauth_1.0.9.bb => xauth_1.0.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xauth_1.0.9.bb => xauth_1.0.10.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-app/xauth_1.0.9.bb b/meta/recipes-graphics/xorg-app/xauth_1.0.10.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-app/xauth_1.0.9.bb
rename to meta/recipes-graphics/xorg-app/xauth_1.0.10.bb
index 59b3323..26e02a9 100644
--- a/meta/recipes-graphics/xorg-app/xauth_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-app/xauth_1.0.10.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5ec74dd7ea4d10c4715a7c44f159a40b"
 DEPENDS += "libxau libxext libxmu"
 PE = "1"
 
-SRC_URI[md5sum] = "7d6003f32838d5b688e2c8a131083271"
-SRC_URI[sha256sum] = "56ce1523eb48b1f8a4f4244fe1c3d8e6af1a3b7d4b0e6063582421b0b68dc28f"
+SRC_URI[md5sum] = "f3f76cb10f69b571c43893ea6a634aa4"
+SRC_URI[sha256sum] = "5afe42ce3cdf4f60520d1658d2b17face45c74050f39af45dccdc95e73fafc4d"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.1.4


