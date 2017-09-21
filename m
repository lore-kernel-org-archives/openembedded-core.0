Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7CB8860685
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 17:42:22 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id b11so3885127pgn.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 10:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VV4AY9nWJLU25Mo58+E6tQdSvMmPCRDATk0SB4sbCAQ=;
	b=FiKRbQ8e69O3bT+eus/+k5Cxsw7hvqegaJOAzwN/X1y0izUZ7M/BvbtjpF36fONDI8
	Yxua6oBOe7j8W3uBjz407pW9wZSryWxvbFNxIurZKjgUAGk2oib9uBYzTjL3u33f+7Ax
	s10uGwo11DjPiJ7q4Bdg11vDQrYKtMQOQRks8Ww+CUGkSaTpWz1zoxjvdS5CO+uK+JVR
	X5P+HKqOHOGtdu6epZ9VYveyUBdIBQIO2yy3W1rF4QNWvSSxJGvIVewNV0P9pBdUSFci
	NqeP0Cu0N3Vlh+gFeEmLmE4H/D30y8wLyzn4rEfCuVLh6zKTwXLzciVqwC04/LLrt6d4
	6b9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VV4AY9nWJLU25Mo58+E6tQdSvMmPCRDATk0SB4sbCAQ=;
	b=ev0nh0L5r4WL6ttF6N2hbPXM7pHArcNOjyJIw2AIX0dNFiUF+aQTdSjuZ+4wvjcNuB
	HJjzalFgXSJJ3cwKJmoVi1/weSDIkhqt9nLVjLK8c9jBStAi+5AnhDR1N5YV2ogKyG3W
	tSOqr9YDt0Z0CrK5Ydam/OwTOrMii9Ur3QcxoTN7tfQmBzysNh6vfNACJCQYo+VhKoag
	WKhcuPCfjmFeViLSwSBjdJzG62BjgoVsuEK/J60QCbEXj260rzeuhYSVNahzBYcj1KYj
	msbxbkioM7ZXs+wQ/Gp9Y9GJjKwkHu/4jQ0cC6lQluMyD5PlSkIZ1hBZYQhEPs7qrtaR
	lFcA==
X-Gm-Message-State: AHPjjUhF/2TBUmMsJx/9oWU+tNjb7QIasZONkS/3EYzK/WtLclSJHkOk
	WpOn/mBY/+CMUxLxFuxm/dYZAA==
X-Google-Smtp-Source: AOwi7QAwZNpgfumodjjOyEnvwbyPmyMAKNdxaTKhR1q6vAWhfAsI6KjVWAm/9aLQewJ++pS9CUlQyw==
X-Received: by 10.84.132.2 with SMTP id 2mr6277155ple.381.1506015743693;
	Thu, 21 Sep 2017 10:42:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	u20sm3241745pfh.171.2017.09.21.10.42.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 10:42:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 10:42:15 -0700
Message-Id: <20170921174216.33386-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH 1/2] gstreamer1.0-libav: Fix build on mips
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
X-List-Received-Date: Thu, 21 Sep 2017 17:42:22 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...a.c-Fix-build-by-Including-libavcodec-hev.patch | 33 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-libav_1.12.2.bb         |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-hevcpred_msa.c-Fix-build-by-Including-libavcodec-hev.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-hevcpred_msa.c-Fix-build-by-Including-libavcodec-hev.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-hevcpred_msa.c-Fix-build-by-Including-libavcodec-hev.patch
new file mode 100644
index 0000000000..afbfc84db5
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-hevcpred_msa.c-Fix-build-by-Including-libavcodec-hev.patch
@@ -0,0 +1,33 @@
+From b5226c096a0b7049874858e94a59d43e10ba3fd2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Sep 2017 10:22:56 -0700
+Subject: [PATCH] hevcpred_msa.c: Fix build by Including libavcodec/hevcdec.h
+
+src/libavcodec/mips/hevcpred_msa.c:1913:32: error: unknown type name 'HEVCContext'; did you mean 'HEVCPredContext'?
+ void ff_intra_pred_8_16x16_msa(HEVCContext *s, int x0, int y0, int c_idx)
+                                ^~~~~~~~~~~
+                                HEVCPredContext
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ gst-libs/ext/libav/libavcodec/mips/hevcpred_msa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst-libs/ext/libav/libavcodec/mips/hevcpred_msa.c b/gst-libs/ext/libav/libavcodec/mips/hevcpred_msa.c
+index 6a3b281..963c64c 100644
+--- a/gst-libs/ext/libav/libavcodec/mips/hevcpred_msa.c
++++ b/gst-libs/ext/libav/libavcodec/mips/hevcpred_msa.c
+@@ -18,7 +18,7 @@
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  */
+ 
+-#include "libavcodec/hevc.h"
++#include "libavcodec/hevcdec.h"
+ #include "libavutil/mips/generic_macros_msa.h"
+ #include "hevcpred_mips.h"
+ 
+-- 
+2.14.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.2.bb
index 6c5f779ebf..3b5bbd1507 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz
            file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
            file://mips64_cpu_detection.patch \
            file://0001-configure-check-for-armv7ve-variant.patch \
+           file://0001-hevcpred_msa.c-Fix-build-by-Including-libavcodec-hev.patch \
            "
 SRC_URI[md5sum] = "8788aecc032a287227b4bd239d1b998a"
 SRC_URI[sha256sum] = "5bb735b9bb218b652ae4071ea6f6be8eaae55e9d3233aec2f36b882a27542db3"
-- 
2.14.1


