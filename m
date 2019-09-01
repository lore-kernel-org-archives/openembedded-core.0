Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 00F107F421
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:31 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id y9so7380418pfl.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hnT581ksGjvHz3tiL++Grc54cuBUBtoclFnz+7uX0dY=;
	b=qOoxvYaGtTxlMHWDSDgGp5bc/NHz1uZ6ZFs8f7O7lU8cHaBU+/zukY/mxNrkE5VDxe
	og94TeHwkvKdZnkkupt05MM+gapZlnjLDxXuDX/dbvjOrfmKQzH4O7GHOSznGwLSwc+i
	sPD4udxeaGlxWI+wTEqOea0eDmtdnBpKOznETmCTaf5tzEdQlCkxtELFNa6SknoRQ6la
	6ccF4U2H4EJLaJ0qjwk/2NImhr1w9SBb5+Aj2eGqKCCT7goR7xDE5EjFSSzJ2iQh5N2Y
	oTUUpN/DzNg/RvgDkY7O2OQMRW/YuBJuTbyENAmG0XSUcydNqTsGbitPmBCETYrLrH2z
	gwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hnT581ksGjvHz3tiL++Grc54cuBUBtoclFnz+7uX0dY=;
	b=aqJCYMcmhBzaMdYxXXsJCa2Vm/YM6qZBbNhgeEd+xmQQFAUQ9i0VoZ7xlCMJRLRvDe
	teZfK/+HMMTG10DT4PkH32uW5poiiPW0bXh7OJr3g9oumniu92lw5Dv4zekLiwRU9QGk
	7evyacIFxQbk5mqTiEFCWl75ua4k8JfRyWokjTzQhOzp50MI0OblTv0pxTcgjuOrYamn
	IjRkzVXZKDJXIwP8niGvwXVg+KYHm4M8oCDIgdxBh3xBdNOLxSmj2N+9ooX6GLxpQUGN
	0ZWSpBQ/4G1zYjAlE4DdxDjVlKl5m6dSPbo7Wkjxgs2EomFpOHDgQB85s2vOdTlDZaXE
	uiZg==
X-Gm-Message-State: APjAAAXMQNgxiXYfLOvpJLmV2AsU5cHK7dddaKhQ7ZxIhzuT8Gv5HhKd
	y19/KLaZbB1NCjvgM2C9eyIpWL7G
X-Google-Smtp-Source: APXvYqxFb02lOwJvP45SxA9Bi9zuO4XDKMKtqEmTTxJdEuklhPac/B1s4a4YrD8V9V5FV780vfAXGQ==
X-Received: by 2002:a17:90a:3462:: with SMTP id
	o89mr3850970pjb.2.1567348592859; 
	Sun, 01 Sep 2019 07:36:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:35:46 -0700
Message-Id: <d449e28bb9d7749e0abd759086b5f58d68af0ab4.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 08/43] tiff: fix CVE-2019-6128
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:32 -0000

From: Ross Burton <ross.burton@intel.com>

(From OE-Core rev: 7293e417dd9bdd04fe0fec177a76c9286234ed46)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libtiff/tiff/CVE-2019-6128.patch               | 52 ++++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.10.bb     |  2 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch
new file mode 100644
index 0000000..6f1fd4d
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch
@@ -0,0 +1,52 @@
+CVE: CVE-2019-6128
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 0c74a9f49b8d7a36b17b54a7428b3526d20f88a8 Mon Sep 17 00:00:00 2001
+From: Scott Gayou <github.scott@gmail.com>
+Date: Wed, 23 Jan 2019 15:03:53 -0500
+Subject: [PATCH] Fix for simple memory leak that was assigned CVE-2019-6128.
+
+pal2rgb failed to free memory on a few errors. This was reported
+here: http://bugzilla.maptools.org/show_bug.cgi?id=2836.
+---
+ tools/pal2rgb.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/tools/pal2rgb.c b/tools/pal2rgb.c
+index 01d8502ec..9492f1cf1 100644
+--- a/tools/pal2rgb.c
++++ b/tools/pal2rgb.c
+@@ -118,12 +118,14 @@ main(int argc, char* argv[])
+ 	    shortv != PHOTOMETRIC_PALETTE) {
+ 		fprintf(stderr, "%s: Expecting a palette image.\n",
+ 		    argv[optind]);
++		(void) TIFFClose(in);
+ 		return (-1);
+ 	}
+ 	if (!TIFFGetField(in, TIFFTAG_COLORMAP, &rmap, &gmap, &bmap)) {
+ 		fprintf(stderr,
+ 		    "%s: No colormap (not a valid palette image).\n",
+ 		    argv[optind]);
++		(void) TIFFClose(in);
+ 		return (-1);
+ 	}
+ 	bitspersample = 0;
+@@ -131,11 +133,14 @@ main(int argc, char* argv[])
+ 	if (bitspersample != 8) {
+ 		fprintf(stderr, "%s: Sorry, can only handle 8-bit images.\n",
+ 		    argv[optind]);
++		(void) TIFFClose(in);
+ 		return (-1);
+ 	}
+ 	out = TIFFOpen(argv[optind+1], "w");
+-	if (out == NULL)
++	if (out == NULL) {
++		(void) TIFFClose(in);
+ 		return (-2);
++	}
+ 	cpTags(in, out);
+ 	TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &imagewidth);
+ 	TIFFGetField(in, TIFFTAG_IMAGELENGTH, &imagelength);
+-- 
+2.21.0
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
index 152fa81..a82d744 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
@@ -6,8 +6,8 @@ CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
+           file://CVE-2019-6128.patch"
            "
-
 SRC_URI[md5sum] = "114192d7ebe537912a2b97408832e7fd"
 SRC_URI[sha256sum] = "2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4"
 
-- 
2.7.4


