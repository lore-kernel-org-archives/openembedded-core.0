Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id CEE976ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 05:02:58 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so125625904pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 22:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=9mm7f2wTwrLG4mFzSEnZEENKSpQZld9fifIW8jhL0cs=;
	b=DnIdLyjVbfI6ls2oVXbJfdCQFAQZT4nCBxTBTuyFDIlvzMB8Ts5ABnzl5MLcb0It3O
	WmtAYNM6JiKTS96rsrM2tT1Blvb96vadnDwagII0tNg8XrLN0OJcCvUHk4Ee51SoBeHk
	Dt0zIyjSmRcxZnpFexOhlGxOmCecsSpyFpf8CxhruxOjragEoJx9NzafqqFqIhxf8ah2
	EKcoqVfI8zj7RyAEflOoImx3mt4CkanWCG5zMcY7UTCdEPNnJrVzjNKelfGI31GI4htW
	MUoFwQyWAm752g4xaoK0k1uLph7I45GmGZuKFDWvxVtnHb1kD8po7Sx9r5eXD+F2p/vL
	Z2Pw==
X-Received: by 10.70.133.194 with SMTP id pe2mr32959273pdb.57.1428987779489;
	Mon, 13 Apr 2015 22:02:59 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id x1sm8893948pdp.1.2015.04.13.22.02.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Apr 2015 22:02:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Apr 2015 22:02:46 -0700
Message-Id: <1428987767-763-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 1/2] tzcode: update to 2015c
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
X-List-Received-Date: Tue, 14 Apr 2015 05:02:59 -0000

Changes affecting commentary
 Mention the TZUpdater tool.
 Mention "The Time Now".  (Thanks to Brandon Ramsey.)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2015b.bb | 10 ----------
 meta/recipes-extended/tzcode/tzcode-native_2015c.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015b.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015c.bb

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
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2015c.bb b/meta/recipes-extended/tzcode/tzcode-native_2015c.bb
new file mode 100644
index 0000000..02cb9bc
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2015c.bb
@@ -0,0 +1,11 @@
+# note that we allow for us to use data later than our code version
+#
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2015c.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "182c85e99be2bcc6b77d9956c8c0dcce"
+SRC_URI[tzcode.sha256sum] = "7feeb1a60dff8b179c884f6e3aa7684606f4eaeb7f7ecc61a6bb81e3e38af42e"
+SRC_URI[tzdata.md5sum] = "4b4a3e344786198c46909e5afde08788"
+SRC_URI[tzdata.sha256sum] = "860fac5f5f57f7a2dfc1ba682dbd1f5c0f0b597f761571277b6ed6561e22365a"
+
+require tzcode-native.inc
-- 
2.3.5


