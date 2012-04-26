Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SNOar-00079H-5g for openembedded-core@lists.openembedded.org;
	Thu, 26 Apr 2012 15:18:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3QD98Xi003234
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 14:09:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02847-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 14:09:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3QD8tC0003221
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 14:08:56 +0100
Message-ID: <1335445736.20130.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Apr 2012 14:08:56 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: xf86-video-vesa: Add recommendation for xserver libint10 module which this driver needs
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
X-List-Received-Date: Thu, 26 Apr 2012 13:18:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without this module, the driver doesn't work correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.0.bb
index 30e3dee..f0c0167 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.0.bb
@@ -11,12 +11,14 @@ can drive most VESA-compatible video cards, but only makes use of the \
 basic standard VESA core that is common to these cards. The driver \
 supports depths 8, 15 16 and 24."
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
 	    virtual/libgl xineramaproto xf86driproto libpciaccess"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
+RRECOMMENDS_${PN} += "xserver-xorg-module-libint10"
+
 SRC_URI[md5sum] = "07fa32958aff9b463dd3af5481ef6626"
 SRC_URI[sha256sum] = "8ed85a0e94523539d81d5ae6639fa22ceb1c1e3baf89128915db65d4d2900d7a"





