Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id A6DE6605F2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 06:09:15 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id rl6so1599644pac.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 23:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=7re1PqNItJaVFawXVvItYCuO+IGroiq+J38zGnw7jLI=;
	b=ilVvWoHWukm1WpCssLdX3FrO86D5ydyJoRC7laIXvkMypW+tC3uZMwVemPs9Z6UiH1
	9wJpOhJBdXixtS+45WUzDzFa+5HnUicqZlz3RI8xL9dfKR0hnXOYnvu/KFAzlAhhcfvh
	VuamqpMF4R2B0y3Mb8XGEzt3g03D42p6Z3Hqtme+dbgTQ2jbxpT3h8QVcBPxqvYACS8m
	CKl1lYtkh5PQQnHYKHUGUVW0bJmKbwm24mKbeIDIU0DEdQ9N6zdlPZwTtD9ZvvtIZ+YK
	0UJxOLJx5Ox7lAcwxSU2IJ7qZHsuWqxr9FQ/jToJZJwOj95S0Xn8ZzEgbmjQq9QzdhWG
	AGjA==
X-Received: by 10.68.191.5 with SMTP id gu5mr5080950pbc.191.1374041356459;
	Tue, 16 Jul 2013 23:09:16 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id wg6sm5900500pbc.3.2013.07.16.23.09.15
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Jul 2013 23:09:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2013 23:09:04 -0700
Message-Id: <1374041344-1701-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1374041344-1701-1-git-send-email-raj.khem@gmail.com>
References: <1374041344-1701-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] eglibc-2.18: Update to latest snapshot
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
X-List-Received-Date: Wed, 17 Jul 2013 06:09:15 -0000

Works on all supposted qemu machines

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/cross-localedef-native_2.18.bb          |    6 +++---
 meta/recipes-core/eglibc/eglibc_2.18.bb            |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb
index 790f259..072b807 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb
@@ -16,11 +16,11 @@ inherit autotools
 # pick up an eglibc patch
 FILESPATH = "${FILE_DIRNAME}/eglibc-${PV}"
 
-SRC_URI = "http://sakrah.dontexist.org/files/eglibc-${PV}-svnr23424.tar.bz2 \
+SRC_URI = "http://sakrah.dontexist.org/files/eglibc-${PV}-svnr23532.tar.bz2 \
 	   file://fix_for_centos_5.8.patch;patchdir=.. \
 	  "
-SRC_URI[md5sum] = "e7bb555f34e782d428de3482d203df8d"
-SRC_URI[sha256sum] = "3824e699a91a34aebbe80bae9993b569616fad2056e4f6430cd455d604fb1d9c"
+SRC_URI[md5sum] = "8c83078851c44089a019c626d51c51bb"
+SRC_URI[sha256sum] = "ecd3167d7d417c05b10ea7ab8e3acbc05f4bc2b389b6fae9c186bc0fd34c3ff1"
 
 S = "${WORKDIR}/eglibc-${PV}/localedef"
 
diff --git a/meta/recipes-core/eglibc/eglibc_2.18.bb b/meta/recipes-core/eglibc/eglibc_2.18.bb
index ce416f7..2e1d380 100644
--- a/meta/recipes-core/eglibc/eglibc_2.18.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.18.bb
@@ -2,7 +2,7 @@ require eglibc.inc
 
 DEPENDS += "gperf-native kconfig-frontends-native"
 
-SRC_URI = "http://sakrah.dontexist.org/files/eglibc-${PV}-svnr23424.tar.bz2 \
+SRC_URI = "http://sakrah.dontexist.org/files/eglibc-${PV}-svnr23532.tar.bz2 \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://mips-rld-map-check.patch \
@@ -27,8 +27,8 @@ SRC_URI = "http://sakrah.dontexist.org/files/eglibc-${PV}-svnr23424.tar.bz2 \
            file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
            file://fix-tibetian-locales.patch \
           "
-SRC_URI[md5sum] = "e7bb555f34e782d428de3482d203df8d"
-SRC_URI[sha256sum] = "3824e699a91a34aebbe80bae9993b569616fad2056e4f6430cd455d604fb1d9c"
+SRC_URI[md5sum] = "8c83078851c44089a019c626d51c51bb"
+SRC_URI[sha256sum] = "ecd3167d7d417c05b10ea7ab8e3acbc05f4bc2b389b6fae9c186bc0fd34c3ff1"
 
 LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-- 
1.7.9.5


