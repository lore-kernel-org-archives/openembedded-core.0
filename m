Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B16FF6FC0F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 00:36:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Jun 2014 17:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,503,1400050800"; d="scan'208";a="530722137"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by orsmga001.jf.intel.com with ESMTP; 18 Jun 2014 17:36:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jun 2014 17:36:17 -0700
Message-Id: <1403138177-11400-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] local.conf.sample: Add sdl to nativesdk qemu PACKAGECONFIG
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
X-List-Received-Date: Thu, 19 Jun 2014 00:36:30 -0000

Enable SDL by default for nativesdk as we do with natve, this will
allow qemu with ADT to use graphics no vnc by default.

[YOCTO #6446]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/local.conf.sample | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 1d893af..d64ba7f 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -221,6 +221,7 @@ BB_DISKMON_DIRS = "\
 # seen. The two lines below enable the SDL backend too. This assumes there is a
 # libsdl library available on your build system.
 PACKAGECONFIG_pn-qemu-native = "sdl"
+PACKAGECONFIG_pn-nativesdk-qemu = "sdl"
 ASSUME_PROVIDED += "libsdl-native"
 
 
-- 
1.8.3.1


