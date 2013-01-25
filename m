Received: from mail-vb0-f45.google.com ([209.85.212.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stashluk@gmail.com>) id 1TymiV-0007pw-RG
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 18:05:28 +0100
Received: by mail-vb0-f45.google.com with SMTP id p1so423616vbi.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 08:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=AQZDga3bMiAaKUNXMPpvPKTMc5dh+5fj7EUcUpKBZ/E=;
	b=nX0CrrzvbIQ+0aE49dX2Pu3MowDnA3orRlVw3JU2uSLVEFk4pd9rx7QZAZKJnQDk7Q
	7ugDF67sQQr4tqSY8ZhyH0A8dhRBCRrwd8kotIF49XMG1sdDTOg0n075JS/cAoArfxG9
	cV2LnJ1RtfPgOMcpfvmPNZU34lgPY1hldHxtBNYk3do0RKmLhoD9abZkqhkmDuo6Xksl
	9NlU6sZ6ryjB7M8r2bq0QTJOzD/xIxYQCWCStobAuG726YrZYy6J5WczeJ++kt++Pw8j
	F8xT8QB7NpRLZUZNlo8ir3Lho04Ha4nGLO+jCbvYCyUaPioiMudYbpO+MCa7761Hcyhn
	UaUA==
X-Received: by 10.52.76.170 with SMTP id l10mr5838309vdw.83.1359132592954;
	Fri, 25 Jan 2013 08:49:52 -0800 (PST)
Received: from jstashluk2.deka.local ([208.65.175.197])
	by mx.google.com with ESMTPS id j16sm758331vdh.6.2013.01.25.08.49.52
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 08:49:52 -0800 (PST)
From: Jeremy Stashluk <stashluk@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 11:49:45 -0500
Message-Id: <1359132585-31911-1-git-send-email-jstashluk@dekaresearch.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Jeremy Stashluk <jstashluk@dekaresearch.com>
Subject: [PATCH v5] gst-plugins-gl: add package recipe
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
X-List-Received-Date: Fri, 25 Jan 2013 17:05:28 -0000

Signed-off-by: Jeremy Stashluk <jstashluk@dekaresearch.com>
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



