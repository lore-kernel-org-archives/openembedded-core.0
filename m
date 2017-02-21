Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4514772FAF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 18:10:49 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id v77so82472889wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 10:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=R4Sxojrf5VNAA9E6uu5dbRwX6HEV0AkSKcGWi9E7uoo=;
	b=RQ86EMe0HAOCG9MBckoTWSo4sAvEhCZcrakYMDAEkPFcM4ptktJjOlIG+oa++WFrJy
	wDCx6+RuYFsPoo0PxPTAUwSX9jRi1RsYiP9VI97lL1xe+8vQkHn3EPELFsfms28vVNKG
	z07SEy61rOQssGoD5A6KKsXYmoF/l492PI5ZlQfcpi6uFP9kQ8MrEFVgaIBuvYpoHjtF
	/qJYv6Kex5LcvtWsJewY5z47v1jonTepRm4SvVhR7RthMRORrIt4y9LpouA66ZmcEyo1
	AkoE0bhVym7ShErlbRnih7r+vg3QZbIYnYzo0j+GPn2+DgrLz7nVDktfyUimB8uM2Hd0
	J6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=R4Sxojrf5VNAA9E6uu5dbRwX6HEV0AkSKcGWi9E7uoo=;
	b=cTjAGwKTDlCDJ1xW3qe6XNoATV4PYcx8MMWhDti8uGKuZxfIPgRKMLccE86uVFB/uV
	qAUpR4Kag7Xa63NZpUOw1lGu71E9iFFkFrfHKop7a3JZ4MvQGs86k/BxOhwDt+wA17OZ
	tuic09vQzj0qNYV6kiB2NSuBNy6mx/LnOD+5Pp7pFyV0IyaNye1HxZCfNSKsHWAtPIZF
	evzKGg8QRhN1jpGDx+A4FsC3MBdioc1gKx4RkLeI1Cu/6NMB96QZm91nwNvLeX1zBYLX
	KZxBkzu64kvutC3/brpuVSVCopKwVaNQSDZFAF9sUehVFLrBcqq9xr077Baf0Tv/sQGz
	7Ovg==
X-Gm-Message-State: AMke39kVIYPrkbvmsivtqEBHrUspR2dDaoSYZsYb4T1ENstsP6RpbK/T4JXOxQ2wCipG28la
X-Received: by 10.28.51.205 with SMTP id z196mr26005323wmz.22.1487700650604;
	Tue, 21 Feb 2017 10:10:50 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	k187sm15141514wmb.13.2017.02.21.10.10.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Feb 2017 10:10:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 18:10:46 +0000
Message-Id: <1487700646-25006-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] ncurses: 6.0+20160625 -> 6.0+20161126
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
X-List-Received-Date: Tue, 21 Feb 2017 18:10:50 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

Add a patch to fix the CC/CFLAGS mangling that broke builds. [RB]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-core/ncurses/files/fix-cflags-mangle.patch | 18 ++++++++++++++++++
 ...ncurses_6.0+20160625.bb => ncurses_6.0+20161126.bb} |  3 ++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
 rename meta/recipes-core/ncurses/{ncurses_6.0+20160625.bb => ncurses_6.0+20161126.bb} (73%)

diff --git a/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch b/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
new file mode 100644
index 0000000..e9447c5
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
@@ -0,0 +1,18 @@
+configure has a piece of logic to detect users "abusing" CC to hold compiler
+flags (which we do).  It also has logic to "correct" this by moving the flags
+from CC to CFLAGS, but the sed only handles a single argument in CC.
+
+Replace the sed with awk to filter out all words that start with a hyphen.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure b/configure
+index 7f31208..1a29cfc 100755
+--- a/configure
++++ b/configure
+@@ -2191,2 +2191,2 @@ echo "$as_me: WARNING: your environment misuses the CC variable to hold CFLAGS/C
+-	cf_flags=`echo "$CC" | sed -e 's/^.*[ 	]\(-[^ 	]\)/\1/'`
+-	CC=`echo "$CC " | sed -e 's/[ 	]-[^ 	].*$//' -e 's/[ 	]*$//'`
++	cf_flags=`echo "$CC" | awk  'BEGIN{ORS=" ";RS=" "} /^-.+/ {print $1}'`
++	CC=`echo "$CC " | awk  'BEGIN{ORS=" ";RS=" "} /^[^-].+/ {print $1}'`
diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20160625.bb b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
similarity index 73%
rename from meta/recipes-core/ncurses/ncurses_6.0+20160625.bb
rename to meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
index 6514613..e95741f 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0+20160625.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
@@ -1,10 +1,11 @@
 require ncurses.inc
 
 SRC_URI += "file://tic-hang.patch \
+            file://fix-cflags-mangle.patch \
             file://config.cache \
 "
 # commit id corresponds to the revision in package version
-SRCREV = "63dd558cb8e888d6fab5f00bbf7842736a2356b9"
+SRCREV = "3db0bd19cb50e3d9b4f2cf15b7a102fe11302068"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.8.1


