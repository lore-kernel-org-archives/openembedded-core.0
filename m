Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 23CD870F83
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 18:50:05 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id ey11so8908988pad.21
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 11:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aec0rc9vK70uXkh/CDptWyBKaHgzMV0qbH1m4T8eHGc=;
	b=bY3Hus9WG7kxhto8C0tkwBzhfHbcIyfIyOQrfwja3FMcFa6mLVHWkXhjoMmtMbZqP9
	C945QRoyS3HO0yqsweyNbAOfxrZBRkfk0hFbLTQlsiRoW6KQKMhDdHDqSC8qo3YDLr1P
	dr2XwhmaQ13G8H28CaftepVy4lXVDa8YTDKEGZ9QR6+NVTuwpd9facby+F4nU7X8/8Kq
	Hqw6QD8j3pzZyiHgTQvV2mKObPLHlH2VaUkJ9Uq6wT5WWfuUwsgMb2i+ep647+3oM2Lu
	gMogcshI/8t7z0sPEMbgJv5utVNl+kIYiNsrSBhg9PuWK9+/2rkPwypofqQug8YT77Bz
	Cm5A==
X-Received: by 10.70.103.8 with SMTP id fs8mr25771944pdb.81.1409424606181;
	Sat, 30 Aug 2014 11:50:06 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id c2sm5123927pds.32.2014.08.30.11.50.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Aug 2014 11:50:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Aug 2014 11:50:00 -0700
Message-Id: <1409424600-22218-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1409424600-22218-1-git-send-email-akuster808@gmail.com>
References: <1409424600-22218-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] tzcode: update to 2014g
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
X-List-Received-Date: Sat, 30 Aug 2014 18:50:06 -0000

The readme md5sum changed do you wording changes.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzcode/tzcode-native.inc      |  2 +-
 meta/recipes-extended/tzcode/tzcode-native_2014f.bb | 11 -----------
 meta/recipes-extended/tzcode/tzcode-native_2014g.bb | 11 +++++++++++
 3 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014f.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014g.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native.inc b/meta/recipes-extended/tzcode/tzcode-native.inc
index f034333..4af1e20 100644
--- a/meta/recipes-extended/tzcode/tzcode-native.inc
+++ b/meta/recipes-extended/tzcode/tzcode-native.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 LICENSE = "PD & BSD"
 
-LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=0b7570113550eb5d30aa4bd220964b8f"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=d0ff93a73dd5bc3c6e724bb4343760f6"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014f.bb b/meta/recipes-extended/tzcode/tzcode-native_2014f.bb
deleted file mode 100644
index d9557ea..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2014f.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-# note that we allow for us to use data later than our code version
-#
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2014f.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "1e15be52900cd49e93f093d4731fec96"
-SRC_URI[tzcode.sha256sum] = "8c12b56abf614722f0ab7cfc502492063b2c7c5de19563540132b81709ac2555"
-SRC_URI[tzdata.md5sum] = "f333b2e8f876221a97871cae0c188aa5"
-SRC_URI[tzdata.sha256sum] = "eed690a72124f380bcb14947d398a7a482acb9ab792ae78bd4554e52c5ca2001"
-
-require tzcode-native.inc
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014g.bb b/meta/recipes-extended/tzcode/tzcode-native_2014g.bb
new file mode 100644
index 0000000..55e591a
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2014g.bb
@@ -0,0 +1,11 @@
+# note that we allow for us to use data later than our code version
+#
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2014g.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "f154679d48b724fe191efc19b55abd24"
+SRC_URI[tzcode.sha256sum] = "df555fa4ad57cc7394812941d6d037b8c7ecea55e9916eaf4cd2adcb3403af7a"
+SRC_URI[tzdata.md5sum] = "f9f59425e55b21d2e52bb3a95fc17b8d"
+SRC_URI[tzdata.sha256sum] = "5547d5b7a982f7f53fffe68cb2a13692553f591a17d58c8ef15b20679d82a270"
+
+require tzcode-native.inc
-- 
1.9.1


