Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8BBD976B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 17:03:41 +0000 (UTC)
Received: by wicjd9 with SMTP id jd9so40192479wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YoC2gizN4Lw4mkVGtA2PVev7oGe2UBdZ7yd0qZMMJxY=;
	b=V4jjFmyzp9ElL7owYQwv9xqAA7joU7czKOAseeYHxFbAyiGUg70KMg+Pt+xop/Wt0l
	RuMcHDzcFiC4e7VDv/1pHIfH9Ah7F8eQxTtabU8aSdKCfO/M/LXuwV5SjuZW6+IlZGo0
	lVO9ae6IWaooyT5JHycMWlxX7fH6apU9Hl8jduGsGvPe/kX/jBNmenjBsAiydA7w8+WG
	eyzefmnHCyIaYnoHLFhZ47aOZq3daN/wQOf6gXLKhTpXMeSdTu/IA66v6T/34wIs8i1b
	dlXaRF167duyFXpF7VJ4LCofa94dKDk+3LCkE9hNwXznH5wIrnQD+Lxxyr2phEr+Fevc
	fYwQ==
X-Received: by 10.180.216.108 with SMTP id op12mr4678841wic.43.1441127019216; 
	Tue, 01 Sep 2015 10:03:39 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id f7sm3647689wij.17.2015.09.01.10.03.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Sep 2015 10:03:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Sep 2015 19:03:52 +0200
Message-Id: <1441127032-30264-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <20150828182256.GA2488@jama>
References: <20150828182256.GA2488@jama>
Subject: [fido][PATCH] tzcode: update to 2015d
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
X-List-Received-Date: Tue, 01 Sep 2015 17:03:44 -0000

From: Armin Kuster <akuster808@gmail.com>

Changes affecting code

    zic has some minor performance improvements.

(From OE-Core rev: 3ab7e247b0662a1791169f16424abec426885f80)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2015b.bb | 10 ----------
 meta/recipes-extended/tzcode/tzcode-native_2015d.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015b.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015d.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2015b.bb b/meta/recipes-extended/tzcode/tzcode-native_2015b.bb
deleted file mode 100644
index a4ec72d..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2015b.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-# note that we allow for us to use data later than our code version
-#
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2015b.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "f073a7c9bca7f9fe408491f826e92968"
-SRC_URI[tzcode.sha256sum] = "e668f1235b998c90e43ecc93c8535728c65bb01d6bb93d22467e04b5ffa35d76"
-SRC_URI[tzdata.md5sum] = "75571bb17c7b6be88a9f8872e45bc726"
-SRC_URI[tzdata.sha256sum] = "556ac1a5b3a371adc1ad4e77138f78ddd7f8ddd7bc2b52545924598c7dc8ad62"
-require tzcode-native.inc
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2015d.bb b/meta/recipes-extended/tzcode/tzcode-native_2015d.bb
new file mode 100644
index 0000000..44a9f03
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2015d.bb
@@ -0,0 +1,11 @@
+# note that we allow for us to use data later than our code version
+#
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2015d.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "4008a3abc025a398697b2587c48258b9"
+SRC_URI[tzcode.sha256sum] = "221af54ec5c42eaf0101159ffe1256a883d1c14c46228d42774c656a56317128"
+SRC_URI[tzdata.md5sum] = "b595bdc4474b8fc1a15cffc67c66025b"
+SRC_URI[tzdata.sha256sum] = "8b9f5008277f09e251e97dba7813f56168d691115bda90ade4638d72f296d531"
+
+require tzcode-native.inc
-- 
2.5.0


