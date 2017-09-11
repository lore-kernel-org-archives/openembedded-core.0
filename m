Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2220C71A3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 11:35:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 11 Sep 2017 04:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,377,1500966000"; d="scan'208";a="1171065867"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 11 Sep 2017 04:35:15 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 6C3CC5803A7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 04:35:14 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Sep 2017 14:37:41 +0300
Message-Id: <1505129861-39655-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] hostap-utils: use w1.fi for SRC_URI
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
X-List-Received-Date: Mon, 11 Sep 2017 11:35:14 -0000

epitest.fi is down and hostap-utils source is now available in
w1.fi. So, move SRC_URI to https://w1.fi

Since hostap-utils is only meant for old Intersil Prism2/2.5/3 wifi cards,
this recipe will be removed from oe-core in future (most likely to
meta-handheld)

[YOCTO #12051]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-bsp/hostap/hostap-utils.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/hostap/hostap-utils.inc b/meta/recipes-bsp/hostap/hostap-utils.inc
index 140321d..6d98e3a 100644
--- a/meta/recipes-bsp/hostap/hostap-utils.inc
+++ b/meta/recipes-bsp/hostap/hostap-utils.inc
@@ -1,15 +1,14 @@
 SUMMARY = "User mode helpers for the hostap driver"
 DESCRIPTION = "The hostap driver supports Host AP mode, it allows for IEEE 802.11 \
 management functions on the host computer and allows the system to act as an access point."
-HOMEPAGE = "http://hostap.epitest.fi"
-BUGTRACKER = "http://hostap.epitest.fi/bugz/"
+HOMEPAGE = "https://w1.fi"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 			file://util.c;beginline=1;endline=9;md5=d3b9280851302e5ba34e5fb717489b6d"
 SECTION = "kernel/userland"
 PR = "r4"
 
-SRC_URI = "http://hostap.epitest.fi/releases/hostap-utils-${PV}.tar.gz \
+SRC_URI = "https://w1.fi/releases/hostap-utils-${PV}.tar.gz \
            file://hostap-fw-load.patch \
            file://0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch \
 "
-- 
2.4.0


