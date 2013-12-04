Return-Path: <andrei@gherzan.ro>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id BAC5D6D840
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 18:47:02 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so2654478eei.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 10:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KcVPWMvYLZcWXG570G/Y3aoEPsIG+kGd6udUQDbxf+g=;
	b=VTG9r70vtQaUlyEZ2EXYZsyUphGtcnqDvo24SnHb6VPf+nApW6gNTQKfsMFnx3unw5
	HB7KDGpi9rwIhY0FLD8LzoNEfNpzZKI8+Yf62LxWNERZCtXHA757G5iLc/Q8ghdqttCH
	11ZcKdF8I23EeMJW/QEvm7hWoVPZPNjmCFvjntDfjFbFERg4zvtq8cB3r2EpPPc5pgA7
	sSJlsWWeJgio8eF87eBRoxTlSStA6HhIYzBAfeF3CDe92L8EIUSqaxCGxhyqvBhPivv6
	bv03n0KdxqtWQwVtzDRUB7BT895oG8zUq4X8FIulBJovy/1yBlQAQ7zaSK+4sn03Nxht
	p4tQ==
X-Gm-Message-State: ALoCoQl8XOXf48eT8m8McNcQ9CkJSkyZBK9kXEWJY5qliPufIy9OfyejmhZ1d5XCPsXq1Eul94P1
X-Received: by 10.15.101.9 with SMTP id bo9mr26686208eeb.32.1386182821667;
	Wed, 04 Dec 2013 10:47:01 -0800 (PST)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPSA id
	o47sm97653978eem.21.2013.12.04.10.47.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 10:47:01 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 20:46:50 +0200
Message-Id: <1386182811-3588-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 1/2] libav: Add v9.10
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
X-List-Received-Date: Wed, 04 Dec 2013 18:47:04 -0000

This version includes libavresample needed for packages like xbmc.
To use this version add:
PREFERRED_VERSION_libav = "9.10".

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-multimedia/libav/libav_9.10.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-multimedia/libav/libav_9.10.bb

diff --git a/meta/recipes-multimedia/libav/libav_9.10.bb b/meta/recipes-multimedia/libav/libav_9.10.bb
new file mode 100644
index 0000000..a76cc9c
--- /dev/null
+++ b/meta/recipes-multimedia/libav/libav_9.10.bb
@@ -0,0 +1,13 @@
+require libav.inc
+
+SRC_URI = "http://libav.org/releases/libav-9.10.tar.xz"
+
+SRC_URI[md5sum] = "4b49d1d8734815ca095bb0600d41c5cb"
+SRC_URI[sha256sum] = "83dbe640779da1c1e8d8836c99575f57f749d18407494ebca451578afee9300d"
+
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
+                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
-- 
1.8.1.4


