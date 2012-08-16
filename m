Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T20fr-0000SJ-1o
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 16:03:48 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2012 06:50:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,778,1336374000"; d="scan'208";a="134986159"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2012 06:50:48 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2012 15:55:19 +0300
Message-Id: <1345121720-25925-6-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345121720-25925-1-git-send-email-constantinx.musca@intel.com>
References: <1345121720-25925-1-git-send-email-constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 5/6] pulseaudio: upgrade to 2.1
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
X-List-Received-Date: Thu, 16 Aug 2012 14:03:48 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../{pulseaudio_2.0.bb => pulseaudio_2.1.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_2.0.bb => pulseaudio_2.1.bb} (71%)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
similarity index 71%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb
rename to meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index 7e57e5e..a61e983 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.
   file://volatiles.04_pulse \
 "
 
-SRC_URI[md5sum] = "9bbde657c353fe675c3b693054175a8e"
-SRC_URI[sha256sum] = "28b42edd42f4879a6884af5f0ec11801ac001eb7582881215b36649aa37e2061"
+SRC_URI[md5sum] = "33e85023259d530f0a763d5204e8bad9"
+SRC_URI[sha256sum] = "ef6b347bf47abfb98080795f1583018ac959b4aeb4df916b879f9e1eaba0ca7f"
 
 do_compile_prepend() {
     cd ${S}
-- 
1.7.9.5



