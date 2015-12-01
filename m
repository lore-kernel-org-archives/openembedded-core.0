Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 04351605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 14:49:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2015 06:48:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,369,1444719600"; d="scan'208";a="831866824"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 01 Dec 2015 06:48:57 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 709326A4087
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 06:47:47 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Dec 2015 12:00:03 +0200
Message-Id: <1448964003-7692-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] xvideo-tests: move to the latest release
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
X-List-Received-Date: Tue, 01 Dec 2015 14:49:20 -0000

Updating SRCREV to pick up the latest changes.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb b/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
index 9b3c9e0..51839dd 100644
--- a/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
+++ b/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/test-xvideo.c;beginline=1;endline=20;md5=6ae3b4c3c2ff9e51dbbc35bb237afa00"
 DEPENDS = "libxv"
 
-SRCREV = "f8f320d0254c09ce483fc1d8ee99ecf5bc940965"
+SRCREV = "7d38b881e99eb74169d292b40f7164e461a65092"
 PV = "0.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/test-xvideo"
-- 
2.4.0


