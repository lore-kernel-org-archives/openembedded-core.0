Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQxWI-0003LS-CU
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 11:45:02 +0200
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 24 Oct 2012 02:31:33 -0700
Received: by mail-bk0-f69.google.com with SMTP id jg15so219820bkc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 02:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=I8mIfiB9J8Y76b7+vOBAyrzGCtPMpLYoyXODeyQyk0Y=;
	b=c0DAq4rNV7M28a4CPP9eZHHrovSUppjBQEBv5HuY1URGZjl9U2wg8GCbZGX7pXc/FA
	+INjs0JPCQO+NX5uT9mcrJ9WQ3BvwrSTHuNdDPP1DPqTAicZsWmRydsteJclLyxt2lOM
	4t3Tiwa/izvXlCX0NVb6TS/LKuFbiIXtZl9qKRV1K/5EC8iuBc0a3i7Ikeoczx9lXS7v
	ylv/A89WxITSqdIuehVeFtJS02aRm4uPVAZRXQTjuHxnqAK3hwirTx+UICcd9l9M014F
	omvNtMazO/t1qdw0GxMURmM45WhMv6/2SWBWrKD+vm8JabOORYxWvU6SRcQfJZ1MEUNO
	YsCw==
Received: by 10.180.100.35 with SMTP id ev3mr1064736wib.7.1351071091579;
	Wed, 24 Oct 2012 02:31:31 -0700 (PDT)
Received: by 10.180.100.35 with SMTP id ev3mr1064714wib.7.1351071091365;
	Wed, 24 Oct 2012 02:31:31 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ei1sm3896253wid.7.2012.10.24.02.31.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 02:31:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2012 10:30:18 +0100
Message-Id: <1351071018-22570-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmculOmVQXCbVd66ueyz7z38w8ikFqjlDjhmYeo6uydCIUOxO5bmHmre6xm+V3U6vKD7DJzTXgG49WZ6XC2g4QQ1LK48HvKyx7OJcFg2xe0ilc9mo4jFUBcN2QcBviUITPLKkcEDFVjX4zvnKjrL4OUsLodyIvYhKtSSuDPa2M1yDHdUMn2RG6j+ejBAVBEdXwNoI6D
Subject: [PATCH] gst-plugins-good: disable taglib explicitly
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
X-List-Received-Date: Wed, 24 Oct 2012 09:45:02 -0000

This was being detected automatically so the build wasn't deterministic.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index b845371..59bde5b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=622921ffad8cb18ab906c56052788a3f \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
-PR = "r6"
+PR = "r7"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
@@ -18,7 +18,7 @@ inherit gettext gconf
 SRC_URI += "file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch"
 
 EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal --without-check \
-                 --disable-orc --disable-examples"
+                 --disable-orc --disable-examples --disable-taglib"
 
 do_configure_prepend() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-- 
1.7.10



