Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6E9717704E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 04:24:11 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id i123so2322617pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 21:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=28hP5FKqZ0YuADI/tJtdvy6fC6SeHJtoGKbjzxsb468=;
	b=q1bnald8bgzd26bdWPnGMzVFHJ7VdDbhOWyXO5EW++BJLkTm7yF5vUh182GKVsIEN7
	eFq+GX7KIrmazv4USkiVY61G/sbXtqDatVGq28Y/pebMoWjatoTR0Xe6PZXt6VeV8Z3r
	Zr/HouBy2+LjZ7/JYnwgKTZRnuJf/2oGXA7I5rzh9oSMzb09j5GNZA07+Ln5bEnA9/JS
	5Jd89PfGxsYAoc987zwBZsAyYE/BUvyBo2CHZdPU/qgiDA9tSetLlDx9MD6Rmk3hV9kW
	BA9U6usPqB9sBw3zAc4xEeDtkrFeasRj8VPWXkV/TpDea0XmzFOHXXeHB4KSCEvWUbPj
	dFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=28hP5FKqZ0YuADI/tJtdvy6fC6SeHJtoGKbjzxsb468=;
	b=EFdl8qGsDGBAKe6J2rpeGqNfqzGy5E9JhkMwSZRCDHg7y8EPGYPJ6wbb8u+q59mZWt
	q9pYWlvhHrxYzUayvSft/2k/So7+cWYC9W/KUSbhdUT0yvQfQKg5/aoZdeyIT+0j+e8n
	2BTjqeeRk995ljIcn3YYcguuxDndGGCUo3pAmkNZ3y5M336zizFoz7YK2nSUvGklAbxl
	EbTIfQXBP7MOmCuEktwYWDo7mU7mST638W6ZMItRVy8C9iZcnqjnN4REY6VhIwammO2F
	/EBGi4/8udexYv7B6tw+jryS2tXRmigC1Gw0JWvyQlGKXb5yST+BlHcFljFTzW0J3A45
	c2cg==
X-Gm-Message-State: ALyK8tJK4UkaRzHdvfSk3lAyU6NNbXDsrSXZz9E4VoPGLIhgxgjj1HuAkplrUqyv3VHcrw==
X-Received: by 10.98.30.133 with SMTP id e127mr86325pfe.112.1466137447064;
	Thu, 16 Jun 2016 21:24:07 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	bw1sm56677200pab.17.2016.06.16.21.24.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jun 2016 21:24:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2016 21:23:57 -0700
Message-Id: <20160617042358.24237-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.3
Subject: [PATCH 1/2] gstreamer1.0-plugins-bad: Upgrade to 1.8.1
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
X-List-Received-Date: Fri, 17 Jun 2016 04:24:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb    | 28 ------------
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.1.bb    | 52 ++++++++++++++++++++++
 2 files changed, 52 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.1.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
deleted file mode 100644
index 8eb47c2..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-include gstreamer1.0-plugins-bad.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
-                    file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
-                    file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50 \
-                    file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a"
-
-# Note: The mpg123 plugin was moved to gst-plugins-ugly prior to the 1.7.2
-# release, so this line should be removed during the update to 1.8.x
-# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=08d8aefcdaaf89ecb6dd53ec1e4f95cd42d01664
-PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
-
-# Note: The gsettings plug-in was dropped prior to the 1.7.2 release,
-# so this line should be removed during the update to 1.8.x
-# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=914291808ad10621d6a74031f3d46d45eef5a3a3
-EXTRA_OECONF += "--disable-gsettings"
-
-SRC_URI = " \
-    http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
-    file://configure-allow-to-disable-libssh2.patch \
-    file://0001-glimagesink-Downrank-to-marginal.patch \
-    file://0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch \
-"
-
-SRC_URI[md5sum] = "4857adcafe41e4b9b8805cf88303bd55"
-SRC_URI[sha256sum] = "971b29101d6a9c5e3fe94d99d977a227f58f0b2d29b6ca2c7f292052542b3a61"
-
-S = "${WORKDIR}/gst-plugins-bad-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.1.bb
new file mode 100644
index 0000000..a240bcb
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.1.bb
@@ -0,0 +1,52 @@
+include gstreamer1.0-plugins-bad.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
+                    file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
+                    file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50 \
+                    file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a"
+
+SRC_URI = " \
+    http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
+    file://configure-allow-to-disable-libssh2.patch \
+    file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
+    file://avoid-including-sys-poll.h-directly.patch \
+    file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
+    file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
+"
+SRC_URI[md5sum] = "e508da2a8a5c3d12264fe3415be2f451"
+SRC_URI[sha256sum] = "0bbd58f363734fc0c4a620b2d6fb01d427fdafdbda7b90b4e15d03b751ca40f5"
+
+S = "${WORKDIR}/gst-plugins-bad-${PV}"
+
+# over-ride the default hls PACKAGECONFIG in gstreamer1.0-plugins-bad.inc to
+# pass an additional --with-hls-crypto=XXX option (new in 1.7.x) and switch HLS
+# AES decryption from nettle to openssl (ie a shared dependency with dtls).
+# This should move back to the common .inc once the main recipe updates to 1.8.x
+PACKAGECONFIG[hls] = "--enable-hls --with-hls-crypto=openssl,--disable-hls,openssl"
+
+# The tinyalsa plugin was added prior to the 1.7.2 release
+# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=c8bd74fa9a81398f57d976c478d2043f30188684
+PACKAGECONFIG[tinyalsa] = "--enable-tinyalsa,--disable-tinyalsa,tinyalsa"
+
+# The vulkan based video sink plugin was added prior to the 1.7.2 release
+# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=5de6dd9f40629562acf90e35e1fa58464d66617d
+PACKAGECONFIG[vulkan] = "--enable-vulkan,--disable-vulkan,libxcb"
+
+# The dependency-less netsim plugin was added prior to the 1.7.2 release
+# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=e3f9e854f08e82bfab11182c5a2aa6f9a0c73cd5
+EXTRA_OECONF += " \
+    --enable-netsim \
+"
+
+# In 1.6.2, the "--enable-hls" configure option generated an installable package
+# called "gstreamer1.0-plugins-bad-fragmented". In 1.7.1 that HLS plugin package
+# has become "gstreamer1.0-plugins-bad-hls". See:
+# http://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=efe62292a3d045126654d93239fdf4cc8e48ae08
+
+PACKAGESPLITFUNCS_append = " handle_hls_rename "
+
+python handle_hls_rename () {
+    d.setVar('RPROVIDES_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
+    d.setVar('RREPLACES_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
+    d.setVar('RCONFLICTS_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
+}
-- 
2.8.3


