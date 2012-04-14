Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SJ0eb-00006F-V7
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 12:56:30 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Apr 2012 03:47:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="89010316"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Apr 2012 03:47:06 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Apr 2012 18:44:14 +0800
Message-Id: <7a59efe236b3ebd7472ce95bf75b9b5a27ba656c.1334400035.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1334400035.git.dongxiao.xu@intel.com>
References: <cover.1334400035.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1334400035.git.dongxiao.xu@intel.com>
References: <cover.1334400035.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] gst-plugins-bad: add curl as build dependency
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
X-List-Received-Date: Sat, 14 Apr 2012 10:56:30 -0000

gst-plugins-bad needs curl.h to finish its build, so add curl as its
dependency.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../gstreamer/gst-plugins-bad_0.10.23.bb           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index 656b61e..fbe1709 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=71a904d99ce7ae0c1cf129891b98145c"
 
-DEPENDS += "gst-plugins-base libmusicbrainz tremor librsvg"
+DEPENDS += "gst-plugins-base libmusicbrainz tremor librsvg curl"
 
 PR = "r1"
 
-- 
1.7.4.1



