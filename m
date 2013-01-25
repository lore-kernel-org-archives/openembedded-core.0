Received: from mail-vc0-f178.google.com ([209.85.220.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stashluk@gmail.com>) id 1Tym5z-0005tG-0x
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 17:25:40 +0100
Received: by mail-vc0-f178.google.com with SMTP id m8so386296vcd.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 08:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=MF4yjOIOTLgmvBYGgEwS6uLqm5oxDJlkztmpJgWi3I8=;
	b=n8pljTVbcR+dl5Qx+VRPDOfoELUFOZrK+8aNg9J+T+sulFXPMmUh5Ie0w9FJYCICiy
	vAGwxRU8zeygeJGGjVBkViiwunJk7yPmF5IqIjLzLvMnx+0CtV6svej57fbXzqLI4koG
	WrzEtenPGcWOa0B5qwwvRGVKbjA1/Ncd2kijLUCjgIv5s/99R/0bH9rHsHwDG0eTmmbU
	30NjPyia8C1aSxAALrPJ0UxBMalx/QdhUxDiKWi2V2XWF00fBfEjvmtLzFX3AnT3FuB/
	tN0kHU7/RyhXopx/kQ0EzT9qVgelN/uITVKmRZ5NyE9qt6iCJfnhJRof73lCQ9OPYfiI
	LTsw==
X-Received: by 10.220.150.84 with SMTP id x20mr6477439vcv.73.1359130203501;
	Fri, 25 Jan 2013 08:10:03 -0800 (PST)
Received: from jstashluk2.deka.local ([208.65.175.197])
	by mx.google.com with ESMTPS id kn18sm688135veb.5.2013.01.25.08.10.01
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 08:10:02 -0800 (PST)
From: Jeremy Stashluk <stashluk@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 11:09:53 -0500
Message-Id: <1359130193-10991-1-git-send-email-jstashluk@dekaresearch.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Jeremy Stashluk <jstashluk@dekaresearch.com>
Subject: [PATCH v3] gst-plugins-gl: add package recipe
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
X-List-Received-Date: Fri, 25 Jan 2013 16:25:43 -0000

---
 .../gstreamer/gst-plugins-gl_0.10.3.bb             |   12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
new file mode 100644
index 0000000..754efbe
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
@@ -0,0 +1,12 @@
+require recipes-multimedia/gstreamer/gst-plugins.inc
+
+LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
+LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+DEPENDS += "gst-plugins-base virtual/libgl"
+
+SRC_URI[md5sum] = "f066943621e9e18dc4b8e27e869a39cf8893aec9"
+
+inherit gettext gconf
+
+ARM_INSTRUCTION_SET = "arm"
-- 
1.7.9.5



