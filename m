Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id D6BEE6BCA4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 03:00:44 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id r9so11417720ljg.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 20:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=aywlOH6MaYIbX1cil8gPDJMp+y80nVIrpFItfWNBkq4=;
	b=uX+LE2al32xMYiQBU5X51oCDtweV5PYhhUb8tj5Fp3HwPVi0qsTwIrMh+hpMeQwPyy
	o9P7cu+maxp9fsbLBvWO+AzE47MZWatymDUJmnhtMzQozR2LLQL0OfPq/Utg1OPhG60g
	xen/gk1Z22nmOoWGSfAPa4TjAMz87uY5q7/rapJpGTQbNI4saV1cL4JJAvvwFvpfzkua
	q8iaMSk4mnWKp9SiQjlQT6pJp7V9z3F2vGUTkJobVV47RgBq5F/nrRPZfviul9bIL+JK
	JXyznd7vWkrta8tT+Iz6ZCvzDDofelpWi8gPS94Qa3M7c8Nmr9j09k6THHC8hOo+7xEA
	bxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aywlOH6MaYIbX1cil8gPDJMp+y80nVIrpFItfWNBkq4=;
	b=sx1qIRnrBOm9VHMNCEUXgD7RyVDbejfCINqJEZLhgHmyVq1gw99kWA8212o4Akoxd1
	4oRAIxrqf6Y0NmxRykv1Nd2YLj5ZT1L8j0ffED0nl/RJ13sWy/SD72sr0GbRjrj52WMZ
	d7K3C2D2uZL8QZfeA1JhBvfZYoEtb46pCweJyX0L+L+xr/Magb6u32ktSHGMiUXMMW+2
	hDgvVVqQ2Iiy1aaPEl0XtGniUQmTqvBDxk1fVVuhk/w1DHNOnakI4bX2sfBArObw2j9d
	tQZm2Bc/O366KYCAemxpnnsKejL8+Kro65sSqyhgRgFq9DKymrFkaSR2gAJtDiwEXV3N
	VH4g==
X-Gm-Message-State: APjAAAX/gpHBcX6DyvP3v2TRY03GRMQreG/A9HQj060dHIOV4LnukAL2
	XCWkZILnigWQJTv/rbuP6P0WQI/mkOI=
X-Google-Smtp-Source: APXvYqwK2FVL69LQZxBOaI/ASio3l2kyxL5zhJVnXYujp7GT1mCvRin9aOot/kp0eC75UPk0RACWBg==
X-Received: by 2002:a2e:8847:: with SMTP id z7mr12651811ljj.51.1561950044994; 
	Sun, 30 Jun 2019 20:00:44 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	u15sm2977080lji.61.2019.06.30.20.00.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 30 Jun 2019 20:00:44 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 05:00:42 +0200
Message-Id: <20190701030042.23878-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] quilt: update to 0.66
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
X-List-Received-Date: Mon, 01 Jul 2019 03:00:45 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../quilt/{quilt-native_0.65.bb => quilt-native_0.66.bb}  | 0
 meta/recipes-devtools/quilt/quilt.inc                     | 4 ++--
 .../quilt/0001-tests-Allow-different-output-from-mv.patch | 8 ++++----
 .../quilt/{quilt_0.65.bb => quilt_0.66.bb}                | 0
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/quilt/{quilt-native_0.65.bb => quilt-native_0.66.bb} (100%)
 rename meta/recipes-devtools/quilt/{quilt_0.65.bb => quilt_0.66.bb} (100%)

diff --git a/meta/recipes-devtools/quilt/quilt-native_0.65.bb b/meta/recipes-devtools/quilt/quilt-native_0.66.bb
similarity index 100%
rename from meta/recipes-devtools/quilt/quilt-native_0.65.bb
rename to meta/recipes-devtools/quilt/quilt-native_0.66.bb
diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index dbf722be2a..dcba62c84b 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -13,8 +13,8 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
 
 SRC_URI_append_class-target = " file://gnu_patch_test_fix_target.patch"
 
-SRC_URI[md5sum] = "c67ba0228f5b7b8bbe469474661f92d6"
-SRC_URI[sha256sum] = "f6cbc788e5cbbb381a3c6eab5b9efce67c776a8662a7795c7432fd27aa096819"
+SRC_URI[md5sum] = "6800c2404a2c0598ab2eff92a636ba70"
+SRC_URI[sha256sum] = "314b319a6feb13bf9d0f9ffa7ce6683b06919e734a41275087ea457cc9dc6e07"
 
 inherit autotools-brokensep ptest
 
diff --git a/meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch b/meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch
index 21219a0bba..6d0f4aedfd 100644
--- a/meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch
+++ b/meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch
@@ -1,4 +1,4 @@
-From 1530138960cfafbeefb95f2a760954c00b4d0ef0 Mon Sep 17 00:00:00 2001
+From e9fa816677993e520adff8bba26cb3e71f5a6665 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Wed, 29 Mar 2017 15:11:59 +0300
 Subject: [PATCH] tests: Allow different output from mv
@@ -12,18 +12,18 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/test/failbackup.test b/test/failbackup.test
-index 37046f7..fce6725 100644
+index 5f0f54f..0902b12 100644
 --- a/test/failbackup.test
 +++ b/test/failbackup.test
 @@ -16,7 +16,7 @@ What happens when refresh fails because of a permission error?
  	$ cat > test.txt
  	< This is updated test.txt.
  	$ quilt refresh --backup
--	>~ mv: cannot move [`']?%{P}test.diff'? to [`']?%{P}test.diff~'?: Permission denied
+-	>~ mv: cannot move [`']?patches/test.diff'? to [`']?patches/test.diff~'?: Permission denied
 +	>~ mv: .*: Permission denied
  	$ echo %{?}
  	> 1
  
 -- 
-2.1.4
+2.17.1
 
diff --git a/meta/recipes-devtools/quilt/quilt_0.65.bb b/meta/recipes-devtools/quilt/quilt_0.66.bb
similarity index 100%
rename from meta/recipes-devtools/quilt/quilt_0.65.bb
rename to meta/recipes-devtools/quilt/quilt_0.66.bb
-- 
2.17.1


