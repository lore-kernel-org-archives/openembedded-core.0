Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stashluk@gmail.com>) id 1TymGU-0006QN-8q
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 17:36:37 +0100
Received: by mail-vb0-f47.google.com with SMTP id e21so391242vbm.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 08:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=gOQ1dPgYVjI0YNlFkVoxsEP6af95hadZ+/1tQXehA0c=;
	b=0SuqROZ/WYC/hTJPv0lZt4PunKsqZowyhEjERsGi/+w/pU32686UZGUvNCUPqjcaGX
	kVlFdyIfyB9DokkPNrcmVSP6/AgmHe1crcVyO/Yl3PIR/D9Bq+VLU566uwXcpUHksjt4
	Xns0zj542h+4YcY+22sSUvc9eDSjIsV+jgO9VB6V+iWYXmtieKI7srYurl+/eu6yE69V
	r5sqHrxuoJe+w3d+w/B8vil/1J8VxmonISMijbNDM2C7UAH4yuH2/ARwXbWVW0OghzmY
	xpjeulO5spkMj3Dz8TqvxsdnMEZPEe1tdajUQiDYaxwcCu6QlJXfOeVmj+ySxCoKn+rD
	ajog==
X-Received: by 10.52.95.203 with SMTP id dm11mr5660818vdb.112.1359130855416;
	Fri, 25 Jan 2013 08:20:55 -0800 (PST)
Received: from jstashluk2.deka.local ([208.65.175.197])
	by mx.google.com with ESMTPS id j5sm708903vdi.19.2013.01.25.08.20.54
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 08:20:55 -0800 (PST)
From: Jeremy Stashluk <stashluk@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 11:20:42 -0500
Message-Id: <1359130842-21997-1-git-send-email-jstashluk@dekaresearch.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Jeremy Stashluk <jstashluk@dekaresearch.com>
Subject: [PATCH v4] gst-plugins-gl: add package recipe
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
X-List-Received-Date: Fri, 25 Jan 2013 16:36:45 -0000

---
 .../gstreamer/gst-plugins-gl_0.10.3.bb             |   11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
new file mode 100644
index 0000000..3d5934c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
@@ -0,0 +1,11 @@
+require recipes-multimedia/gstreamer/gst-plugins.inc
+
+LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
+LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+DEPENDS += "gst-plugins-base virtual/libgl"
+
+SRC_URI[md5sum] = "ac70ede13f79978d56eaed8abaa3c938"
+SRC_URI[sha256sum] = "48340b6a4b8abce16344a7bc33e74a94fdcce4f57ef6342cdf2f941c429bf210"
+
+inherit gettext gconf
-- 
1.7.9.5



