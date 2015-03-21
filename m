Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0C38060034
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Mar 2015 14:42:13 +0000 (UTC)
Received: by pabxg6 with SMTP id xg6so126529067pab.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Mar 2015 07:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Q5iX+5NxDJIvqB3eakK5Ca0JkkriVlym7Sm1aQNpXSY=;
	b=LAKmSxVnGOZffBNyZ6ve1q01SSStcprzbtUtRy3qTWek/1ZXafL+KpnRhtYJ+JDpg1
	aX+3lXVQT47dbA2cqSfPQL9w+jeirBmvWU5oHt6BEy6xy7lnJ3wag3rhIEJ50Anr7Mop
	kt/bAKnvq0dd3HzR15C2yRquuWGLniBz9du1EXTskOnGXfVuhzqjPWt8+Cqi8Wj7ufqY
	kDkN+nSj3nNcYRZPphARze1iSoL7cNY+dRHNk1UUe+6v1BWp47/Q02aiBBcfjtOuEUTo
	SiBUO4Uwj4QITIt6AVNMBLQbqnjU8egR9BhREKQlzUUfuBKjGv2N7Gb7ET8q/g07S+zT
	FfoA==
X-Received: by 10.68.201.227 with SMTP id kd3mr5489731pbc.95.1426948934464;
	Sat, 21 Mar 2015 07:42:14 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id q4sm11846901pdj.2.2015.03.21.07.42.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 Mar 2015 07:42:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Mar 2015 07:42:08 -0700
Message-Id: <1426948929-10625-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] tzcode: update to 2015b
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
X-List-Received-Date: Sat, 21 Mar 2015 14:42:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes affecting code

Fix integer overflow bug in reference 'mktime' implementation.
(Problem reported by Jörg Richter.)

Allow -Dtime_tz=time_t compilations, and allow -Dtime_tz=... libraries
to be used in the same executable as standard-library time_t functions.
(Problems reported by Bradley White.)

Changes affecting commentary

Cite the recent Mexican decree changing Quintana Roo's time zone.
(Thanks to Carlos Raúl Perasso.)

Likewise for the recent Chilean decree.  (Thanks to Eduardo Romero Urra.)

Update info about Mars time.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2015a.bb | 10 ----------
 meta/recipes-extended/tzcode/tzcode-native_2015b.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015a.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015b.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2015a.bb b/meta/recipes-extended/tzcode/tzcode-native_2015a.bb
deleted file mode 100644
index a0a31d6..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2015a.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-# note that we allow for us to use data later than our code version
-#
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2015a.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "8f375ede46ae137fbac047ac431bda37"
-SRC_URI[tzcode.sha256sum] = "885bab11f286852f34030d7a86ede7d4126319ca74b8ee22be8ca7c17d72dd19"
-SRC_URI[tzdata.md5sum] = "4ed11c894a74a5ea64201b1c6dbb8831"
-SRC_URI[tzdata.sha256sum] = "c52490917d00a8e7fc9b5f0b1b65ef6ec76d612b5b20c81bf86a04147af18e4c"
-require tzcode-native.inc
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2015b.bb b/meta/recipes-extended/tzcode/tzcode-native_2015b.bb
new file mode 100644
index 0000000..a4ec72d
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2015b.bb
@@ -0,0 +1,10 @@
+# note that we allow for us to use data later than our code version
+#
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2015b.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "f073a7c9bca7f9fe408491f826e92968"
+SRC_URI[tzcode.sha256sum] = "e668f1235b998c90e43ecc93c8535728c65bb01d6bb93d22467e04b5ffa35d76"
+SRC_URI[tzdata.md5sum] = "75571bb17c7b6be88a9f8872e45bc726"
+SRC_URI[tzdata.sha256sum] = "556ac1a5b3a371adc1ad4e77138f78ddd7f8ddd7bc2b52545924598c7dc8ad62"
+require tzcode-native.inc
-- 
1.9.1


