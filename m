Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E67D46AC3C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 09:33:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 18 Nov 2015 01:33:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,312,1444719600"; d="scan'208";a="853703731"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2015 01:33:54 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id B511C6A4087
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 01:32:48 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 11:34:37 +0200
Message-Id: <1447839279-12119-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1447839279-12119-1-git-send-email-maxin.john@intel.com>
References: <1447839279-12119-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/6] orc: update to 0.4.24
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
X-List-Received-Date: Wed, 18 Nov 2015 09:33:54 -0000

0.4.23 -> 0.4.24

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/orc/{orc_0.4.23.bb => orc_0.4.24.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/orc/{orc_0.4.23.bb => orc_0.4.24.bb} (83%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.23.bb b/meta/recipes-devtools/orc/orc_0.4.24.bb
similarity index 83%
rename from meta/recipes-devtools/orc/orc_0.4.23.bb
rename to meta/recipes-devtools/orc/orc_0.4.24.bb
index d4257c3..4fa311f 100644
--- a/meta/recipes-devtools/orc/orc_0.4.23.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.24.bb
@@ -4,8 +4,8 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz;name=orc"
-SRC_URI[orc.md5sum] = "72e0612ace54d77aa2f7a006348ee81a"
-SRC_URI[orc.sha256sum] = "767eaebce2941737b43368225ec54598b3055ca78b4dc50c4092f5fcdc0bdfe7"
+SRC_URI[orc.md5sum] = "9e793ec34c0e20339659dd4bbbf62135"
+SRC_URI[orc.sha256sum] = "338cd493b5247300149821c6312bdf7422a3593ae98691fc75d7e4fe727bd39b"
 
 inherit autotools pkgconfig
 
-- 
2.4.0


