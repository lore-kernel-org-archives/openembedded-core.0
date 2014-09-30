Return-Path: <akuster808@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 47F3765DEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 15:47:20 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id a13so1475048igq.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 08:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TU87aphaF64r9PCZeWKgdkh5vOFM8r4TV5H4ESutiJM=;
	b=fL5zjBkEZWhvCMy6jo7a77OGqn8ks58cobsyXl2ZczWjczGkuLzsM3LeArbQACJuvN
	sgNKP6tiWlBZ/aYT1eNs1LKhLyoWFvw0dXvPDWn1Sm1FoKK1DXbhofm5p2dLMdLC6wIG
	KaTx9dPy0sk0JgGoCoRM33UqUDgA0zS+POdgsgNULqe1XM0DtvLF45CtPkaItSns+vcH
	UezuSacGrwYMnyd24gVGBqRyfj16U1yJaofwKz3tbzb/LG5bMUbP/AQkNOLq+w2hMBoH
	BS4f2MHYnr6/dScIJR0zx2TQAcpTISwER51O3dSluwgjEvVmxUTZliZ55v9VOdWBCa5F
	ldlA==
X-Received: by 10.50.78.70 with SMTP id z6mr9272571igw.23.1412092041698;
	Tue, 30 Sep 2014 08:47:21 -0700 (PDT)
Received: from localhost.localdomain (75-163-154-89.clsp.qwest.net.
	[75.163.154.89]) by mx.google.com with ESMTPSA id
	hg4sm13331857igb.15.2014.09.30.08.47.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Sep 2014 08:47:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Sep 2014 08:47:15 -0700
Message-Id: <1412092036-30364-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1412092036-30364-1-git-send-email-akuster808@gmail.com>
References: <1412092036-30364-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 1/2] tzcode-native: update to 2014h
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
X-List-Received-Date: Tue, 30 Sep 2014 15:47:23 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2014g.bb | 11 -----------
 meta/recipes-extended/tzcode/tzcode-native_2014h.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014g.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014h.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014g.bb b/meta/recipes-extended/tzcode/tzcode-native_2014g.bb
deleted file mode 100644
index 55e591a..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2014g.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-# note that we allow for us to use data later than our code version
-#
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2014g.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "f154679d48b724fe191efc19b55abd24"
-SRC_URI[tzcode.sha256sum] = "df555fa4ad57cc7394812941d6d037b8c7ecea55e9916eaf4cd2adcb3403af7a"
-SRC_URI[tzdata.md5sum] = "f9f59425e55b21d2e52bb3a95fc17b8d"
-SRC_URI[tzdata.sha256sum] = "5547d5b7a982f7f53fffe68cb2a13692553f591a17d58c8ef15b20679d82a270"
-
-require tzcode-native.inc
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014h.bb b/meta/recipes-extended/tzcode/tzcode-native_2014h.bb
new file mode 100644
index 0000000..87c5f23
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2014h.bb
@@ -0,0 +1,11 @@
+# note that we allow for us to use data later than our code version
+#
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2014h.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "8e7741fc769ebdd94d95e5f2c3adbb60"
+SRC_URI[tzcode.sha256sum] = "a4d9788a1bb0aa314eae4986ee991425b83ecc47da0e84f626735846be1dbf44"
+SRC_URI[tzdata.md5sum] = "ed05111948beba8a0f30956baa46b272"
+SRC_URI[tzdata.sha256sum] = "e78152f616fb07c1dea124215ffca57d0de66d8897e00896086542e3de30f69e"
+
+require tzcode-native.inc
-- 
1.9.1


