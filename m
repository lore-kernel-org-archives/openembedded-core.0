Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 88B997FD96
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 20:26:33 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id f129so4288654wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 12:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=sY1XG242cH6ZaB7g3hHYl1fsmD/lEdfnV9xriV42fKo=;
	b=SwukTP34V1UJ6D/xc2cdbzZCtSOa8xn376TwzxhipIIw6GuYTRPypiZ6zyqoqMIMLs
	+wFrLkmf7jC1yqULL+GBRX/SI1GyJUWdBpj4jS4pv8JLADU7VVO95USt5VQ2LJT2riXx
	laqqfAWjmODinzFff35T3Y3C3Ihkw2Jiz5YfxEAFgKYwYMURGHAh3ve0yBG2UhZlynx0
	lzk8FCzGyCTOS5JbSOx+OM7n7jyHp3FpjXwtGga/QAxREWoov5HTIXX74YOW2hmRpAP+
	pnzlMHf9gGCW+wHsKcTQlRwcQRi0eOkfNNpY0yC7CkFs7HHRHSuF1hvU0Q+J0F4RlC0i
	qCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sY1XG242cH6ZaB7g3hHYl1fsmD/lEdfnV9xriV42fKo=;
	b=UX10E00JmRS/6wr/v86v+eiYmTTiTbkWWbPFsxpnBe9MP6PMqbr0jfq1qFf9D5MKWz
	uREqgveKIaMIjNed3FYd+9HkirMUtkQcrjhc6qik2yUdR7co3bS+FSPYF3OhXQTpwiaZ
	MAaIsCNuocDeLgMIBEZBiu2ZDgcxzbc1Z7LnD6rQOREX5Ctqpzxf1A+OexMCesvUnkzu
	63b6A2SxIqpoS8/oRNo2B38FoJckEEHni0dExl5BURPOx6Ym4LmtctIuAKY+zJnu0mm/
	uPIIJixu/vmDgMDraPg6AGc46jRhUC4yri8ve/0QtnqOv0RiqEgy30lOsi8b0pEmZTVt
	uo8g==
X-Gm-Message-State: APjAAAWWYjR5TFeVReDMI1u0osa860/NxPYmMDjXSQWFYaKzdec17ghU
	AfZT/OLHMar1g4eOcMr8LUkIFHB1pAU=
X-Google-Smtp-Source: APXvYqzg3rVku2aPHBdxVU0U6hlTVlqylLHyY4c+sZMQECuFAS7/vGM/ASHKSIkDXUev46fyom2xnA==
X-Received: by 2002:a05:600c:108a:: with SMTP id
	e10mr6484077wmd.38.1578601593686; 
	Thu, 09 Jan 2020 12:26:33 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id z6sm9149986wrw.36.2020.01.09.12.26.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 12:26:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2020 21:26:13 +0100
Message-Id: <20200109202623.28936-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109202623.28936-1-schnitzeltony@gmail.com>
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/11] itstool: add from meta-oe
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
X-List-Received-Date: Thu, 09 Jan 2020 20:26:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recent versions of shared-mime-info depend on itstool

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-build-time-hardcoded-python-binary-.patch | 35 +++++++++++++++++++
 ...ld-time-hardcoded-python-binary-path.patch | 29 +++++++++++++++
 meta/recipes-support/itstool/itstool_2.0.6.bb | 20 +++++++++++
 3 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch
 create mode 100644 meta/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcoded-python-binary-path.patch
 create mode 100644 meta/recipes-support/itstool/itstool_2.0.6.bb

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


