Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id BC33161086
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 21:51:59 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t11so4065904wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 13:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JJSZ4101Yb4mQJL0I11BsYQsL99Y5DJ8wyAkJgqnhsE=;
	b=VgfEY9XGmmPzYxjdbIgoaj3rzGGFt/TmuzHPTrFtTKQ1zlcXYoczMaV8t5qYKbYGOW
	If/x8xj3vAAjlruSExkNKXzR6xVOVqY58QfH9T2BMtbmT5/rAC4WJXQS+XEzTl36fAx4
	pgCymgA345Zm2RtSf4FHT62AstzE7l3BfS9eLsWoRMiZLVyAs67KrX9oYvRjfniQ/hni
	y+Ma3KwAj/ZuRu0W0kDnsYwkpNGQ3beCRF+N8v6isNuF798lVcPymp7q872QT6i41cP7
	DRdSZugEteJXgJFIVg9VbhmJ3WaE1enPCUVj9YbsWSMlRnlTVrX+HnCMTY0LuUMZ3Q/n
	uOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JJSZ4101Yb4mQJL0I11BsYQsL99Y5DJ8wyAkJgqnhsE=;
	b=JjDefg2CIEVJn4OobavEZqESc2Ewc0enT9lBQBnqerfgEFcYbOLAo2SFpC1UO2C8dM
	X/uAGDfTnaS0vqzHK1M5I8NNyeGzM40ohdu2zkzWDTZXZYJA7DojdJ2OtjKZVCtPY78k
	MVb1OIS12XKGuos0fLwfIpXlZoXoARJScMexjW0MmNOANiaDWLpcsGDuCEZe75fxF7J3
	Jc79lEPDN1YfomOL/1b770VjInpcWn1gVZQulfgt4mkPuaqycKUsQY8WweePuBYui2qi
	XCSkzlVejR72yLIBvjKzoIY0nLBAT+zbrkRsC5eVveaUvvjQjuV3thIRi9bY3b1Gycp2
	Q73Q==
X-Gm-Message-State: ANhLgQ0S1ki3QRj/fAuAPwMiq/SV49nS0z3Oj1k0lksjSdQTdT3y7Lvx
	v0S8hrSt5kkgEVJwpHAMfpDtB7KEBq4=
X-Google-Smtp-Source: ADFU+vsTMa1meUY327rCKM9S9AHguLq3sSc7DZWDM77C7DnkJ3k5I1IQo8QuM+LixjU/0tj3lto0zQ==
X-Received: by 2002:a5d:44ce:: with SMTP id z14mr4667872wrr.387.1583531519883; 
	Fri, 06 Mar 2020 13:51:59 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	z12sm13439570wrl.48.2020.03.06.13.51.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Mar 2020 13:51:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Mar 2020 22:51:38 +0100
Message-Id: <20200306215138.15785-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] gettext: fix ptest package reproducibilty
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
X-List-Received-Date: Fri, 06 Mar 2020 21:52:00 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...t-env.in-do-not-add-C-CXX-parameters.patch | 29 +++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.20.1.bb   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/gettext/gettext-0.20.1/0001-init-env.in-do-not-add-C-CXX-parameters.patch

diff --git a/meta/recipes-core/gettext/gettext-0.20.1/0001-init-env.in-do-not-add-C-CXX-parameters.patch b/meta/recipes-core/gettext/gettext-0.20.1/0001-init-env.in-do-not-add-C-CXX-parameters.patch
new file mode 100644
index 0000000000..d45b75869a
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.20.1/0001-init-env.in-do-not-add-C-CXX-parameters.patch
@@ -0,0 +1,29 @@
+From 9b912a47f790a7b282ec0c2295a188c5d8fb6a7c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 6 Mar 2020 21:04:05 +0000
+Subject: [PATCH] init-env.in: do not add C/CXX parameters
+
+These are taken from the cross environment and include
+sysroot paths, so are not reproducible.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gettext-tools/tests/init-env.in | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/gettext-tools/tests/init-env.in b/gettext-tools/tests/init-env.in
+index cc84ffd..b69c990 100644
+--- a/gettext-tools/tests/init-env.in
++++ b/gettext-tools/tests/init-env.in
+@@ -3,10 +3,6 @@ top_builddir=../..
+ 
+ OBJEXT="@OBJEXT@"
+ EXEEXT="@EXEEXT@"
+-CC="@CC@"
+-CFLAGS="@CFLAGS@"
+-CXX="@CXX@"
+-CXXFLAGS="@CXXFLAGS@"
+ CPPFLAGS="@CPPFLAGS@"
+ LDFLAGS="@LDFLAGS@"
+ LTLIBINTL="@LTLIBINTL@"
diff --git a/meta/recipes-core/gettext/gettext_0.20.1.bb b/meta/recipes-core/gettext/gettext_0.20.1.bb
index 214803f767..85493e7595 100644
--- a/meta/recipes-core/gettext/gettext_0.20.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.20.1.bb
@@ -25,6 +25,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://serial-tests-config.patch \
            file://0001-msgmerge-Fix-behaviour-of-for-msgfmt-on-PO-files-wit.patch \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
+           file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
            "
 SRC_URI[md5sum] = "bb5b0c0caa028105f3ca1905ddc306e2"
 SRC_URI[sha256sum] = "66415634c6e8c3fa8b71362879ec7575e27da43da562c798a8a2f223e6e47f5c"
-- 
2.25.1


