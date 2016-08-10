Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 079756011C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:29:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Aug 2016 02:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,499,1464678000"; d="scan'208";a="1033023532"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2016 02:29:48 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id EF61F6A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 02:29:32 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2016 12:30:28 +0300
Message-Id: <1470821429-6094-10-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
References: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 09/10] distro_alias.inc: remove xtscal, pointercal and tslib references
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
X-List-Received-Date: Wed, 10 Aug 2016 09:29:48 -0000

Remove xtscal, pointercal and tslib reference from distro_alias.inc
file since we moved those recipes from oe-core

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/conf/distro/include/distro_alias.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 5948b75..9e00ae6 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -311,7 +311,6 @@ DISTRO_PN_ALIAS_pn-patchelf = "Opensuse=patchelf Fedora=patchelf"
 DISTRO_PN_ALIAS_pn-perf = "OSPDT"
 DISTRO_PN_ALIAS_pn-piglit = "OE-Core"
 DISTRO_PN_ALIAS_pn-pkgconfig = "Ubuntu=pkg-config Fedora=pkgconfig"
-DISTRO_PN_ALIAS_pn-pointercal = "OE-Core"
 DISTRO_PN_ALIAS_pn-pointercal-xinput = "OE-Core"
 DISTRO_PN_ALIAS_pn-pong-clock = "OpenedHand"
 DISTRO_PN_ALIAS_pn-portmap = "Debian=rpcbind Fedora=rpcbind"
@@ -379,7 +378,6 @@ DISTRO_PN_ALIAS_pn-texinfo-dummy-native = "OE-Core"
 DISTRO_PN_ALIAS_pn-tiny-init = "OSPDT"
 DISTRO_PN_ALIAS_pn-trace-cmd = "Mandriva=trace-cmd Ubuntu=trace-cmd"
 DISTRO_PN_ALIAS_pn-tremor = "OSPDT upstream=http://www.xiph.org/vorbis/"
-DISTRO_PN_ALIAS_pn-tslib = "Debian=tslib Ubuntu=tslib"
 DISTRO_PN_ALIAS_pn-ttf-bitstream-vera = "Debian=ttf-bitstream-vera Ubuntu=ttf-bitstream-vera"
 DISTRO_PN_ALIAS_pn-tzcode = "OSPDT"
 DISTRO_PN_ALIAS_pn-u-boot-fw-utils = "Ubuntu=u-boot-tools Debian=u-boot-tools"
@@ -448,7 +446,6 @@ DISTRO_PN_ALIAS_pn-xserver-xf86-dri-lite = "Fedora=xorg-x11-server Ubuntu=xserve
 DISTRO_PN_ALIAS_pn-xserver-xf86-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 DISTRO_PN_ALIAS_pn-xserver-xorg = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 DISTRO_PN_ALIAS_pn-xset = "Fedora=xorg-x11-server-utils Ubuntu=x11-xserver-utils Debian=x11-xserver-utils Opensuse=xorg-x11"
-DISTRO_PN_ALIAS_pn-xtscal = "OSPDT upstream=http://gpe.linuxtogo.org/download/source/"
 DISTRO_PN_ALIAS_pn-xuser-account = "OE-Core"
 DISTRO_PN_ALIAS_pn-xvideo-tests = "OpenedHand"
 DISTRO_PN_ALIAS_pn-xvinfo = "Fedora=xorg-x11-utils Ubuntu=x11-utils"
-- 
2.4.0


