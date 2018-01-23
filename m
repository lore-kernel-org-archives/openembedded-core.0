Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA8B787C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:04:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 06:04:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,401,1511856000"; d="scan'208";a="21662869"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 23 Jan 2018 06:04:20 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 4903F5800D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 06:04:20 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jan 2018 16:05:52 +0200
Message-Id: <1516716352-32735-13-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
References: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 12/12] atk: upgrade to version 2.26.1
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
X-List-Received-Date: Tue, 23 Jan 2018 14:04:19 -0000

2.26.0 -> 2.26.1

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/atk/{atk_2.26.0.bb => atk_2.26.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{atk_2.26.0.bb => atk_2.26.1.bb} (78%)

diff --git a/meta/recipes-support/atk/atk_2.26.0.bb b/meta/recipes-support/atk/atk_2.26.1.bb
similarity index 78%
rename from meta/recipes-support/atk/atk_2.26.0.bb
rename to meta/recipes-support/atk/atk_2.26.1.bb
index e014ba0..685b599 100644
--- a/meta/recipes-support/atk/atk_2.26.0.bb
+++ b/meta/recipes-support/atk/atk_2.26.1.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
 
-SRC_URI[archive.md5sum] = "ee9c329784dead6e386e8b2e0d4d8d6f"
-SRC_URI[archive.sha256sum] = "eafe49d5c4546cb723ec98053290d7e0b8d85b3fdb123938213acb7bb4178827"
+SRC_URI[archive.md5sum] = "7cddcc313b9a3efd19b2ddf079ba68f5"
+SRC_URI[archive.sha256sum] = "ef00ff6b83851dddc8db38b4d9faeffb99572ba150b0664ee02e46f015ea97cb"
 
 BBCLASSEXTEND = "native"
 
-- 
2.4.0


