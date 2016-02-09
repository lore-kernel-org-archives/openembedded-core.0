Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id B26CF731A3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 14:50:35 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g62so177654966wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 06:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yCJdiMmFxdzOFS9FRHLIIg6NPCorxxt10Q54cgONPZE=;
	b=XUxxuM08n6BaraE71es4RaaO1RVqZRFo4Xe0DyqPdsYsXAjdqvlsZYmYAgfWTNbJgb
	CyLQHo0VGHn5gFVcX6Y6VrO+M+gcS3HSU2r/M4pdrWx8TcHnG4ldSlUOfgwJdwYunsgg
	yr6753LBY++mOxZi5IXVz9ATVk58BnT2HRGkTiSk4PLUR07BNfnNmpWpjPglxwdTfJZk
	vn7mT5U4MGm56JpMVZF7yRtFDLv3QBNHNVvBoNjPLLu+U625nNNQTTP8CSXWeVRfodZ7
	z7QWm8A33Q4y4M8ohRemIsBCqJ8X/tkCRZteE2O6hTa5StHvuhrkKkO04y38LlSZooLD
	70jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yCJdiMmFxdzOFS9FRHLIIg6NPCorxxt10Q54cgONPZE=;
	b=fMPjxSOA46BZgyb9ONlGQ7Bedap8UVYygBU3PJAwhkPOXpjQiHse2xRFSdZrPUPNS6
	SNco0XGERvGp1hk5pDJH4/5UOpiSGIc7f8ncKmn3oCrtrtSfwB5r/Q/ldOl+5pIMh0Ft
	nki2ZsztLZRS1HQProqeoMvv21ohnXLHeYsSGUWPl0qHKPz5UTgsXRhgpwhig7+2HHo2
	XUsUUC7DeeSm29hLnLDOgU4MYAcRAnTwRgRFgufglU4tBYkAnnL0/21+YbM85Sh2XC9g
	JFCmoMnNb2nPtcYg6d2UPoS2dK/05tWG/fYCFdANEqofXcgd+Vkdtqwo3LwA59Er8lOk
	w1NQ==
X-Gm-Message-State: AG10YOQyE2MaLxDh3Htp/m1ngKC4S+mLdt6Hsagze9+sSF6piGd2oFFyMQYvvM2LzlodeA==
X-Received: by 10.195.13.129 with SMTP id ey1mr33493305wjd.132.1455029435429; 
	Tue, 09 Feb 2016 06:50:35 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id h8sm35129792wjw.6.2016.02.09.06.50.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Feb 2016 06:50:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Feb 2016 15:54:13 +0100
Message-Id: <1455029653-4207-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH][fido] tzdata: remove 2015d version
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
X-List-Received-Date: Tue, 09 Feb 2016 14:50:37 -0000

* this is left-over from upgrade to 2016a

* it's safer to remove so that .bbappends in other layers really apply to version
  used in build (currently we have bbappend for 2015d and build will use 2016a
  without any warning

* the same problem was reported with 2015f upgrade:
  http://lists.openembedded.org/pipermail/openembedded-core/2015-August/109708.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata_2015d.bb | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2015d.bb

diff --git a/meta/recipes-extended/tzdata/tzdata_2015d.bb b/meta/recipes-extended/tzdata/tzdata_2015d.bb
deleted file mode 100644
index d8e5f24..0000000
--- a/meta/recipes-extended/tzdata/tzdata_2015d.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzdata.md5sum] = "b595bdc4474b8fc1a15cffc67c66025b"
-SRC_URI[tzdata.sha256sum] = "8b9f5008277f09e251e97dba7813f56168d691115bda90ade4638d72f296d531"
-
-require tzdata.inc
-- 
2.7.0


