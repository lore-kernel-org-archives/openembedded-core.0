Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rhxr5-0004Kv-7s
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:15 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752140"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:47 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:04 -0800
Message-Id: <7cfab069b0d5f87057c7a25f6d936471eecc6c19.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 018/113] gst-plugins-bad: upgrade to 0.10.22
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:18 -0000

From: Shane Wang <shane.wang@intel.com>

This patch is to upgrade gst-plugins-bad to 0.10.22.
One of the license files is removed because the file doesn't exist any more.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 ...s-bad_0.10.21.bb => gst-plugins-bad_0.10.22.bb} |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-bad_0.10.21.bb => gst-plugins-bad_0.10.22.bb} (76%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
similarity index 76%
rename from meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb
rename to meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
index a7023e3..ec067b8 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
@@ -4,12 +4,11 @@ LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://gst/tta/filters.h;beginline=12;endline=29;md5=629b0c7a665d155a6677778f4460ec06 \
                     file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
-                    file://gst/qtmux/gstqtmuxmap.h;beginline=1;endline=19;md5=2da8f56a44697c1527c5a4bcf8d5d69b \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=71a904d99ce7ae0c1cf129891b98145c"
 
 DEPENDS += "gst-plugins-base libmusicbrainz tremor librsvg"
 
-PR = "r1"
+PR = "r0"
 
 inherit gettext
 
@@ -23,5 +22,5 @@ do_configure_prepend() {
 	rm ${S}/m4/lib-link.m4 || true
 }
 
-SRC_URI[md5sum] = "f501336ab1d18d2565f47c36ce653a82"
-SRC_URI[sha256sum] = "422badacbda37ac33cb446c6751dabcd0b223c308dbb01024a34ded682fa47e3"
+SRC_URI[md5sum] = "9a2acee1f386f71247003d0d7090fb1c"
+SRC_URI[sha256sum] = "d8f7102f43ffea076646427115ffdccb3975954f1e9367bd304f7ee01e12070c"
-- 
1.7.6.4



