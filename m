Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 48CBC74C0A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 15:33:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 08:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,406,1517904000"; d="scan'208";a="30988993"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga008.jf.intel.com with ESMTP; 04 Apr 2018 08:33:41 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 167145801C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 08:33:40 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 18:32:19 +0300
Message-Id: <1522855946-8702-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
References: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 03/10] atk: upgrade to version 2.28.1
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
X-List-Received-Date: Wed, 04 Apr 2018 15:33:42 -0000

convert to meson build

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/atk/{atk_2.26.1.bb => atk_2.28.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{atk_2.26.1.bb => atk_2.28.1.bb} (75%)

diff --git a/meta/recipes-support/atk/atk_2.26.1.bb b/meta/recipes-support/atk/atk_2.28.1.bb
similarity index 75%
rename from meta/recipes-support/atk/atk_2.26.1.bb
rename to meta/recipes-support/atk/atk_2.28.1.bb
index 685b599..bb47916 100644
--- a/meta/recipes-support/atk/atk_2.26.1.bb
+++ b/meta/recipes-support/atk/atk_2.28.1.bb
@@ -10,10 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 
 DEPENDS = "glib-2.0"
 
+GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
 
-SRC_URI[archive.md5sum] = "7cddcc313b9a3efd19b2ddf079ba68f5"
-SRC_URI[archive.sha256sum] = "ef00ff6b83851dddc8db38b4d9faeffb99572ba150b0664ee02e46f015ea97cb"
+SRC_URI[archive.md5sum] = "dfb5e7474220afa3f4ca7e45af9f3a11"
+SRC_URI[archive.sha256sum] = "cd3a1ea6ecc268a2497f0cd018e970860de24a6d42086919d6bf6c8e8d53f4fc"
 
 BBCLASSEXTEND = "native"
 
-- 
2.4.0


