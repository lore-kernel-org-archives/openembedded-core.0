Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id DD07C7F317
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 15:32:39 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id g7so14403294wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 08:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=veZLHYEb1TMkiTpnwp6JCZIT4+v2XI9/jYKLn6KxxNQ=;
	b=Fnwv9fIRsy3Qf81Y3FtuakXTaY9L9eSVY2QMjcO3jp9GDgYhNKTZ9lRC9l9H/XsfvH
	Au80ruVEe+O/BSKA8hF4z3F3+YfSHxpm0E9zfEo3KSGYMpSPqQVSvPFTmfLubZ9cL9MW
	8qssPv3ByQF3SMrwONckwHlJ07tHhlrHdj0Tp0AmddPfD1g8J8SiM75klxzSRBR85K/5
	YCdOIO4O2tqc2azmYUwUxpcDKol7mjf3Yzk6KPK5BgigPrUxdlwB3GIDwmsYHxI3cUt5
	OspVGABJZ+j8nknPTToZGMQ7kkvzhF9lf8Wgt1oAN+fFb1avsMMDnJN1Ld6XjtDIWB/i
	I/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=veZLHYEb1TMkiTpnwp6JCZIT4+v2XI9/jYKLn6KxxNQ=;
	b=Qchz3vR7SNGQFFqbET4pBiAFFKqgCU3mAmWTW5wZpuHV+HL8PcMwNKX3pAsoIYea6o
	4sIjZf8bW//RZM7+hBqQnOwwk+GA+w8NC4lPr7iTxQHUOGrGRYLuBef2hBvu/YcgqfRP
	ZWsfHv5LN88W41DTc81/zRzztpXoALJlSEKDwtkIfVKq9bc1klCxa8cFlfcc+M5hExXX
	Zn0PFYQxllyluxS21rRzjTezz3zDgXD8/3giG0OwFIVra9n2SkkGpmpQr83Qa6siupMo
	VGzJYpkZQrSNO9SaZBRhTE/UVb3BLr1/bol5E+fDxqSsGNhSRGnvul9re8Cq2peLAoaW
	kxsw==
X-Gm-Message-State: APjAAAUgM2q+Xy/v6fkTaLbEXywmLpmAQEshHewDxKTKIj3MkhmbQj3y
	4W0b2AUSyrbIfP/ENshQPPPF0k7AGx8=
X-Google-Smtp-Source: APXvYqyl4RXmoWazIgRsqYrKBXg8QvB+nCejpJBNdwSGrgqYqpfP0xoJMnXZ3zo1v+AeRXQ1bp8gXw==
X-Received: by 2002:a5d:62c7:: with SMTP id o7mr19120575wrv.197.1568043160185; 
	Mon, 09 Sep 2019 08:32:40 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e4sm16653557wro.21.2019.09.09.08.32.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2019 08:32:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Sep 2019 16:32:36 +0100
Message-Id: <20190909153236.28042-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gstreamer1.0-libav: enable gtk-doc again
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Sep 2019 15:32:40 -0000
Content-Transfer-Encoding: 8bit

Remove the broken piece of the API documentation template so the documentation
can be generated again.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gstreamer1.0-libav/gtkdoc-no-tree.patch   | 24 +++++++++++++++++++
 .../gstreamer/gstreamer1.0-libav_1.16.0.bb    |  6 +----
 2 files changed, 25 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/gtkdoc-no-tree.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/gtkdoc-no-tree.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/gtkdoc-no-tree.patch
new file mode 100644
index 00000000000..5ea9232c265
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/gtkdoc-no-tree.patch
@@ -0,0 +1,24 @@
+gtk-doc can't find a type hierarchy when scanning gst-libav, and the new gtk-doc
+doesn't write a file if it will be empty. This results in the gtk-doc generation
+failing.
+
+This could be investigated further but upstream has moved away from gtk-doc, so
+in the next release this will be moot anyway.
+
+Upstream-Status: Inappropriate [upstream moved away from gtk-doc]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/docs/plugins/gst-libav-plugins-docs.sgml b/docs/plugins/gst-libav-plugins-docs.sgml
+index 75c68f4..f68d554 100644
+--- a/docs/plugins/gst-libav-plugins-docs.sgml
++++ b/docs/plugins/gst-libav-plugins-docs.sgml
+@@ -32,9 +32,4 @@
+     <title>gst-libav Plugins</title>
+     <xi:include href="xml/plugin-libav.xml" />
+   </chapter>
+-
+-  <chapter>
+-    <title>Object Hierarchy</title>
+-    <xi:include href="xml/tree_index.sgml" />
+-  </chapter>
+ </book>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb
index d94c3215dc4..d2629b506d7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz
            file://mips64_cpu_detection.patch \
            file://0001-configure-check-for-armv7ve-variant.patch \
            file://0001-fix-host-contamination.patch \
+           file://gtkdoc-no-tree.patch \
            "
 SRC_URI[md5sum] = "e3a201a45985ddc1327cd496046ca818"
 SRC_URI[sha256sum] = "dfac119043a9cfdcacd7acde77f674ab172cf2537b5812be52f49e9cddc53d9a"
@@ -28,11 +29,6 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base zlib bzip2 xz"
 
 inherit autotools pkgconfig upstream-version-is-even gtk-doc
 
-# Disable documentation for now as it is failing with gtk-doc 1.30:
-# gst-libav-plugins-docs.sgml:38: element include: XInclude error:
-# could not load xml/tree_index.sgml, and no fallback was found
-GTKDOC_ENABLED = "False"
-
 # CAUTION: Using the system libav is not recommended. Since the libav API is changing all the time,
 # compilation errors (and other, more subtle bugs) can happen. It is usually better to rely on the
 # libav copy included in the gst-libav package.
-- 
2.20.1


