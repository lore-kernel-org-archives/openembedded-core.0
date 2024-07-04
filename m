Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A70C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 17:06:12 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.246.1720112766293260207
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 10:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R5enZSjq;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3679df4cb4cso524835f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 10:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720112764; x=1720717564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=subkC4o/kW/dA/+bugnFbzLvkLsKKWRFVLjyqTQqQ1o=;
        b=R5enZSjqvNse1gfzaO2x0dmK87atggsSDhWcViOicDW5iWL0zro9bB9QWr0S5jGqsx
         nPnNXmr5cZstsY5pu283dIFeUAWviWtJ1HDt1bGWfU4cxTXi0cWTD+9muY2lGiODF/ue
         ka52o1TnhLFwnIC0+xn33008N6spuZxY3l6JOt05Q+04putL0GKrIFs/1888aGSlKw/P
         /vN+KAwxoUYC0MMiF5l/TuGEleOpt8gZG921Mnuo8wke7vp9qkEzUxpx0XDmUdr8FZxd
         ybgXnJeSpiUcPCjZdPghA1IGVR+gh1xXmFr7dqCSMWUVOTkUN878mU+He6rTieoUc0EI
         /IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720112764; x=1720717564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=subkC4o/kW/dA/+bugnFbzLvkLsKKWRFVLjyqTQqQ1o=;
        b=jW4Va/ErevWLntuHuZyH9Hrrwry8tljd5XgKc57VaHCUBk/pyvoeZNnGiDP4KxhES4
         QcL/8NZ6t3O0QtWvDpJOkk3A/gCsN1KMDSZMZlK/mGKgYqE4KdVwakV4UiShpTd86v40
         bVLyhV64riZGJt3D7y5YMZYIVPOjZUXRQLx7KluN4GyRBfl8z5xl2l1/+wbbqhnm04IO
         AZzVLhHiJMBLUpcOZ6DTt0nUMHQ0D8XfgAu5So1MLJrBqhaWXu1Lkb96o9/++coEqe+n
         ehgXmqXxgQf6ErG3QjPc2ew1NMlvLm2sGtMlORdqCEILW+eilH1xbTf1wDshifbSbRKX
         1z6Q==
X-Gm-Message-State: AOJu0YyXYn4jXct7WSAhQwjUduY63SLb07BROBsHYG07VaoWGXJkkx+u
	5Ixdbt9Y7rj4WbmvocCIyCSjaGwfDukXJAKe0HhfvdeBWa6uPJcdOZiM9w==
X-Google-Smtp-Source: AGHT+IHTMK0slpfO1Ouhp6VZC4m+hdJmdEqKJYI1tGJVrOr1R9LuevOncaa861nNmbGklr6uTs/jug==
X-Received: by 2002:a5d:5446:0:b0:366:e9f7:4e73 with SMTP id ffacd0b85a97d-3679f6c59ebmr1925302f8f.5.1720112763976;
        Thu, 04 Jul 2024 10:06:03 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36796351169sm3995519f8f.95.2024.07.04.10.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:06:03 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] go: upgrade 1.22.4 -> 1.22.5
Date: Thu,  4 Jul 2024 18:05:57 +0100
Message-ID: <20240704170557.446861-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 17:06:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201583

- refresh patches with devtool

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.4..go1.22.5
8e1fdea831 (tag: go1.22.5, origin/release-branch.go1.22) [release-branch.go1.22] go1.22.5
c2d4f852ce [release-branch.go1.22] cmd/link: handle dynamic import variables on Darwin in plugin mode
3222951439 [release-branch.go1.22] net/http: send body or close connection on expect-100-continue requests
ceaf26ecce [release-branch.go1.22] cmd/compile: mark pointer to noalg type as noalg
dfe4dbf8c0 [release-branch.go1.22] os/exec: on Windows look for extensions in Run if not already done
3560cf0afb [release-branch.go1.22] runtime: always update stack bounds on cgocallback
5159a7193a [release-branch.go1.22] cmd/compile: put constants before variables in initialization order
11b861e459 [release-branch.go1.22] go/types, types2: report error for floating-point iteration variable
81fc616267 [release-branch.go1.22] crypto/tls: don't call tlsrsakex.IncNonDefault with FIPS
14f0251867 [release-branch.go1.22] cmd/cgo/internal/swig: force use of lld for LTO tests on the builders
ab60a7bc18 [release-branch.go1.22] cmd/cgo/internal/testsanitizers: make the libfuzzer tests all short
4c97e883b5 [release-branch.go1.22] cmd/link: put runtime.end in the last section of data segment
179ccb7042 [release-branch.go1.22] cmd/go: fix go list -u -m all with too new retractions dependency
fe9b3c3399 [release-branch.go1.22] net: add GODEBUG=netedns0=0 to disable sending EDNS0 header
b515c5208b [release-branch.go1.22] go/internal/gccgoimporter: recognize "any" as a builtin type

[1] https://github.com/golang/go/compare/go1.22.4...go1.22.5

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../go/{go-1.22.4.inc => go-1.22.5.inc}             |  2 +-
 ...-native_1.22.4.bb => go-binary-native_1.22.5.bb} |  6 +++---
 ...nadian_1.22.4.bb => go-cross-canadian_1.22.5.bb} |  0
 .../go/{go-cross_1.22.4.bb => go-cross_1.22.5.bb}   |  0
 ...{go-crosssdk_1.22.4.bb => go-crosssdk_1.22.5.bb} |  0
 .../{go-runtime_1.22.4.bb => go-runtime_1.22.5.bb}  |  0
 ...e-content-based-hash-generation-less-pedan.patch | 11 ++++-------
 ...ow-GOTOOLDIR-to-be-overridden-in-the-envir.patch | 12 ++++--------
 .../0003-ld-add-soname-to-shareable-objects.patch   |  9 +++------
 ...override-CC-when-building-dist-and-go_boot.patch | 10 +++-------
 ...5-cmd-dist-separate-host-and-target-builds.patch |  9 +++------
 ...006-cmd-go-make-GOROOT-precious-by-default.patch | 13 +++++--------
 ...lter-out-build-specific-paths-from-linker-.patch | 12 +++++-------
 ...st-buildgo.go-do-not-hardcode-host-compile.patch | 11 ++++-------
 ...lter-build-paths-on-staticly-linked-arches.patch |  9 +++------
 .../go/{go_1.22.4.bb => go_1.22.5.bb}               |  0
 16 files changed, 38 insertions(+), 66 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.4.inc => go-1.22.5.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.4.bb => go-binary-native_1.22.5.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.4.bb => go-cross-canadian_1.22.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.4.bb => go-cross_1.22.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.4.bb => go-crosssdk_1.22.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.4.bb => go-runtime_1.22.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.4.bb => go_1.22.5.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.4.inc b/meta/recipes-devtools/go/go-1.22.5.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.4.inc
rename to meta/recipes-devtools/go/go-1.22.5.inc
index 44897daba4..7f7d8377ca 100644
--- a/meta/recipes-devtools/go/go-1.22.4.inc
+++ b/meta/recipes-devtools/go/go-1.22.5.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "fed720678e728a7ca30ba8d1ded1caafe27d16028fab0232b8ba8e22008fb784"
+SRC_URI[main.sha256sum] = "ac9c723f224969aee624bc34fd34c9e13f2a212d75c71c807de644bb46e112f6"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.4.bb b/meta/recipes-devtools/go/go-binary-native_1.22.5.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.4.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.5.bb
index 61da51be3a..b00857f001 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.5.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "ba79d4526102575196273416239cca418a651e049c2b099f3159db85e7bade7d"
-SRC_URI[go_linux_arm64.sha256sum] = "a8e177c354d2e4a1b61020aca3562e27ea3e8f8247eca3170e3fa1e0c2f9e771"
-SRC_URI[go_linux_ppc64le.sha256sum] = "a3e5834657ef92523f570f798fed42f1f87bc18222a16815ec76b84169649ec4"
+SRC_URI[go_linux_amd64.sha256sum] = "904b924d435eaea086515bc63235b192ea441bd8c9b198c507e85009e6e4c7f0"
+SRC_URI[go_linux_arm64.sha256sum] = "8d21325bfcf431be3660527c1a39d3d9ad71535fabdf5041c826e44e31642b5a"
+SRC_URI[go_linux_ppc64le.sha256sum] = "5312bb420ac0b59175a58927e70b4660b14ab7319aab54398b6071fabcbfbb09"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.4.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.4.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.5.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.4.bb b/meta/recipes-devtools/go/go-cross_1.22.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.4.bb
rename to meta/recipes-devtools/go/go-cross_1.22.5.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.4.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.4.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.5.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.4.bb b/meta/recipes-devtools/go/go-runtime_1.22.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.4.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.5.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 564837c7cd..a8e5d6e86d 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -1,7 +1,7 @@
-From 9a6c5040cbcd88b10ceb8ceaebc8d6158c086670 Mon Sep 17 00:00:00 2001
+From 9b3ebef0356594a447906f00fe80584952c08289 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 28 Mar 2022 10:59:03 -0700
-Subject: [PATCH 1/9] cmd/go: make content-based hash generation less pedantic
+Subject: [PATCH] cmd/go: make content-based hash generation less pedantic
 
 Go 1.10's build tool now uses content-based hashes to
 determine when something should be built or re-built.
@@ -32,7 +32,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  2 files changed, 36 insertions(+), 10 deletions(-)
 
 diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index c7c2e83e0f..4a90d9da5c 100644
+index c7c2e83..4a90d9d 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
 @@ -189,7 +189,7 @@ func ExtraEnvVarsCostly() []cfg.EnvVar {
@@ -45,7 +45,7 @@ index c7c2e83e0f..4a90d9da5c 100644
  		// Should not happen - b.CFlags was given an empty package.
  		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index e05471b06c..9724cd07d0 100644
+index e05471b..9724cd0 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
 @@ -232,6 +232,8 @@ func (b *Builder) Do(ctx context.Context, root *Action) {
@@ -163,6 +163,3 @@ index e05471b06c..9724cd07d0 100644
  	if err != nil {
  		return "", "", err
  	}
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
index 001c94a4e7..a69ada47b0 100644
--- a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
+++ b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
@@ -1,8 +1,7 @@
-From e3f9a8a69d3a340c1a1d0bba566e71f20f635a43 Mon Sep 17 00:00:00 2001
+From 687ff9d17f756145f9a58413070cccbd488d1ea2 Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:15:37 +0430
-Subject: [PATCH 2/9] cmd/go: Allow GOTOOLDIR to be overridden in the
- environment
+Subject: [PATCH] cmd/go: Allow GOTOOLDIR to be overridden in the environment
 
 to allow for split host/target build roots
 
@@ -20,7 +19,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  2 files changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index 32e59b446a..06ee4de8a9 100644
+index 32e59b4..06ee4de 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
 @@ -259,7 +259,9 @@ func xinit() {
@@ -35,7 +34,7 @@ index 32e59b446a..06ee4de8a9 100644
  	goversion := findgoversion()
  	isRelease = strings.HasPrefix(goversion, "release.") || strings.HasPrefix(goversion, "go")
 diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
-index a8daa2dfc3..393ada39c9 100644
+index a8daa2d..393ada3 100644
 --- a/src/cmd/go/internal/cfg/cfg.go
 +++ b/src/cmd/go/internal/cfg/cfg.go
 @@ -230,7 +230,11 @@ func SetGOROOT(goroot string, isTestGo bool) {
@@ -51,6 +50,3 @@ index a8daa2dfc3..393ada39c9 100644
  		}
  	}
  }
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
index 9cab2969c8..abc5faa21c 100644
--- a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
@@ -1,7 +1,7 @@
-From 7dde77b3ce8138314dd2736604b1b110dbcc0ac1 Mon Sep 17 00:00:00 2001
+From 01fe178b292db12d811811ff2d8d56b225e4b5e8 Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:16:32 +0430
-Subject: [PATCH 3/9] ld: add soname to shareable objects
+Subject: [PATCH] ld: add soname to shareable objects
 
 so that OE's shared library dependency handling
 can find them.
@@ -19,7 +19,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 3 insertions(+)
 
 diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
-index eab74dc328..ae9bbc9093 100644
+index eab74dc..ae9bbc9 100644
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
 @@ -1576,6 +1576,7 @@ func (ctxt *Link) hostlink() {
@@ -46,6 +46,3 @@ index eab74dc328..ae9bbc9093 100644
  		}
  	}
  
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
index 8889aef1cf..9df43c46d0 100644
--- a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -1,8 +1,7 @@
-From 9f59e46991074d3e3c4d00f3971e62bfcd707167 Mon Sep 17 00:00:00 2001
+From e47d157631d1b97403f253c63d361b7380b32c22 Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:17:16 +0430
-Subject: [PATCH 4/9] make.bash: override CC when building dist and
- go_bootstrap
+Subject: [PATCH] make.bash: override CC when building dist and go_bootstrap
 
 for handling OE cross-canadian builds.
 
@@ -19,7 +18,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/make.bash b/src/make.bash
-index 76ad51624a..074e129a24 100755
+index 76ad516..074e129 100755
 --- a/src/make.bash
 +++ b/src/make.bash
 @@ -198,7 +198,7 @@ if [[ "$GOROOT_BOOTSTRAP" == "$GOROOT" ]]; then
@@ -40,6 +39,3 @@ index 76ad51624a..074e129a24 100755
  rm -f ./cmd/dist/dist
  
  # DO NOT ADD ANY NEW CODE HERE.
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
index 364fce907a..bc25d08fbf 100644
--- a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
@@ -1,7 +1,7 @@
-From 6dda78d528e60993a4688cd9d49440a726378ac8 Mon Sep 17 00:00:00 2001
+From bae1cec790ff17c4c93a2f8fda27036e5e021f6d Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:18:12 +0430
-Subject: [PATCH 5/9] cmd/dist: separate host and target builds
+Subject: [PATCH] cmd/dist: separate host and target builds
 
 Change the dist tool to allow for OE-style cross-
 and cross-canadian builds:
@@ -45,7 +45,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 75 insertions(+), 1 deletion(-)
 
 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index 06ee4de8a9..74b7c7098f 100644
+index 06ee4de..016b1dd 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
 @@ -46,6 +46,7 @@ var (
@@ -216,6 +216,3 @@ index 06ee4de8a9..74b7c7098f 100644
  
  	if goos == "android" {
  		// Make sure the exec wrapper will sync a fresh $GOROOT to the device.
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
index 262f1e96b8..4a57b07b7a 100644
--- a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
@@ -1,7 +1,7 @@
-From aff5a740d6286c04beb0593fc68b0aea5a95ad39 Mon Sep 17 00:00:00 2001
+From a31db6f78d851741aea1e76132a84a24138a5bc6 Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:18:56 +0430
-Subject: [PATCH 6/9] cmd/go: make GOROOT precious by default
+Subject: [PATCH] cmd/go: make GOROOT precious by default
 
 The go build tool normally rebuilds whatever it detects is
 stale.  This can be a problem when GOROOT is intended to
@@ -29,7 +29,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  3 files changed, 34 insertions(+)
 
 diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go/internal/work/action.go
-index a59072e591..9e35ebde0c 100644
+index a59072e..9e35ebd 100644
 --- a/src/cmd/go/internal/work/action.go
 +++ b/src/cmd/go/internal/work/action.go
 @@ -754,6 +754,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action, shlib string) {
@@ -43,7 +43,7 @@ index a59072e591..9e35ebde0c 100644
  			// TODO(rsc): The use of ModeInstall here is suspect, but if we only do ModeBuild,
  			// we'll end up building an overall library or executable that depends at runtime
 diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
-index 408edb5119..3d60252127 100644
+index 408edb5..3d60252 100644
 --- a/src/cmd/go/internal/work/build.go
 +++ b/src/cmd/go/internal/work/build.go
 @@ -233,6 +233,8 @@ See also: go install, go get, go clean.
@@ -67,7 +67,7 @@ index 408edb5119..3d60252127 100644
  
  // Note that flags consulted by other parts of the code
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 9724cd07d0..544df461a2 100644
+index 9724cd0..544df46 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
 @@ -544,6 +544,23 @@ func (b *Builder) build(ctx context.Context, a *Action) (err error) {
@@ -109,6 +109,3 @@ index 9724cd07d0..544df461a2 100644
  	if err := b.Shell(a).Mkdir(a.Objdir); err != nil {
  		return err
  	}
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch b/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
index c5bf28f54a..2fdd52974f 100644
--- a/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
+++ b/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
@@ -1,4 +1,4 @@
-From 083b5c74b12a1abeb11dd7f58a1cb1593d0000c0 Mon Sep 17 00:00:00 2001
+From 1097a07b097043e15fe29a85326dbd196401244a Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 27 Feb 2024 18:06:51 +0800
 Subject: [PATCH] exec.go: filter out build-specific paths from linker flags
@@ -9,15 +9,16 @@ Filter out options that have build-specific paths.
 Upstream-Status: Inappropriate [ Not perfect for upstream ]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
 ---
  src/cmd/go/internal/work/exec.go | 25 ++++++++++++++++++++++++-
  1 file changed, 24 insertions(+), 1 deletion(-)
 
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index cde867b..e3ce17d 100644
+index 544df46..c8f297c 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -1358,6 +1358,29 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
+@@ -1401,6 +1401,29 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
  	return h.Sum()
  }
  
@@ -47,7 +48,7 @@ index cde867b..e3ce17d 100644
  // printLinkerConfig prints the linker config into the hash h,
  // as part of the computation of a linker-related action ID.
  func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
-@@ -1368,7 +1391,7 @@ func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
+@@ -1411,7 +1434,7 @@ func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
  	case "gc":
  		fmt.Fprintf(h, "link %s %q %s\n", b.toolID("link"), forcedLdflags, ldBuildmode)
  		if p != nil {
@@ -56,6 +57,3 @@ index cde867b..e3ce17d 100644
  		}
  
  		// GOARM, GOMIPS, etc.
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
index 0662f66af5..4c1f0ca145 100644
--- a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
+++ b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
@@ -1,8 +1,8 @@
-From e0999902687e2e394499f7153db8d62440c4dab0 Mon Sep 17 00:00:00 2001
+From e5af6155f2d6e0758d11d6c12d6f47ea8e65b141 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 16:33:27 +0000
-Subject: [PATCH 8/9] src/cmd/dist/buildgo.go: do not hardcode host compilers
- into target binaries
+Subject: [PATCH] src/cmd/dist/buildgo.go: do not hardcode host compilers into
+ target binaries
 
 These come from $CC/$CXX on the build host and are not useful on targets;
 additionally as they contain host specific paths, this helps reproducibility.
@@ -16,7 +16,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/src/cmd/dist/buildgo.go b/src/cmd/dist/buildgo.go
-index 884e9d729a..2f52edacfe 100644
+index 884e9d7..2f52eda 100644
 --- a/src/cmd/dist/buildgo.go
 +++ b/src/cmd/dist/buildgo.go
 @@ -51,8 +51,8 @@ func mkzdefaultcc(dir, file string) {
@@ -41,6 +41,3 @@ index 884e9d729a..2f52edacfe 100644
  	writefile(buf.String(), file, writeSkipSame)
  }
  
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
index cc45496e9c..d939cb4716 100644
--- a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
+++ b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
@@ -1,7 +1,7 @@
-From 6c2438f187ca912c54a71b4ac65ab98999a019d2 Mon Sep 17 00:00:00 2001
+From 6bdd6405ce63c7aa4b35cd85833d03c7f1b9109a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sat, 2 Jul 2022 23:08:13 +0100
-Subject: [PATCH 9/9] go: Filter build paths on staticly linked arches
+Subject: [PATCH] go: Filter build paths on staticly linked arches
 
 Filter out build time paths from ldflags and other flags variables when they're
 embedded in the go binary so that builds are reproducible regardless of build
@@ -17,7 +17,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 13 insertions(+), 2 deletions(-)
 
 diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/pkg.go
-index 1549800afb..f41fb2c4ef 100644
+index 1549800..f41fb2c 100644
 --- a/src/cmd/go/internal/load/pkg.go
 +++ b/src/cmd/go/internal/load/pkg.go
 @@ -2277,6 +2277,17 @@ func appendBuildSetting(info *debug.BuildInfo, key, value string) {
@@ -56,6 +56,3 @@ index 1549800afb..f41fb2c4ef 100644
  		}
  	}
  	appendSetting("GOARCH", cfg.BuildContext.GOARCH)
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/go/go_1.22.4.bb b/meta/recipes-devtools/go/go_1.22.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.4.bb
rename to meta/recipes-devtools/go/go_1.22.5.bb
-- 
2.45.2


