Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 94E3F78227
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:39:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:39:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945873"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:39:01 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:30 +0300
Message-Id: <13c0999dda5eb7e305608dcf7c8776427e903905.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 38/50] libgudev: update to 232
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
X-List-Received-Date: Wed, 11 Oct 2017 15:39:06 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/libgudev/{libgudev_231.bb => libgudev_232.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libgudev/{libgudev_231.bb => libgudev_232.bb} (74%)

diff --git a/meta/recipes-gnome/libgudev/libgudev_231.bb b/meta/recipes-gnome/libgudev/libgudev_232.bb
similarity index 74%
rename from meta/recipes-gnome/libgudev/libgudev_231.bb
rename to meta/recipes-gnome/libgudev/libgudev_232.bb
index ad679265282..19fe962e466 100644
--- a/meta/recipes-gnome/libgudev/libgudev_231.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_232.bb
@@ -1,7 +1,7 @@
 SUMMARY = "GObject wrapper for libudev"
 HOMEPAGE = "https://wiki.gnome.org/Projects/libgudev"
-SRC_URI[archive.md5sum] = "916c10c51ec61131e244c3936bbb2e0c"
-SRC_URI[archive.sha256sum] = "3b1ef99d4a8984c35044103d8ddfc3cc52c80035c36abab2bcc5e3532e063f96"
+SRC_URI[archive.sha256sum] = "ee4cb2b9c573cdf354f6ed744f01b111d4b5bed3503ffa956cefff50489c7860"
+SRC_URI[archive.md5sum] = "6914852377156665567abf8a38d89236"
 
 DEPENDS = "glib-2.0 udev"
 
-- 
2.14.1


