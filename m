Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 081F1601A4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jul 2016 23:27:24 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id ts6so10490098pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jul 2016 16:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SpnH/ZDwtJbtO3leO4txjhXDCu+b6IY1ugE9A79wufk=;
	b=pqqQtw2Fr47cSgMXLA8kdL/1iqEkSot5wZ5q/ywh8vf2vga/ZkSk9G//nHB6i0S9Ht
	mij1xbW4sDTEBJhmZPqP+yN35wxbEJ8Dm140zSDAQO7mEobdZDWPgnNpezhZ6yHT77gg
	9QH838eUjKKIWRFoHOhDLpSMepimgbfAALsXVkF5UiGTcz3zvsZX9QE9EO4JAWRe72lw
	9INF4/3d5Pc/+PqhX+OgmLdysjtm4RYZeYrwJhfUnPpqjgdq5XmvlE6slHT7FufLicJC
	BCJy9hfHB+fWwjxSBb8VyKXSMc13fjgb5TdU/7ytFVteLd4F5ZmXLeEW484yUGKeK/AH
	ttAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SpnH/ZDwtJbtO3leO4txjhXDCu+b6IY1ugE9A79wufk=;
	b=amTaClkyC3CRcyDUVrHYFTEfQwAKWgcAROdbJ4G6kv5zagpXYjlruWYO3biVv0aI4i
	0lbaSe8EgEG8PAlo5SAhwO5iUx9T8yHRIO7yGZBme0LKpyP/AkaWUVlFOssT+bhfSxGi
	j6PSU8CRmF98hAwanRsufHY+uTVNZyIGyQdOX2k3FYV2t6Qv0EIY6C4iHQfe5XiiFp4y
	7Ge2lQreFVEHXGaXh2upNwGgli9C72/F+4pMcUUZjqr2jSIDwEXY+MpOKaCdK2jsqsQK
	dzSUdgSu1FHndTbQ4kWsv03kKo8In9uDNZcYMAaIhW4+yEk1aCAl/B6a+vMx0MQxExFM
	cWPg==
X-Gm-Message-State: ALyK8tJ7cnkglBAn5sezhxl29Rel4Qlyihvmd1QROZRM3iv5fBPEQM259+gEKmJTgQ9jxw==
X-Received: by 10.66.193.39 with SMTP id hl7mr22090043pac.10.1468106845510;
	Sat, 09 Jul 2016 16:27:25 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	i89sm5338293pfi.22.2016.07.09.16.27.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jul 2016 16:27:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jul 2016 16:27:17 -0700
Message-Id: <20160709232717.22380-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] v86d: Accept aarch64 as build host
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
X-List-Received-Date: Sat, 09 Jul 2016 23:27:25 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/v86d/v86d/aarch64-host.patch | 18 ++++++++++++++++++
 meta/recipes-bsp/v86d/v86d_0.1.10.bb          |  4 +++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/v86d/v86d/aarch64-host.patch

diff --git a/meta/recipes-bsp/v86d/v86d/aarch64-host.patch b/meta/recipes-bsp/v86d/v86d/aarch64-host.patch
new file mode 100644
index 0000000..701fed7
--- /dev/null
+++ b/meta/recipes-bsp/v86d/v86d/aarch64-host.patch
@@ -0,0 +1,18 @@
+Accept aarch64 as valid build host
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: v86d-0.1.10/configure
+===================================================================
+--- v86d-0.1.10.orig/configure
++++ v86d-0.1.10/configure
+@@ -26,7 +26,7 @@ copt_x86emu_test()
+ 	local m=`uname -m`
+ 	if [ "$m" = "i686" -o "$m" = "i586" -o "$m" = "i486" -o "$m" = "i386" ]; then
+ 		echo "n";
+-	elif [ "$m" = "x86_64" ]; then
++	elif [ "$m" = "x86_64" -o "$m" = "aarch64" ]; then
+ 		echo "y";
+ 	else
+ 		echo "It looks like your architecture '$m' isn't supported by this version of v86d." >&2
diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index f502072..1046d63 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -13,7 +13,9 @@ SRC_URI = "http://distfiles.gentoo.org/distfiles/${BP}.tar.bz2 \
            file://Update-x86emu-from-X.org.patch \
            file://fbsetup \
            file://uvesafb.conf \
-           file://ar-from-env.patch"
+           file://ar-from-env.patch \
+           file://aarch64-host.patch \
+"
 
 SRC_URI[md5sum] = "51c792ba7b874ad8c43f0d3da4cfabe0"
 SRC_URI[sha256sum] = "634964ae18ef68c8493add2ce150e3b4502badeb0d9194b4bd81241d25e6735c"
-- 
2.9.0


