Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id B58AA6AC9D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jul 2014 20:09:47 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id ik5so489333vcb.20
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jul 2014 13:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=+mz4XZT3CvUjou5q9XV2G8c/N+2SeNFid6cf+Mvj3ks=;
	b=aC9YcrgQeXeIFXmNSv53EEmbD7QkV4Uw246KdBMlGJukmhpbIfszyEEd5rQgDLwFf1
	UQn7lDK1juVo+BRA//X1EtsJlJldvTxNCfaZZsvzCWPolYj1dFqMaQJrIjuz2pyrc+RL
	auqJZS2sERxa6vVL8F/XvJrmsYvgEFq6q9/Dc0VWvoHopsCNx8tR9In2+eE/B79VUoeN
	kCMphvW5FdC5yJYuCaODU1K2QX2u7i2ufNoVlmdvdBhdBXhrdWri+oHPGdvBl+aaAWIo
	IfIb1Q+5CF7z1FTN8q5rACgxJe5sirVqm6HE50C4mkZptXZqcb9y3NjNIxiY7OD9elCl
	oOCA==
X-Received: by 10.220.81.194 with SMTP id y2mr3182758vck.29.1406405388933;
	Sat, 26 Jul 2014 13:09:48 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id
	sc19sm3584796veb.13.2014.07.26.13.09.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Jul 2014 13:09:48 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 7C6031C1FB0B1; Sat, 26 Jul 2014 17:09:44 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 26 Jul 2014 17:09:43 -0300
Message-Id: <1406405383-13462-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] directfb-examples: Fix building with new autoconf
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
X-List-Received-Date: Sat, 26 Jul 2014 20:09:50 -0000

This fixes the following build error:

,----
| .../configure: line 4229: syntax error near unexpected token `DIRECTFB,'
| .../configure: line 4229: `PKG_CHECK_MODULES(DIRECTFB, directfb >= $DIRECTFB_REQUIRED_VERSION, WATER=`$PKG_CONFIG --variable=water directfb` ,'
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../configure.in-Fix-string-argument-syntax.patch  | 28 ++++++++++++++++++++++
 .../directfb/directfb-examples_1.7.0.bb            |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-graphics/directfb/directfb-examples/configure.in-Fix-string-argument-syntax.patch

diff --git a/meta/recipes-graphics/directfb/directfb-examples/configure.in-Fix-string-argument-syntax.patch b/meta/recipes-graphics/directfb/directfb-examples/configure.in-Fix-string-argument-syntax.patch
new file mode 100644
index 0000000..0717ea6
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb-examples/configure.in-Fix-string-argument-syntax.patch
@@ -0,0 +1,28 @@
+From 88077ed156a714f32bb408f422278d61611ffd41 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Sat, 26 Jul 2014 16:57:46 -0300
+Subject: [PATCH] configure.in: Fix string argument syntax
+
+Upstream-Status: Submitted
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ configure.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index bfe1b82..e939bbd 100644
+--- a/configure.in
++++ b/configure.in
+@@ -65,7 +65,7 @@ fi)
+ 
+ DIRECTFB_REQUIRED_VERSION=1.4.14
+ 
+-PKG_CHECK_MODULES(DIRECTFB, directfb >= $DIRECTFB_REQUIRED_VERSION,[ WATER=`$PKG_CONFIG --variable=water directfb` ],
++PKG_CHECK_MODULES([DIRECTFB], directfb >= $DIRECTFB_REQUIRED_VERSION,[ WATER=`$PKG_CONFIG --variable=water directfb` ],
+ 	AC_MSG_ERROR([$DIRECTFB_PKG_ERRORS
+ *** DirectFB $DIRECTFB_REQUIRED_VERSION or newer is required. The latest version
+ *** of DirectFB is available from http://www.directfb.org/.]))
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb b/meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb
index 6057596..9c3e8bf 100644
--- a/meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb
+++ b/meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb
@@ -8,6 +8,7 @@ LICENSE = "MIT"
 
 SRC_URI = " \
            http://www.directfb.org/downloads/Extras/DirectFB-examples-${PV}.tar.gz \
+           file://configure.in-Fix-string-argument-syntax.patch \
           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecf6fd2b19915afc4da56043926ca18f"
-- 
2.0.0


