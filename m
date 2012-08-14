Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dasty82@gmail.com>) id 1T1Mym-0002nN-T2
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 21:40:40 +0200
Received: by weyr6 with SMTP id r6so542925wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 12:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=pf8k7Ic65nPSSDn0+sYO3psb8GOR3q0Khml8gbBcn5Q=;
	b=IJq8FNFj/W9t7Ld/Tj8ea5ulOck7z0Sm8b5kxxU7//3hVUBX35PF/MeMaoNl6ts5nL
	ZIlj/k8LmvRHNcBtb+Ym2K05951Nw5D9D3GloE+FZ/HnvHe6jYpnBRBtotMnw9p6KxXm
	pg7kW3fylppKx1G37RVNTRsQ2eWvNf9i/kuXfhU+i7VLQkL+RlPFu7qEtdcML/6lNW+8
	f7o5t/fdSrwtyc4/BI+mDTtimG4usYw/48+8hC2tpDfjNAxk7WerjWTCTxmQqp1isJri
	2FbcF3w+rUa9kxqUuYEY9Vds+2Wq+qAx0qK7fqIcLHqA2wlc2S/ORomyNuRig0JVPFUO
	DpFw==
Received: by 10.180.105.163 with SMTP id gn3mr30449837wib.2.1344972525754;
	Tue, 14 Aug 2012 12:28:45 -0700 (PDT)
Received: from localhost.localdomain
	(83-64-248-68.inzersdorf.xdsl-line.inode.at. [83.64.248.68])
	by mx.google.com with ESMTPS id fu8sm24048789wib.5.2012.08.14.12.28.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Aug 2012 12:28:44 -0700 (PDT)
Sender: Radek Dostal <dasty82@gmail.com>
From: Radek Dostal <rd@radekdostal.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 21:26:43 +0200
Message-Id: <1344972403-26049-1-git-send-email-rd@radekdostal.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Radek Dostal <rd@radekdostal.com>
Subject: [PATCH] gst-plugins-base: remove avahi from DEPENDS
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
X-List-Received-Date: Tue, 14 Aug 2012 19:40:40 -0000

avahi is no longer required as gnome_vfs is disabled

Signed-off-by: Radek Dostal <rd@radekdostal.com>
---
 .../gstreamer/gst-plugins-base_0.10.36.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
index da4a726..99f28e9 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
 
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv', '', d)}"
-DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora avahi util-linux tremor"
+DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora util-linux tremor"
 
 SRC_URI += "file://gst-plugins-base-tremor.patch \
             file://configure.ac-fix-subparse-plugin.patch"
@@ -15,7 +15,7 @@ SRC_URI += "file://gst-plugins-base-tremor.patch \
 SRC_URI[md5sum] = "776c73883e567f67b9c4a2847d8d041a"
 SRC_URI[sha256sum] = "2cd3b0fa8e9b595db8f514ef7c2bdbcd639a0d63d154c00f8c9b609321f49976"
 
-PR = "r3"
+PR = "r4"
 
 inherit gettext
 
-- 
1.7.5.4



