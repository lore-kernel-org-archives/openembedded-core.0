Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 45147601B8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 11:13:43 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 01 Jul 2016 04:13:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,556,1459839600"; d="scan'208";a="131860651"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 01 Jul 2016 04:13:44 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 33B352C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 04:13:38 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 14:13:09 +0300
Message-Id: <1467371591-12270-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1467371591-12270-1-git-send-email-maxin.john@intel.com>
References: <1467371591-12270-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/6] distro_alias.inc: remove directfb related references
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
X-List-Received-Date: Fri, 01 Jul 2016 11:13:43 -0000

remove directfb related references from distro_alias.inc as part of
moving directfb from oe-core

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/conf/distro/include/distro_alias.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index d6ba66b..7574032 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -46,7 +46,6 @@ DISTRO_PN_ALIAS_pn-connman-gnome = "Intel"
 DISTRO_PN_ALIAS_pn-console-tools = "Debian=console-tools Ubuntu=console-tools"
 DISTRO_PN_ALIAS_pn-core-image-base = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-clutter = "OE-Core"
-DISTRO_PN_ALIAS_pn-core-image-directfb = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-full-cmdline = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-kernel-dev = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-lsb = "OE-Core"
@@ -75,7 +74,6 @@ DISTRO_PN_ALIAS_pn-db = "Debian=db5.1 Ubuntu=db5.1"
 DISTRO_PN_ALIAS_pn-dbus-test = "Fedora=dbus Ubuntu=dbus"
 DISTRO_PN_ALIAS_pn-dbus-wait = "OpenedHand"
 DISTRO_PN_ALIAS_pn-depmodwrapper-cross = "OE-Core"
-DISTRO_PN_ALIAS_pn-directfb-examples = "Debian=directfb Fedora=directfb"
 DISTRO_PN_ALIAS_pn-distcc = "Debian=distcc Fedora=distcc"
 DISTRO_PN_ALIAS_pn-distcc-config = "OpenedHand"
 DISTRO_PN_ALIAS_pn-dmxproto = "Meego=xorg-x11-proto-dmxproto Ubuntu=x11proto-dmx Debian=x11proto-dmx"
@@ -288,7 +286,6 @@ DISTRO_PN_ALIAS_pn-packagegroup-core-boot = "OE-Core"
 DISTRO_PN_ALIAS_pn-packagegroup-core-buildessential = "OE-Core"
 DISTRO_PN_ALIAS_pn-packagegroup-core-clutter = "OE-Core"
 DISTRO_PN_ALIAS_pn-packagegroup-core-device-devel = "OE-Core"
-DISTRO_PN_ALIAS_pn-packagegroup-core-directfb = "OE-Core"
 DISTRO_PN_ALIAS_pn-packagegroup-core-eclipse-debug = "OE-Core"
 DISTRO_PN_ALIAS_pn-packagegroup-core-full-cmdline = "OE-Core"
 DISTRO_PN_ALIAS_pn-packagegroup-core-lsb = "OE-Core"
-- 
2.4.0


