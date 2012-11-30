Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TeZQd-0001oQ-D9
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 23:51:27 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Nov 2012 14:36:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,194,1355126400"; 
	d="scan'208,223";a="227386407"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.208])
	by orsmga001.jf.intel.com with ESMTP; 30 Nov 2012 14:37:07 -0800
Message-ID: <50B93513.4020209@linux.intel.com>
Date: Fri, 30 Nov 2012 14:37:07 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Danny - backport - gst-meta-base x11 fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 22:51:27 -0000
X-Groupsio-MsgNum: 32044
Content-Type: multipart/mixed; boundary="------------090900070908020309080303"

--------------090900070908020309080303
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Ross,

Since we have a fix in master (1.4) already for this, we should just 
backport it.

OE-Core: 6e44bf71fd4645ea09b3e34b907b17e92b5225e3
Poky: 115076c0d8fa0e9f100136b8f060e59d978c4fca

Thanks

-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System


--------------090900070908020309080303
Content-Type: text/x-patch;
 name="0001-gst-meta-base-include-ximagesink-plugin-when-x11-is-.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-gst-meta-base-include-ximagesink-plugin-when-x11-is-.pa";
 filename*1="tch"

From 115076c0d8fa0e9f100136b8f060e59d978c4fca Mon Sep 17 00:00:00 2001
From: Saul Wold <sgw@linux.intel.com>
Date: Wed, 24 Oct 2012 13:52:17 -0700
Subject: [PATCH] gst-meta-base: include ximagesink plugin when x11 is a
 feature

(From OE-Core rev: 6e44bf71fd4645ea09b3e34b907b17e92b5225e3)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
index 1788104..2fb39d5 100644
--- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
@@ -5,10 +5,11 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 
-PR = "r10"
+PR = "r11"
 
 PACKAGES = "\
     gst-meta-base \
+    gst-meta-x11-base \
     gst-meta-audio \
     gst-meta-debug \
     gst-meta-video"
@@ -23,7 +24,6 @@ RDEPENDS_gst-meta-base = "\
     gst-plugins-base-gio \
     gst-plugins-base-alsa \
     gst-plugins-base-volume \
-    gst-plugins-base-ximagesink \
     gst-plugins-base-audioconvert \
     gst-plugins-base-audioresample \
     gst-plugins-base-typefindfunctions \
@@ -32,6 +32,7 @@ RDEPENDS_gst-meta-base = "\
     gst-plugins-good-autodetect \
     gst-plugins-good-souphttpsrc"
 
+RDEPENDS_gst-meta-x11-base = "${@base_contains('DISTRO_FEATURES', 'x11', 'gst-plugins-base-ximagesink', '', d)}"
 
 RDEPENDS_gst-meta-audio = "\
     gst-meta-base \
-- 
1.8.0


--------------090900070908020309080303--
