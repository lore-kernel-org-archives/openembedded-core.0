Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id A21C460248
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 15:49:07 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id v78so3491039pgb.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 08:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tzoFro7c01PQG4E8OK4bbczW7MvrqkD62zZJhsZe50k=;
	b=fdg4Fj28k+dBu/tSufUbDejBjThrEmcTgeiNvRPGTK299MmOphE8pnF8kuQADGZFnN
	tq8mJgWmfVBhlo/Wn9kmmHicogbkM0+gdaI0sxn4S80RqCRzLgpXAPTyFjuVl9kTJ1/b
	H2BFJQr12PGFHsy2cpWITr+lieDedS+Vl2Ry0DHgWWoNp0kqdfALgSznVLlf5f0iTXUl
	IxzUZqPqgTPPhjOYVcnw1jC8W5txvfaTQ5rHcCjHUVb4kz8AZrVo1Xdc6SmUKQlCmgYm
	Fs6DSlWZpbafdpqCCLV/h1pUo3dsfMbrH65fX1hQl9FQpwpF62I+CkL7oklZ5Ad5s2f6
	5Tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tzoFro7c01PQG4E8OK4bbczW7MvrqkD62zZJhsZe50k=;
	b=Qenm25mwslxp2tN4UodrRoAFDgcriOvVkWNnAbCL4aDPP77tZUj3OhHyaevqsh2YbI
	PGlqsWz1qGZlFtXQWtrr7GtfCi1nBXwk0XEPLIUvjyd8WXCHg0FWqHP/YzJGALZBq3JF
	MFcSU7nxOlnU+BDKW7ZnToErVNIFxEQoxcnbePKEw4g8ZnnmV1ptbpJ/tRrzZk080Ga+
	/tB/f3JgtWhfBJDGFxC/GnxqHdCmYbFfmbqIkXCnMil59BTKB+xzz6DTnghXT3aCX7uh
	7sLsOFBlqDasPLGx+fV16pGkg7AC5xAN+nXCSianDiJUwYCKOq9ay9tIi3UvaLIDDjhU
	XwVw==
X-Gm-Message-State: AMCzsaVZwHU/JMvn/3v/UiV0m19rEh31kW3TxswrE0NhGHHDmYxMrTLG
	nTejsCZur69bRd8kJCq1ss5z1w==
X-Google-Smtp-Source: AOwi7QCn1jep0XiWGwTYCsJKcynjgpwMP9Lrfne+a5gAJDvyYG3plN0vlLC2gjxPiRzX++XOKPyKxA==
X-Received: by 10.159.206.132 with SMTP id bg4mr4432632plb.129.1507996148509; 
	Sat, 14 Oct 2017 08:49:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::74e7])
	by smtp.gmail.com with ESMTPSA id r9sm8384819pfd.6.2017.10.14.08.49.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Oct 2017 08:49:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Oct 2017 08:48:52 -0700
Message-Id: <20171014154858.35123-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH 1/7] go-dep: Upgrade to 0.3.1
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
X-List-Received-Date: Sat, 14 Oct 2017 15:49:07 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../go-dep/0001-Add-support-for-mips-mips64.patch  | 54 ++++++++++++++++++++++
 ...er-constant-that-hopefully-works-the-same.patch | 33 +++++++++++++
 meta/recipes-devtools/go/go-dep_0.3.0.bb           | 16 -------
 meta/recipes-devtools/go/go-dep_0.3.1.bb           | 19 ++++++++
 4 files changed, 106 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-dep/0001-Add-support-for-mips-mips64.patch
 create mode 100644 meta/recipes-devtools/go/go-dep/0001-use-a-smaller-constant-that-hopefully-works-the-same.patch
 delete mode 100644 meta/recipes-devtools/go/go-dep_0.3.0.bb
 create mode 100644 meta/recipes-devtools/go/go-dep_0.3.1.bb

diff --git a/meta/recipes-devtools/go/go-dep/0001-Add-support-for-mips-mips64.patch b/meta/recipes-devtools/go/go-dep/0001-Add-support-for-mips-mips64.patch
new file mode 100644
index 0000000000..34ec9876f8
--- /dev/null
+++ b/meta/recipes-devtools/go/go-dep/0001-Add-support-for-mips-mips64.patch
@@ -0,0 +1,54 @@
+From f0fb80604385ae3266a472601ef685896b4cc0af Mon Sep 17 00:00:00 2001
+From: Vladimir Stefanovic <vladimir.stefanovic@imgtec.com>
+Date: Fri, 17 Feb 2017 20:44:43 +0100
+Subject: [PATCH] Add support for mips, mips64
+
+---
+Upstream-Status: Submitted
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ vendor/github.com/boltdb/bolt/bolt_mips64x.go | 12 ++++++++++++
+ vendor/github.com/boltdb/bolt/bolt_mipsx.go   | 12 ++++++++++++
+ 2 files changed, 24 insertions(+)
+ create mode 100644 vendor/github.com/boltdb/bolt/bolt_mips64x.go
+ create mode 100644 vendor/github.com/boltdb/bolt/bolt_mipsx.go
+
+diff --git a/vendor/github.com/boltdb/bolt/bolt_mips64x.go b/vendor/github.com/boltdb/bolt/bolt_mips64x.go
+new file mode 100644
+index 00000000..134b578b
+--- /dev/null
++++ b/vendor/github.com/boltdb/bolt/bolt_mips64x.go
+@@ -0,0 +1,12 @@
++// +build mips64 mips64le
++
++package bolt
++
++// maxMapSize represents the largest mmap size supported by Bolt.
++const maxMapSize = 0x8000000000 // 512GB
++
++// maxAllocSize is the size used when creating array pointers.
++const maxAllocSize = 0x7FFFFFFF
++
++// Are unaligned load/stores broken on this arch?
++var brokenUnaligned = false
+diff --git a/vendor/github.com/boltdb/bolt/bolt_mipsx.go b/vendor/github.com/boltdb/bolt/bolt_mipsx.go
+new file mode 100644
+index 00000000..d5ecb059
+--- /dev/null
++++ b/vendor/github.com/boltdb/bolt/bolt_mipsx.go
+@@ -0,0 +1,12 @@
++// +build mips mipsle
++
++package bolt
++
++// maxMapSize represents the largest mmap size supported by Bolt.
++const maxMapSize = 0x40000000 // 1GB
++
++// maxAllocSize is the size used when creating array pointers.
++const maxAllocSize = 0xFFFFFFF
++
++// Are unaligned load/stores broken on this arch?
++var brokenUnaligned = false
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-dep/0001-use-a-smaller-constant-that-hopefully-works-the-same.patch b/meta/recipes-devtools/go/go-dep/0001-use-a-smaller-constant-that-hopefully-works-the-same.patch
new file mode 100644
index 0000000000..2a7bc43cdb
--- /dev/null
+++ b/meta/recipes-devtools/go/go-dep/0001-use-a-smaller-constant-that-hopefully-works-the-same.patch
@@ -0,0 +1,33 @@
+From 73e8dd479420bb90a46cf9d99ca62289fab3677e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Sep 2017 08:43:58 -0700
+Subject: [PATCH] use a smaller constant that hopefully works the same.
+
+This test uses a constant that is too big for 32bit systems.
+
+Backported from
+https://github.com/boltdb/bolt/issues/645
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ vendor/github.com/boltdb/bolt/db_test.go | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/vendor/github.com/boltdb/bolt/db_test.go b/vendor/github.com/boltdb/bolt/db_test.go
+index 3034d4f4..035f5a5f 100644
+--- a/vendor/github.com/boltdb/bolt/db_test.go
++++ b/vendor/github.com/boltdb/bolt/db_test.go
+@@ -370,7 +370,7 @@ func TestDB_Open_InitialMmapSize(t *testing.T) {
+ 	path := tempfile()
+ 	defer os.Remove(path)
+ 
+-	initMmapSize := 1 << 31  // 2GB
++	initMmapSize := 1 << 29  // 512MB
+ 	testWriteSize := 1 << 27 // 134MB
+ 
+ 	db, err := bolt.Open(path, 0666, &bolt.Options{InitialMmapSize: initMmapSize})
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-dep_0.3.0.bb b/meta/recipes-devtools/go/go-dep_0.3.0.bb
deleted file mode 100644
index abfeb48370..0000000000
--- a/meta/recipes-devtools/go/go-dep_0.3.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Dependency management tool for Golang"
-HOMEPAGE = "https://github.com/golang/dep"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=1bad315647751fab0007812f70d42c0d"
-
-GO_IMPORT = "github.com/golang/dep"
-SRC_URI = "git://${GO_IMPORT}"
-
-# Points to 0.3.0 tag
-SRCREV = "7a91b794bbfbf1f3b8b79823799316451127801b"
-
-inherit go
-
-GO_INSTALL = "${GO_IMPORT}/cmd/dep"
-
-RDEPENDS_${PN}-dev += "bash"
diff --git a/meta/recipes-devtools/go/go-dep_0.3.1.bb b/meta/recipes-devtools/go/go-dep_0.3.1.bb
new file mode 100644
index 0000000000..3a404e357f
--- /dev/null
+++ b/meta/recipes-devtools/go/go-dep_0.3.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Dependency management tool for Golang"
+HOMEPAGE = "https://github.com/golang/dep"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=1bad315647751fab0007812f70d42c0d"
+
+GO_IMPORT = "github.com/golang/dep"
+SRC_URI = "git://${GO_IMPORT} \
+           file://0001-use-a-smaller-constant-that-hopefully-works-the-same.patch;patchdir=src/github.com/golang/dep \
+           file://0001-Add-support-for-mips-mips64.patch;patchdir=src/github.com/golang/dep \
+          "
+
+# Points to 0.3.1 tag
+SRCREV = "83789e236d7ff64c82ee8392005455fc1ec1983b"
+
+inherit go
+
+GO_INSTALL = "${GO_IMPORT}/cmd/dep"
+
+RDEPENDS_${PN}-dev += "bash"
-- 
2.14.2


