Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 67CAB6BF37
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 10:30:56 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id r1so87319160wrl.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 03:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/OQkVMY5CiRYwogWa18sW56siHGJeDQVqKwAPDTi3io=;
	b=0In/xP83SyR4SDOTo3AWezqSvpDOrXo2uGdtGn0t0anTnwrrDDmq4M13MWORQv3u2C
	jgcOAbX6RrqlrhVHTPrzU0zRVivFvgbxBGJ7LkP5ZxGk7e5B/dd8yhHxR9v1qhIq00BY
	rvYP5eYlcUayAit8gTDnmBgRNDZS3S7Rfqfj6Mdk0xuzmdKcG7BssB0eB+jwkKD1sNO1
	C5jFU1aurQG5zzZ26X8S3C9oqswiqt1Xo5OZFJSkvycyMLDp0VMiIAeaD2BUd8Oygu2M
	tU/E9TLHD72RSGsfkpF885CYyS2y+WivWDdzCMPFGa3+IUv3R5MvrMgtJwEokQxiimGD
	hzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/OQkVMY5CiRYwogWa18sW56siHGJeDQVqKwAPDTi3io=;
	b=Y/89gWEkusVRMZFiUJ925AF/j4RJW3NgwaAw8jigCeIN3e3PqK3XEfRVVwdPbNjTK3
	l9Y00QlDDQcnQGGe6YKsw+Z+FpyLcJzp3nhrUMIGzAW9DpDSBbWN3wFkv9K7H4+GqEMi
	aPYRI/DOg76wC1gsCab7yKGHKOtjkhOQwJUmtBMrYaeq+OYFK18eDb+WmTWZUXwbcx6M
	oNb9XiIV4nUPyqkiNuREcuxKLuoaZPLCnyqZupeJ6Acs00BM/gUaCtAQQdF6KLT/c/4Y
	j4tSzzc/WlELcLw1m+HdhhablTT+tlCrd4XWgRmBl/ZqoN0wNHHypvnNZPXiGE4Ps2Mn
	MMpQ==
X-Gm-Message-State: APjAAAWGLnQDMEqURtqWvRLpqK2cCm1+FmQ+ykVdqcazaSb/+E6aqCjD
	huIg2UFz4ZOwrecr193KNHB8oDMKb0M=
X-Google-Smtp-Source: APXvYqwvCOLCncaHzfWWpXodGlIogagWzOIjHQA/g43mQG6qZD0j6mhnu1U3vQTnYBY2kxV3nEE8Hw==
X-Received: by 2002:adf:f005:: with SMTP id j5mr3750913wro.251.1565087456787; 
	Tue, 06 Aug 2019 03:30:56 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	w23sm94845444wmi.45.2019.08.06.03.30.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 03:30:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2019 11:30:51 +0100
Message-Id: <20190806103051.3333-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] xserver-xorg: refresh build path removal patch
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
X-List-Received-Date: Tue, 06 Aug 2019 10:30:56 -0000
Content-Transfer-Encoding: 8bit

The patch has iterated, so update to the latest revision.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xserver-xorg/sdksyms-no-build-path.patch  | 40 ++++++++++++++++---
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
index 54d128cb39e..be198ece49c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
@@ -1,18 +1,34 @@
-sdksyms.sh: don't embed the build path
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/merge_requests/253]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From ca832598d38ba55a001088b57d73c6d7261dc9a7 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Thu, 1 Aug 2019 15:24:51 +0100
+Subject: [PATCH] sdksyms.sh: don't embed the build path
 
 This script generates a header that has a comment containing the build path for
 no real reason.  As this source can end up deployed on targets in debug packages
 this means there is both potentially sensitive information leakage about the
 build environment, and a source of change for reproducible builds.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/xserver/merge_requests/253]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ hw/xfree86/sdksyms.sh | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/hw/xfree86/sdksyms.sh b/hw/xfree86/sdksyms.sh
-index 39e33711d..cdb3794b9 100755
+index 39e33711d..bdf47a71a 100755
 --- a/hw/xfree86/sdksyms.sh
 +++ b/hw/xfree86/sdksyms.sh
-@@ -308,7 +308,6 @@ BEGIN {
+@@ -302,13 +302,16 @@ LC_ALL=C
+ export LC_ALL
+ ${CPP:-cpp} "$@" sdksyms.c > /dev/null || exit $?
+ ${CPP:-cpp} "$@" sdksyms.c | ${AWK:-awk} -v topdir=$topdir '
++function basename(file) {
++    sub(".*/", "", file)
++    return file
++}
+ BEGIN {
+     sdk = 0;
+     print("/*");
      print(" * These symbols are referenced to ensure they");
      print(" * will be available in the X Server binary.");
      print(" */");
@@ -20,3 +36,15 @@ index 39e33711d..cdb3794b9 100755
      print("_X_HIDDEN void *xorg_symbols[] = {");
  
      printf("sdksyms.c:") > "sdksyms.dep";
+@@ -337,7 +340,7 @@ BEGIN {
+ 	# remove quotes
+ 	gsub(/"/, "", $3);
+ 	line = $2;
+-	header = $3;
++	header = basename($3);
+ 	if (! headers[$3]) {
+ 	    printf(" \\\n  %s", $3) >> "sdksyms.dep";
+ 	    headers[$3] = 1;
+-- 
+2.20.1
+
-- 
2.20.1


