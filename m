Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 32576607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 13:28:17 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP; 26 Oct 2016 06:28:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,550,1473145200"; d="scan'208";a="24249152"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 26 Oct 2016 06:28:10 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id E9DF16A4006;
	Wed, 26 Oct 2016 06:27:35 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 16:27:51 +0300
Message-Id: <6247f979128efef0875eaea4c54dcd537196924a.1477488358.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
References: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477488358.git.jussi.kukkonen@intel.com>
References: <cover.1477488358.git.jussi.kukkonen@intel.com>
Subject: [PATCH 10/14] glib-networking: Upgrade 2.48.2 -> 2.50.0
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
X-List-Received-Date: Wed, 26 Oct 2016 13:28:17 -0000

Six-monthly feature release, mostly bug fixes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{glib-networking_2.48.2.bb => glib-networking_2.50.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.48.2.bb => glib-networking_2.50.0.bb} (88%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.48.2.bb b/meta/recipes-core/glib-networking/glib-networking_2.50.0.bb
similarity index 88%
rename from meta/recipes-core/glib-networking/glib-networking_2.48.2.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.50.0.bb
index 50d9983..0baaffd 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.48.2.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.50.0.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 SECTION = "libs"
 DEPENDS = "glib-2.0 intltool-native"
 
-SRC_URI[archive.md5sum] = "d7cf81d52c856b0c66f7821021f40e08"
-SRC_URI[archive.sha256sum] = "925c0c49d6b2b8b5695f2e33cd952d1dbb7d18d3f2f796413577719315bb3a84"
+SRC_URI[archive.md5sum] = "4d06d0224646f274918b1cb6da9a07f6"
+SRC_URI[archive.sha256sum] = "3f1a442f3c2a734946983532ce59ed49120319fdb10c938447c373d5e5286bee"
 
 PACKAGECONFIG ??= "ca-certificates gnutls"
 
-- 
2.1.4


