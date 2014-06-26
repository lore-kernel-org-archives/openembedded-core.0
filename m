Return-Path: <fabien.chereau@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BACB4605B3
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 10:20:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Jun 2014 03:20:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,552,1400050800"; d="scan'208";a="534421737"
Received: from tllab257.tl.intel.com ([10.102.162.222])
	by orsmga001.jf.intel.com with ESMTP; 26 Jun 2014 03:20:42 -0700
From: Fabien Chereau <fabien.chereau@intel.com>
To: Openembedded-core@lists.openembedded.org
Date: Thu, 26 Jun 2014 12:20:02 +0200
Message-Id: <1403778002-10155-1-git-send-email-fabien.chereau@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] libusb: add missing build dependency on udev
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
X-List-Received-Date: Thu, 26 Jun 2014 10:20:46 -0000

This fixes the ./configure error in case libusb is built before udev/systemd.

Signed-off-by: Fabien Chereau <fabien.chereau@intel.com>
---
 meta/recipes-support/libusb/libusb1_1.0.19.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.19.bb b/meta/recipes-support/libusb/libusb1_1.0.19.bb
index a20e1fc..be2be9d 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.19.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.19.bb
@@ -6,6 +6,8 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
+DEPENDS_append = " udev"
+
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
-- 
1.8.3.2

---------------------------------------------------------------------
Intel Corporation SAS (French simplified joint stock company)
Registered headquarters: "Les Montalets"- 2, rue de Paris, 
92196 Meudon Cedex, France
Registration Number:  302 456 199 R.C.S. NANTERRE
Capital: 4,572,000 Euros

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


