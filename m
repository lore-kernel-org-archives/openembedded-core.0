Return-Path: <mail@timomueller.eu>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 484AE6018F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 14:03:15 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id a1so38816539wgh.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Feb 2015 06:03:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xGeCxK2Kx8W5LfsXZ/eoFjJHwzkCqZryw87+R3/xEo0=;
	b=YbQZDzk/n0lIQ4sBWNH8CwOYDI49cgdeh6atOtD1uH/Ok0ZxxYb3DnOAlmca8ra/hd
	0vGSk0OCML3x5BJ6Sz3vOHXsNaLAxCu0IF4po0qsi6/I8qiLG9SjK75oqYw7G8ispGpX
	b3jaj6u/28RU+ASF0R0fiNvnVkSMMdoWDGQy7HIP9oqXw64h/Dm5F3dNc81K2jDnQs1N
	03orPnyMKUOvhe/ite1G1eT7QjIukyUz7JzvwwfZbpEjGcBx0u37BjUhI4rMXCvX5Kw2
	vqUwEoXv5UxOf2jRCGv9oROxS/C6ijg8FY+TqFGwIMgdKa232KV186zQrTmyKb3R+HM0
	u6jQ==
X-Gm-Message-State: ALoCoQkD7V0qPySyBTrW63HimZYVgZbrjctmsp7pKBtwvwmoZ3ooRswOlH/hw026N8KJQIospslN
X-Received: by 10.180.198.148 with SMTP id jc20mr19443452wic.67.1422885796961; 
	Mon, 02 Feb 2015 06:03:16 -0800 (PST)
Received: from localhost (mail.bmw-carit.de. [62.245.222.98])
	by mx.google.com with ESMTPSA id cm7sm20002401wib.6.2015.02.02.06.03.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Feb 2015 06:03:16 -0800 (PST)
From: Timo Mueller <mail@timomueller.eu>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Feb 2015 15:03:07 +0100
Message-Id: <49e336fde7b762f9e00013cf7adf53618fbb4f2a.1420813096.git.timo.mueller@bmw-carit.de>
X-Mailer: git-send-email 2.1.0
Cc: Timo Mueller <timo.mueller@bmw-carit.de>
Subject: [PATCH 1/2] apr: Allow use in SDK
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
X-List-Received-Date: Mon, 02 Feb 2015 14:03:16 -0000

From: Timo Mueller <timo.mueller@bmw-carit.de>

This adds 'nativesdk' in the BBCLASSEXTEND.

Signed-off-by: Timo Mueller <timo.mueller@bmw-carit.de>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 meta/recipes-support/apr/apr_1.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr_1.5.1.bb b/meta/recipes-support/apr/apr_1.5.1.bb
index a27b233..985ef67 100644
--- a/meta/recipes-support/apr/apr_1.5.1.bb
+++ b/meta/recipes-support/apr/apr_1.5.1.bb
@@ -7,7 +7,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4dfd4cd216828c8cae5de5a12f3844c8 \
                     file://include/apr_lib.h;endline=17;md5=ee42fa7575dc40580a9e01c1b75fae96"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://configure_fixes.patch \
-- 
2.1.0


