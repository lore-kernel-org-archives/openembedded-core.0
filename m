Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51F4EB64DA
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 13:34:23 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.19391.1689341657918992824
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 06:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OeByWpjc;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-785cbc5bfd2so75396739f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689341657; x=1691933657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zyMAV70cX4PS4zRIE67PGESKdl711UpfQa5YyCW8wc4=;
        b=OeByWpjcztJryc46mB+rg9YtmMn0y4BQWNkCpmHcJYP6kJYGZPnxbITAvIetVmP8+v
         rO1p8NFCF1D9pW9oC+rvE/vU0HFmw8ar6+q4LBU70tbOX+3kYLBIY3CVtkEymrkSL3LT
         MAQ1unh7+ZG3k4wXNK9y2axOUad1OvdlRy9huaKp/8CWFMoakUAxWFv/O958oTk8Tx8d
         0/qApTRojgfDcioz5OPWleBNNjyM7tyPJNsokafBG9tBO7EC++dnZvBmOckpHRBI9+Dv
         jfDkkJfq10rEPu9NTbLCSMzT5B13SHzNAJawx5/QLHs7W8XJbJLTvWr6tLThfdEF5yP5
         PmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689341657; x=1691933657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyMAV70cX4PS4zRIE67PGESKdl711UpfQa5YyCW8wc4=;
        b=abqCVPUmePOifG60lxPiOCUv7xJf8c0LWqNhQdhPWHBDnSfC7VMrB44RRD2WsfbQ1X
         IQgVsKorPteC/xyVjIBipMBKLZSgu1iErVnN/B/QXBbFZzqcKu4iZX8oQcLmPAD6ACiZ
         SiKC2GjvvumpceKN72EFfDtKtoH8ASNM508iWkwTv37FIyZNlJ5p7yp/17ws1koj6Hq+
         1PgXHWZcR8ijX2DMGi2InHwLZGHw7MdlfiLwow9ipgaMLSRZU4y1ZcHDHnP/f4oYbll8
         EhKWjJUgCGXnubEkavo1t4B1lAz7M2X6y6wZbnXrxZvA28mZ28B1rDApfQzhkkvx778u
         H/tA==
X-Gm-Message-State: ABy/qLYuQ98HDkpLySkA8Glt7HL711odF2StZte72LppfUfPPIC81Tpg
	qzXAwj7FDrfvP7qDLzNgIm5Lkl/XdUw=
X-Google-Smtp-Source: APBJJlHDG4uW6gZNc2sTahBMmvK5C5L8n4cUBuQ9BRGf/qbCoqsqS+WNxPkyQwAVECNTVi9XVEGL8g==
X-Received: by 2002:a6b:e70c:0:b0:780:c787:637d with SMTP id b12-20020a6be70c000000b00780c787637dmr4682529ioh.17.1689341656891;
        Fri, 14 Jul 2023 06:34:16 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id ed5-20020a056638290500b0042b27413760sm2528944jab.142.2023.07.14.06.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 06:34:16 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] go: update 1.20.5 -> 1.20.6
Date: Fri, 14 Jul 2023 13:34:00 +0000
Message-Id: <20230714133400.3463291-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 13:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184263

Upgrade to latest 1.20.x release [1]:

$ git log --oneline go1.20.5..go1.20.6 origin/release-branch.go1.20
2c358ffe97 (tag: go1.20.6, origin/release-branch.go1.20) [release-branch.go1.20] go1.20.6
312920c00a [release-branch.go1.20] net/http: validate Host header before sending
4db13d762b [release-branch.go1.20] runtime: set raceignore to zero when starting a new goroutine
08a58dd8b6 [release-branch.go1.20] runtime: allow for 5 more threads in TestWindowsStackMemory*
65092835c5 [release-branch.go1.20] cmd/go: skip TestScript/gccgo_link_ldflags on aix/ppc64
bca817594c [release-branch.go1.20] crypto/x509: tolerate multiple matching chains in testVerify
b8e67d1ddd [release-branch.go1.20] cmd/go/internal/test: don't wait for previous test actions when interrupted
3db4f8146c [release-branch.go1.20] runtime: resolve checkdead panic by refining `startm` lock handling in caller context
6b45fb7b73 [release-branch.go1.20] runtime: fallback to TEB arbitrary pointer when TLS slots are full
be30960e58 [release-branch.go1.20] runtime: use 1-byte load for address checking in racecallatomic
b59efe6c34 [release-branch.go1.20] net/mail: permit more characters in mail headers
c32f1afb41 [release-branch.go1.20] all: make safe for new vet analyzer
c7b145655b [release-branch.go1.20] cmd/go: fix tests for new builder environment
03063101a2 [release-branch.go1.20] text/template: set variables correctly in range assignment
d51e322a3f [release-branch.go1.20] go/printer: error out of Fprint when it would write a '//line' directive with a multiline file path
49594244d3 [release-branch.go1.20] cmd/cover: error out if a requested source file contains a newline
4719048211 [release-branch.go1.20] cmd/cgo: error out if the source path used in line directives would contain a newline
6c606fc191 [release-branch.go1.20] cmd/go: fix TestScript/build_cwd_newline with CGO_ENABLED=0
63ad2b5811 [release-branch.go1.20] cmd/compile: do not report division by error during typecheck
95f377daad [release-branch.go1.20] cmd/go: retain extra roots to disambiguate imports in 'go mod tidy'
a7a48fad7e [release-branch.go1.20] crypto/ecdsa: properly truncate P-521 hashes
f5172dcd38 [release-branch.go1.20] go/build: check for invalid import paths again
8b3acefcbe [release-branch.go1.20] cmd/go: omit checksums for go.mod files needed for go version lines more often in pre-1.21 modules
1008486a9f [release-branch.go1.20] cmd/cgo: correct _cgo_flags output

[1] https://github.com/golang/go/compare/go1.20.5...go1.20.6

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/go/{go-1.20.5.inc => go-1.20.6.inc}   | 2 +-
 ...o-binary-native_1.20.5.bb => go-binary-native_1.20.6.bb} | 6 +++---
 ...cross-canadian_1.20.5.bb => go-cross-canadian_1.20.6.bb} | 0
 .../go/{go-cross_1.20.5.bb => go-cross_1.20.6.bb}           | 0
 .../go/{go-crosssdk_1.20.5.bb => go-crosssdk_1.20.6.bb}     | 0
 .../go/{go-native_1.20.5.bb => go-native_1.20.6.bb}         | 0
 .../go/{go-runtime_1.20.5.bb => go-runtime_1.20.6.bb}       | 0
 meta/recipes-devtools/go/{go_1.20.5.bb => go_1.20.6.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.5.inc => go-1.20.6.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.5.bb => go-binary-native_1.20.6.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.5.bb => go-cross-canadian_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.5.bb => go-cross_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.5.bb => go-crosssdk_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.5.bb => go-native_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.5.bb => go-runtime_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.5.bb => go_1.20.6.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.5.inc b/meta/recipes-devtools/go/go-1.20.6.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.20.5.inc
rename to meta/recipes-devtools/go/go-1.20.6.inc
index 4e4e57d5cb..551171b255 100644
--- a/meta/recipes-devtools/go/go-1.20.5.inc
+++ b/meta/recipes-devtools/go/go-1.20.6.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "9a15c133ba2cfafe79652f4815b62e7cfc267f68df1b9454c6ab2a3ca8b96a88"
+SRC_URI[main.sha256sum] = "62ee5bc6fb55b8bae8f705e0cb8df86d6453626b4ecf93279e2867092e0b7f70"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.5.bb b/meta/recipes-devtools/go/go-binary-native_1.20.6.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.5.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.6.bb
index a98be4af1b..5b2f8f4352 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.6.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "d7ec48cde0d3d2be2c69203bc3e0a44de8660b9c09a6e85c4732a3f7dc442612"
-SRC_URI[go_linux_arm64.sha256sum] = "aa2fab0a7da20213ff975fa7876a66d47b48351558d98851b87d1cfef4360d09"
-SRC_URI[go_linux_ppc64le.sha256sum] = "049b8ab07d34077b90c0642138e10207f6db14bdd1743ea994a21e228f8ca53d"
+SRC_URI[go_linux_amd64.sha256sum] = "b945ae2bb5db01a0fb4786afde64e6fbab50b67f6fa0eb6cfa4924f16a7ff1eb"
+SRC_URI[go_linux_arm64.sha256sum] = "4e15ab37556e979181a1a1cc60f6d796932223a0f5351d7c83768b356f84429b"
+SRC_URI[go_linux_ppc64le.sha256sum] = "a1b91a42a40bba54bfd5c96c23d72250e0c424038d0d2b5c7950b828b4905822"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.5.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.5.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.6.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.5.bb b/meta/recipes-devtools/go/go-cross_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.5.bb
rename to meta/recipes-devtools/go/go-cross_1.20.6.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.5.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.5.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.6.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.5.bb b/meta/recipes-devtools/go/go-native_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.5.bb
rename to meta/recipes-devtools/go/go-native_1.20.6.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.5.bb b/meta/recipes-devtools/go/go-runtime_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.5.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.6.bb
diff --git a/meta/recipes-devtools/go/go_1.20.5.bb b/meta/recipes-devtools/go/go_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.5.bb
rename to meta/recipes-devtools/go/go_1.20.6.bb
-- 
2.34.1


