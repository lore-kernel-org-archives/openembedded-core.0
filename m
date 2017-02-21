Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 29C1872F0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 00:37:41 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id 89so68606125wrr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 16:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=zx6ocAd7rBOxYRSPs9O+jBoKFFWJbv+KoDSZrzlfmuA=;
	b=VYQ6JPRPbMMv0UtgGuo1lLSGDj6Wzq9ZK7+gM4KkLyZdCD80da1Y+rE2YpspfFMm/C
	qmFsG7zoCH83QE3RUa3/gOrFUbiNFgy/KxiaP8GNGs63Ih+YQwQr3D0D+MQpZ+E64Nsf
	KPpqFBgoXsut1ZYJ4AOT9ieK72T5i7dOjBzfkkfQ7CHaUions1NhmSleN3HXe9GJaXzD
	78syFt3+3QnSUwt/CDtBx/sYrkFg8e7iyumteKl6kwIczf4+aVPq1JAEkLKlW7FIO8CZ
	VF+2CAv7DkkynMFDQoEP5ijgm8FHFFPXSfBxq8SCa3s2BaYqJUrnJPAqQeXUyiSqcaH4
	xA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zx6ocAd7rBOxYRSPs9O+jBoKFFWJbv+KoDSZrzlfmuA=;
	b=tOrjBBHVEN1srMY+WWv64PNyq/rxhlYx2jbvA6Zf7j61fgxBSJ1z4ZZ05I3fGYNPR/
	DTZIwwXWoGxj5a4f597oF0kCO3JLbCamHvwCVaILgszW4I1df/TgdlaCK9hZ1cWFKiuS
	C4RShVeSItZ3gTFXVHTkaEk8CLptad8HKvuA55uzLCNtZb/Pb6V3n0yefpyaucdGkktr
	gbDHmjWMAxOht6FAQmyO/AzYzU7p2h5vwOsBAnk4Yjbarax1qiTkoVczFG6YSpD17+nx
	wz8doeEy/BB+CYogbPKxAQaCfXBZzg/A7HZfjYP/2cO9NulCIq4R70OVqO4hHquDIQDY
	LPDw==
X-Gm-Message-State: AMke39lE2VXUlmg4Xerwwf4/EbFVmMNGmmIb7RKGzlXzm6ElxMfizvc6NtVolTrg96CCn1Kb
X-Received: by 10.223.172.136 with SMTP id o8mr15601055wrc.87.1487637462043;
	Mon, 20 Feb 2017 16:37:42 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	k70sm15490055wmc.3.2017.02.20.16.37.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Feb 2017 16:37:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 00:37:38 +0000
Message-Id: <1487637458-15893-1-git-send-email-ross.burton@intel.com>
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
X-List-Received-Date: Tue, 21 Feb 2017 00:37:42 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

Add a patch to fix the CC/CFLAGS mangling that broke builds. [RB]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/ncurses/files/fix-cflags-mangle.patch | 17 +++++++++++++++++
 ...{ncurses_6.0+20160625.bb => ncurses_6.0+20161126.bb} |  3 ++-
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
 rename meta/recipes-core/ncurses/{ncurses_6.0+20160625.bb => ncurses_6.0+20161126.bb} (73%)

diff --git a/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch b/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
new file mode 100644
index 0000000..0308fe1
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
@@ -0,0 +1,17 @@
+configure has a piece of logic to detect users "abusing" CC to hold compiler
+flags (which we do).  It also has logic to "correct" this by moving the flags
+from CC to CFLAGS, but the sed only handles a single argument in CC.
+
+Replace the sed with a simple 'cut' call, making the assumption that the first
+word is the compiler name and everything else is an option.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure b/configure
+index 7f31208..1a29cfc 100755
+--- a/configure
++++ b/configure
+@@ -2191 +2191 @@ echo "$as_me: WARNING: your environment misuses the CC variable to hold CFLAGS/C
+-	cf_flags=`echo "$CC" | sed -e 's/^.*[ 	]\(-[^ 	]\)/\1/'`
++	cf_flags=`echo "$CC" | cut -f2- -d' '`
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


