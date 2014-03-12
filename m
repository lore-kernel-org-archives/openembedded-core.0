Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 076F86F81D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 05:45:18 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id y13so595547pdi.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 22:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gI5URUKakKiDHfG5kU19fv+RKUKM6MNH5/qOZ+Tku2c=;
	b=IPn7Khq0DuvO44TzcBYQTq0S9F297DibyTL4ZhR272LKbFV7+RcXVyAwHhbsTCMKoh
	0j6LuLk03crKNAjsBYaZu7dwgCDVrkz9M+gH5P8YZXtf+ExxViXKEC4QKQk7TBUjJ9vx
	nvDIpa33l9WsjFJMDjw7Cft9o09bscDILWo33CSi2QMB+hyr3Iky7fZJZenDyhIF4/Qo
	+sOQoS90YlUkuLyAcrexWhSF9IXcuvBfd6OC/GPps8CLpA6/rD/joUggIE+lmzuG/EyC
	uaarh9nGL7vuAiYNUrWZvOGKgWAtZPZF+Kde5IF3Mq3Ppip9KHWw18MWlYYhxeraTQN3
	zzhw==
X-Received: by 10.66.119.136 with SMTP id ku8mr2564458pab.121.1394603118911;
	Tue, 11 Mar 2014 22:45:18 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	id10sm2308393pbc.35.2014.03.11.22.45.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Mar 2014 22:45:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Mar 2014 22:46:50 -0700
Message-Id: <1394603210-678-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] eglibc: Update SRC_URI to point to final download location
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
X-List-Received-Date: Wed, 12 Mar 2014 05:45:21 -0000

We have been using interim location for the src_uri
now the tarballs are placed in usual location so update
the src_uri accordingly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/cross-localedef-native_2.19.bb | 2 +-
 meta/recipes-core/eglibc/eglibc_2.19.bb                 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.19.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.19.bb
index d3f43bd..3ce0e1d 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.19.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.19.bb
@@ -16,7 +16,7 @@ inherit autotools
 # pick up an eglibc patch
 FILESPATH = "${FILE_DIRNAME}/eglibc-${PV}"
 
-SRC_URI = "http://sakrah.homelinux.org/files/eglibc-${PV}-svnr25243.tar.bz2 \
+SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr25243.tar.bz2 \
 	   file://fix_for_centos_5.8.patch;patchdir=.. \
 	  "
 SRC_URI[md5sum] = "197836c2ba42fb146e971222647198dd"
diff --git a/meta/recipes-core/eglibc/eglibc_2.19.bb b/meta/recipes-core/eglibc/eglibc_2.19.bb
index 7e582b6..2bedf26 100644
--- a/meta/recipes-core/eglibc/eglibc_2.19.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.19.bb
@@ -2,7 +2,7 @@ require eglibc.inc
 
 DEPENDS += "gperf-native kconfig-frontends-native"
 
-SRC_URI = "http://sakrah.homelinux.org/files/eglibc-${PV}-svnr25243.tar.bz2 \
+SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr25243.tar.bz2 \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://mips-rld-map-check.patch \
-- 
1.9.0


