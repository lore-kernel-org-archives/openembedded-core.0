Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id E21FF7E831
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:49:40 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id a3so337873pgm.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hnT581ksGjvHz3tiL++Grc54cuBUBtoclFnz+7uX0dY=;
	b=DU8mA2PaiTgH1hobqzp6ObXuBdFx2L1XcxSVuJK9iBPsROuR/gXad6lbmgElKeYfwo
	VcRzf+72IGjNGbYz9/A5koZvs+r+J0yCwuCP4pthDZZPF7jWeBNGfabfmaEiTgm+8825
	UtQI6alXj0TMEvJ3IgcnB5uriA+eghHKNagt8DYIBepOAmiu2myNLPdcLfl+i1GMTYcm
	RSktzUyqVTf+2awQYqe61ZtjMswRzaN09FtLUSX2Y2/XO6580k9tVbgdK1GI+JVEqpkj
	UGFkSC9Lg0JiweuPC5uitN2sRyEEi1CPQnUD8CnmBp+u6k+36MRcc8Tzl9Q19OT86PSV
	nqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hnT581ksGjvHz3tiL++Grc54cuBUBtoclFnz+7uX0dY=;
	b=AxqvwQXIJCQxgkLnL0cig8njYvDMKSe5Hkqe4UAUu7cyVe69l2cN640ODTgF4IqaUh
	mG5Wy5PUOn6fwk16WAEf43BWAggqDqrUOu6IlyCj8W73t3Xos/X34dUFI1Opq7MHn/SP
	JPyaY48E6eHmFCziRN5FWXEhHAJANcq1kUA+/LkC5AHKIIjqxZKi3QTba2Cmu7lIlXBP
	woBs+OHjq44WpqzG4HelH6PeQDYiGK9XWOQNsaGqi4rKi5J1jGFigaCepyjmcuEvNZej
	HRMQOab+pzAWpdajV1Ehb5BYpQaAuqMATmh/LrfLwoE37odwSza9iOtdpym6kuIBR/ht
	putg==
X-Gm-Message-State: APjAAAVV6m0yI70PQMGK+DsLkDR/cpkozvazmaTvFbjrwKYaOw/C0+EC
	jQn6Tbo3xGDGL78Jg15XH7WPVzmzOSQ=
X-Google-Smtp-Source: APXvYqwofE0jWtYJdiRSotTyGq+vi3EEAnml1/hoBftMJ0sv6DoNEhZDThAi36y2w2ZrLOD3DddDmA==
X-Received: by 2002:a63:e1a:: with SMTP id d26mr764504pgl.73.1569293381873;
	Mon, 23 Sep 2019 19:49:41 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.49.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:49:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:48:48 -0700
Message-Id: <d449e28bb9d7749e0abd759086b5f58d68af0ab4.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 08/50] tiff: fix CVE-2019-6128
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
X-List-Received-Date: Tue, 24 Sep 2019 02:49:41 -0000

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


