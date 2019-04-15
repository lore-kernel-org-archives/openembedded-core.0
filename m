Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7369E7D9E9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:19 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k11so21335139wro.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=APD913GcHl8VbHV6TJx2OTcGiK5BGNRpQ6XaTGMtWc0=;
	b=XgDFeOTpROIDeHT/US3lkitKCDgufRQs5K6u4xlbxKIONMZYA3zWbzsTceGWxwXGNn
	D4Wqb0aT4bo+vG/Ur3eef0aZ/djVHnGHYv6qkjA1SwgMpWnWwH5Yn104UYrhmXhLCkWh
	fy3qRp6A2MQif6uSHBcksH0E9xXeYByjJqP1GyFs2pnzMxe7NqWln0ESvyFF3qSCU9k4
	IYJMDBM0sFG5m9eWlbeHv50cv9s8p6jleZVRFVQCcEc16RasVNeqaoZY7UHDXAzjiyOk
	muWb+1Ib8cIyPgN4rzdOhEahSfiEYd9QZvnEcSUW9zr8sG+rdrIUNA2w42r6PYNO6XiY
	X57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=APD913GcHl8VbHV6TJx2OTcGiK5BGNRpQ6XaTGMtWc0=;
	b=UzRGHGTBMUDQ0ZN/NpKNYfXzcEdpc4MGLrqJwxZOfof5ZvVbrAOtFvoFdR2BcC1gvm
	dNS4o2DvSB8aKA5UTBKWRig+6r/Z6tH9NGgVtjR/mymrwKert8IUx6Xy0hfO3nPalMZD
	QxvhgxDaFnVJz2YWQqAMj4+Iobmt2WS6U3JGrrodF7MXDxVWY6uTuLaeiye2plOPZKsA
	qIOLsdRkeGzS89u7uEYYC2U/PX8WVccsb+KqANUYbU5u5/cy2hGzQvwgJf/QH678fvjM
	TS11PG+zysQNpZTu1Yfuf5dgGiEfNKH6Q8cit9FlYY1xzFHHIRKRmU1qkoqurFpwk+Gl
	X4CA==
X-Gm-Message-State: APjAAAUIiU8pzj10IbOdDcV9IBpPG77PZZIPDXAcRDcY2piN26fWafSc
	XUNh9I2ucoq738TXZjciB5e07jlYeJQ=
X-Google-Smtp-Source: APXvYqxmyRnzp3PCbbJjLbWF9AhTUZ1LiKAkCoEVJtWiILzkV41IiULx1z4BbdBz23lZklD5+0foGA==
X-Received: by 2002:a5d:4683:: with SMTP id u3mr12072610wrq.200.1555325719991; 
	Mon, 15 Apr 2019 03:55:19 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:55 +0200
Message-Id: <20190415105457.57067-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
Subject: [PATCH 17/19] python: update to 3.7.3
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:19 -0000

License-update: copyright years

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...stutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch | 2 +-
 .../12-distutils-prefix-is-inside-staging-area.patch        | 2 +-
 .../python/{python3_3.7.2.bb => python3_3.7.3.bb}           | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.7.2.bb => python3_3.7.3.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
index 8083345a4e0..1741f5753b4 100644
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
@@ -1,4 +1,4 @@
-From 4865615a2bc2b78c739e4c33f536712c7f9af061 Mon Sep 17 00:00:00 2001
+From 17796e353acf08acd604610f34840a4a9d2f4b54 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 31 Jan 2019 16:46:30 +0100
 Subject: [PATCH] distutils/sysconfig: append
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index dcc0932c7f2..35213171bdb 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 1397979ee445ff6826aa5469511e003539f77bb2 Mon Sep 17 00:00:00 2001
+From 12900d498bb77bcc990868a80eaf0ab257b88fff Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb b/meta/recipes-devtools/python/python3_3.7.3.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.7.2.bb
rename to meta/recipes-devtools/python/python3_3.7.3.bb
index 6464aafa409..ea46b0535b9 100644
--- a/meta/recipes-devtools/python/python3_3.7.2.bb
+++ b/meta/recipes-devtools/python/python3_3.7.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.python.org"
 LICENSE = "PSFv2"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f257cc14f81685691652a3d3e1b5d754"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e466242989bd33c1bd2b6a526a742498"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -29,8 +29,8 @@ SRC_URI_append_class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            "
 
-SRC_URI[md5sum] = "df6ec36011808205beda239c72f947cb"
-SRC_URI[sha256sum] = "d83fe8ce51b1bb48bbcf0550fd265b9a75cdfdfa93f916f9e700aef8444bf1bb"
+SRC_URI[md5sum] = "93df27aec0cd18d6d42173e601ffbbfd"
+SRC_URI[sha256sum] = "da60b54064d4cfcd9c26576f6df2690e62085123826cff2e667e72a91952d318"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.17.1


