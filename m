Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id DB23E7F7BC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 09:38:52 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c22so1615309wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 01:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GjRuHtHgnXPZHM4GcOvQtvgjFqBBcjbi9mQXgkElaFA=;
	b=TWXLMJXFVFmgB2VC91PYB1YPF+/rwBZs5HUXBs06URpH7jikoIvDKSpoAnwBNT/ikf
	iezE2yUo6+zA78kHDlNUYIzWBCY5rF0AR5N18nsYQcPDzJuxDMC7Xbsohe39SCmcZu08
	9Enw/pJFWCgh3Vpaeg6hhIswmqiXm6i+uHI5aNES6IIJcz7twFtgBjgwaU7nLCkJ9wgo
	DcKd7icCNoIHH1vp8t2oUBV1OTgXg0gudcYiVNVR3Ka/Ds72NeJo1i50Wbx1ZCnYPrS+
	KvI5l6u/nsBvI8/W6QMXkCXq1okac11LBP9/nrdNtRRLpX6J0JiA7AoWuoIm1a1+QAcU
	HIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GjRuHtHgnXPZHM4GcOvQtvgjFqBBcjbi9mQXgkElaFA=;
	b=pw3TjDpiAyWxYiF1tHWNjlBA9IkVdo5ZpW1Qv1kd1AEIabM0ZPJ92mDy25mCxcxxzB
	VZyS1RVQICMhIFdimjLULJtxebCWChYSra+sdjxaaouUNNjAGsaWfAORfUHNymAMHBpX
	Xe98Ubx15RnG1RQsGpn2MqQ8kXoS8OQDWZb/dYrzIqRfZ0kLCUXG09wsib9RAbqUkcWQ
	nw5bMWTSgxADmmQUU0XWVVXcjrS9F+ttJCPBwrERhGoaPGQEXgVQ/cW1Lzl3Q0xVJ9XY
	2lW93RoH/XPBTEapI0mqFkdBx83UoHvaP9muWB1MZARDCF+CyhHXpBdfeI23935kE1QX
	bkLw==
X-Gm-Message-State: APjAAAXftpVtnQ3/WDlKJ4c3JcfGj0//fQkQSJGGoNqwNN7UBE7Dl63r
	DZgzuxU98GoYko1ArZaSyEkv2tDR
X-Google-Smtp-Source: APXvYqzHQBjfBb23Fkx6YsV0n3NTlTmiGj0LXUtgCBB9Tt2edg3HAT4icL11p8YjT9tKqMcRAPJwKA==
X-Received: by 2002:a05:600c:294e:: with SMTP id
	n14mr1890262wmd.18.1573119533000; 
	Thu, 07 Nov 2019 01:38:53 -0800 (PST)
Received: from cmtcleu60844809.rd.corpintra.net
	(ip5f5bf1cc.dynamic.kabel-deutschland.de. [95.91.241.204])
	by smtp.gmail.com with ESMTPSA id
	d11sm1492748wrn.28.2019.11.07.01.38.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 01:38:52 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 10:39:04 +0100
Message-Id: <20191107093904.2055-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] ethtool: update 5.2 -> 5.3
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
X-List-Received-Date: Thu, 07 Nov 2019 09:38:53 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.2.bb => ethtool_5.3.bb}              | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.2.bb => ethtool_5.3.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 7c5d4f956b..b08b6124c8 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From f8333f7759717b4d163cfe8e3ef8861c5a667324 Mon Sep 17 00:00:00 2001
+From 6aa70c1598451d7c93e55ce5193aac90fe8b2136 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2127fdb..4910e6f 100644
+index 56e4683..1ac9d61 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.2, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.3, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.2.bb b/meta/recipes-extended/ethtool/ethtool_5.3.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_5.2.bb
rename to meta/recipes-extended/ethtool/ethtool_5.3.bb
index 67e7fadee0..401331be39 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.2.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.3.bb
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "79cff0d4af62b030ad28be90414b5c4a"
-SRC_URI[sha256sum] = "8ad6cb30f6e1767d9d23a5cb5f606f3b51f83e85ebf0153c1506194f6709e90b"
+SRC_URI[md5sum] = "63d1c835b861912ea0dfd52cf66a2da4"
+SRC_URI[sha256sum] = "cd2d8ea360431a2ea35ff61c276bcf2afee1ad901668a0b50ae9f1c5814756bd"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.23.0


