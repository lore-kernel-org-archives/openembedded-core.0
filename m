Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 520A5730D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 13:02:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 05:02:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="936824845"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 22 Feb 2017 05:02:42 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id D0D326A4080;
	Wed, 22 Feb 2017 05:02:41 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 15:02:33 +0200
Message-Id: <88a99b771ee408ffbc608650c9efe57dbe132b01.1487764904.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487764904.git.jussi.kukkonen@intel.com>
References: <cover.1487764904.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/6] libgudev: Upgrade 230 -> 231
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
X-List-Received-Date: Wed, 22 Feb 2017 13:02:42 -0000

Very small bug fix release.

Use --disable-umockdev: Testing is great but a single regression test
isn't really worth a new build dependency (that isn't in oe-core yet).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/libgudev/{libgudev_230.bb => libgudev_231.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libgudev/{libgudev_230.bb => libgudev_231.bb} (65%)

diff --git a/meta/recipes-gnome/libgudev/libgudev_230.bb b/meta/recipes-gnome/libgudev/libgudev_231.bb
similarity index 65%
rename from meta/recipes-gnome/libgudev/libgudev_230.bb
rename to meta/recipes-gnome/libgudev/libgudev_231.bb
index 709553b..ae0f1c7 100644
--- a/meta/recipes-gnome/libgudev/libgudev_230.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_231.bb
@@ -1,10 +1,12 @@
 SUMMARY = "GObject wrapper for libudev"
 
-SRC_URI[archive.md5sum] = "e4dee8f3f349e9372213d33887819a4d"
-SRC_URI[archive.sha256sum] = "a2e77faced0c66d7498403adefcc0707105e03db71a2b2abd620025b86347c18"
+SRC_URI[archive.md5sum] = "916c10c51ec61131e244c3936bbb2e0c"
+SRC_URI[archive.sha256sum] = "3b1ef99d4a8984c35044103d8ddfc3cc52c80035c36abab2bcc5e3532e063f96"
 
 DEPENDS = "glib-2.0 udev"
 
+EXTRA_OECONF = "--disable-umockdev"
+
 RCONFLICTS_${PN} = "systemd (<= 220)"
 
 LICENSE = "LGPLv2.1"
-- 
2.1.4


