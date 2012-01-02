Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Rhngl-0001SR-Uu
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 20:36:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Jan 2012 11:29:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="93685220"
Received: from unknown (HELO localhost) ([10.255.13.35])
	by orsmga002.jf.intel.com with ESMTP; 02 Jan 2012 11:29:32 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	sgw@linux.intel.com
Date: Mon,  2 Jan 2012 13:29:27 -0600
Message-Id: <a3e699470bceb6d2b274e396fef1b92a5d263c18.1325526807.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <6f382ab47a126d96637ba3581f11bf1f2093b5a0.1325526807.git.tom.zanussi@intel.com>
References: <6f382ab47a126d96637ba3581f11bf1f2093b5a0.1325526807.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1325526807.git.tom.zanussi@intel.com>
References: <cover.1325526807.git.tom.zanussi@intel.com>
Subject: [PATCH 4/5] default-distrovars.inc: remove COMMERCIAL_LICENSE et al
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
X-List-Received-Date: Mon, 02 Jan 2012 19:36:57 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

The global COMMERCIAL_LICENSE mechanism has been obsoleted by
per-recipe LICENSE_FLAGS, so remove the related variables.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/conf/distro/include/default-distrovars.inc |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index e1594f3..16b3108 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -26,11 +26,6 @@ HOSTTOOLS_WHITELIST_GPLv3 ?= ""
 WHITELIST_GPLv3 ?= "less"
 LGPLv2_WHITELIST_GPLv3 ?= "libassuan gnutls libtasn1 libidn libgcc gcc-runtime" 
 
-# This is a list of packages that require a commercial license to ship
-# product. If shipped as part of an image these packages may have 
-# implications so they are disabled by default
-COMMERCIAL_LICENSE ?= "lame gst-fluendo-mp3 libmad mpeg2dec ffmpeg qmmp ${COMMERCIAL_LICENSE_DEPENDEES}"
-COMMERCIAL_LICENSE_DEPENDEES ?= "gst-plugins-ugly libomxil gst-openmax"
 COMMERCIAL_AUDIO_PLUGINS ?= ""
 # COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad gst-plugins-ugly-mpegaudioparse"
 COMMERCIAL_VIDEO_PLUGINS ?= ""
-- 
1.7.0.4



