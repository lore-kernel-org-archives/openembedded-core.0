Return-Path: <>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 527D07FAA8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 13:58:58 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id t16so2487074wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 06:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xZ8ihn9OlU4dFQ/YYDeH5+S+Kky+g5Axo4Ntx5onlH4=;
	b=r+3A1hrr1w4bawGno9iMC4Am0fu9SBktwXxDSVDSlfnxJNq75DIdxQDDBVXotvpuCu
	PB1xsoemB1x5T57cX5Pwb7gtx4roWXY6Q2YO6pd/KTx1sZ8Yi9XCNQmWsDT8CyU0Diim
	BS9CJ26mFTwZiDpgUG71M8zwuNILHM8NSLvG6/ffNImuAMzWv4wZ6CR/koazpeTYi/xA
	bRPqdfZifBkHTekBylVTWbjaBcgzunOXt2COvuwODUAiJuPkGJ+xiq4udKf8pdMFn6LY
	C7aPKE3B89fxKRLOZfmGbovFvCwZZTaR8GitEmG1aPi9Xwu2i7dOM3xH5dn14xqsOu+1
	M8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xZ8ihn9OlU4dFQ/YYDeH5+S+Kky+g5Axo4Ntx5onlH4=;
	b=fm2MPZpAxwianzIDfM9Cx3NMCavukK724kDZlo+CMGeuW7TvzspKTSjejGwcm8OhUl
	1X9h/VfWxa4kGavpTdky6z+pdAjyhG7MK4OcjDingJvujVChOhMP3V6PppggPfcC1E1U
	RO+uqEQpdbBtWG7j7Rp5uzIHsAgMQmaRqcqe7RA6gElpDjOx3KTb4kEGy9gz3Mgkqb/+
	tYVd5ry+1uMb9LKWkay8oWyAeKmkL7/qqWaayVct7HuG2bhYoQW6QNAtE13BJnTjkUuR
	PrisFzbG7L+pVagIuioT7o3+tJzAfF3RlE3rY6tpyJOkMQsi4HOSJsNqXTvyyE0e9Vno
	3Vaw==
X-Gm-Message-State: APjAAAVqLbK7tFCbM9CLdXwIO+JIFbXqF858Zn5neYF4mkPODowRdTNV
	utwNC+SSUHqqdD7W+9qOJyR0rzrt
X-Google-Smtp-Source: APXvYqyEHY2rps2FUKg6eJbqGqovxEnrSoUPW+S+wGr4s0A08pjpMyCPyM5GcMrjjxCG2mNigzaE3w==
X-Received: by 2002:adf:dd4d:: with SMTP id u13mr3201490wrm.104.1572011938766; 
	Fri, 25 Oct 2019 06:58:58 -0700 (PDT)
Received: from localhost.localdomain ([117.55.204.18])
	by smtp.gmail.com with ESMTPSA id
	w22sm2380726wmc.16.2019.10.25.06.58.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 06:58:58 -0700 (PDT)
From: Alexander Kube <alexander.j.kube@gmail.com>
X-Google-Original-From: Alexander Kube
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 18:28:45 +0430
Message-Id: <20191025135847.77492-2-alexander.j.kube@gmail.com>
X-Mailer: git-send-email 2.17.1 (Apple Git-112)
In-Reply-To: <20191025135847.77492-1-alexander.j.kube@gmail.com>
References: <20191025135847.77492-1-alexander.j.kube@gmail.com>
Subject: [PATCH v4 2/4] go: Add go1.13 recipes
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
X-List-Received-Date: Fri, 25 Oct 2019 13:58:58 -0000

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


