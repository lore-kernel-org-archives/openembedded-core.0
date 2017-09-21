Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id D395E77FC3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 09:21:54 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id g29so4044392wrg.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 02:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=O2aRKxALv4M9zw3Abecdtzkm41/sZxt3gR5f+tUdcFo=;
	b=UusCtxZVb1IiMNJnuM+h32SDqoCtVqFSyvXHlD9fIwFHRGfP5METI/tfZyS+EhOJ4U
	gzOJ72WqwF9FjCcCMUmRpgOY2GNogMHlLCnOaMvEXRFvwM+EITNM0aJYjp1hWwUWr4ei
	8cbRnUocnnY01gaqAO+ZcfLuXzdbaJIRS0r8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=O2aRKxALv4M9zw3Abecdtzkm41/sZxt3gR5f+tUdcFo=;
	b=pgFnBDQkFctnku8QlFHnvFJQqtlt1fH7vOFsqWHz6GmRvYKopZtDyvCquawkO+VfSJ
	2T1/T2d5pTU7dCzbIk7JUyEXu3MjIh/7vLAqjKvESB/n4CZ+J80soz3X5ZxvMPoiSS3h
	NPRYpPnEkIj4zxT3XWPjqpcSHTl69V90HhzlVHSp5jNBoVXWjgp0huiCiZ2Wk+jHW/1g
	3FkuhsTSqFSFmRY69pYDwrhUOggs2OZY9f/zZ0ZBkqkJ9O6aRxZ4BirR72+d0JFjX1fb
	dY69CEc/aGF5YNePEKGJ3yIP05+9q2N6Idcwu2+U0tu6VIL3iOfA2KePluWZdVZV72zl
	Bqhg==
X-Gm-Message-State: AHPjjUiCOnb+QW0gK6NjWPt10f5rB+RxDVlc/ua0vnq5seR+H0ipo6ne
	7h44+pvP2IfqFpywE9Dq/rWxcFeNkGo=
X-Google-Smtp-Source: AOwi7QBB8yiqmigWOU0peYJPWuW5Els3wVnQ2bHV6AN5dxsF2DLvXRqHIp/8D2pUECCakatt1CsYcg==
X-Received: by 10.223.160.221 with SMTP id n29mr1309050wrn.214.1505985715189; 
	Thu, 21 Sep 2017 02:21:55 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	g132sm1103466wmd.5.2017.09.21.02.21.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 02:21:54 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 11:21:27 +0200
Message-Id: <20170921092131.25537-7-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
References: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 06/10] gstreamer1.0-rtsp-server: upgrade to version 1.12.3
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
X-List-Received-Date: Thu, 21 Sep 2017 09:21:55 -0000

Bugfixes release only.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb | 6 ------
 .../recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.3.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.3.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb
deleted file mode 100644
index 2426cca6c9..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require gstreamer1.0-rtsp-server.inc
-
-SRC_URI[md5sum] = "022757cab183f5b970086e9101c60a98"
-SRC_URI[sha256sum] = "d8ba9264e8ae6e440293328e759e40456f161aa66077b3143dd07581136190b3"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.3.bb
new file mode 100644
index 0000000000..387628470a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.3.bb
@@ -0,0 +1,6 @@
+require gstreamer1.0-rtsp-server.inc
+
+SRC_URI[md5sum] = "83ae8adda3b9c6164cd2fba1efdde87e"
+SRC_URI[sha256sum] = "67255971bb16029a01de66b9f9687f20d8dbf3d3bd75feb48605d0723a7c74ec"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
-- 
2.11.0


