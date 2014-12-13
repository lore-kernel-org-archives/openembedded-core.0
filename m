Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 277B171F2C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 16:26:16 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id eu11so9079895pac.36
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 08:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=ubHT8Jnelo+z3SqSYI84bZQKQjjmuaMzzW6iqaln9+M=;
	b=LUWNKhBgAcsNXBH740RqBlZFTSe29rkCRtcNWPMe87dYSoh0QmFMJ1hnq4h7nYW33v
	gJ9cYw3cxhPDgYtjt8oAMTeLgn1VYFrhPcunGOGT5k6LoibJ2SAvwHj+tUKac+0xHc+h
	82E8sf0TxxLUYCDi1b/pvn8UB4OK7oovHkyLTaT/oAfX+hI7+cK5ToihqmVcJLOZ7+Gg
	Qx4FLEpq8R8+iNT72NKkD8hqgR6xPz44BLWZ6DlA2rX2RM7buqpK3Dam2ufrOG7TTEuV
	Ob8Q1njRO1uXjG11KYkw2g/rLI++k6/TFL+lW8Br/MLLWtjwjs3dD5MqPUxrcx03kCdA
	xoOw==
X-Received: by 10.66.66.68 with SMTP id d4mr33916195pat.79.1418487977197;
	Sat, 13 Dec 2014 08:26:17 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id m5sm4640821pdi.24.2014.12.13.08.26.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 13 Dec 2014 08:26:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Dec 2014 08:26:11 -0800
Message-Id: <1418487971-12276-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [[PATCH] gnutls: upgrade to 3.3.11
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
X-List-Received-Date: Sat, 13 Dec 2014 16:26:20 -0000

this also includes a fix for CVE-2014-8564.

see http://www.gnutls.org/security.html for CVE-2014-3566 "POODLE" statement.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gnutls/gnutls_3.3.11.bb | 6 ++++++
 meta/recipes-support/gnutls/gnutls_3.3.5.bb  | 7 -------
 2 files changed, 6 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls_3.3.11.bb
 delete mode 100644 meta/recipes-support/gnutls/gnutls_3.3.5.bb

diff --git a/meta/recipes-support/gnutls/gnutls_3.3.11.bb b/meta/recipes-support/gnutls/gnutls_3.3.11.bb
new file mode 100644
index 0000000..320c510
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls_3.3.11.bb
@@ -0,0 +1,6 @@
+require gnutls.inc
+
+SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
+           "
+SRC_URI[md5sum] = "b657e3010c10cae2244e7ce79ee3d446"
+SRC_URI[sha256sum] = "aef28d629b6ba824bd435f9b23506525e657e3746d4aa021296b13cbaaa6ae71"
diff --git a/meta/recipes-support/gnutls/gnutls_3.3.5.bb b/meta/recipes-support/gnutls/gnutls_3.3.5.bb
deleted file mode 100644
index b3daa49..0000000
--- a/meta/recipes-support/gnutls/gnutls_3.3.5.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require gnutls.inc
-
-SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
-           "
-
-SRC_URI[md5sum] = "1f396dcf3c14ea67de7243821006d1a2"
-SRC_URI[sha256sum] = "48f34ae032692c498e782e9f1369506572be40ecf7f3f3604b0b00bad1b10477"
-- 
1.9.1


