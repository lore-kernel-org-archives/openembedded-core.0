Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9E64076F8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 17:04:05 +0000 (UTC)
Received: by wicmc4 with SMTP id mc4so40135875wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 10:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2ssJ2L/+K/MW6RVuoBUVFBTMzljjSh095bwiKQseUkU=;
	b=0dwNmV1+tXplPy9Q0LqexqSJYCTfEEgEYHhtEFcIsVxSDFCgzjdLFbwnd1Ryo3O4oN
	h178LmomY1j0/6SJbqyrZNN2O9G6+arFC/VzmQa4emq0WVV+ZSaZShFXoaXEZBtM1mQH
	7w4ncmWhV0C6jpVQ9DKQApYKggkTp2LpKcJP4WFICFTsS1suIzahbxXmpuJPUYEFhjwA
	b881YsaY4MT7gqJNPrcvr38nLI5lTfxD/eEhjM5D/9t7hvhQlhVnlpvuLv2pxsobX4H8
	BcC50WeL2rsDpDhz8obqnubYoUta0Qd9YK9vHaknuRsS5/353u+L8iSTPhW5poYRhTbl
	3IZg==
X-Received: by 10.180.149.146 with SMTP id ua18mr4593445wib.86.1441127044532; 
	Tue, 01 Sep 2015 10:04:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id d7sm3628176wiz.22.2015.09.01.10.04.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Sep 2015 10:04:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Sep 2015 19:04:18 +0200
Message-Id: <1441127058-30449-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <20150828182256.GA2488@jama>
References: <20150828182256.GA2488@jama>
Subject: [dizzy][PATCH] tzdata, tzcode-native: drop older versions 2014h, 2015b
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
X-List-Received-Date: Tue, 01 Sep 2015 17:04:08 -0000

* unlike in master, the older versions weren't dropped when upgrading to 2015d

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2014h.bb | 11 -----------
 meta/recipes-extended/tzcode/tzcode-native_2015d.bb | 11 -----------
 meta/recipes-extended/tzdata/tzdata_2014h.bb        |  6 ------
 meta/recipes-extended/tzdata/tzdata_2015b.bb        |  6 ------
 4 files changed, 34 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014h.bb
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015d.bb
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2014h.bb
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2015b.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014h.bb b/meta/recipes-extended/tzcode/tzcode-native_2014h.bb
deleted file mode 100644
index 87c5f23..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2014h.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-# note that we allow for us to use data later than our code version
-#
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2014h.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "8e7741fc769ebdd94d95e5f2c3adbb60"
-SRC_URI[tzcode.sha256sum] = "a4d9788a1bb0aa314eae4986ee991425b83ecc47da0e84f626735846be1dbf44"
-SRC_URI[tzdata.md5sum] = "ed05111948beba8a0f30956baa46b272"
-SRC_URI[tzdata.sha256sum] = "e78152f616fb07c1dea124215ffca57d0de66d8897e00896086542e3de30f69e"
-
-require tzcode-native.inc
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2015d.bb b/meta/recipes-extended/tzcode/tzcode-native_2015d.bb
deleted file mode 100644
index 44a9f03..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2015d.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-# note that we allow for us to use data later than our code version
-#
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2015d.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "4008a3abc025a398697b2587c48258b9"
-SRC_URI[tzcode.sha256sum] = "221af54ec5c42eaf0101159ffe1256a883d1c14c46228d42774c656a56317128"
-SRC_URI[tzdata.md5sum] = "b595bdc4474b8fc1a15cffc67c66025b"
-SRC_URI[tzdata.sha256sum] = "8b9f5008277f09e251e97dba7813f56168d691115bda90ade4638d72f296d531"
-
-require tzcode-native.inc
diff --git a/meta/recipes-extended/tzdata/tzdata_2014h.bb b/meta/recipes-extended/tzdata/tzdata_2014h.bb
deleted file mode 100644
index 9334a62..0000000
--- a/meta/recipes-extended/tzdata/tzdata_2014h.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzdata.md5sum] = "ed05111948beba8a0f30956baa46b272"
-SRC_URI[tzdata.sha256sum] = "e78152f616fb07c1dea124215ffca57d0de66d8897e00896086542e3de30f69e"
-
-require tzdata.inc
diff --git a/meta/recipes-extended/tzdata/tzdata_2015b.bb b/meta/recipes-extended/tzdata/tzdata_2015b.bb
deleted file mode 100644
index df97d6d..0000000
--- a/meta/recipes-extended/tzdata/tzdata_2015b.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzdata.md5sum] = "75571bb17c7b6be88a9f8872e45bc726"
-SRC_URI[tzdata.sha256sum] = "556ac1a5b3a371adc1ad4e77138f78ddd7f8ddd7bc2b52545924598c7dc8ad62"
-
-require tzdata.inc
-- 
2.5.0


