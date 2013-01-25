Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stashluk@gmail.com>) id 1TylaR-0004Dh-Eu
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 16:53:03 +0100
Received: by mail-vc0-f175.google.com with SMTP id fw7so356753vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 07:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=mSplcyOVVRaIOBUBE2RU8dBs9UXYeymW0FaqAqvckgQ=;
	b=YWzjEUWiLxyoUr7Ya/EjyZApAReQF6dPmmd9JhqOIdpV7ncQnvv+/m7w8dyhHIfbSV
	/OCrP1WyNguNlUKmXoo9+6ectvc+Gyebg42YwUXn/9O7lkUCoRo4VLSB47lmwnS/sCjv
	YrsBf9n3UlfrTb5t0OmUCN3PlpacsOUdIssK01zmDZExz8LvEQ7p2KOC+yLa3A1lzxVY
	vlIoiJgJOYyCBjrtKMWKNS4nVfo/RKFm/VrOnEgGIs09zCn69fRLBTqqlJhHNxA4ikKx
	hCiRGTQa+CWLpmIa1DGTXidxwVRTll/f55fsi97tmgsNki1V+0CWqQQLQeKXJP3Kacgm
	rKXA==
X-Received: by 10.220.215.73 with SMTP id hd9mr4699482vcb.19.1359128248602;
	Fri, 25 Jan 2013 07:37:28 -0800 (PST)
Received: from jstashluk2.deka.local ([208.65.175.197])
	by mx.google.com with ESMTPS id n10sm651776vde.9.2013.01.25.07.37.26
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 07:37:26 -0800 (PST)
From: Jeremy Stashluk <stashluk@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 10:37:18 -0500
Message-Id: <1359128238-23401-1-git-send-email-jstashluk@dekaresearch.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Jeremy Stashluk <jstashluk@dekaresearch.com>
Subject: [PATCH] gst-plugins-gl: add package recipe
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
X-List-Received-Date: Fri, 25 Jan 2013 15:53:04 -0000

---
 .../gstreamer/gst-plugins-gl_0.10.3.bb             |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
new file mode 100644
index 0000000..3bafb7c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
@@ -0,0 +1,16 @@
+require recipes-multimedia/gstreamer/gst-plugins.inc
+
+LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
+LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+PR = "r2"
+
+DEPENDS += "gst-plugins-base virtual/libgl"
+
+SRC_URI[md5sum] = "f066943621e9e18dc4b8e27e869a39cf8893aec9"
+
+inherit gettext gconf
+
+ARM_INSTRUCTION_SET = "arm"
+
+FILES_${PN}-gconfelements += "${sysconfdir}/gconf/schemas/gstreamer-0.10.schemas"
-- 
1.7.9.5



