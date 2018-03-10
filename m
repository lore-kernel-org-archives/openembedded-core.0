Return-Path: <california.l.sullivan@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 90E5F6011B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 00:23:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 16:23:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,448,1515484800"; d="scan'208";a="24403674"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga006.jf.intel.com with ESMTP; 09 Mar 2018 16:23:48 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 16:23:46 -0800
Message-Id: <20180310002346.6086-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] x86-base.inc: use xf86-video-modesettings as default xserver
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
X-List-Received-Date: Sat, 10 Mar 2018 00:23:47 -0000

Most distros have switched to this, and we're seeing better results in
some areas as well. E.g., on a NUC6CAYS the x11perf -aa10text and
-rgb10text results see a 20x increase.

[YOCTO #12019].
[YOCTO #12590].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/conf/machine/include/x86-base.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index f8aacea64cc..e6bfdc6f770 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -34,11 +34,11 @@ XSERVER_X86_EXT = " \
            xserver-xorg-module-libint10 \
            "
 
-XSERVER_X86_I915 = "xf86-video-intel \
+XSERVER_X86_I915 = "xf86-video-modesetting \
            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-i915', '', d)} \
            "
 
-XSERVER_X86_I965 = "xf86-video-intel \
+XSERVER_X86_I965 = "xf86-video-modesetting \
            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-i965', '', d)} \
            "
 
-- 
2.14.3


