Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web12.4402.1599096873811030170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 18:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rE0hQKD+;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id u20so894191pfn.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 18:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N0N0WdVut9ZmD2G62YCvDrSDkcknnBsY4l+lFrzK3PI=;
        b=rE0hQKD+GCceV86Wss9OQ4SgXjmmsnHlr5Y9QxQzbJfIGur8EA+gds9WdX+AI8Dmam
         KZ8a3vLypoDeWY2uE6+TtNTBjNUL1iWFIxKksewo/3MiM4UcmA2s2FfzMgQVea53+E4u
         OgImQdRVaGt1+PIWSUYbsSoiN7fzX4Uc975i+uzzRBdRYz5oJwdWdvmGycmK1/aeJh+8
         U1OXdbHwO+SNeqBZxhdlhWXxXF0f0Rui3r4pk2x0teEqqYk2yiifQZAXEAEpeg5JwAT+
         Od9QPbkTuUWGiWYNqxjBY1MNiN2V6IPQY3Pu5ZMA/t6F0DHDsxnsMm3MK88sMl+Mjejk
         duzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N0N0WdVut9ZmD2G62YCvDrSDkcknnBsY4l+lFrzK3PI=;
        b=m341kRPIfZt7VVAtAGs8FC8qEaf52hpVbvOpkAufSEb0ABCfO7riaWlFHhopEHI1XY
         Yu45GxprBtn9ur6rSDYg5jvkAd8Ng/2ZkxxVFhnpf0/TDhNe3OY5Ftzp0+SXT1JIsQda
         PGixJdqHHeg0GeFMUtx3eAQyQvUC20vkMpkw1S1d/wmL/L5a54TCnGj9vfP5V5jZW1dv
         81FzGRUUfoIrVyr+JJIW/bj9p4fovnPmfPO8F58C1qB6NtbyrDfuH592lIzFD8UkbqXF
         cqnE6HWxQV3BrA0xLtsBs/WDXEJcNOKX74Ajul/iQkpxA/JQJgbZkfJXZRJQc49+uD2c
         VXUw==
X-Gm-Message-State: AOAM530Z+mFlY5sDL3xPRAKBqnUu0yxQ/ovUUNr+69+ixVbTzpQfCZms
	ItRrYFfp0EJbWed9QLZLjxsxJA8o3Ar4rw==
X-Google-Smtp-Source: ABdhPJz18BK+E+qyypogoOFi7PYy7RIkCO1H8HnRh3kGkwjLmymDlsUtawyejEwLkTosiP8lszo+xw==
X-Received: by 2002:a62:4e49:: with SMTP id c70mr1288454pfb.100.1599096872343;
        Wed, 02 Sep 2020 18:34:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id k29sm578212pgf.21.2020.09.02.18.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 18:34:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] go: Upgrade to 1.15 major release
Date: Wed,  2 Sep 2020 18:34:03 -0700
Message-Id: <20200903013403.345340-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1.15 is latest major release changelog is [1] and detailed blog is [2]

[1] https://golang.org/doc/go1.15
[2] https://blog.golang.org/go1.15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../go/{go-1.14.inc => go-1.15.inc}           |  6 ++---
 ...ow-CC-and-CXX-to-have-multiple-words.patch |  2 +-
 ...ent-based-hash-generation-less-pedan.patch | 22 +++++++++----------
 ...-to-be-overridden-in-the-environment.patch |  0
 ...4-ld-add-soname-to-shareable-objects.patch |  6 ++---
 ...de-CC-when-building-dist-and-go_boot.patch |  0
 ...dist-separate-host-and-target-builds.patch |  0
 ...d-go-make-GOROOT-precious-by-default.patch |  6 ++---
 ...008-use-GOBUILDMODE-to-set-buildmode.patch |  2 +-
 ...place-glibc-dynamic-linker-with-musl.patch | 16 +++++++-------
 ...e_1.14.7.bb => go-binary-native_1.15.1.bb} |  4 ++--
 ...dian_1.14.bb => go-cross-canadian_1.15.bb} |  0
 .../go/{go-cross_1.14.bb => go-cross_1.15.bb} |  0
 ...o-crosssdk_1.14.bb => go-crosssdk_1.15.bb} |  0
 .../{go-native_1.14.bb => go-native_1.15.bb}  |  1 -
 ...{go-runtime_1.14.bb => go-runtime_1.15.bb} |  0
 .../go/{go_1.14.bb => go_1.15.bb}             |  0
 18 files changed, 33 insertions(+), 34 deletions(-)
 rename meta/recipes-devtools/go/{go-1.14.inc => go-1.15.inc} (86%)
 rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0001-allow-CC-and-CXX-to-have-multiple-words.patch (95%)
 rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch (93%)
 rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch (100%)
 rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0004-ld-add-soname-to-shareable-objects.patch (89%)
 rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch (100%)
 rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0006-cmd-dist-separate-host-and-target-builds.patch (100%)
 rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0007-cmd-go-make-GOROOT-precious-by-default.patch (95%)
 rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0008-use-GOBUILDMODE-to-set-buildmode.patch (96%)
 rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0009-ld-replace-glibc-dynamic-linker-with-musl.patch (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.14.7.bb => go-binary-native_1.15.1.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.14.bb => go-cross-canadian_1.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.14.bb => go-cross_1.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.14.bb => go-crosssdk_1.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.14.bb => go-native_1.15.bb} (96%)
 rename meta/recipes-devtools/go/{go-runtime_1.14.bb => go-runtime_1.15.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.14.bb => go_1.15.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4f29d00e99..1bc95ec675 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,7 +23,7 @@ GDBVERSION ?= "9.%"
 GLIBCVERSION ?= "2.32"
 LINUXLIBCVERSION ?= "5.8%"
 QEMUVERSION ?= "5.1%"
-GOVERSION ?= "1.14%"
+GOVERSION ?= "1.15%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "10.0.1"
diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.15.inc
similarity index 86%
rename from meta/recipes-devtools/go/go-1.14.inc
rename to meta/recipes-devtools/go/go-1.15.inc
index 8f8ed89de8..f93662a428 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.15.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
-GO_BASEVERSION = "1.14"
-GO_MINOR = ".7"
+GO_BASEVERSION = "1.15"
+GO_MINOR = ".1"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -18,4 +18,4 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
-SRC_URI[main.sha256sum] = "064392433563660c73186991c0a315787688e7c38a561e26647686f89b6c30e3"
+SRC_URI[main.sha256sum] = "d3743752a421881b5cc007c76b4b68becc3ad053e61275567edab1c99e154d30"
diff --git a/meta/recipes-devtools/go/go-1.14/0001-allow-CC-and-CXX-to-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.15/0001-allow-CC-and-CXX-to-have-multiple-words.patch
similarity index 95%
rename from meta/recipes-devtools/go/go-1.14/0001-allow-CC-and-CXX-to-have-multiple-words.patch
rename to meta/recipes-devtools/go/go-1.15/0001-allow-CC-and-CXX-to-have-multiple-words.patch
index d47664d8e2..5f4823be22 100644
--- a/meta/recipes-devtools/go/go-1.14/0001-allow-CC-and-CXX-to-have-multiple-words.patch
+++ b/meta/recipes-devtools/go/go-1.15/0001-allow-CC-and-CXX-to-have-multiple-words.patch
@@ -17,7 +17,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
-@@ -102,11 +102,11 @@ func MkEnv() []cfg.EnvVar {
+@@ -103,11 +103,11 @@ func MkEnv() []cfg.EnvVar {
  
  	cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
  	if env := strings.Fields(cfg.Getenv("CC")); len(env) > 0 {
diff --git a/meta/recipes-devtools/go/go-1.14/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.15/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
similarity index 93%
rename from meta/recipes-devtools/go/go-1.14/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
rename to meta/recipes-devtools/go/go-1.15/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 9e88567ebd..d0511c0c40 100644
--- a/meta/recipes-devtools/go/go-1.14/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go-1.15/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -52,7 +52,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
-@@ -156,7 +156,7 @@ func ExtraEnvVars() []cfg.EnvVar {
+@@ -157,7 +157,7 @@ func ExtraEnvVars() []cfg.EnvVar {
  func ExtraEnvVarsCostly() []cfg.EnvVar {
  	var b work.Builder
  	b.Init()
@@ -63,8 +63,8 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -32,6 +32,8 @@ import (
- 	"time"
+@@ -33,6 +33,8 @@ import (
+ 	"cmd/go/internal/str"
  )
  
 +var omitGopath = os.Getenv("GOPATH_OMIT_IN_ACTIONID") != ""
@@ -72,7 +72,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  // actionList returns the list of actions in the dag rooted at root
  // as visited in a depth-first post-order traversal.
  func actionList(root *Action) []*Action {
-@@ -208,7 +210,7 @@ func (b *Builder) buildActionID(a *Actio
+@@ -209,7 +211,7 @@ func (b *Builder) buildActionID(a *Actio
  	// Assume b.WorkDir is being trimmed properly.
  	// When -trimpath is used with a package built from the module cache,
  	// use the module path and version instead of the directory.
@@ -81,7 +81,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  		fmt.Fprintf(h, "dir %s\n", p.Dir)
  	} else if cfg.BuildTrimpath && p.Module != nil {
  		fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
-@@ -224,13 +226,13 @@ func (b *Builder) buildActionID(a *Actio
+@@ -228,13 +230,13 @@ func (b *Builder) buildActionID(a *Actio
  	}
  	if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
  		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
@@ -99,7 +99,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  		}
  		// TODO(rsc): Should we include the SWIG version or Fortran/GCC/G++/Objective-C compiler versions?
  	}
-@@ -2228,33 +2230,48 @@ var (
+@@ -2298,33 +2300,48 @@ var (
  // gccCmd returns a gcc command line prefix
  // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
  func (b *Builder) GccCmd(incdir, workdir string) []string {
@@ -157,7 +157,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  }
  
  // compilerExe returns the compiler to use given an
-@@ -2263,11 +2280,16 @@ func (b *Builder) fcExe() []string {
+@@ -2333,11 +2350,16 @@ func (b *Builder) fcExe() []string {
  // of the compiler but can have additional arguments if they
  // were present in the environment value.
  // For example if CC="gcc -DGOPHER" then the result is ["gcc", "-DGOPHER"].
@@ -175,7 +175,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	return compiler
  }
  
-@@ -2428,7 +2450,7 @@ func envList(key, def string) []string {
+@@ -2510,7 +2532,7 @@ func envList(key, def string) []string {
  }
  
  // CFlags returns the flags to use when invoking the C, C++ or Fortran compilers, or cgo.
@@ -184,7 +184,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	defaults := "-g -O2"
  
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
-@@ -2447,6 +2469,14 @@ func (b *Builder) CFlags(p *load.Package
+@@ -2529,6 +2551,14 @@ func (b *Builder) CFlags(p *load.Package
  		return
  	}
  
@@ -199,7 +199,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	return
  }
  
-@@ -2461,7 +2491,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
+@@ -2543,7 +2573,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
  
  func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
  	p := a.Package
@@ -208,7 +208,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -2820,7 +2850,7 @@ func (b *Builder) swigIntSize(objdir str
+@@ -2902,7 +2932,7 @@ func (b *Builder) swigIntSize(objdir str
  
  // Run SWIG on one SWIG input file.
  func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
diff --git a/meta/recipes-devtools/go/go-1.14/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.15/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.14/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
rename to meta/recipes-devtools/go/go-1.15/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
diff --git a/meta/recipes-devtools/go/go-1.14/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.15/0004-ld-add-soname-to-shareable-objects.patch
similarity index 89%
rename from meta/recipes-devtools/go/go-1.14/0004-ld-add-soname-to-shareable-objects.patch
rename to meta/recipes-devtools/go/go-1.15/0004-ld-add-soname-to-shareable-objects.patch
index 75c9c75211..da29923920 100644
--- a/meta/recipes-devtools/go/go-1.14/0004-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go-1.15/0004-ld-add-soname-to-shareable-objects.patch
@@ -19,7 +19,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1280,6 +1280,7 @@ func (ctxt *Link) hostlink() {
+@@ -1446,6 +1446,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -27,7 +27,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  			if ctxt.HeadType != objabi.Hwindows {
  				// Pass -z nodelete to mark the shared library as
  				// non-closeable: a dlclose will do nothing.
-@@ -1291,6 +1292,7 @@ func (ctxt *Link) hostlink() {
+@@ -1457,6 +1458,7 @@ func (ctxt *Link) hostlink() {
  			argv = append(argv, "-Wl,-z,relro")
  		}
  		argv = append(argv, "-shared")
@@ -35,7 +35,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	case BuildModePlugin:
  		if ctxt.HeadType == objabi.Hdarwin {
  			argv = append(argv, "-dynamiclib")
-@@ -1299,6 +1301,7 @@ func (ctxt *Link) hostlink() {
+@@ -1465,6 +1467,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
diff --git a/meta/recipes-devtools/go/go-1.14/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.15/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.14/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
rename to meta/recipes-devtools/go/go-1.15/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
diff --git a/meta/recipes-devtools/go/go-1.14/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.15/0006-cmd-dist-separate-host-and-target-builds.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.14/0006-cmd-dist-separate-host-and-target-builds.patch
rename to meta/recipes-devtools/go/go-1.15/0006-cmd-dist-separate-host-and-target-builds.patch
diff --git a/meta/recipes-devtools/go/go-1.14/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.15/0007-cmd-go-make-GOROOT-precious-by-default.patch
similarity index 95%
rename from meta/recipes-devtools/go/go-1.14/0007-cmd-go-make-GOROOT-precious-by-default.patch
rename to meta/recipes-devtools/go/go-1.15/0007-cmd-go-make-GOROOT-precious-by-default.patch
index b93f83de69..4b4d0d4f3d 100644
--- a/meta/recipes-devtools/go/go-1.14/0007-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go-1.15/0007-cmd-go-make-GOROOT-precious-by-default.patch
@@ -63,7 +63,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  // Note that flags consulted by other parts of the code
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -464,6 +464,23 @@ func (b *Builder) build(a *Action) (err
+@@ -468,6 +468,23 @@ func (b *Builder) build(a *Action) (err
  		return errors.New("binary-only packages are no longer supported")
  	}
  
@@ -87,8 +87,8 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	if err := b.Mkdir(a.Objdir); err != nil {
  		return err
  	}
-@@ -1493,6 +1510,14 @@ func BuildInstallFunc(b *Builder, a *Act
- 		return nil
+@@ -1520,6 +1537,14 @@ func BuildInstallFunc(b *Builder, a *Act
+ 		return err
  	}
  
 +	if goRootPrecious && a.Package != nil {
diff --git a/meta/recipes-devtools/go/go-1.14/0008-use-GOBUILDMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.15/0008-use-GOBUILDMODE-to-set-buildmode.patch
similarity index 96%
rename from meta/recipes-devtools/go/go-1.14/0008-use-GOBUILDMODE-to-set-buildmode.patch
rename to meta/recipes-devtools/go/go-1.15/0008-use-GOBUILDMODE-to-set-buildmode.patch
index b15d9812aa..4e5d5021d6 100644
--- a/meta/recipes-devtools/go/go-1.14/0008-use-GOBUILDMODE-to-set-buildmode.patch
+++ b/meta/recipes-devtools/go/go-1.15/0008-use-GOBUILDMODE-to-set-buildmode.patch
@@ -25,7 +25,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 
 --- a/src/cmd/go/internal/work/build.go
 +++ b/src/cmd/go/internal/work/build.go
-@@ -251,7 +251,13 @@ func AddBuildFlags(cmd *base.Command, ma
+@@ -254,7 +254,13 @@ func AddBuildFlags(cmd *base.Command, ma
  
  	cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
  	cmd.Flag.Var(buildCompiler{}, "compiler", "")
diff --git a/meta/recipes-devtools/go/go-1.14/0009-ld-replace-glibc-dynamic-linker-with-musl.patch b/meta/recipes-devtools/go/go-1.15/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
similarity index 91%
rename from meta/recipes-devtools/go/go-1.14/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
rename to meta/recipes-devtools/go/go-1.15/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
index 427cfb0dd2..2edb0e381d 100644
--- a/meta/recipes-devtools/go/go-1.14/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
+++ b/meta/recipes-devtools/go/go-1.15/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
@@ -27,7 +27,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 
 --- a/src/cmd/link/internal/amd64/obj.go
 +++ b/src/cmd/link/internal/amd64/obj.go
-@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
+@@ -64,7 +64,7 @@ func Init() (*sys.Arch, ld.Arch) {
  		PEreloc1:         pereloc1,
  		TLSIEtoLE:        tlsIEtoLE,
  
@@ -49,19 +49,19 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  		Netbsddynld:    "/libexec/ld.elf_so",
 --- a/src/cmd/link/internal/arm64/obj.go
 +++ b/src/cmd/link/internal/arm64/obj.go
-@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
- 		Gentext:          gentext,
+@@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {
  		Machoreloc1:      machoreloc1,
  
--		Linuxdynld: "/lib/ld-linux-aarch64.so.1",
-+		Linuxdynld: "/lib/ld-musl-aarch64.so.1",
+ 		Androiddynld: "/system/bin/linker64",
+-		Linuxdynld:   "/lib/ld-linux-aarch64.so.1",
++		Linuxdynld:   "/lib/ld-musl-aarch64.so.1",
  
  		Freebsddynld:   "/usr/libexec/ld-elf.so.1",
  		Openbsddynld:   "/usr/libexec/ld.so",
 --- a/src/cmd/link/internal/mips/obj.go
 +++ b/src/cmd/link/internal/mips/obj.go
 @@ -60,7 +60,7 @@ func Init() (*sys.Arch, ld.Arch) {
- 		Gentext:          gentext,
+ 		Gentext2:         gentext2,
  		Machoreloc1:      machoreloc1,
  
 -		Linuxdynld: "/lib/ld.so.1",
@@ -72,7 +72,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 --- a/src/cmd/link/internal/mips64/obj.go
 +++ b/src/cmd/link/internal/mips64/obj.go
 @@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
- 		Gentext:          gentext,
+ 		Gentext2:         gentext2,
  		Machoreloc1:      machoreloc1,
  
 -		Linuxdynld:     "/lib64/ld64.so.1",
@@ -94,7 +94,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 --- a/src/cmd/link/internal/s390x/obj.go
 +++ b/src/cmd/link/internal/s390x/obj.go
 @@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
- 		Gentext:          gentext,
+ 		Gentext2:         gentext2,
  		Machoreloc1:      machoreloc1,
  
 -		Linuxdynld: "/lib64/ld64.so.1",
diff --git a/meta/recipes-devtools/go/go-binary-native_1.14.7.bb b/meta/recipes-devtools/go/go-binary-native_1.15.1.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.14.7.bb
rename to meta/recipes-devtools/go/go-binary-native_1.15.1.bb
index 3452ca46d4..a4eca7f4c1 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.14.7.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.15.1.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "4a7fa60f323ee1416a4b1425aefc37ea359e9d64df19c326a58953a97ad41ea5"
-SRC_URI[go_linux_arm64.sha256sum] = "fe5b6f6e441f3cb7b53ebf1a010bbebcb720ac98124984cfe2e51d72b8a58c71"
+SRC_URI[go_linux_amd64.sha256sum] = "70ac0dbf60a8ee9236f337ed0daa7a4c3b98f6186d4497826f68e97c0c0413f6"
+SRC_URI[go_linux_arm64.sha256sum] = "ca21c771d906fbba8840b3a4831b1aa118f6e09b5d028323592faba382787a03"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.14.bb b/meta/recipes-devtools/go/go-cross-canadian_1.15.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.14.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.15.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.14.bb b/meta/recipes-devtools/go/go-cross_1.15.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.14.bb
rename to meta/recipes-devtools/go/go-cross_1.15.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.14.bb b/meta/recipes-devtools/go/go-crosssdk_1.15.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.14.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.15.bb
diff --git a/meta/recipes-devtools/go/go-native_1.14.bb b/meta/recipes-devtools/go/go-native_1.15.bb
similarity index 96%
rename from meta/recipes-devtools/go/go-native_1.14.bb
rename to meta/recipes-devtools/go/go-native_1.15.bb
index c5cb97e73e..f14892cdb0 100644
--- a/meta/recipes-devtools/go/go-native_1.14.bb
+++ b/meta/recipes-devtools/go/go-native_1.15.bb
@@ -6,7 +6,6 @@ require go-${PV}.inc
 inherit native
 
 SRC_URI_append = " https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz;name=bootstrap;subdir=go1.4"
-SRC_URI[bootstrap.md5sum] = "dbf727a4b0e365bf88d97cbfde590016"
 SRC_URI[bootstrap.sha256sum] = "f4ff5b5eb3a3cae1c993723f3eab519c5bae18866b5e5f96fe1102f0cb5c3e52"
 
 export GOOS = "${BUILD_GOOS}"
diff --git a/meta/recipes-devtools/go/go-runtime_1.14.bb b/meta/recipes-devtools/go/go-runtime_1.15.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.14.bb
rename to meta/recipes-devtools/go/go-runtime_1.15.bb
diff --git a/meta/recipes-devtools/go/go_1.14.bb b/meta/recipes-devtools/go/go_1.15.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.14.bb
rename to meta/recipes-devtools/go/go_1.15.bb
-- 
2.28.0

