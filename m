Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.1663.1607985992575187756
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 14:46:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MDi9Tr81;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id e2so2610356plt.12
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 14:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bAsDV/lGuLCVoLVlnEoptk92M897hTtijaqzjft7VmM=;
        b=MDi9Tr811vqmMQpW+2+Ak6Titlq5+MIR36EU+BZo3O8LQ6eSQKrAx4saoYPVLdWo6u
         1ddXTaYfy1TAMnbsn3P4MgqRLb2tEtC7c6p9GDjR0FH4/RsQovcF+f6KmfVod6yBL9od
         wQAlxrnvWKvpmgvIrR5Ep5RMbNGu2ojmCsXZ7r53J+ccM9ehDUSDd7mcciLGeyw5XATK
         DXpZYlUVDpAAa/BrpOIdqVVGm0bu1byAraphp3jY/kP4bl7mKEXikW19d2zv32rUYP6J
         I4Z/ctsQpFSu7wRJfJ3PMS4VeOtv6VEIrAwwIgurJGqKR8WGbLyB1ii9OOEZLpWo1dcI
         O1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bAsDV/lGuLCVoLVlnEoptk92M897hTtijaqzjft7VmM=;
        b=pguT8ADcIgej6OqnK6XO+icCSVRcx/vSJtZtgYSTr972BSz9ibzUjs2mUdKCfNIJ3Z
         7m3+X/7XrOuLG3yu6TuN+jj9ZuAG2ff6FDC3C8bu7ZgGLkmFkXVJhaf1K0OlQ/u8aK/u
         SvYcVaONAcz0gKb/97X8WL6Y5uKMlhqf9u34eVzfxivNvfdPXiAGhi0sxLdHE7ozsN1V
         +QLFog0s/VH1O5XnPnm5cXVjmIBZZ57/IT2qgVn1z1gqKelRzMCZK+bY525CXXwUH5vV
         lT1Ew1p30Ww48lV5avp3yVu/qpkxifErtoq2wXNhau9UDNjMUqVO7/xdNpv3bbeMsqgM
         B2UA==
X-Gm-Message-State: AOAM531uzQkQDpr203nzo/dVH9J0dTGE72ZdypKRmS0NaahKujrQSZn0
	NDu/c7YItJLL8DUuirt7b9AhNUDv45Pyhg==
X-Google-Smtp-Source: ABdhPJx1+t3YoFlyY9qzQYLw4yKm8qJH4pglgIx6cEbyZXo0u7YgOmVBkW2Ssl2vK+eoY2OL2Y2ZPA==
X-Received: by 2002:a17:902:e9d4:b029:da:a2fd:476 with SMTP id 20-20020a170902e9d4b02900daa2fd0476mr24771271plk.73.1607985991537;
        Mon, 14 Dec 2020 14:46:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::64a3])
        by smtp.gmail.com with ESMTPSA id a21sm19119165pjq.37.2020.12.14.14.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 14:46:30 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] go: Update 1.15.5 -> 1.15.6
Date: Mon, 14 Dec 2020 14:46:27 -0800
Message-Id: <20201214224627.1777683-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

The deleted patch file mentioned below is removed since 1.15.6
already has the issue patched.

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
---
v2: Also update go-binary-native

 meta/recipes-devtools/go/go-1.15.inc          |   5 +-
 ...t-CGO_LDFLAGS-to-appear-in-go-ldflag.patch | 100 ------------------
 ...e_1.15.5.bb => go-binary-native_1.15.6.bb} |   4 +-
 3 files changed, 4 insertions(+), 105 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.15/0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
 rename meta/recipes-devtools/go/{go-binary-native_1.15.5.bb => go-binary-native_1.15.6.bb} (83%)

diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
index ccfb0c5987..abe74e5eb7 100644
--- a/meta/recipes-devtools/go/go-1.15.inc
+++ b/meta/recipes-devtools/go/go-1.15.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.15"
-PV = "1.15.5"
+PV = "1.15.6"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -15,6 +15,5 @@ SRC_URI += "\
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
-    file://0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch \
 "
-SRC_URI[main.sha256sum] = "c1076b90cf94b73ebed62a81d802cd84d43d02dea8c07abdc922c57a071c84f1"
+SRC_URI[main.sha256sum] = "890bba73c5e2b19ffb1180e385ea225059eb008eb91b694875dd86ea48675817"
diff --git a/meta/recipes-devtools/go/go-1.15/0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch b/meta/recipes-devtools/go/go-1.15/0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
deleted file mode 100644
index b57041f1db..0000000000
--- a/meta/recipes-devtools/go/go-1.15/0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 4759221d46b1666de96b8047cec3160bfe4d3d5d Mon Sep 17 00:00:00 2001
-From: Ian Lance Taylor <iant@golang.org>
-Date: Fri, 13 Nov 2020 11:05:37 -0800
-Subject: [PATCH] cmd/go: permit CGO_LDFLAGS to appear in //go:ldflag
-
-Fixes #42565
-
-Upstream-Status: Backport [https://github.com/golang/go/commit/782cf560db4c919790fdb476d1bbe18e5ddf5ffd]
-Change-Id: If7cf39905d124dbd54dfac6a53ee38270498efed
-Reviewed-on: https://go-review.googlesource.com/c/go/+/269818
-Trust: Ian Lance Taylor <iant@golang.org>
-Run-TryBot: Ian Lance Taylor <iant@golang.org>
-TryBot-Result: Go Bot <gobot@golang.org>
-Reviewed-by: Jay Conrod <jayconrod@google.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/cmd/go/internal/work/exec.go      | 15 +++++++++
- src/cmd/go/testdata/script/ldflag.txt | 44 +++++++++++++++++++++++++++
- 2 files changed, 59 insertions(+)
- create mode 100644 src/cmd/go/testdata/script/ldflag.txt
-
-diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 575a2df..9209e3d 100644
---- a/src/cmd/go/internal/work/exec.go
-+++ b/src/cmd/go/internal/work/exec.go
-@@ -2821,6 +2821,21 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
- 				idx = bytes.Index(src, []byte(cgoLdflag))
- 			}
- 		}
-+
-+		// We expect to find the contents of cgoLDFLAGS in flags.
-+		if len(cgoLDFLAGS) > 0 {
-+		outer:
-+			for i := range flags {
-+				for j, f := range cgoLDFLAGS {
-+					if f != flags[i+j] {
-+						continue outer
-+					}
-+				}
-+				flags = append(flags[:i], flags[i+len(cgoLDFLAGS):]...)
-+				break
-+			}
-+		}
-+
- 		if err := checkLinkerFlags("LDFLAGS", "go:cgo_ldflag", flags); err != nil {
- 			return nil, nil, err
- 		}
-diff --git a/src/cmd/go/testdata/script/ldflag.txt b/src/cmd/go/testdata/script/ldflag.txt
-new file mode 100644
-index 0000000..6ceb33b
---- /dev/null
-+++ b/src/cmd/go/testdata/script/ldflag.txt
-@@ -0,0 +1,44 @@
-+# Issue #42565
-+
-+[!cgo] skip
-+
-+# We can't build package bad, which uses #cgo LDFLAGS.
-+cd bad
-+! go build
-+stderr no-such-warning
-+
-+# We can build package ok with the same flags in CGO_LDFLAGS.
-+env CGO_LDFLAGS=-Wno-such-warning -Wno-unknown-warning-option
-+cd ../ok
-+go build
-+
-+# Build a main program that actually uses LDFLAGS.
-+cd ..
-+go build -ldflags=-v
-+
-+# Because we passed -v the Go linker should print the external linker
-+# command which should include the flag we passed in CGO_LDFLAGS.
-+stderr no-such-warning
-+
-+-- go.mod --
-+module ldflag
-+
-+-- bad/bad.go --
-+package bad
-+
-+// #cgo LDFLAGS: -Wno-such-warning -Wno-unknown-warning
-+import "C"
-+
-+func F() {}
-+-- ok/ok.go --
-+package ok
-+
-+import "C"
-+
-+func F() {}
-+-- main.go --
-+package main
-+
-+import _ "ldflag/ok"
-+
-+func main() {}
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/go/go-binary-native_1.15.5.bb b/meta/recipes-devtools/go/go-binary-native_1.15.6.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.15.5.bb
rename to meta/recipes-devtools/go/go-binary-native_1.15.6.bb
index 1fb11b0435..622557ad2b 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.15.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.15.6.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "9a58494e8da722c3aef248c9227b0e9c528c7318309827780f16220998180a0d"
-SRC_URI[go_linux_arm64.sha256sum] = "a72a0b036beb4193a0214bca3fca4c5d68a38a4ccf098c909f7ce8bf08567c48"
+SRC_URI[go_linux_amd64.sha256sum] = "3918e6cc85e7eaaa6f859f1bdbaac772e7a825b0eb423c63d3ae68b21f84b844"
+SRC_URI[go_linux_arm64.sha256sum] = "f87515b9744154ffe31182da9341d0a61eb0795551173d242c8cad209239e492"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.29.2

