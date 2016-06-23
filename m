Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E52C76057B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 22:23:34 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id t190so7619065pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 15:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hQ5X6jt0cAlmFqsRILjV5tRKeuKfqNCgV+6qEw24ja0=;
	b=whOo7uTTAB5deVD9AHDPkANm2i8oUexkTpeNVBNhk72KhO/nuDd9MAjjGIAtj5QzWF
	k3HXOKPHu+UIpmbmdGxwGYsMtXglvk1wqqTlFgecjmpU5pG5RhXH3Stdi/Q7S21QTWzd
	/f1owfsRNF4KQXzDrZRfm6swPSWnlg01J2VL93JRY1kLvoj+kyJyHMQxYHmvDPut0abA
	7km20ROK09U8ggWz66YXw8NpUFYXDlTEvQxzKa2N+onSgGV2HvTrOJ6foya1HDR7GGGm
	Ry4kIScVqQO00Vp+pqr5vy+fXQ+rcwd0lPtwEVJzMZZ6f2oep7GN5TsqmuPamreS+YRP
	FGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hQ5X6jt0cAlmFqsRILjV5tRKeuKfqNCgV+6qEw24ja0=;
	b=N515dF+KawOX8sq9kF5x+X3uM6GN+r50/mGGodTIvz4za3Ou1iDE933jA8c6uRPEIJ
	O6rO6Kf0yEa79/HYuuzo2CYMr4j3bI3J7cFjrKroBoAE7AbnY0C9hzly9ezLchP8LZzW
	tGioCuuNgfMlVli02diJwncibyi8P04gDIbaEJSXMvP4ASb1C++fXxjtjZrzqTadBA3A
	DXrmBZt+b5/TpxMNJ16Emy0vllEM5kJyT3bnpZngVR6SMbTE5CsLgHvQSmhrHQBUTGHW
	q3MjgbMfgwgPhu+v3YiFsxtXSg5BtCKRyjflbWKlJbEObT4q8IHo3Ke9l0WW91I6uI1K
	ZbaA==
X-Gm-Message-State: ALyK8tKJ2tAMBs/0B/TuQf2dTGF9TONznqm3OUd5qQKONtZvSfZiOGjdygf86+Qs33hHgw==
X-Received: by 10.98.52.3 with SMTP id b3mr1345235pfa.40.1466720615478;
	Thu, 23 Jun 2016 15:23:35 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	tj10sm2396547pab.21.2016.06.23.15.23.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jun 2016 15:23:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2016 15:23:20 -0700
Message-Id: <20160623222320.8387-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160623222320.8387-1-raj.khem@gmail.com>
References: <20160623222320.8387-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] gstreamer1.0: Upgrade to 1.8.2
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
X-List-Received-Date: Thu, 23 Jun 2016 22:23:36 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{gstreamer1.0-libav_1.8.1.bb => gstreamer1.0-libav_1.8.2.bb}    | 0
 ...er1.0-plugins-bad_1.8.1.bb => gstreamer1.0-plugins-bad_1.8.2.bb} | 4 ++--
 ...1.0-plugins-base_1.8.1.bb => gstreamer1.0-plugins-base_1.8.2.bb} | 4 ++--
 ...1.0-plugins-good_1.8.1.bb => gstreamer1.0-plugins-good_1.8.2.bb} | 4 ++--
 ...1.0-plugins-ugly_1.8.1.bb => gstreamer1.0-plugins-ugly_1.8.2.bb} | 4 ++--
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.1.bb | 6 ------
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.2.bb | 6 ++++++
 .../gstreamer/{gstreamer1.0_1.8.1.bb => gstreamer1.0_1.8.2.bb}      | 4 ++--
 8 files changed, 16 insertions(+), 16 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.8.1.bb => gstreamer1.0-libav_1.8.2.bb} (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.8.1.bb => gstreamer1.0-plugins-bad_1.8.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.8.1.bb => gstreamer1.0-plugins-base_1.8.2.bb} (84%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.8.1.bb => gstreamer1.0-plugins-good_1.8.2.bb} (83%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.8.1.bb => gstreamer1.0-plugins-ugly_1.8.2.bb} (72%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.1.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.2.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.8.1.bb => gstreamer1.0_1.8.2.bb} (69%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.2.bb
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.2.bb
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
index a240bcb..c7d67f8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
     file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
 "
-SRC_URI[md5sum] = "e508da2a8a5c3d12264fe3415be2f451"
-SRC_URI[sha256sum] = "0bbd58f363734fc0c4a620b2d6fb01d427fdafdbda7b90b4e15d03b751ca40f5"
+SRC_URI[md5sum] = "83abc2e70684e7b195f18ca2992ef6e8"
+SRC_URI[sha256sum] = "d7995317530c8773ec088f94d9320909d41da61996b801ebacce9a56af493f97"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.2.bb
similarity index 84%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.2.bb
index c3bf2b1..3af6af2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.2.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
     file://make-gio_unix_2_0-dependency-configurable.patch \
 "
 
-SRC_URI[md5sum] = "5421edfeb7479d5f5776e917ba30e24e"
-SRC_URI[sha256sum] = "15a9de985cd265c344e359f5b19347df4021b7611ed2c2d91917cb900f2fad6f"
+SRC_URI[md5sum] = "f55254ca18b845a9a7d8fe671bc09c24"
+SRC_URI[sha256sum] = "9d7109c8fb0a5dec8edb17b0053c59a46aba7ddf48dc48ea822ebbbd4339d38d"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.2.bb
similarity index 83%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.2.bb
index 26e3c6f..b1728db 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.2.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
 "
 
-SRC_URI[md5sum] = "3eabe7277681b9bef8a64c312de03d47"
-SRC_URI[sha256sum] = "2103e17921d67894e82eafdd64fb9b06518599952fd93e625bfbc83ffead0972"
+SRC_URI[md5sum] = "1ad652a98c2106f6d839dfba8d310d23"
+SRC_URI[sha256sum] = "8d7549118a3b7a009ece6bb38a05b66709c551d32d2adfd89eded4d1d7a23944"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.2.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.2.bb
index 7c0d206..d313ef3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.2.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
 "
 
-SRC_URI[md5sum] = "b6f47bcb3d924f7ef8a8b33ac4d037ab"
-SRC_URI[sha256sum] = "8e656a9a3be60d7e7ed3fb8e2a22d070b1f54f95d0b22accd876360e659446ce"
+SRC_URI[md5sum] = "f781790cf64b44522b01ab560f16d4de"
+SRC_URI[sha256sum] = "9c5b33a2a98fc1d6d6c99a1b536b1fb2de45f53cc8bf8ab85a8b8141fed1a8ac"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.1.bb
deleted file mode 100644
index 395c43a..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-include gstreamer1.0-rtsp-server.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
-
-SRC_URI[md5sum] = "0a5966df7f3d74cccfcededdcacd8212"
-SRC_URI[sha256sum] = "6fa8d9ce5b6f6f3309ab9eae14739af4f5666e259cdc64d0667d284ab17eb12e"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.2.bb
new file mode 100644
index 0000000..01abafb
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.2.bb
@@ -0,0 +1,6 @@
+include gstreamer1.0-rtsp-server.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
+
+SRC_URI[md5sum] = "193ae75a676f39294f64b162bbe2369d"
+SRC_URI[sha256sum] = "7d414cd4302ae253821dcb22d483fadc9d21cf96b5fd4c0a33fd41960f8e0459"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.2.bb
similarity index 69%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.2.bb
index 475ebf9..98f2d1a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.2.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
 "
 
-SRC_URI[md5sum] = "711ada79b63e47ac96adb4e5444dc908"
-SRC_URI[sha256sum] = "5a3722fb9302dd977c17ced4240293dc777cb716dc98c8cca63d75c27e5e3107"
+SRC_URI[md5sum] = "0f011ee793cbcfa96d6b51d8271349fa"
+SRC_URI[sha256sum] = "9dbebe079c2ab2004ef7f2649fa317cabea1feb4fb5605c24d40744b90918341"
 
 S = "${WORKDIR}/gstreamer-${PV}"
-- 
2.9.0


