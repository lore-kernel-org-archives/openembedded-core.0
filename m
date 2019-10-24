Return-Path: <>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 193467F9BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:29:37 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id w18so26462595wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 10:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PYYvr00Xr4FrmxM2jaZLo76rXChiZE3LAL5o8mQxHtk=;
	b=nrjNGWtRAEqlBodbyZDFd+6LoVcCdPQ5flpD3vKxHiT/rt7jJHahx85iKSdDzn9Cuo
	AS9CItEFrJXbcgjLaLRGlvWYUzj7uE187RLHAVpsYDNAum0dhijI5ME9bhIQPL3Prf/2
	VKCwCnbraSZ2jcSrYHSuOXOvVcgWpwJJbVWOY3RZ1g6nwP05maPc5b7J2i/p1yfPU1gO
	zgAmxx9Dwy8Yl7S2LNnvzxLSJgvsiFEvKodmZRvJ+qcg92ya5JJiMWCeP5PSMHr3i7Cu
	8vnt6lIXd2LXxY17mOuEriMnBplM5cA41782QJLXIkJZQRvBoxSctOGNEscnZ6T8HZ35
	NUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PYYvr00Xr4FrmxM2jaZLo76rXChiZE3LAL5o8mQxHtk=;
	b=Lhy2zxfrpHuWjldKOvNoj7BsTiKwG/iwk4NwhbXn/86O6+06w/tYeMYH/vNaObIrtG
	TKzhVrE7gRdSv8EcqtXUIeMNkX1SSNNecneK6dGWdsTcoW/gTsutyQ9+ViqKCiz5nZVD
	CjEq/F785l2L/Gvz8xXIMY2QLhYHpdekvE12LtEMUpU8GM2lmxyEg6T3DhNxwBZLSf0t
	JaqlvsPoUu6vEiDk9cawTtUmBRKRUxAXwEsBwXr2TzPR6/tJj1pGWf46wTKruGpqho4W
	vxNg8AOWl/5dU7MHNRxd4dY3HXLr0ppTMORoXcUmEu+0sqMYO59Kt8arxmZlE/Wm88Yg
	iF9A==
X-Gm-Message-State: APjAAAWZh4bRKfabJW3O8ijV694cnXiofTkuCT5aIf5VhMDQ5xTQO55B
	XwhVoMSEQYmwqOtA7IE66AWcLxh2
X-Google-Smtp-Source: APXvYqyPi0/qjd8Liv2NPabhfmx32gs2sZQjVAjUhOVBUhVDTf6dMjG2YOhxm1f+qiiLfZoKwGZFnA==
X-Received: by 2002:adf:fcd1:: with SMTP id f17mr5236925wrs.82.1571938177523; 
	Thu, 24 Oct 2019 10:29:37 -0700 (PDT)
Received: from localhost.localdomain ([117.55.204.18])
	by smtp.gmail.com with ESMTPSA id
	p10sm28141824wrx.2.2019.10.24.10.29.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Oct 2019 10:29:36 -0700 (PDT)
From: Alexander Kube <alexander.j.kube@gmail.com>
X-Google-Original-From: Alexander Kube
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2019 21:59:07 +0430
Message-Id: <20191024172908.68056-3-alexander.j.kube@gmail.com>
X-Mailer: git-send-email 2.17.1 (Apple Git-112)
In-Reply-To: <20191024172908.68056-1-alexander.j.kube@gmail.com>
References: <20191024172908.68056-1-alexander.j.kube@gmail.com>
Subject: [PATCH 2/3] Add go1.13 recipes
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
X-List-Received-Date: Thu, 24 Oct 2019 17:29:37 -0000

From: Alex Kube <alexander.j.kube@gmail.com>

Duplicate existing go-1.12 recipes and bump versions for 
go-1.13.3.

Signed-off-by: Alexander Kube <alexander.j.kube@gmail.com>
---
 meta/recipes-devtools/go/go-1.13.inc          | 24 +++++++++++++++++++
 .../go/go-cross-canadian_1.13.bb              |  2 ++
 meta/recipes-devtools/go/go-cross_1.13.bb     |  2 ++
 meta/recipes-devtools/go/go-crosssdk_1.13.bb  |  2 ++
 meta/recipes-devtools/go/go-native_1.13.bb    |  2 ++
 meta/recipes-devtools/go/go-runtime_1.13.bb   |  2 ++
 meta/recipes-devtools/go/go_1.13.bb           | 14 +++++++++++
 7 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.13.inc
 create mode 100644 meta/recipes-devtools/go/go-cross-canadian_1.13.bb
 create mode 100644 meta/recipes-devtools/go/go-cross_1.13.bb
 create mode 100644 meta/recipes-devtools/go/go-crosssdk_1.13.bb
 create mode 100644 meta/recipes-devtools/go/go-native_1.13.bb
 create mode 100644 meta/recipes-devtools/go/go-runtime_1.13.bb
 create mode 100644 meta/recipes-devtools/go/go_1.13.bb

diff --git a/meta/recipes-devtools/go/go-1.13.inc b/meta/recipes-devtools/go/go-1.13.inc
new file mode 100644
index 0000000000..2afe8b69cd
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.13.inc
@@ -0,0 +1,24 @@
+require go-common.inc
+
+GO_BASEVERSION = "1.13"
+GO_MINOR = ".3"
+PV .= "${GO_MINOR}"
+FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
+
+SRC_URI += "\
+    file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
+    file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch \
+    file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
+    file://0004-ld-add-soname-to-shareable-objects.patch \
+    file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
+    file://0006-cmd-dist-separate-host-and-target-builds.patch \
+    file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
+    file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
+"
+SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
+
+SRC_URI[main.md5sum] = "94ae8bf6a4fe623e34cb8b0db2a71ec0"
+SRC_URI[main.sha256sum] = "4f7123044375d5c404280737fbd2d0b17064b66182a65919ffe20ffe8620e3df"
+
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.13.bb b/meta/recipes-devtools/go/go-cross-canadian_1.13.bb
new file mode 100644
index 0000000000..7ac9449e47
--- /dev/null
+++ b/meta/recipes-devtools/go/go-cross-canadian_1.13.bb
@@ -0,0 +1,2 @@
+require go-cross-canadian.inc
+require go-${PV}.inc
diff --git a/meta/recipes-devtools/go/go-cross_1.13.bb b/meta/recipes-devtools/go/go-cross_1.13.bb
new file mode 100644
index 0000000000..80b5a03f6c
--- /dev/null
+++ b/meta/recipes-devtools/go/go-cross_1.13.bb
@@ -0,0 +1,2 @@
+require go-cross.inc
+require go-${PV}.inc
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.13.bb b/meta/recipes-devtools/go/go-crosssdk_1.13.bb
new file mode 100644
index 0000000000..1857c8a577
--- /dev/null
+++ b/meta/recipes-devtools/go/go-crosssdk_1.13.bb
@@ -0,0 +1,2 @@
+require go-crosssdk.inc
+require go-${PV}.inc
diff --git a/meta/recipes-devtools/go/go-native_1.13.bb b/meta/recipes-devtools/go/go-native_1.13.bb
new file mode 100644
index 0000000000..bbf3c0dd73
--- /dev/null
+++ b/meta/recipes-devtools/go/go-native_1.13.bb
@@ -0,0 +1,2 @@
+require ${PN}.inc
+require go-${PV}.inc
diff --git a/meta/recipes-devtools/go/go-runtime_1.13.bb b/meta/recipes-devtools/go/go-runtime_1.13.bb
new file mode 100644
index 0000000000..43b68b4e46
--- /dev/null
+++ b/meta/recipes-devtools/go/go-runtime_1.13.bb
@@ -0,0 +1,2 @@
+require go-${PV}.inc
+require go-runtime.inc
diff --git a/meta/recipes-devtools/go/go_1.13.bb b/meta/recipes-devtools/go/go_1.13.bb
new file mode 100644
index 0000000000..483e2e2cb7
--- /dev/null
+++ b/meta/recipes-devtools/go/go_1.13.bb
@@ -0,0 +1,14 @@
+require go-${PV}.inc
+require go-target.inc
+
+export GOBUILDMODE=""
+
+# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips
+# doesn't support -buildmode=pie, so skip the QA checking for mips and its
+# variants.
+python() {
+    if 'mips' in d.getVar('TARGET_ARCH',True):
+        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN',True), " textrel")
+    else:
+        d.setVar('GOBUILDMODE', 'pie')
+}
-- 
2.17.1 (Apple Git-112)


