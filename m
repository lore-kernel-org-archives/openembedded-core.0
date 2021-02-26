Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web12.9975.1614349557292487749
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TWHzhlLF;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.175, mailfrom: steve@sakoman.com)
Received: by mail-il1-f175.google.com with SMTP id i18so8104010ilq.13
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jcxGf1r8kNoh+ZfJngUC2Db02S390XOPPVGHJ4Zd9cc=;
        b=TWHzhlLFRIJFFATUP/YaO/1ocgQyAYp1tqWpDTm3+YZuuDQkYuqBvTbc9dlu4jSi06
         LxfGRJLfhhkMyNVjwPO9pM7WwPymSRslZp/Qr56322/M9d+bNsdiccSYzS2EdCryJeVL
         hiIyiEAoxov6aWxI12oV/vbP4w2O2ReHHPZfrGGvWUKPhbT14MavzGpkUFPqK5+jXKII
         yoK4fIVdpMg3FmWF7U3Genk3dkpf6jAkjRaYHTtmVDt/ZpkIyJZCI2ccLxixIeem6k4n
         qoge1hf+hsoPPxS5744nvV5Ypbrhoq9+QRppqt9AEXQfpDv6huuQCQ+7YV5NBcXLPgfM
         xlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jcxGf1r8kNoh+ZfJngUC2Db02S390XOPPVGHJ4Zd9cc=;
        b=P7260c+kHB1i9ibZ1UiA7l5qInit74ryF72HVQbUe1MS9a5ZOEHAPkCXKkBJEUXCu7
         PxdCMrSXVFytQbXjnQKbg6JJaN8zUGPXgBaafIuQLMKaWWa+lzMuxnkTo5Mu11CaG80n
         MGSs7qVTGKj7ItqL+GIQEE3Gs/SkXcHDAK+McHaH4ZldWB8vTLTnqAWmoY1XKcYgE/3f
         4yKwb2H05yKMHSOLDqgijsdHogZIvDlAnsmsgLjIMv7ltgkDGwMFwwQvVDqQi0K2Dm3x
         3b4dL+PSQ4l7+i24QqnfpF8vA5GbkkeT9kCBZIZpR7oe9W+qryr+CULtA/3tzuV84etd
         +LkA==
X-Gm-Message-State: AOAM530rtvQFrb0rXgUZV1aX8ckvTYExWAnO2nrwNCb9M3tPFHpxdq2l
	bVWpa+3m7SPFlMDxpZq+a81dLSVMoqQQ9JRQ
X-Google-Smtp-Source: ABdhPJyKHE+RSzjB2TH2AOGt1DTguwlBRW8B1qK8ags9qf8rzBfn3Xa/bBJMi9klOpD7E8hr0Mu2Tw==
X-Received: by 2002:a05:6e02:1aab:: with SMTP id l11mr2658690ilv.300.1614349556095;
        Fri, 26 Feb 2021 06:25:56 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.25.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:25:55 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/40] go: update to 1.14.15
Date: Fri, 26 Feb 2021 04:23:54 -1000
Message-Id: <fc00bb2a71c3321af01b072c4e329650f7e163dd.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

updates include fixes for
CVE-2021-3114
CVE-2021-3115

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  5 +-
 ...t-CGO_LDFLAGS-to-appear-in-go-ldflag.patch | 98 -------------------
 2 files changed, 2 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 02c40f4e25..3dfd671d11 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.14"
-GO_MINOR = ".12"
+GO_MINOR = ".15"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -16,7 +16,6 @@ SRC_URI += "\
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
-    file://0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
-SRC_URI[main.sha256sum] = "b34f4b7ad799eab4c1a52bdef253602ce957125a512f5a1b28dce43c6841b971"
+SRC_URI[main.sha256sum] = "7ed13b2209e54a451835997f78035530b331c5b6943cdcd68a3d815fdc009149"
diff --git a/meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch b/meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
deleted file mode 100644
index 85bf39c752..0000000000
--- a/meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 782cf560db4c919790fdb476d1bbe18e5ddf5ffd Mon Sep 17 00:00:00 2001
-From: Ian Lance Taylor <iant@golang.org>
-Date: Fri, 13 Nov 2020 11:05:37 -0800
-Subject: [PATCH] cmd/go: permit CGO_LDFLAGS to appear in //go:ldflag
-
-Fixes #42565
-
-Change-Id: If7cf39905d124dbd54dfac6a53ee38270498efed
-Reviewed-on: https://go-review.googlesource.com/c/go/+/269818
-Trust: Ian Lance Taylor <iant@golang.org>
-Run-TryBot: Ian Lance Taylor <iant@golang.org>
-TryBot-Result: Go Bot <gobot@golang.org>
-Reviewed-by: Jay Conrod <jayconrod@google.com>
-
-Upstream-Status: Backport [https://github.com/golang/go/commit/782cf560db4c919790fdb476d1bbe18e5ddf5ffd]
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
----
- src/cmd/go/internal/work/exec.go      | 15 +++++++++
- src/cmd/go/testdata/script/ldflag.txt | 44 +++++++++++++++++++++++++++
- 2 files changed, 59 insertions(+)
- create mode 100644 src/cmd/go/testdata/script/ldflag.txt
-
-diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 2c40a4bf001e..157ac4cafc70 100644
---- a/src/cmd/go/internal/work/exec.go
-+++ b/src/cmd/go/internal/work/exec.go
-@@ -2883,6 +2883,21 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
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
-index 000000000000..6ceb33bb70e7
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
-- 
2.25.1

