Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id F02F97FC1B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:29:17 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id c14so24041745wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=A0tDUanZTWNtQ7NRla9VxM9pHv7exDSmDvWD7kIoR48=;
	b=KiuYUnFY4rpeMKYDa1BOWUMK+ZA3zPgZIPrbj1A6/YETms3KvLTKbRImgBufa5rqTo
	1R98obeRJdH5bZF6jJIOONBVyC2gw261LmPHONbIyIFv4SNEBHCccNdKUMLNkyVoNryR
	SzGyCMXth1K09IC/mVFLUomG5FIxHQGzFkfa+aNWS5Tu10URuVEhtw60ldKgaORx/0jg
	TPYX23OcCNtBrk0+fhl2X/2tuEbIH+2hrTxdsjYI2tE8lvQAGExCBbz0A9NugWtqOU5H
	IhXsDj4QSe7dIhaJJoXeVBD3erVFT9VViibwcyBUH5zKXxfuRed0q008TGJd8nzHg0WT
	6pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=A0tDUanZTWNtQ7NRla9VxM9pHv7exDSmDvWD7kIoR48=;
	b=Cz1wjR6Jv31x8rq2rihVLXuyKMWNhjdMU2wbGewsPujnEuSCqTPSJBcv3h07g3oXSD
	2ae8UjSWyuniWEL681pILaD5jwGWtYnCoyg+2CwE4xh7j2nJ4lDpSVxEHmYUdblDX+J7
	zdF2bErEFcMs4Ifl4lDMM1lkEI0O8oi4+cMeL2eShPiR6MKsLU9OVfCL4WfpQ5yAdLyM
	Gfeq4MGun4YWjYw1GxKp+KisA75mZpiYA6SIcipQpX8d5cTDh6+1Cm8hN44xNK2sx93L
	hFEu3uKywmUKgfiIAtjAh86hZ6p+XaQ1Wvf6wHd8l12AvGP5wv2I8aFyeCtruU/sU9M6
	7HlA==
X-Gm-Message-State: APjAAAUTEf5vFuTgRqrG+rHIMbBWSPSuwGp/2bb6DW++pfvv/LtbFMTL
	/Ko2ZIBNxzHLCA9R/7bDSkUPfuTmqmU=
X-Google-Smtp-Source: APXvYqy4atZ314GzduXDZllb/ZuxgBQs+aE4pK/gZU0mE7KmgtOaAzZCTF80GAqaZiurbu4+rP/d0A==
X-Received: by 2002:a5d:43c7:: with SMTP id v7mr5010608wrr.32.1579296558267;
	Fri, 17 Jan 2020 13:29:18 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id
	l7sm36094689wrq.61.2020.01.17.13.29.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:29:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:28:59 +0100
Message-Id: <20200117212908.32647-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200117212908.32647-1-schnitzeltony@gmail.com>
References: <20200117212908.32647-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 01/10] itstool: add from meta-oe
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
X-List-Received-Date: Fri, 17 Jan 2020 21:29:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recent versions of shared-mime-info depend on itstool

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 ...-build-time-hardcoded-python-binary-.patch | 35 +++++++++++++++++++
 ...ld-time-hardcoded-python-binary-path.patch | 29 +++++++++++++++
 meta/recipes-support/itstool/itstool_2.0.6.bb | 20 +++++++++++
 4 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch
 create mode 100644 meta/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcoded-python-binary-path.patch
 create mode 100644 meta/recipes-support/itstool/itstool_2.0.6.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 7d47677d3b..ffb6da7dae 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -281,6 +281,7 @@ RECIPE_MAINTAINER_pn-iproute2 = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-iptables = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-iputils = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-iso-codes = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-itstool = "Andreas Müller <schnitzeltony@gmail.com>"
 RECIPE_MAINTAINER_pn-iw = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-libjpeg-turbo = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-json-c = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch b/meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch
new file mode 100644
index 0000000000..19a858bd75
--- /dev/null
+++ b/meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch
@@ -0,0 +1,35 @@
+From 335ef14fc801c9dfbe7e5692dc71cfbe72049d2b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sun, 27 Oct 2019 16:38:52 +0100
+Subject: [PATCH] Native: Don't use build time hardcoded python binary path.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This is same patch as used for target build except that we do not use the
+'-S' and '-s' option because '-S' is relatively young [1] and elder build-host
+don't support it [2]
+
+[1] https://github.com/coreutils/coreutils/commit/668306ed86c8c79b0af0db8b9c882654ebb66db2#diff-83d9d52b1f12ac589739ab1334ae4f30
+[2] https://errors.yoctoproject.org/Errors/Details/274743/
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ itstool.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/itstool.in b/itstool.in
+index e64cd34..05d264f 100755
+--- a/itstool.in
++++ b/itstool.in
+@@ -1,4 +1,4 @@
+-#!@PYTHON@ -s
++#!/usr/bin/env python3
+ #
+ # Copyright (c) 2010-2018 Shaun McCance <shaunm@gnome.org>
+ #
+-- 
+2.21.0
+
diff --git a/meta/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcoded-python-binary-path.patch b/meta/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcoded-python-binary-path.patch
new file mode 100644
index 0000000000..b91105330c
--- /dev/null
+++ b/meta/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcoded-python-binary-path.patch
@@ -0,0 +1,29 @@
+From cd9b56224895576125e91cca317ace8a80f3eb77 Mon Sep 17 00:00:00 2001
+From: Piotr Tworek <tworaz@tworaz.net>
+Date: Sat, 27 Jul 2019 10:19:11 +0200
+Subject: [PATCH] Don't use build time hardcoded python binary path.
+
+This path obviously won't work on target since they refer to build
+machine directory structure. Native builds will also fail if local.conf
+has INHERIT+=rm_work. Instread of hardcoding path to python binary use
+whatever is found in PATH first. This should also allow the tool to use
+python3 binary provided in recipe-sysroot-native.
+
+Upstream-Status: Inappropriate [OE specific]
+---
+ itstool.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/itstool.in b/itstool.in
+index b3c0033..7df2476 100755
+--- a/itstool.in
++++ b/itstool.in
+@@ -1,4 +1,4 @@
+-#!@PYTHON@ -s
++#!/usr/bin/env -S python3 -s
+ #
+ # Copyright (c) 2010-2018 Shaun McCance <shaunm@gnome.org>
+ #
+--
+2.21.0
+
diff --git a/meta/recipes-support/itstool/itstool_2.0.6.bb b/meta/recipes-support/itstool/itstool_2.0.6.bb
new file mode 100644
index 0000000000..8290c5e581
--- /dev/null
+++ b/meta/recipes-support/itstool/itstool_2.0.6.bb
@@ -0,0 +1,20 @@
+SUMMARY = "ITS Tool allows you to translate your XML documents with PO files"
+HOMEPAGE = "http://itstool.org/"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59c57b95fd7d0e9e238ebbc7ad47c5a5"
+
+inherit autotools python3native
+
+DEPENDS = "libxml2-native"
+
+SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2"
+SRC_URI_append_class-native = " file://0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch"
+SRC_URI_append_class-target = " file://0002-Don-t-use-build-time-hardcoded-python-binary-path.patch"
+
+SRC_URI[md5sum] = "4306eeba4f4aee6b393d14f9c3c57ca1"
+SRC_URI[sha256sum] = "6233cc22726a9a5a83664bf67d1af79549a298c23185d926c3677afa917b92a9"
+
+BBCLASSEXTEND = "native"
+
+RDEPENDS_${PN} += "libxml2-python"
+RDEPENDS_${PN}_class-native = ""
-- 
2.21.0


