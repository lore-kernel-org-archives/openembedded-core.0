Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77875ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 16:11:02 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.11177.1667232654534373003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 09:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gmx38S0n;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id v17so8140383plo.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 09:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uOpNPt6XDkIcYLEzrK3xW2f/39wgqr0h/tSfC6BLGLA=;
        b=Gmx38S0nphALVlqyy5/xddtu3cKm4ld8rZZOFx/fwvK1qnmE4Og787Ru/ICcPjONoo
         J6bzblP4G1J0Vpb1V0hQtOsaOYNShd0eqgOcWr+nwAJk+P+8wmz0vasuNvyxAMmTekU7
         Ff3yif/9lYqx/0z72mXFYgEIwJhXRIOd5toL++CuKS3vP4gbZX42TZzfsW68YBZM7s57
         qzdQB6jwdNBTkU+mgneUdSWSH8+IwUtKnn3xNCQY5FSPaDjMNJm56r16GMynUDaoG3PT
         iFp5RC2sa6dlwQq9D8btBQqqStzvMTc8j7tU8Z868bkpK/HWUT6JVEy+7IaVSK81tWcq
         BDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOpNPt6XDkIcYLEzrK3xW2f/39wgqr0h/tSfC6BLGLA=;
        b=7phPRFIutv1HfqeQFFk2TwXl1RmxWBoU4MhYd0m/33KDSSX+Q3e/mRFrVowYY5Z9VK
         wo0d21PvVIDaUd1RTjjAyWPwRuppstGvVEr2UyflabzRY71f6UUB/fSZMOVcOHzPNW+h
         FzIz6E4ei66hVpTCYOKZelYC+HtWQChDPO0MnhuPTiN5M3jqE0uljhlBHJokfcrIvP9m
         F8u3JHTVmew3pn4KCJqgnqHLV97HlA9a31ZtUbDkUGF4Ig2hvKYjH0Oztv02PSH1Pdc5
         1oZlejK/1gnxlvxo4O78DssgltvT7efKy2tULb3ISDXewxE3Xy3g1J83lq+VOSkS+IBG
         O1Cg==
X-Gm-Message-State: ACrzQf3/irWhO80MahijeefM3no+waeOK7Mtqq43Nj5JEu8LWY22eZX6
	0sceDTWG2ZEmsbspfW+ZyUWtgVhISuU=
X-Google-Smtp-Source: AMsMyM6/C4OLBX9eCtr9fkGCJj2NmeLRApEJaR4lP8FDoo18AWxgrfDlEfgHSo9R2O+UjOqiKUnusg==
X-Received: by 2002:a17:903:50b:b0:187:11e:5f1f with SMTP id jn11-20020a170903050b00b00187011e5f1fmr15268326plb.41.1667232653561;
        Mon, 31 Oct 2022 09:10:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b13])
        by smtp.gmail.com with ESMTPSA id z15-20020a170903018f00b00180a7ff78ccsm4661800plg.126.2022.10.31.09.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 09:10:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] go: Upgrade to 1.19.2
Date: Mon, 31 Oct 2022 09:10:49 -0700
Message-Id: <20221031161049.894149-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 16:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172328

go1.19.1 (released 2022-09-06) includes security fixes to the net/http and net/url packages,
as well as bug fixes to the compiler, the go command, the pprof command, the linker, the
runtime, and the crypto/tls and crypto/x509 packages. See the Go 1.19.1 milestone[1] on our
issue tracker for details.

go1.19.2 (released 2022-10-04) includes security fixes to the archive/tar,
net/http/httputil, and regexp packages, as well as bug fixes to the compiler, the linker,
the runtime, and the go/types package. See the Go 1.19.2 milestone[2] on our issue tracker
for details.

Forward port patches as needed
Drop stack-protector.patch, its already upstream

Includes fixed for CVE-2022-2879, CVE-2022-2880, and CVE-2022-41715

[1] https://github.com/golang/go/issues?q=milestone%3AGo1.19.1+label%3ACherryPickApproved
[2] https://github.com/golang/go/issues?q=milestone%3AGo1.19.2+label%3ACherryPickApproved

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../go/{go-1.19.inc => go-1.19.2.inc}         |  3 +-
 ...ive_1.19.bb => go-binary-native_1.19.2.bb} |  6 ++--
 ...an_1.19.bb => go-cross-canadian_1.19.2.bb} |  0
 .../{go-cross_1.19.bb => go-cross_1.19.2.bb}  |  0
 ...crosssdk_1.19.bb => go-crosssdk_1.19.2.bb} |  0
 ...{go-native_1.19.bb => go-native_1.19.2.bb} |  0
 ...o-runtime_1.19.bb => go-runtime_1.19.2.bb} |  0
 ...ent-based-hash-generation-less-pedan.patch | 22 ++++++-------
 .../go/go/stack-protector.patch               | 32 -------------------
 .../go/{go_1.19.bb => go_1.19.2.bb}           |  0
 10 files changed, 13 insertions(+), 50 deletions(-)
 rename meta/recipes-devtools/go/{go-1.19.inc => go-1.19.2.inc} (85%)
 rename meta/recipes-devtools/go/{go-binary-native_1.19.bb => go-binary-native_1.19.2.bb} (77%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.19.bb => go-cross-canadian_1.19.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.19.bb => go-cross_1.19.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.19.bb => go-crosssdk_1.19.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.19.bb => go-native_1.19.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.19.bb => go-runtime_1.19.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/go/go/stack-protector.patch
 rename meta/recipes-devtools/go/{go_1.19.bb => go_1.19.2.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.19.inc b/meta/recipes-devtools/go/go-1.19.2.inc
similarity index 85%
rename from meta/recipes-devtools/go/go-1.19.inc
rename to meta/recipes-devtools/go/go-1.19.2.inc
index f733a807b4..206ee3ca45 100644
--- a/meta/recipes-devtools/go/go-1.19.inc
+++ b/meta/recipes-devtools/go/go-1.19.2.inc
@@ -14,6 +14,5 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://filter-build-paths.patch \
-    file://stack-protector.patch \
 "
-SRC_URI[main.sha256sum] = "9419cc70dc5a2523f29a77053cafff658ed21ef3561d9b6b020280ebceab28b9"
+SRC_URI[main.sha256sum] = "2ce930d70a931de660fdaf271d70192793b1b240272645bf0275779f6704df6b"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.19.bb b/meta/recipes-devtools/go/go-binary-native_1.19.2.bb
similarity index 77%
rename from meta/recipes-devtools/go/go-binary-native_1.19.bb
rename to meta/recipes-devtools/go/go-binary-native_1.19.2.bb
index eda90f3753..ebf45954e6 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.19.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.19.2.bb
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "464b6b66591f6cf055bc5df90a9750bf5fbc9d038722bb84a9d56a2bea974be6"
-SRC_URI[go_linux_arm64.sha256sum] = "efa97fac9574fc6ef6c9ff3e3758fb85f1439b046573bf434cccb5e012bd00c8"
-SRC_URI[go_linux_ppc64le.sha256sum] = "92bf5aa598a01b279d03847c32788a3a7e0a247a029dedb7c759811c2a4241fc"
+SRC_URI[go_linux_amd64.sha256sum] = "5e8c5a74fe6470dd7e055a461acda8bb4050ead8c2df70f227e3ff7d8eb7eeb6"
+SRC_URI[go_linux_arm64.sha256sum] = "b62a8d9654436c67c14a0c91e931d50440541f09eb991a987536cb982903126d"
+SRC_URI[go_linux_ppc64le.sha256sum] = "37e1d4342f7103aeb9babeabe8c71ef3dba23db28db525071119e94b2aa21d7d"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.19.bb b/meta/recipes-devtools/go/go-cross-canadian_1.19.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.19.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.19.2.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.19.bb b/meta/recipes-devtools/go/go-cross_1.19.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.19.bb
rename to meta/recipes-devtools/go/go-cross_1.19.2.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.19.bb b/meta/recipes-devtools/go/go-crosssdk_1.19.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.19.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.19.2.bb
diff --git a/meta/recipes-devtools/go/go-native_1.19.bb b/meta/recipes-devtools/go/go-native_1.19.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.19.bb
rename to meta/recipes-devtools/go/go-native_1.19.2.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.19.bb b/meta/recipes-devtools/go/go-runtime_1.19.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.19.bb
rename to meta/recipes-devtools/go/go-runtime_1.19.2.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 8cbed93017..ae887111a0 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -31,24 +31,20 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/cmd/go/internal/work/exec.go  | 42 ++++++++++++++++++++++++-------
  2 files changed, 34 insertions(+), 10 deletions(-)
 
-diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index 529351d..df791b0 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
 @@ -176,7 +176,7 @@ func ExtraEnvVars() []cfg.EnvVar {
  func ExtraEnvVarsCostly() []cfg.EnvVar {
- 	var b work.Builder
- 	b.Init()
+ 	b := work.NewBuilder("")
+ 
 -	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{})
 +	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{}, false)
  	if err != nil {
  		// Should not happen - b.CFlags was given an empty package.
  		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
-diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index c88b315..a06455c 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -213,6 +213,8 @@ func (b *Builder) Do(ctx context.Context, root *Action) {
+@@ -213,6 +213,8 @@ func (b *Builder) Do(ctx context.Context
  	writeActionGraph()
  }
  
@@ -57,7 +53,7 @@ index c88b315..a06455c 100644
  // buildActionID computes the action ID for a build action.
  func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	p := a.Package
-@@ -234,7 +236,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -234,7 +236,7 @@ func (b *Builder) buildActionID(a *Actio
  		if p.Module != nil {
  			fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
  		}
@@ -66,7 +62,7 @@ index c88b315..a06455c 100644
  		// The Go compiler always hides the exact value of $GOROOT
  		// when building things in GOROOT.
  		//
-@@ -266,9 +268,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -266,9 +268,9 @@ func (b *Builder) buildActionID(a *Actio
  	}
  	if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
  		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
@@ -78,7 +74,7 @@ index c88b315..a06455c 100644
  		fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
  		// Include the C compiler tool ID so that if the C
  		// compiler changes we rebuild the package.
-@@ -281,14 +283,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -281,14 +283,14 @@ func (b *Builder) buildActionID(a *Actio
  			}
  		}
  		if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
@@ -95,7 +91,7 @@ index c88b315..a06455c 100644
  			fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
  			if fcID, err := b.gccToolID(fcExe[0], "f95"); err == nil {
  				fmt.Fprintf(h, "FC ID=%q\n", fcID)
-@@ -305,7 +307,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -305,7 +307,7 @@ func (b *Builder) buildActionID(a *Actio
  		}
  	}
  	if p.Internal.BuildInfo != "" {
@@ -129,7 +125,7 @@ index c88b315..a06455c 100644
  	defaults := "-g -O2"
  
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
-@@ -2724,6 +2741,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+@@ -2724,6 +2741,13 @@ func (b *Builder) CFlags(p *load.Package
  	if ldflags, err = buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
  		return
  	}
@@ -152,7 +148,7 @@ index c88b315..a06455c 100644
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -3246,7 +3270,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
+@@ -3246,7 +3270,7 @@ func (b *Builder) swigIntSize(objdir str
  
  // Run SWIG on one SWIG input file.
  func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
diff --git a/meta/recipes-devtools/go/go/stack-protector.patch b/meta/recipes-devtools/go/go/stack-protector.patch
deleted file mode 100644
index cc92a444a7..0000000000
--- a/meta/recipes-devtools/go/go/stack-protector.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c537b87782293fe222f2ef5eb1ae818092118e97 Mon Sep 17 00:00:00 2001
-From: Ian Lance Taylor <iant@golang.org>
-Date: Sun, 07 Aug 2022 19:21:15 -0700
-Subject: [PATCH] runtime/cgo: add -fno-stack-protector to CFLAGS
-
-Some compilers default to having -fstack-protector on, which breaks
-when using internal linking because the linker doesn't know how to
-find the support functions.
-
-Fixes #52919
-Fixes #54313
-
-Change-Id: I6f51d5e906503f61fc768ad8e30c163bad135087
-Upstream-Status: Submitted [https://github.com/golang/go/issues/54313]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
-
-diff --git a/src/runtime/cgo/cgo.go b/src/runtime/cgo/cgo.go
-index 298aa63..4b7046e 100644
---- a/src/runtime/cgo/cgo.go
-+++ b/src/runtime/cgo/cgo.go
-@@ -23,7 +23,9 @@
- #cgo solaris LDFLAGS: -lxnet
- #cgo solaris LDFLAGS: -lsocket
- 
--#cgo CFLAGS: -Wall -Werror
-+// We use -fno-stack-protector because internal linking won't find
-+// the support functions. See issues #52919 and #54313.
-+#cgo CFLAGS: -Wall -Werror -fno-stack-protector
- 
- #cgo solaris CPPFLAGS: -D_POSIX_PTHREAD_SEMANTICS
- 
diff --git a/meta/recipes-devtools/go/go_1.19.bb b/meta/recipes-devtools/go/go_1.19.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.19.bb
rename to meta/recipes-devtools/go/go_1.19.2.bb
-- 
2.38.1


