Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id ABBB07D41C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:29:16 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id i21so8420383ita.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5lyb/LE4zvC9IdDDJrXwu1GamAaqnXoZhoiTHvKiOa8=;
	b=X0ccuFokASQi4NTWCWNjy3iLO0Nyiqh72E7rxvp1VcayRGrdSXvAnub7wfweRYGUge
	Q8FuiKkBBjfzQf5OXid9K1rjT9pPljZQjGiYFGkNTgqLvn9csktwZEzO+dvYQ9piJISR
	MwrTUqGv5TmkaalY7SHuK6tdyMUBvO4JuskhQLgpI9CtKtwhpiMEPQ52tLRlMkk42aFn
	EQpOn7DFKV62SCFvmXvbkV+BNV3dFu9a+KzfwUbzFSfSAnm+MEaJVetGllUFu+EsWdBs
	c0fqIhCJKCk/R588mxh9kXGA+atGQicUcK/lTSBNeSdf7pKKdPlTq16qT0g/uJidryhs
	MTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5lyb/LE4zvC9IdDDJrXwu1GamAaqnXoZhoiTHvKiOa8=;
	b=eE4AqBuc332j/MwhHIFyvdGAtfAZfisM4E8dZjhne0Z1OMfzXW+k8tWn03nISsXIvS
	67/lvetLWJ2G8nas5VDjiMOpGQLGFYJ6NYGZn10VPy0SVAqMQjmg+gEdNvpCmvIBonP0
	uIjNrIc7Oix2ltrPF76+xrbmW8SM1IzAARNMKCKIJwf8P0cKVI049PY866Z50LIoL94Z
	s2Qg16JlNvarSXCiP8f3lBe7R3U3+TtynY9IbSB0oBd80AhXyLQFqKzxXujHSsZOUW3G
	NQt/aodHpdLQsASWvpWf1UbDwHBIM1bbDQSuzAkTSWWwA1nKXWjZlhHPKNv3bXo5ifT6
	6aKg==
X-Gm-Message-State: APjAAAX05HN6ED+IZ4ah3JQsNHRS/EuJjJw7+dzl2tx18yH4U+mZs0kr
	O3NXId3bjLiQIBIPGNIgN6xqPARF
X-Google-Smtp-Source: APXvYqw4uhY6NSSw+4brUmIXHZrGsSYhFtk+9u+ug6ZhtQ2wKnNMG0b9RtDqAyETL/3Tz+2p8TRunw==
X-Received: by 2002:a24:2846:: with SMTP id h67mr18284436ith.94.1559575757549; 
	Mon, 03 Jun 2019 08:29:17 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	k22sm4977630ior.52.2019.06.03.08.29.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Jun 2019 08:29:17 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 10:29:10 -0500
Message-Id: <20190603152910.20369-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: denys@ti.com
Subject: [PATCH] zip: Remove build date to improve reproducibility
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
X-List-Received-Date: Mon, 03 Jun 2019 15:29:17 -0000
Content-Transfer-Encoding: 8bit

Applies a patch from Debian to remove the build date from zip.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../zip/zip-3.0/10-remove-build-date.patch    | 19 +++++++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |  4 +++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/10-remove-build-date.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/10-remove-build-date.patch b/meta/recipes-extended/zip/zip-3.0/10-remove-build-date.patch
new file mode 100644
index 00000000000..244ddea363a
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/10-remove-build-date.patch
@@ -0,0 +1,19 @@
+From: Santiago Vila <sanvila@debian.org>
+Subject: Remove (optional) build date to make the build reproducible
+Bug-Debian: http://bugs.debian.org/779042
+
+Upstream-Status: Inappropriate [no upstream]
+
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+
+--- a/unix/unix.c
++++ b/unix/unix.c
+@@ -1020,7 +1020,7 @@
+ 
+ 
+ /* Define the compile date string */
+-#ifdef __DATE__
++#if 0
+ #  define COMPILE_DATE " on " __DATE__
+ #else
+ #  define COMPILE_DATE ""
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index de779e94aae..a2cd7717caf 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -10,7 +10,9 @@ PR = "r2"
 S = "${WORKDIR}/zip30"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.gz \
-           file://fix-security-format.patch"
+           file://fix-security-format.patch \
+           file://10-remove-build-date.patch \
+           "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
 SRC_URI[md5sum] = "7b74551e63f8ee6aab6fbc86676c0d37"
-- 
2.21.0


