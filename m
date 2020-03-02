Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF50605A3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2020 04:45:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2020 20:45:59 -0800
X-IronPort-AV: E=Sophos;i="5.70,506,1574150400"; d="scan'208";a="233035455"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.22.68])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2020 20:45:58 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Mar 2020 12:45:52 +0800
Message-Id: <20200302044554.1265618-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 1/3] enchant2: upgrade 2.2.7 -> 2.2.8
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
X-List-Received-Date: Mon, 02 Mar 2020 04:45:59 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../enchant/{enchant2_2.2.7.bb => enchant2_2.2.8.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/enchant/{enchant2_2.2.7.bb => enchant2_2.2.8.bb} (85%)

diff --git a/meta/recipes-support/enchant/enchant2_2.2.7.bb b/meta/recipes-support/enchant/enchant2_2.2.8.bb
similarity index 85%
rename from meta/recipes-support/enchant/enchant2_2.2.7.bb
rename to meta/recipes-support/enchant/enchant2_2.2.8.bb
index 03db5c7fae..4ddbe55da5 100644
--- a/meta/recipes-support/enchant/enchant2_2.2.7.bb
+++ b/meta/recipes-support/enchant/enchant2_2.2.8.bb
@@ -9,8 +9,8 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig
 
 SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[md5sum] = "8a6ea1bb143c64e0edf5e49c7e7cb984"
-SRC_URI[sha256sum] = "1b22976135812b35cb5b8d21a53ad11d5e7c1426c93f51e7a314a2a42cab3a09"
+SRC_URI[md5sum] = "c7b9d6a392ecb8758e499f783e8dc883"
+SRC_URI[sha256sum] = "c7b5e2853f0dd0b1aafea2f9e071941affeec3a76df8e3f6d67a718c89293555"
 
 UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.24.1


