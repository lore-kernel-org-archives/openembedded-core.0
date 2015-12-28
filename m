Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1ACD16013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 12:52:38 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l126so260932654wml.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 04:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Iwo2ctEO17r69kAj9YZy/oGLLxckQc0pTSMm9wpldEo=;
	b=SqkNA2lRemPVyjHw+mFxzgcTveXvROWcxOCHOKZVQbWxBQuxgEkV6kFEph1l20kb7D
	hmODKOtcp58OT7UVelg66tASjUanD1L5eLtGmiam5o32m2dQUKUyY6KqCynrXR7NdhKV
	8xt7L9VZvrNGC0o9qboVMslBUuifsIPYqJd8UVZmrz6SDT5SthQXCXauyKgT6HalEM6r
	eNSUys3PpTyQL2RvVaqGbsCfTOZpqfd30AS8Pc8s4cnf20rLUa1nmKUegN6pgUUmvPZS
	hj8EvnYIE18TzEun6kh3rDTxbeQTnus9fbkCiCDEle/9mi90Kn6DBrcXSQk8Hpz8YFNB
	T/eg==
X-Received: by 10.28.216.211 with SMTP id p202mr13498041wmg.84.1451307158838; 
	Mon, 28 Dec 2015 04:52:38 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lx4sm56870885wjb.5.2015.12.28.04.52.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Dec 2015 04:52:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Dec 2015 13:55:52 +0100
Message-Id: <1451307352-4694-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] bluez5: include the patch only for 5.36
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
X-List-Received-Date: Mon, 28 Dec 2015 12:52:39 -0000

* it's backport so it probably won't be needed for newer version and it doesn't
  apply for older versions, so it just prevents to easily use bluez5.inc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc     | 1 -
 meta/recipes-connectivity/bluez5/bluez5_5.36.bb | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 62bd143..3aaefa3 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -18,7 +18,6 @@ PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
-    file://core-profile-Fix-possible-crash-when-registering-pro.patch \
     file://init \
 "
 S = "${WORKDIR}/bluez-${PV}"
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.36.bb b/meta/recipes-connectivity/bluez5/bluez5_5.36.bb
index b94ed31..884bb77 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.36.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.36.bb
@@ -1,4 +1,6 @@
 require bluez5.inc
+
+SRC_URI += "file://core-profile-Fix-possible-crash-when-registering-pro.patch"
 SRC_URI[md5sum] = "9a0ee479cacc44fac68f6a65b1cd3eba"
 SRC_URI[sha256sum] = "a343ea1aeb53d3bd139087f3b1c1e1fb70db452d9762cc7a3d23e75962e578f2"
 
-- 
2.6.4


