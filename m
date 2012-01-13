Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RlZed-0004cw-Nc
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 06:26:19 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jan 2012 21:18:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106678129"
Received: from unknown (HELO localhost) ([10.255.13.225])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2012 21:18:48 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2012 23:18:11 -0600
Message-Id: <50de946696c8a5722d7552571c1162a3d8d95f76.1326431435.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1c27c9814d62adcde5540d6cbbdab5e0417a484c.1326431435.git.tom.zanussi@intel.com>
References: <1c27c9814d62adcde5540d6cbbdab5e0417a484c.1326431435.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1326431435.git.tom.zanussi@intel.com>
References: <cover.1326431435.git.tom.zanussi@intel.com>
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
X-List-Received-Date: Fri, 13 Jan 2012 05:26:20 -0000

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



