Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id AEE3C76B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 17:08:42 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so19667153wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 10:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S9cmrFXDUrT3EOwVO+0vroR7qOEbTB5ZQXOrldfAf60=;
	b=M7xckylQsCRci/haEMfGXKblGOhCYAh7dhN0Zc8LfzHa+EjUs02N9PXStNxRcsDglB
	Gv5zxsfreKnelwtW3srXumCBOusVfO5ClItwi7797+W6rkiHbTP5ateKUbBTTpCMFZSp
	QpjL4c47pwTQIhC8uL8zIzlTgeYE/5B84ZlbMVLxM6FyDh9j4QghBodzlqONx7vfwSW2
	DSCMWo6kUkiWRTiGuFcY83oH1XA2wVas78r/MJxY9msR/IfcsXRjtELxyPpaiNnjgLYZ
	fn7sF8WH+fa4AqmHGpEGeUNnXBePheFEvRyujJhezXxBmAiJ+AERCE1+wdLTmJ95t390
	mO5g==
X-Received: by 10.180.23.71 with SMTP id k7mr4805133wif.5.1441127319707;
	Tue, 01 Sep 2015 10:08:39 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i3sm23891880wja.42.2015.09.01.10.08.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Sep 2015 10:08:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Sep 2015 19:08:52 +0200
Message-Id: <1441127332-29133-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <20150828182256.GA2488@jama>
References: <20150828182256.GA2488@jama>
Subject: [fido][PATCH] tzdata: update to 2015d
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
X-List-Received-Date: Tue, 01 Sep 2015 17:08:48 -0000

From: Armin Kuster <akuster808@gmail.com>

Changes affecting future time stamps

Egypt will not observe DST in 2015 and will consider canceling it
permanently.  For now, assume no DST indefinitely.
(Thanks to Ahmed Nazmy and Tim Parenti.)

Changes affecting past time stamps
America/Whitehorse switched from UTC-9 to UTC-8 on 1967-05-28, not
1966-07-01.  Also, Yukon's time zone history is documented better.
(Thanks to Brian Inglis and Dennis Ferguson.)

Change affecting past and future time zone abbreviations
The abbreviations for Hawaii-Aleutian standard and daylight times
have been changed from HAST/HADT to HST/HDT, as per US Government
Printing Office style.  This affects only America/Adak since 1983,
as America/Honolulu was already using the new style.

(From OE-Core rev: b9f366ab4e0a9cad69b631f402b9afa02d40f667)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata_2015b.bb | 6 ------
 meta/recipes-extended/tzdata/tzdata_2015d.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2015b.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2015d.bb

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
diff --git a/meta/recipes-extended/tzdata/tzdata_2015d.bb b/meta/recipes-extended/tzdata/tzdata_2015d.bb
new file mode 100644
index 0000000..d8e5f24
--- /dev/null
+++ b/meta/recipes-extended/tzdata/tzdata_2015d.bb
@@ -0,0 +1,6 @@
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "b595bdc4474b8fc1a15cffc67c66025b"
+SRC_URI[tzdata.sha256sum] = "8b9f5008277f09e251e97dba7813f56168d691115bda90ade4638d72f296d531"
+
+require tzdata.inc
-- 
2.5.0


