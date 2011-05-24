Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QOu83-0003tE-V7
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 18:06:44 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 May 2011 09:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,261,1304319600"; 
   d="scan'208";a="7845611"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2011 09:03:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2011 09:02:52 -0700
Message-Id: <bfeba6a42f4de99a543f1eaa21ddcfde6dc34338.1306219274.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306219274.git.sgw@linux.intel.com>
References: <cover.1306219274.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306219274.git.sgw@linux.intel.com>
References: <cover.1306219274.git.sgw@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [Consolidated Pull 05/12] pulseaudio: package udev rules
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2011 16:06:44 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 .../pulseaudio/pulseaudio_0.9.15.bb                |    2 +-
 .../pulseaudio/pulseaudio_0.9.22.bb                |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 78d790f..e46b716 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -69,7 +69,7 @@ FILES_${PN}-dev += "${libdir}/pulse-${PV}/modules/*.la"
 FILES_${PN}-conf = "${sysconfdir}"
 FILES_${PN}-bin = "${bindir}/* \
                    ${sysconfdir}/default/volatiles/volatiles.04_pulse"
-FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl"
+FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl ${base_libdir}/udev/rules.d/*.rules"
 FILES_${PN}-gconf-helper = "${libexecdir}/pulse/gconf-helper"
 FILES_${PN}-misc = "${bindir}/*"
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.15.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.15.bb
index 7bac9f9..71e19e9 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.15.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.15.bb
@@ -1,7 +1,7 @@
 require pulseaudio.inc
 
 DEPENDS += "dbus gdbm speex"
-PR = "r14"
+PR = "r15"
 
 SRC_URI += "\
   file://buildfix.patch;patch=1 \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
index 91893d7..863beda 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS += "gdbm speex"
 
-- 
1.7.3.4



