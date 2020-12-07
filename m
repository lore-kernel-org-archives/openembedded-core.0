Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web08.6802.1607350401456982113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 06:13:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=eaUvVvdY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id m9so8978355pgb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Dec 2020 06:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=gZ/qYFrEvM0n9w1itL0hbUQksuS3zXKle2DDR7k98uE=;
        b=eaUvVvdYL3C/PCXjHP7bQDTjxIb2dPrymp2b40CVMKhkVJzBkwdWF4T3QIGeP1JvrO
         FhV5xT8bMUSpMV6LBeLsa0pvJlgUadP2jwoxywWh+bf9HjMWSKT+QmktG39dPp6HEGOT
         2tAFmehfi6+dNNSQ6AoPqjUW6QCguNl+CKzbBObr0FSOvKWvGvc1rLvWVQlUrZGxI10X
         TLS+Q6aOvrDXH6LRuZ9kT9ySKGKyD6U5ZgnEsHWX2pVRosE7OUpARMHYlvD2xxO/0u4R
         6uA24NDFb5NC4p0sQvXvKn3wcjyqCD3t3sNbakwbpqS2kksMnviMdGIdXWgV7pIUOe+/
         5wGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=gZ/qYFrEvM0n9w1itL0hbUQksuS3zXKle2DDR7k98uE=;
        b=RTT78H3cwFScE+ybfRbWPSm/5tCFnP3Z1bAXOM7OBARJL3N09XxpnxVJry7fqZ5SRz
         uwM9lKTWiB0Kt59CGwxaHRON1/EVmkVhBg3sPb62pfMytWAcufU/xMViS23Ax917LXlb
         9u8vy8CM6kX1NuFtdHIRZWw3dU0zdnQvfnO1pt3JTqkRcYZhsoKcPqzpimAK9e0oqubA
         Nm61MPrJ5KJ2U4LxyEcPR1CTXAgYNhwX8JDJZipVxYChp1u5X62oxCkRBLqHDuMhooJf
         trsvX2elWPFBl9qw/IyI9OcAQ5Mtx0DB589qZN6M4nWLVN1adtsD+fKtA8NAkBoRpS68
         FHlw==
X-Gm-Message-State: AOAM5315nzKl0J6nFzgIW4jrP8Zr0LUgx7DXT1U4UVBLaJEAH0qI6SFr
	FVw9vmwjfhwGs6hyEciVv6n6gnvf7MqsJZDE
X-Google-Smtp-Source: ABdhPJwnOijogNyDhY+yIFfTC+J+aldg8OZ7NfZhryFuVjobAF757B0XMwvwKdTV8SUhHdhiSTA21Q==
X-Received: by 2002:a63:170f:: with SMTP id x15mr3774313pgl.157.1607350400474;
        Mon, 07 Dec 2020 06:13:20 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u3sm14848093pfu.47.2020.12.07.06.13.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 06:13:19 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 9/9] go: update to 1.14.12
Date: Mon,  7 Dec 2020 04:12:26 -1000
Message-Id: <e216b2223cbe8c459348262f98b3cfbe79d12023.1607350153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607350153.git.steve@sakoman.com>
References: <cover.1607350153.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

update minor version to 1.14.12

go1.14.8 includes security fixes to the net/http/cgi and net/http/fcgi packages.
go1.14.9 includes fixes to the compiler, linker, runtime, documentation, and the net/http and testing packages.
go1.14.10 includes fixes to the compiler, runtime, and the plugin and testing packages.
go1.14.11 includes fixes to the runtime, and the net/http and time packages.
go1.14.12 includes security fixes to the cmd/go and math/big packages.

Release notes:
https://golang.org/doc/devel/release.html#go1.14.minor

updates include fix for
CVE-2020-24553
CVE-2020-28362
CVE-2020-28366
CVE-2020-28367

Also backport patch to fix below CGO_LDFLAGS error

| Building std for target, linux/amd64.
| go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  5 +-
 ...t-CGO_LDFLAGS-to-appear-in-go-ldflag.patch | 98 +++++++++++++++++++
 2 files changed, 101 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 8f8ed89de8..02c40f4e25 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.14"
-GO_MINOR = ".7"
+GO_MINOR = ".12"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -16,6 +16,7 @@ SRC_URI += "\
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
+    file://0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
-SRC_URI[main.sha256sum] = "064392433563660c73186991c0a315787688e7c38a561e26647686f89b6c30e3"
+SRC_URI[main.sha256sum] = "b34f4b7ad799eab4c1a52bdef253602ce957125a512f5a1b28dce43c6841b971"
diff --git a/meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch b/meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
new file mode 100644
index 0000000000..85bf39c752
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
@@ -0,0 +1,98 @@
+From 782cf560db4c919790fdb476d1bbe18e5ddf5ffd Mon Sep 17 00:00:00 2001
+From: Ian Lance Taylor <iant@golang.org>
+Date: Fri, 13 Nov 2020 11:05:37 -0800
+Subject: [PATCH] cmd/go: permit CGO_LDFLAGS to appear in //go:ldflag
+
+Fixes #42565
+
+Change-Id: If7cf39905d124dbd54dfac6a53ee38270498efed
+Reviewed-on: https://go-review.googlesource.com/c/go/+/269818
+Trust: Ian Lance Taylor <iant@golang.org>
+Run-TryBot: Ian Lance Taylor <iant@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Reviewed-by: Jay Conrod <jayconrod@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/782cf560db4c919790fdb476d1bbe18e5ddf5ffd]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ src/cmd/go/internal/work/exec.go      | 15 +++++++++
+ src/cmd/go/testdata/script/ldflag.txt | 44 +++++++++++++++++++++++++++
+ 2 files changed, 59 insertions(+)
+ create mode 100644 src/cmd/go/testdata/script/ldflag.txt
+
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index 2c40a4bf001e..157ac4cafc70 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -2883,6 +2883,21 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
+ 				idx = bytes.Index(src, []byte(cgoLdflag))
+ 			}
+ 		}
++
++		// We expect to find the contents of cgoLDFLAGS in flags.
++		if len(cgoLDFLAGS) > 0 {
++		outer:
++			for i := range flags {
++				for j, f := range cgoLDFLAGS {
++					if f != flags[i+j] {
++						continue outer
++					}
++				}
++				flags = append(flags[:i], flags[i+len(cgoLDFLAGS):]...)
++				break
++			}
++		}
++
+ 		if err := checkLinkerFlags("LDFLAGS", "go:cgo_ldflag", flags); err != nil {
+ 			return nil, nil, err
+ 		}
+diff --git a/src/cmd/go/testdata/script/ldflag.txt b/src/cmd/go/testdata/script/ldflag.txt
+new file mode 100644
+index 000000000000..6ceb33bb70e7
+--- /dev/null
++++ b/src/cmd/go/testdata/script/ldflag.txt
+@@ -0,0 +1,44 @@
++# Issue #42565
++
++[!cgo] skip
++
++# We can't build package bad, which uses #cgo LDFLAGS.
++cd bad
++! go build
++stderr no-such-warning
++
++# We can build package ok with the same flags in CGO_LDFLAGS.
++env CGO_LDFLAGS=-Wno-such-warning -Wno-unknown-warning-option
++cd ../ok
++go build
++
++# Build a main program that actually uses LDFLAGS.
++cd ..
++go build -ldflags=-v
++
++# Because we passed -v the Go linker should print the external linker
++# command which should include the flag we passed in CGO_LDFLAGS.
++stderr no-such-warning
++
++-- go.mod --
++module ldflag
++
++-- bad/bad.go --
++package bad
++
++// #cgo LDFLAGS: -Wno-such-warning -Wno-unknown-warning
++import "C"
++
++func F() {}
++-- ok/ok.go --
++package ok
++
++import "C"
++
++func F() {}
++-- main.go --
++package main
++
++import _ "ldflag/ok"
++
++func main() {}
-- 
2.17.1

