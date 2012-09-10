Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TB3Dd-0002Ks-Fv
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 14:36:01 +0200
Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 10 Sep 2012 05:23:23 -0700
Received: by wibhm2 with SMTP id hm2so1610624wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 05:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=4GJPlvfY4tEaNfk2m4FTMDLdYeEE2ibuL3hxqpfQfgI=;
	b=Os9oTMDEU+5pGSMUZjo4ud3TyEK8JF7O2T3BBFFrkCOBHW/Da2B27re2PY3+OcrN9P
	6UG0sOPyYf7FdMb2FWv6JR5DTRZpJWmlHN+ECGKosvtW1VJcrr8NeGi7jtRoWa5jfc1m
	F+qvg46WpV3pqvTWUROz0XOnnXU0KzlOeVu/6PE7yL9mnsVFzqr2Ss9lR9cb3T/ZwAik
	hpO2oiHVZDlbzPRpYbqJu5uLxiLzwvptRt0RPZ+8Bi95pcOImgIufu+Qdic8222cSPoR
	O3LU09+Gch/RQiT1E+Ay0+aMMScd4W0xEgAMUpZ2BP4vR+S+fqJqFgDdPS3s42EhcJ72
	qezg==
Received: by 10.216.194.39 with SMTP id l39mr90994wen.131.1347279808836;
	Mon, 10 Sep 2012 05:23:28 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id el6sm16952093wib.8.2012.09.10.05.23.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 05:23:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2012 13:22:36 +0100
Message-Id: <1347279756-6624-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlVKTKzLxy77f6pNvGMR3kKu3U8sm9mTV3XizdNGGrpPnnSMM7VJguOk9uIimES3G4oyab/
Subject: [PATCH] packagegroup-core-x11-xserver: remove redundant PACKAGES statement
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
X-List-Received-Date: Mon, 10 Sep 2012 12:36:01 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../packagegroups/packagegroup-core-x11-xserver.bb                 |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
index bf39e63..fd6ed42 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
@@ -3,14 +3,12 @@
 #
 
 LICENSE = "MIT"
-PR = "r38"
+PR = "r39"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PACKAGES = "${PN}"
-
 XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
 
 SUMMARY_${PN} = "X11 display server"
-- 
1.7.10



