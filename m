Return-Path: <>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id D289A7FA71
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 14:04:41 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id r1so2471835wrs.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xZ8ihn9OlU4dFQ/YYDeH5+S+Kky+g5Axo4Ntx5onlH4=;
	b=HQ0Gg324zb/spIM6pFXz/Gtxk0edIJvKvllbk/x7cZ7SxnLe0rfN1wt0lE9Lo566JC
	/UDJUf6Di6MVNg1b2E83VZhdi07kEf+cLgB3YGx5i1Rvin7w1V3/8QvP0Xqa8+NiR4D0
	MjkgEiBjBdpJdPw9M7jxrFy0Xn4grU7+e+yPYD+Sj8B44hHe81ze4OAvP+Pnb0Bl2zh2
	fNYbbHxChUAlwA6M5KD51AMf41M1nSBV8gROvf+wItTU+V1VHq0kiZywgZN+uJUMxTLl
	dae3mtvFGdRMXWJelQZGF5OAJss3Lps1vJdvjZloAWoE18evBfrl1l9i0kVgd8JejWe9
	9Lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xZ8ihn9OlU4dFQ/YYDeH5+S+Kky+g5Axo4Ntx5onlH4=;
	b=EOpSSGYVAi/Y9Ty++yT21EzK/wBDh/DlVqBgrbQicdwqcHwSGP5jFyrbwsAB4clGlN
	2Zv43z0+xE/HUc4crAByUpp+ZMMV+R+4lM9VRZxj/yI+FHq74hlgUDhy13EZx9zylfOJ
	t9bpsVLKHVQPLtEC+jfUGu3ryV1qWgt9zNWIrloU5847pf6yPYIhzqmiUxJffVpnjGON
	PwOh9SYB5cyRgEoGJ1T4oW+AHqvsFACcJGj9L4qGmdJzSGutKH2UPm11XlhXROCgrz1V
	2gUVSe0KGTWfB1T9WGevLg9F0v1BfMjDNdHNI7cuYdyhYZutv2LNNMYCFdrZKvO8miwj
	QBrg==
X-Gm-Message-State: APjAAAWOKWdDF6+PpR7h6hZkpYog9tJAQeC//9NOYviAQjhA17Fv+JTg
	PsHS9dzGJQVt95Z2mN/V8z+0CCRu
X-Google-Smtp-Source: APXvYqzbIcKaP6qhXnlP1v5+MClDS+iBwRG9FgH8fee6yOG3rDM34fg8pbWX5Ja7cg0KdoU40zzZog==
X-Received: by 2002:adf:dbcf:: with SMTP id e15mr3326215wrj.134.1572012282488; 
	Fri, 25 Oct 2019 07:04:42 -0700 (PDT)
Received: from localhost.localdomain ([117.55.204.18])
	by smtp.gmail.com with ESMTPSA id l6sm2185417wmg.2.2019.10.25.07.04.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 07:04:41 -0700 (PDT)
From: Alexander Kube <alexander.j.kube@gmail.com>
X-Google-Original-From: Alexander Kube
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 18:34:27 +0430
Message-Id: <20191025140430.77773-2-alexander.j.kube@gmail.com>
X-Mailer: git-send-email 2.17.1 (Apple Git-112)
In-Reply-To: <20191025140430.77773-1-alexander.j.kube@gmail.com>
References: <20191025140430.77773-1-alexander.j.kube@gmail.com>
Subject: [PATCH v5 2/4] go: Add go1.13 recipes
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
X-List-Received-Date: Fri, 25 Oct 2019 14:04:43 -0000

From: Alex Kube <alexander.j.kube@gmail.com>

Signed-off-by: Alex Kube <alexander.j.kube@gmail.com>
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


