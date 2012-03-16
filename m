Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LFC-0001RC-V3
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:42:11 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121477976"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 17:32:40 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:16 +0800
Message-Id: <37498c0a268fb066186e7a81af11c197fdf2cd21.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 19/60] gst-plugins-bad: upgrade to 0.10.23
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
X-List-Received-Date: Fri, 16 Mar 2012 00:42:11 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 ...s-bad_0.10.22.bb => gst-plugins-bad_0.10.23.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-bad_0.10.22.bb => gst-plugins-bad_0.10.23.bb} (85%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
similarity index 85%
rename from meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
rename to meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index b99d453..ad0f7c9 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS += "gst-plugins-base libmusicbrainz tremor librsvg"
 
-PR = "r2"
+PR = "r0"
 
 inherit gettext
 
@@ -22,5 +22,5 @@ do_configure_prepend() {
 	rm ${S}/m4/lib-link.m4 || true
 }
 
-SRC_URI[md5sum] = "9a2acee1f386f71247003d0d7090fb1c"
-SRC_URI[sha256sum] = "d8f7102f43ffea076646427115ffdccb3975954f1e9367bd304f7ee01e12070c"
+SRC_URI[md5sum] = "fcb09798114461955260e4d940db5987"
+SRC_URI[sha256sum] = "0eae7d1a1357ae8377fded6a1b42e663887beabe0e6cc336e2ef9ada42e11491"
-- 
1.7.6



