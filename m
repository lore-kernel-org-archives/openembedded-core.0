Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOF-0005aX-Ki
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:40 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351201"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:42:51 -0800
Message-Id: <145ee23ca5a9264735588cc10e013a48d41f640f.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 09/33] lame: update to 3.99.1
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
X-List-Received-Date: Thu, 10 Nov 2011 07:49:40 -0000

Updated lame.h checksum due to change of LGPL Lessor -> Library

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../lame/{lame-3.98.4 => lame}/no-gtk1.patch       |    0
 .../lame/{lame_3.98.4.bb => lame_3.99.1.bb}        |    6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/lame/{lame-3.98.4 => lame}/no-gtk1.patch (100%)
 rename meta/recipes-multimedia/lame/{lame_3.98.4.bb => lame_3.99.1.bb} (82%)

diff --git a/meta/recipes-multimedia/lame/lame-3.98.4/no-gtk1.patch b/meta/recipes-multimedia/lame/lame/no-gtk1.patch
similarity index 100%
rename from meta/recipes-multimedia/lame/lame-3.98.4/no-gtk1.patch
rename to meta/recipes-multimedia/lame/lame/no-gtk1.patch
diff --git a/meta/recipes-multimedia/lame/lame_3.98.4.bb b/meta/recipes-multimedia/lame/lame_3.99.1.bb
similarity index 82%
rename from meta/recipes-multimedia/lame/lame_3.98.4.bb
rename to meta/recipes-multimedia/lame/lame_3.99.1.bb
index 680ea48..31766fd 100644
--- a/meta/recipes-multimedia/lame/lame_3.98.4.bb
+++ b/meta/recipes-multimedia/lame/lame_3.99.1.bb
@@ -4,14 +4,14 @@ BUGTRACKER = "http://sourceforge.net/tracker/?group_id=290&atid=100290"
 SECTION = "console/utils"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9 \
-                    file://include/lame.h;beginline=1;endline=20;md5=d3ff8cae3e79c4e9da7169c7928dc3a2"
+                    file://include/lame.h;beginline=1;endline=20;md5=a2258182c593c398d15a48262130a92b
 PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lame/lame-${PV}.tar.gz \
            file://no-gtk1.patch"
 
-SRC_URI[md5sum] = "8e9866ad6b570c6c95c8cba48060473f"
-SRC_URI[sha256sum] = "ac3144c76617223a9be4aaa3e28a66b51bcab28141050c3af04cb06836f772c8"
+SRC_URI[md5sum] = "2576a7368b5c90a87adc9de6b9f0628c"
+SRC_URI[sha256sum] = "1eedcbe238f81cdef822f367f104a8ff918062727b61f0c62b24e9f79d941cf0"
 
 inherit autotools
 
-- 
1.7.6.4



