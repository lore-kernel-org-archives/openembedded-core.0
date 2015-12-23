Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 071AF60291
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 14:38:04 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 23 Dec 2015 06:38:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,469,1444719600"; d="scan'208";a="713518107"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 23 Dec 2015 06:38:05 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 7504A6A4087
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 07:26:05 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Dec 2015 16:39:31 +0200
Message-Id: <1450881571-2377-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] packagegroup-core-x11-sato: enable pcmanfm on mips
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
X-List-Received-Date: Wed, 23 Dec 2015 14:38:05 -0000

Enable pcmanfm in MIPS. Tested on qemumips.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 753d2bf..b3f6830 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -42,9 +42,7 @@ RDEPENDS_${PN}-base = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio-server pulseaudio-client-conf-sato pulseaudio-misc', '', d)} \
     "
 
-# pcmanfm doesn't work on mips
 FILEMANAGER ?= "pcmanfm"
-FILEMANAGER_mips ?= ""
 
 WEB ?= ""
 #WEB = "epiphany"
-- 
2.4.0


