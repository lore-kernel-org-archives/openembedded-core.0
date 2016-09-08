Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 43A956FF84
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 15:47:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 08 Sep 2016 08:47:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,301,1470726000"; d="scan'208";a="1053176114"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2016 08:47:08 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 62F526A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 08:46:46 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Sep 2016 18:46:52 +0300
Message-Id: <1473349614-5497-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1473349614-5497-1-git-send-email-maxin.john@intel.com>
References: <1473349614-5497-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/4] kmod: inherit pkgconfig
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
X-List-Received-Date: Thu, 08 Sep 2016 15:47:09 -0000

Instead of DEPENDS += "pkgconfig-native", inherit pkgconfig class which does
the same.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-kernel/kmod/kmod.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 99c4a8f..eeacb9a 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -9,12 +9,10 @@ LICENSE = "GPL-2.0+ & LGPL-2.1+"
 LICENSE_libkmod = "LGPL-2.1+"
 SECTION = "base"
 
-DEPENDS += "pkgconfig-native"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
-inherit autotools gtk-doc
+inherit autotools gtk-doc pkgconfig
 
 SRCREV = "65a885df5f6f15222b44fd695c5eaca17e837a14"
 # Lookout for PV bump too when SRCREV is changed
-- 
2.4.0


