Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A29C27874E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 13:50:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jan 2018 05:50:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,407,1511856000"; d="scan'208";a="29115268"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 24 Jan 2018 05:50:48 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 7DF1F5801D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 05:50:47 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jan 2018 15:52:32 +0200
Message-Id: <1516801953-19706-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1516801953-19706-1-git-send-email-maxin.john@intel.com>
References: <1516801953-19706-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/3] pango: upgrade to version 1.40.14
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
X-List-Received-Date: Wed, 24 Jan 2018 13:50:54 -0000

Upgrading to stable version 1.40.14

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/pango/{pango_1.40.12.bb => pango_1.40.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.40.12.bb => pango_1.40.14.bb} (92%)

diff --git a/meta/recipes-graphics/pango/pango_1.40.12.bb b/meta/recipes-graphics/pango/pango_1.40.14.bb
similarity index 92%
rename from meta/recipes-graphics/pango/pango_1.40.12.bb
rename to meta/recipes-graphics/pango/pango_1.40.14.bb
index cbad9a9..3bd9c64 100644
--- a/meta/recipes-graphics/pango/pango_1.40.12.bb
+++ b/meta/recipes-graphics/pango/pango_1.40.14.bb
@@ -17,8 +17,8 @@ SRC_URI += "file://run-ptest \
             file://0001-Drop-introspection-macros-from-acinclude.m4.patch \
             file://0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch \
 "
-SRC_URI[archive.sha256sum] = "75f1a9a8e4e2b28cbc078b50c1fa927ee4ded994d1ade97c5603e2d1f3161cfc"
-SRC_URI[archive.md5sum] = "9aae7dd5ecc1c2ade4e6951b85004cee"
+SRC_URI[archive.md5sum] = "18d7eb8d52e7e445e733c109ddaa7b78"
+SRC_URI[archive.sha256sum] = "90af1beaa7bf9e4c52db29ec251ec4fd0a8f2cc185d521ad1f88d01b3a6a17e3"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz"
 
-- 
2.4.0


