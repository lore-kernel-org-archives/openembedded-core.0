Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3D49A6EFC4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 22:51:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Mar 2014 14:51:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,588,1389772800"; d="scan'208";a="492416817"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.227])
	by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2014 14:51:09 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Mar 2014 14:51:03 -0800
Message-Id: <fbf82d4d5ea79392747eaeaeabb6c2142f08d5c6.1393973357.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <c8001854a355061a1c36a51eced9f72f2ce294d3.1393973357.git.sgw@linux.intel.com>
References: <c8001854a355061a1c36a51eced9f72f2ce294d3.1393973357.git.sgw@linux.intel.com>
In-Reply-To: <cover.1393973357.git.sgw@linux.intel.com>
References: <cover.1393973357.git.sgw@linux.intel.com>
Subject: [PATCH 6/6] security_flags: Update to correctly link X modules
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
X-List-Received-Date: Tue, 04 Mar 2014 22:51:09 -0000

Remove the -z,now flag from linking

[YOCTO #5885]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/include/security_flags.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index a871a3f..fa604fd 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -1,6 +1,7 @@
 SECURITY_CFLAGS ?= "-fstack-protector-all -pie -fpie -D_FORTIFY_SOURCE=2"
 SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-all -D_FORTIFY_SOURCE=2"
 SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
+SECURITY_X_LDFLAGS ?= "-Wl,-z,relro"
 
 # powerpc does not get on with pie for reasons not looked into as yet
 SECURITY_CFLAGS_powerpc = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
@@ -72,3 +73,11 @@ SECURITY_CFLAGS_pn-pulseaudio = "${SECURITY_NO_PIE_CFLAGS}"
 
 TARGET_CFLAGS_append = " ${SECURITY_CFLAGS}"
 TARGET_LDFLAGS_append = " ${SECURITY_LDFLAGS}"
+
+SECURITY_LDFLAGS_pn-xf86-video-fbdev = "${SECURITY_X_LDFLAGS}"
+SECURITY_LDFLAGS_pn-xf86-video-intel = "${SECURITY_X_LDFLAGS}"
+SECURITY_LDFLAGS_pn-xf86-video-omapfb = "${SECURITY_X_LDFLAGS}"
+SECURITY_LDFLAGS_pn-xf86-video-omap = "${SECURITY_X_LDFLAGS}"
+SECURITY_LDFLAGS_pn-xf86-video-vesa = "${SECURITY_X_LDFLAGS}"
+SECURITY_LDFLAGS_pn-xf86-video-vmware = "${SECURITY_X_LDFLAGS}"
+SECURITY_LDFLAGS_pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
-- 
1.8.3.1


