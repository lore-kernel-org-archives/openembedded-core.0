Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1136B159
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 15:23:04 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Jul 2013 08:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1028,1363158000"; d="scan'208";a="328787198"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.85])
	by azsmga001.ch.intel.com with ESMTP; 09 Jul 2013 08:23:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2013 08:23:05 -0700
Message-Id: <1373383385-14099-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH v2] security_flags: Add addition recipes to the non pie list
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
X-List-Received-Date: Tue, 09 Jul 2013 15:23:05 -0000

Create a local SECURITY_NO_PIE_CFLAGS to cover the recipes that have
issues with with pic and pie cflags set.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/include/security_flags.inc | 45 +++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 72dd1ad..2858e46 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -1,26 +1,47 @@
 SECURITY_CFLAGS ?= "-fstack-protector-all -pie -fpie -D_FORTIFY_SOURCE=2"
+SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-all -D_FORTIFY_SOURCE=2"
 SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
 
+SECURITY_CFLAGS_pn-aspell = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-beecrypt = "${SECURITY_NO_PIE_CFLAGS}"
 # Curl seems to check for FORTIFY_SOURCE in CFLAGS, but even assigned
 # to CPPFLAGS it gets picked into CFLAGS in bitbake.
 #TARGET_CPPFLAGS_pn-curl += "-D_FORTIFY_SOURCE=2"
 SECURITY_CFLAGS_pn-curl = "-fstack-protector-all -pie -fpie"
-SECURITY_CFLAGS_pn-ppp = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
+SECURITY_CFLAGS_pn-directfb = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-eglibc = ""
 SECURITY_CFLAGS_pn-eglibc-initial = ""
-SECURITY_CFLAGS_pn-zlib = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
-SECURITY_CFLAGS_pn-gcc-runtime = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
-SECURITY_CFLAGS_pn-libgcc = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
-SECURITY_CFLAGS_pn-tcl = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
-SECURITY_CFLAGS_pn-libcap = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
-SECURITY_CFLAGS_pn-python-smartpm = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
-SECURITY_CFLAGS_pn-python-imaging = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
-SECURITY_CFLAGS_pn-python-pycurl = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
-SECURITY_CFLAGS_pn-kexec-tools = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
+SECURITY_CFLAGS_pn-enchant = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-flac = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-gcc-runtime = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-gdb = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-gmp = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-gnutls = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-grub = ""
+SECURITY_CFLAGS_pn-gst-plugins-bad = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-gst-plugins-gl = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-gstreamer1.0-plugins-good = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-harfbuzz = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-kexec-tools = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libcap = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libgcc = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libglu = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libpcre = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-mesa = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-opensp = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-ppp = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-python = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-python-imaging = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-python-pycurl = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-python-smartpm = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-tcl = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-tiff = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-webkit-gtk = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
 
 # These 2 have text relco errors with the pie options enabled
-SECURITY_CFLAGS_pn-pulseaudio = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
-SECURITY_CFLAGS_pn-ltp = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
+SECURITY_CFLAGS_pn-ltp = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-pulseaudio = "${SECURITY_NO_PIE_CFLAGS}"
 
 TARGET_CFLAGS_append = " ${SECURITY_CFLAGS}"
 TARGET_LDFLAGS_append = " ${SECURITY_LDFLAGS}"
-- 
1.8.1.4


