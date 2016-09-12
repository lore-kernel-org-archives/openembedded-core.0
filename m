Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D097731A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 17:05:46 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a6so14537096wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 10:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=do0lA56Jf6GNaoyhXs4sCPk0qN+W5ZGTwQLgCfoTHcQ=;
	b=0AIhbzxWp3t1XJEye0Q1oArI3zxcpAyvc9I78yxwcUBp4+dT/T5SnmRjVBzVS1C6ch
	pNn+OySSP/wSzvYPOZxPvEiCLHtK/RbeofmMqOsNgI4Db6M3JnfN7d7mAEBS0tuuUe9x
	FQ0DOahN6fxsgjlKIuGXEzF2I6+KG6ISvwv8hkib98V/q+8keQrfiIKLK9wSQYkSuizy
	l7HgigNxC3QQIEYJdfpB1NstS4V0Nx5aH9dJNrPuVdO3S3AXk4Ja/yrdWAVoQCrp28tG
	gVnY++bBbnGPclujE+g4dOJQ4V8vfbbG1KEnYE04kRMPUwR2Rr6u4q3RxOPSSuMaX5Et
	6Snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=do0lA56Jf6GNaoyhXs4sCPk0qN+W5ZGTwQLgCfoTHcQ=;
	b=I6J7kgfSXsnju3rpaHC0wzrMxBuc0LT8+h3lmgDmTy7C+FwwmlQxHYiLWorxInI3MH
	TL9SQO3vQET/NB0OW6b8mNpMZt8ci3m34QFquzBs8nQw2Bive4aJgXyUOh46QwtPfqDl
	qWzuvEdf0UaCWO2UUysUxUuOCZxmBQe8in/MBHRnLIGOTqIHuYYWCpeOS08R1MQLsJHj
	U7sLysvHfUAybBmwi84sT1Iy3kTqlVVkRAUqM1IImXOtbdHvI7A9qnjubcEwnz80BtCK
	5fKzWolQ0G5+9wL/QtIh6nIEobPhJzUH+GVPLi1JO7hUvlE2TyzNR6+zJGALIVTcdRpn
	v7eA==
X-Gm-Message-State: AE9vXwPYh+5Fd+HnwX/bsP4wPzPnP7yZWp/uzCA9AnsztKv50d1F0nuXAK7R5LkgKH+vYg==
X-Received: by 10.28.148.18 with SMTP id w18mr1000577wmd.44.1473699946375;
	Mon, 12 Sep 2016 10:05:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	q142sm1154044wmd.4.2016.09.12.10.05.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Sep 2016 10:05:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 19:05:46 +0200
Message-Id: <20160912170546.14212-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
Cc: Martin Jansa <martin.jansa@lge.com>
Subject: [meta-oe][meta-networking][PATCH] cmake-native: add dependency on openssl-native libidn-native
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
X-List-Received-Date: Mon, 12 Sep 2016 17:05:47 -0000

From: Martin Jansa <martin.jansa@lge.com>

Signed-off-by: Martin Jansa <martin.jansa@lge.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
index 33930fb..c4d22d8 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
@@ -2,7 +2,7 @@ require cmake.inc
 inherit native
 
 # Using cmake's internal libarchive, so some dependencies are needed
-DEPENDS += "bzip2-native zlib-native"
+DEPENDS += "bzip2-native zlib-native openssl-native libidn-native"
 
 SRC_URI += "\
     file://cmlibarchive-disable-ext2fs.patch \
-- 
2.10.0


