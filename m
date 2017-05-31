Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 155417804A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 11:23:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2017 04:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,423,1491289200"; d="scan'208";a="1154873167"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 31 May 2017 04:23:24 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id E365B5803AB;
	Wed, 31 May 2017 04:23:22 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 14:23:11 +0300
Message-Id: <e858b193a5d379aeb65a181dedb1ffe78d372128.1496229576.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496229576.git.jussi.kukkonen@intel.com>
References: <cover.1496229576.git.jussi.kukkonen@intel.com>
Subject: [PATCH 02/10] libsoup-2.4: Upgrade 2.56.0 -> 2.58.1
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
X-List-Received-Date: Wed, 31 May 2017 11:23:23 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libsoup/{libsoup-2.4_2.56.0.bb => libsoup-2.4_2.58.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.56.0.bb => libsoup-2.4_2.58.1.bb} (89%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.56.0.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.58.1.bb
similarity index 89%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.56.0.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.58.1.bb
index a1f294e..5b1273e 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.56.0.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.58.1.bb
@@ -11,8 +11,8 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "465083f74b7bb035959ddb0599313986"
-SRC_URI[sha256sum] = "d8216b71de8247bc6f274ec054c08547b2e04369c1f8add713e9350c8ef81fe5"
+SRC_URI[md5sum] = "91d7a6bf8785d31f4b154a7612e53e62"
+SRC_URI[sha256sum] = "62c669f557de745b7b20ba9d5b74d839c95e4c9cea1a5ab7f3da5531a1aeefb9"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
2.1.4


