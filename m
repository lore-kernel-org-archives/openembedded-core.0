Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 066F0731A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 02:59:28 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id zv9so255048pab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 18:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=UA8RLUUngbmDB/o4O6tVGHZaHHTl2E3Tjd55ltIf6Ss=;
	b=F4JSaH3npVxyZd1yzdDIAKQu3KR+XwJaWV0t1bc3BETgUTnML1e91htvFMyZQSLGzW
	9MesTfDrYZ8g8nS8CN2wHdwg4nbYux6QUHp62vcY+VdwnfIUPLXdzFVlT5oqhhul2npM
	MfsP3TLktQF5rUYwOAzX0CCPTcG682n15XBe21SgNW2XBxHQ0ZcssZ1b0+BbFesPLrs4
	DCJVEzoVcBlNFQf2pQTayPJUrQGQddmkf7g9HWKRcESLcvV7vuMVPgFvpevt9ZYsO1Ps
	/TMs+rkt/Kj/iyKCatwakrFqkhSuyI3F4O54Z2/rzH1ZruIfyo4qs7UYwHJBKNZDff0F
	qvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UA8RLUUngbmDB/o4O6tVGHZaHHTl2E3Tjd55ltIf6Ss=;
	b=K4LZw2FepyqMPLCM0ogieT9rYdshHNSSjeVfbEkFE1m9NAG1wMuxEarnDpO7yc9imY
	Jtoau28qLoTLGdkvjRRgI/tpztubZrhdGWlaPc1566adgxayGVzEBrMAwJWHjMR2HXwC
	h1TnK6r/Lt0BWf0YwuIu15Oo6HgO/v5Vq9FySKFKXs7KbYZFBJquTNpXu4GdkewxaoVH
	aq6Z0r6+6L2UFSq4egE5i45B1oGKs2MRarrW/Cq6jGBjOet/XVoFySaIFWW7YlQj6NiR
	lNZKNKmT8kvEBAxjR3VVZ+1XkJtz9W61PaQAfj7mGJ81g3CBz2Y00Gvs8b8a5bpo06QS
	WPHA==
X-Gm-Message-State: AG10YOT86WSBqwgMRaGb8JMmGhDeBjBLD6dlCGhUyXj+iEd4eCOZYUxV9Hb4QZcmTYOgSw==
X-Received: by 10.66.227.133 with SMTP id sa5mr63232700pac.36.1455159569858;
	Wed, 10 Feb 2016 18:59:29 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id 69sm8134166pfj.20.2016.02.10.18.59.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 18:59:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 18:59:25 -0800
Message-Id: <1455159566-903-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [Jethro][PATCH 1/2] uclibc: Security fix CVE-2016-2224
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
X-List-Received-Date: Thu, 11 Feb 2016 02:59:30 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2016-2224 Do not follow compressed items forever.

This change is being provide to comply to Yocto compatiblity.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |  1 +
 .../uclibc/uclibc-git/CVE-2016-2224.patch          | 49 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/CVE-2016-2224.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index dcb616d..d3fb2a8 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -19,5 +19,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
         file://0001-gcc5-optimizes-away-the-write-only-static-functions-.patch \
         file://0001-fcntl-Add-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch \
         file://0001-wire-in-syncfs.patch \
+        file://CVE-2016-2224.patch \
 "
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/CVE-2016-2224.patch b/meta/recipes-core/uclibc/uclibc-git/CVE-2016-2224.patch
new file mode 100644
index 0000000..218b60a
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/CVE-2016-2224.patch
@@ -0,0 +1,49 @@
+From 16719c1a7078421928e6d31dd1dec574825ef515 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sun, 17 Jan 2016 15:47:22 +0100
+Subject: [PATCH] Do not follow compressed items forever.
+
+It is possible to get stuck in an infinite loop when receiving a
+specially crafted DNS reply. Exit the loop after a number of iteration
+and consider the packet invalid.
+
+Signed-off-by: Daniel Fahlgren <daniel@fahlgren.se>
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+
+Upstream-status: Backport
+http://repo.or.cz/uclibc-ng.git/commit/16719c1a7078421928e6d31dd1dec574825ef515
+
+CVE: CVE-2016-2224
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ libc/inet/resolv.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+Index: git/libc/inet/resolv.c
+===================================================================
+--- git.orig/libc/inet/resolv.c
++++ git/libc/inet/resolv.c
+@@ -666,11 +666,12 @@ int __decode_dotted(const unsigned char
+ 	bool measure = 1;
+ 	unsigned total = 0;
+ 	unsigned used = 0;
++	unsigned maxiter = 256;
+ 
+ 	if (!packet)
+ 		return -1;
+ 
+-	while (1) {
++	while (--maxiter) {
+ 		if (offset >= packet_len)
+ 			return -1;
+ 		b = packet[offset++];
+@@ -707,6 +708,8 @@ int __decode_dotted(const unsigned char
+ 		else
+ 			dest[used++] = '\0';
+ 	}
++	if (!maxiter)
++		return -1;
+ 
+ 	/* The null byte must be counted too */
+ 	if (measure)
-- 
2.3.5


