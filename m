Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB8A605D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 21:38:41 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so59406116pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 14:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=meZaXQxFnTIOTRSztA+Wte8qv6sjXMUKnSARUFp8Fqc=;
	b=Gh2SalkKGqVvYpLR3Ilv+MLyK1qoRPnOL15rWtR8qFRDRAbd1kzd8zT1ofI+Lwrg7+
	ZZM34NHp3pien8p7t92ayVTIlkOgnqLBMtBOMlJOQudkHhgA9XGJ2DdhQxa8urgM3AgD
	VREEp8SMsNHzAqCPtYV739/ruaaZbvZh950UCm/ghSGbsF9ZyQMi5/HlkSl49Q5KcE7B
	NppjiUuautCGcGHoa4Bh40vGjinwupoedG2ch1faZxz+ANtISlFbYrXoPXJ8nibKOEMW
	mz4EP9XUL92YsUSwYKkegpdpVpoOr0bgbQQRN0nYVkutZjVEKYZ6gexh1i7iBa68QJ8G
	M0Cw==
X-Received: by 10.68.176.3 with SMTP id ce3mr743998pbc.122.1429911523406;
	Fri, 24 Apr 2015 14:38:43 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id m4sm12027022pdo.78.2015.04.24.14.38.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Apr 2015 14:38:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Apr 2015 14:38:38 -0700
Message-Id: <1429911519-26068-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 1/2] tzcode: update to 2014d
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
X-List-Received-Date: Fri, 24 Apr 2015 21:38:43 -0000

Changes affecting code

    zic has some minor performance improvements.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2015c.bb | 11 -----------
 meta/recipes-extended/tzcode/tzcode-native_2015d.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015c.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015d.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2015c.bb b/meta/recipes-extended/tzcode/tzcode-native_2015c.bb
deleted file mode 100644
index 02cb9bc..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2015c.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-# note that we allow for us to use data later than our code version
-#
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2015c.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "182c85e99be2bcc6b77d9956c8c0dcce"
-SRC_URI[tzcode.sha256sum] = "7feeb1a60dff8b179c884f6e3aa7684606f4eaeb7f7ecc61a6bb81e3e38af42e"
-SRC_URI[tzdata.md5sum] = "4b4a3e344786198c46909e5afde08788"
-SRC_URI[tzdata.sha256sum] = "860fac5f5f57f7a2dfc1ba682dbd1f5c0f0b597f761571277b6ed6561e22365a"
-
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
2.3.5


