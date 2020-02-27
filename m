Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id D8F006130D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 08:05:56 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id i19so1218013pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 00:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KIMke93EdRIGFKeL7XEDAlYqW49IXhm9BmobVMT05uY=;
	b=jQPX8c63IWRyKlyXwCmT/m84ZmjGYIdHUaGP+46PhcMY7YQ0R02uKLJRZegle3AZJO
	azed+WLcdJ9eNZV7lGgy7LwJ8X6AisLO6cM1EshFD13abFILKgNMz+4zxrnD198YJ1h9
	FKq2UP5pC9+nsfpimBeLz3i3jCAKdVtnHDWYeR7sEc98HyhHgmRbT5Ef7hIBXEJFpBFM
	vjweMFBlfkyylWRFidu/eHV9Ke3ZjrJsSsr/VBKumAxoCgAt0bZTrWwdNboV4XDEzgzP
	PKNb/ozVdafmjN/bmgZgbdb71FsbsWBntdXyDmSzRY4ILLQdg7HWVQ3v/aRlWlGB+l/3
	KgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KIMke93EdRIGFKeL7XEDAlYqW49IXhm9BmobVMT05uY=;
	b=cNWafR9xu2xDgTjWGGNrSDhohpym+7DXDq5xzQ6eKBIHwgUldCFdSmILxkMuSOCQp0
	9RHIlehdaPjeiJsOkO5XNIH+bhY+EhkG5lpRDJ74o35aS+HLJ7VgNmthpVYdlGnN96F1
	9S6M/+HHI65w47Q96TzZYdSVdwSryN93NjVwqC1rZJzD6fzNSdI2Gu7yw1V6koLbRuYD
	Jk69VB2rm9zasfjlpcfrm96n24mfKoV/fgu2V+cDDKu6UGqHeVTj8bROkntkwmAFmWQi
	QDImM6ObTf5bVdl6oz3DeaUmE+ok9AexVFQfACkLXwJrzuinCNAeZGvxKr4LeIgVhc+y
	jiMQ==
X-Gm-Message-State: APjAAAX2aQI85YX0duTSPwHQQ7PeE0mU5+fFKJmFX25CbsjVR0sNz3Ns
	ob2l2FJgyCA3winKBheL+u8z3XgSgKw=
X-Google-Smtp-Source: APXvYqwG7c2wicc6wNbWG2jFj208xCr6Bi60ROXOwW+tyq1O36Thhcz6oLLW7MdfgiN3r82f/V890Q==
X-Received: by 2002:a62:4e4e:: with SMTP id c75mr2827753pfb.227.1582790756363; 
	Thu, 27 Feb 2020 00:05:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	188sm1431753pfa.62.2020.02.27.00.05.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 00:05:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 00:05:58 -0800
Message-Id: <20200227080558.3819138-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200227080558.3819138-1-raj.khem@gmail.com>
References: <20200227080558.3819138-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] go: Update to 1.14 release series
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
X-List-Received-Date: Thu, 27 Feb 2020 08:05:57 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../go/{go-1.13.inc => go-1.14.inc}           |  8 ++--
 ...ow-CC-and-CXX-to-have-multiple-words.patch |  7 +---
 ...ent-based-hash-generation-less-pedan.patch | 33 +++++++----------
 ...-to-be-overridden-in-the-environment.patch | 11 +-----
 ...4-ld-add-soname-to-shareable-objects.patch | 11 ++----
 ...de-CC-when-building-dist-and-go_boot.patch |  9 +----
 ...dist-separate-host-and-target-builds.patch | 37 ++++++++-----------
 ...d-go-make-GOROOT-precious-by-default.patch | 23 ++++--------
 ...008-use-GOBUILDMODE-to-set-buildmode.patch |  9 +----
 ...place-glibc-dynamic-linker-with-musl.patch | 23 +-----------
 ...dian_1.13.bb => go-cross-canadian_1.14.bb} |  0
 .../go/{go-cross_1.13.bb => go-cross_1.14.bb} |  0
 ...o-crosssdk_1.13.bb => go-crosssdk_1.14.bb} |  0
 .../{go-native_1.13.bb => go-native_1.14.bb}  |  0
 ...{go-runtime_1.13.bb => go-runtime_1.14.bb} |  0
 .../go/{go_1.13.bb => go_1.14.bb}             |  0
 17 files changed, 53 insertions(+), 120 deletions(-)
 rename meta/recipes-devtools/go/{go-1.13.inc => go-1.14.inc} (81%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0001-allow-CC-and-CXX-to-have-multiple-words.patch (85%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch (88%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch (83%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0004-ld-add-soname-to-shareable-objects.patch (82%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch (88%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0006-cmd-dist-separate-host-and-target-builds.patch (95%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0007-cmd-go-make-GOROOT-precious-by-default.patch (79%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0008-use-GOBUILDMODE-to-set-buildmode.patch (85%)
 rename meta/recipes-devtools/go/{go-1.13 => go-1.14}/0009-ld-replace-glibc-dynamic-linker-with-musl.patch (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.13.bb => go-cross-canadian_1.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.13.bb => go-cross_1.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.13.bb => go-crosssdk_1.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.13.bb => go-native_1.14.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.13.bb => go-runtime_1.14.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.13.bb => go_1.14.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index e957e3a9bb..31d4b3b854 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,7 +23,7 @@ GDBVERSION ?= "9.%"
 GLIBCVERSION ?= "2.31"
 LINUXLIBCVERSION ?= "5.4%"
 QEMUVERSION ?= "4.2%"
-GOVERSION ?= "1.13%"
+GOVERSION ?= "1.14%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "9.0.1"
diff --git a/meta/recipes-devtools/go/go-1.13.inc b/meta/recipes-devtools/go/go-1.14.inc
similarity index 81%
rename from meta/recipes-devtools/go/go-1.13.inc
rename to meta/recipes-devtools/go/go-1.14.inc
index 7780aced89..ac7b95cf03 100644
--- a/meta/recipes-devtools/go/go-1.13.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
-GO_BASEVERSION = "1.13"
-GO_MINOR = ".8"
+GO_BASEVERSION = "1.14"
+GO_MINOR = ""
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -19,5 +19,5 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "984c244563f2d2f48103e8d6db8a8308"
-SRC_URI[main.sha256sum] = "b13bf04633d4d8cf53226ebeaace8d4d2fd07ae6fa676d0844a688339debec34"
+SRC_URI[main.md5sum] = "7c97bdb3b5218a5089612efb3ed30345"
+SRC_URI[main.sha256sum] = "6d643e46ad565058c7a39dac01144172ef9bd476521f42148be59249e4b74389"
diff --git a/meta/recipes-devtools/go/go-1.13/0001-allow-CC-and-CXX-to-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.14/0001-allow-CC-and-CXX-to-have-multiple-words.patch
similarity index 85%
rename from meta/recipes-devtools/go/go-1.13/0001-allow-CC-and-CXX-to-have-multiple-words.patch
rename to meta/recipes-devtools/go/go-1.14/0001-allow-CC-and-CXX-to-have-multiple-words.patch
index ddfd5e41d1..d47664d8e2 100644
--- a/meta/recipes-devtools/go/go-1.13/0001-allow-CC-and-CXX-to-have-multiple-words.patch
+++ b/meta/recipes-devtools/go/go-1.14/0001-allow-CC-and-CXX-to-have-multiple-words.patch
@@ -15,11 +15,9 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  src/cmd/go/internal/envcmd/env.go | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index 17852de..7b5ec5e 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
-@@ -100,11 +100,11 @@ func MkEnv() []cfg.EnvVar {
+@@ -102,11 +102,11 @@ func MkEnv() []cfg.EnvVar {
  
  	cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
  	if env := strings.Fields(cfg.Getenv("CC")); len(env) > 0 {
@@ -33,6 +31,3 @@ index 17852de..7b5ec5e 100644
  	}
  	env = append(env, cfg.EnvVar{Name: "AR", Value: envOr("AR", "ar")})
  	env = append(env, cfg.EnvVar{Name: "CC", Value: cc})
--- 
-2.17.1 (Apple Git-112)
-
diff --git a/meta/recipes-devtools/go/go-1.13/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.14/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
similarity index 88%
rename from meta/recipes-devtools/go/go-1.13/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
rename to meta/recipes-devtools/go/go-1.14/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 4eddd39809..9e88567ebd 100644
--- a/meta/recipes-devtools/go/go-1.13/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go-1.14/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -50,11 +50,9 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  src/cmd/go/internal/work/exec.go  | 66 ++++++++++++++++++++++---------
  2 files changed, 49 insertions(+), 19 deletions(-)
 
-diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index 7b5ec5e..292f117 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
-@@ -154,7 +154,7 @@ func ExtraEnvVars() []cfg.EnvVar {
+@@ -156,7 +156,7 @@ func ExtraEnvVars() []cfg.EnvVar {
  func ExtraEnvVarsCostly() []cfg.EnvVar {
  	var b work.Builder
  	b.Init()
@@ -63,8 +61,6 @@ index 7b5ec5e..292f117 100644
  	if err != nil {
  		// Should not happen - b.CFlags was given an empty package.
  		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
-diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 7dd9a90..ccebaf8 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
 @@ -32,6 +32,8 @@ import (
@@ -76,16 +72,16 @@ index 7dd9a90..ccebaf8 100644
  // actionList returns the list of actions in the dag rooted at root
  // as visited in a depth-first post-order traversal.
  func actionList(root *Action) []*Action {
-@@ -205,7 +207,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
- 	// The compiler hides the exact value of $GOROOT
- 	// when building things in GOROOT.
+@@ -208,7 +210,7 @@ func (b *Builder) buildActionID(a *Actio
  	// Assume b.WorkDir is being trimmed properly.
+ 	// When -trimpath is used with a package built from the module cache,
+ 	// use the module path and version instead of the directory.
 -	if !p.Goroot && !cfg.BuildTrimpath && !strings.HasPrefix(p.Dir, b.WorkDir) {
 +	if !p.Goroot && !omitGopath && !cfg.BuildTrimpath && !strings.HasPrefix(p.Dir, b.WorkDir) {
  		fmt.Fprintf(h, "dir %s\n", p.Dir)
- 	}
- 	fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
-@@ -219,13 +221,13 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 	} else if cfg.BuildTrimpath && p.Module != nil {
+ 		fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
+@@ -224,13 +226,13 @@ func (b *Builder) buildActionID(a *Actio
  	}
  	if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
  		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
@@ -103,7 +99,7 @@ index 7dd9a90..ccebaf8 100644
  		}
  		// TODO(rsc): Should we include the SWIG version or Fortran/GCC/G++/Objective-C compiler versions?
  	}
-@@ -2229,33 +2231,48 @@ var (
+@@ -2228,33 +2230,48 @@ var (
  // gccCmd returns a gcc command line prefix
  // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
  func (b *Builder) GccCmd(incdir, workdir string) []string {
@@ -161,7 +157,7 @@ index 7dd9a90..ccebaf8 100644
  }
  
  // compilerExe returns the compiler to use given an
-@@ -2264,11 +2281,16 @@ func (b *Builder) fcExe() []string {
+@@ -2263,11 +2280,16 @@ func (b *Builder) fcExe() []string {
  // of the compiler but can have additional arguments if they
  // were present in the environment value.
  // For example if CC="gcc -DGOPHER" then the result is ["gcc", "-DGOPHER"].
@@ -179,7 +175,7 @@ index 7dd9a90..ccebaf8 100644
  	return compiler
  }
  
-@@ -2429,7 +2451,7 @@ func envList(key, def string) []string {
+@@ -2428,7 +2450,7 @@ func envList(key, def string) []string {
  }
  
  // CFlags returns the flags to use when invoking the C, C++ or Fortran compilers, or cgo.
@@ -188,7 +184,7 @@ index 7dd9a90..ccebaf8 100644
  	defaults := "-g -O2"
  
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
-@@ -2448,6 +2470,14 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+@@ -2447,6 +2469,14 @@ func (b *Builder) CFlags(p *load.Package
  		return
  	}
  
@@ -203,7 +199,7 @@ index 7dd9a90..ccebaf8 100644
  	return
  }
  
-@@ -2462,7 +2492,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
+@@ -2461,7 +2491,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
  
  func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
  	p := a.Package
@@ -212,7 +208,7 @@ index 7dd9a90..ccebaf8 100644
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -2821,7 +2851,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
+@@ -2820,7 +2850,7 @@ func (b *Builder) swigIntSize(objdir str
  
  // Run SWIG on one SWIG input file.
  func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
@@ -221,6 +217,3 @@ index 7dd9a90..ccebaf8 100644
  	if err != nil {
  		return "", "", err
  	}
--- 
-2.17.1 (Apple Git-112)
-
diff --git a/meta/recipes-devtools/go/go-1.13/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.14/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
similarity index 83%
rename from meta/recipes-devtools/go/go-1.13/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
rename to meta/recipes-devtools/go/go-1.14/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
index 9aa0119ae9..662c705471 100644
--- a/meta/recipes-devtools/go/go-1.13/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
+++ b/meta/recipes-devtools/go/go-1.14/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
@@ -17,11 +17,9 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  src/cmd/go/internal/cfg/cfg.go | 6 +++++-
  2 files changed, 8 insertions(+), 2 deletions(-)
 
-diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index 9e50311..683ca6f 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -244,7 +244,9 @@ func xinit() {
+@@ -246,7 +246,9 @@ func xinit() {
  	workdir = xworkdir()
  	xatexit(rmworkdir)
  
@@ -32,11 +30,9 @@ index 9e50311..683ca6f 100644
  }
  
  // compilerEnv returns a map from "goos/goarch" to the
-diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
-index a3277a6..db96350 100644
 --- a/src/cmd/go/internal/cfg/cfg.go
 +++ b/src/cmd/go/internal/cfg/cfg.go
-@@ -60,7 +60,11 @@ func defaultContext() build.Context {
+@@ -64,7 +64,11 @@ func defaultContext() build.Context {
  		// variables. This matches the initialization of ToolDir in
  		// go/build, except for using ctxt.GOROOT rather than
  		// runtime.GOROOT.
@@ -49,6 +45,3 @@ index a3277a6..db96350 100644
  	}
  
  	ctxt.GOPATH = envOr("GOPATH", ctxt.GOPATH)
--- 
-2.17.1 (Apple Git-112)
-
diff --git a/meta/recipes-devtools/go/go-1.13/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.14/0004-ld-add-soname-to-shareable-objects.patch
similarity index 82%
rename from meta/recipes-devtools/go/go-1.13/0004-ld-add-soname-to-shareable-objects.patch
rename to meta/recipes-devtools/go/go-1.14/0004-ld-add-soname-to-shareable-objects.patch
index 40763ad5b1..75c9c75211 100644
--- a/meta/recipes-devtools/go/go-1.13/0004-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go-1.14/0004-ld-add-soname-to-shareable-objects.patch
@@ -17,11 +17,9 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  src/cmd/link/internal/ld/lib.go | 3 +++
  1 file changed, 3 insertions(+)
 
-diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
-index 3fa258d..f96fb02 100644
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1215,6 +1215,7 @@ func (ctxt *Link) hostlink() {
+@@ -1280,6 +1280,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -29,7 +27,7 @@ index 3fa258d..f96fb02 100644
  			if ctxt.HeadType != objabi.Hwindows {
  				// Pass -z nodelete to mark the shared library as
  				// non-closeable: a dlclose will do nothing.
-@@ -1226,6 +1227,7 @@ func (ctxt *Link) hostlink() {
+@@ -1291,6 +1292,7 @@ func (ctxt *Link) hostlink() {
  			argv = append(argv, "-Wl,-z,relro")
  		}
  		argv = append(argv, "-shared")
@@ -37,7 +35,7 @@ index 3fa258d..f96fb02 100644
  	case BuildModePlugin:
  		if ctxt.HeadType == objabi.Hdarwin {
  			argv = append(argv, "-dynamiclib")
-@@ -1234,6 +1236,7 @@ func (ctxt *Link) hostlink() {
+@@ -1299,6 +1301,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -45,6 +43,3 @@ index 3fa258d..f96fb02 100644
  		}
  	}
  
--- 
-2.17.1 (Apple Git-112)
-
diff --git a/meta/recipes-devtools/go/go-1.13/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.14/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
similarity index 88%
rename from meta/recipes-devtools/go/go-1.13/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
rename to meta/recipes-devtools/go/go-1.14/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
index 4f2a46c6ce..59c12d9546 100644
--- a/meta/recipes-devtools/go/go-1.13/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ b/meta/recipes-devtools/go/go-1.14/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -17,11 +17,9 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  src/make.bash | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/src/make.bash b/src/make.bash
-index 92d1481..0c2822f 100755
 --- a/src/make.bash
 +++ b/src/make.bash
-@@ -177,7 +177,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
+@@ -178,7 +178,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ];
  	exit 1
  fi
  rm -f cmd/dist/dist
@@ -30,7 +28,7 @@ index 92d1481..0c2822f 100755
  
  # -e doesn't propagate out of eval, so check success by hand.
  eval $(./cmd/dist/dist env -p || echo FAIL=true)
-@@ -208,7 +208,7 @@ fi
+@@ -209,7 +209,7 @@ fi
  # Run dist bootstrap to complete make.bash.
  # Bootstrap installs a proper cmd/dist, built with the new toolchain.
  # Throw ours, built with Go 1.4, away after bootstrap.
@@ -39,6 +37,3 @@ index 92d1481..0c2822f 100755
  rm -f ./cmd/dist/dist
  
  # DO NOT ADD ANY NEW CODE HERE.
--- 
-2.17.1 (Apple Git-112)
-
diff --git a/meta/recipes-devtools/go/go-1.13/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.14/0006-cmd-dist-separate-host-and-target-builds.patch
similarity index 95%
rename from meta/recipes-devtools/go/go-1.13/0006-cmd-dist-separate-host-and-target-builds.patch
rename to meta/recipes-devtools/go/go-1.14/0006-cmd-dist-separate-host-and-target-builds.patch
index 354aaca3a1..7aee0bac43 100644
--- a/meta/recipes-devtools/go/go-1.13/0006-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go-1.14/0006-cmd-dist-separate-host-and-target-builds.patch
@@ -38,8 +38,6 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  src/cmd/dist/build.go | 155 ++++++++++++++++++++++++++++++------------
  1 file changed, 112 insertions(+), 43 deletions(-)
 
-diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index 683ca6f..0ad082b 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
 @@ -41,6 +41,7 @@ var (
@@ -58,7 +56,7 @@ index 683ca6f..0ad082b 100644
  
  	vflag int // verbosity
  )
-@@ -247,6 +249,8 @@ func xinit() {
+@@ -249,6 +251,8 @@ func xinit() {
  	if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
  		tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
  	}
@@ -67,7 +65,7 @@ index 683ca6f..0ad082b 100644
  }
  
  // compilerEnv returns a map from "goos/goarch" to the
-@@ -478,8 +482,10 @@ func setup() {
+@@ -480,8 +484,10 @@ func setup() {
  	p := pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarch)
  	if rebuildall {
  		xremoveall(p)
@@ -78,7 +76,7 @@ index 683ca6f..0ad082b 100644
  
  	if goos != gohostos || goarch != gohostarch {
  		p := pathf("%s/pkg/%s_%s", goroot, goos, goarch)
-@@ -1207,12 +1213,29 @@ func cmdbootstrap() {
+@@ -1244,12 +1250,29 @@ func cmdbootstrap() {
  
  	var noBanner bool
  	var debug bool
@@ -109,7 +107,7 @@ index 683ca6f..0ad082b 100644
  	// Set GOPATH to an internal directory. We shouldn't actually
  	// need to store files here, since the toolchain won't
  	// depend on modules outside of vendor directories, but if
-@@ -1266,8 +1289,13 @@ func cmdbootstrap() {
+@@ -1303,8 +1326,13 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  
@@ -125,7 +123,7 @@ index 683ca6f..0ad082b 100644
  	goBootstrap := pathf("%s/go_bootstrap", tooldir)
  	cmdGo := pathf("%s/go", gobin)
  	if debug {
-@@ -1296,7 +1324,11 @@ func cmdbootstrap() {
+@@ -1333,7 +1361,11 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  	xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
@@ -138,7 +136,7 @@ index 683ca6f..0ad082b 100644
  	goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
  	if debug {
  		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
-@@ -1333,50 +1365,84 @@ func cmdbootstrap() {
+@@ -1370,50 +1402,84 @@ func cmdbootstrap() {
  	}
  	checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
  
@@ -190,8 +188,6 @@ index 683ca6f..0ad082b 100644
 -		timelog("build", "host toolchain")
 -		if vflag > 0 {
 -			xprintf("\n")
--		}
--		xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
 +
 +		if goos == oldgoos && goarch == oldgoarch {
 +			// Common case - not setting up for cross-compilation.
@@ -223,7 +219,8 @@ index 683ca6f..0ad082b 100644
 +			os.Setenv("GOARCH", goarch)
 +			os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
 +			xprintf("Building packages and commands for target, %s/%s.\n", goos, goarch)
-+		}
+ 		}
+-		xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
  		goInstall(goBootstrap, "std", "cmd")
  		checkNotStale(goBootstrap, "std", "cmd")
  		checkNotStale(cmdGo, "std", "cmd")
@@ -231,12 +228,7 @@ index 683ca6f..0ad082b 100644
 -		timelog("build", "target toolchain")
 -		if vflag > 0 {
 -			xprintf("\n")
-+		if debug {
-+			run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
-+			run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
-+			checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
-+			copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
- 		}
+-		}
 -		goos = oldgoos
 -		goarch = oldgoarch
 -		os.Setenv("GOOS", goos)
@@ -257,10 +249,16 @@ index 683ca6f..0ad082b 100644
 -		run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
 -		checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
 -		copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
++		if debug {
++			run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
++			run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
++			checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
++			copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
++		}
  	}
  
  	// Check that there are no new files in $GOROOT/bin other than
-@@ -1393,8 +1459,11 @@ func cmdbootstrap() {
+@@ -1430,8 +1496,11 @@ func cmdbootstrap() {
  		}
  	}
  
@@ -274,6 +272,3 @@ index 683ca6f..0ad082b 100644
  
  	if goos == "android" {
  		// Make sure the exec wrapper will sync a fresh $GOROOT to the device.
--- 
-2.17.1 (Apple Git-112)
-
diff --git a/meta/recipes-devtools/go/go-1.13/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.14/0007-cmd-go-make-GOROOT-precious-by-default.patch
similarity index 79%
rename from meta/recipes-devtools/go/go-1.13/0007-cmd-go-make-GOROOT-precious-by-default.patch
rename to meta/recipes-devtools/go/go-1.14/0007-cmd-go-make-GOROOT-precious-by-default.patch
index e232c79199..b93f83de69 100644
--- a/meta/recipes-devtools/go/go-1.13/0007-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go-1.14/0007-cmd-go-make-GOROOT-precious-by-default.patch
@@ -27,11 +27,9 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  src/cmd/go/internal/work/exec.go   | 25 +++++++++++++++++++++++++
  3 files changed, 34 insertions(+)
 
-diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go/internal/work/action.go
-index 33b7818..7617b4c 100644
 --- a/src/cmd/go/internal/work/action.go
 +++ b/src/cmd/go/internal/work/action.go
-@@ -662,6 +662,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action, shlib string) {
+@@ -670,6 +670,9 @@ func (b *Builder) addTransitiveLinkDeps(
  			if p1 == nil || p1.Shlib == "" || haveShlib[filepath.Base(p1.Shlib)] {
  				continue
  			}
@@ -41,11 +39,9 @@ index 33b7818..7617b4c 100644
  			haveShlib[filepath.Base(p1.Shlib)] = true
  			// TODO(rsc): The use of ModeInstall here is suspect, but if we only do ModeBuild,
  			// we'll end up building an overall library or executable that depends at runtime
-diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
-index 9305b2d..6560317 100644
 --- a/src/cmd/go/internal/work/build.go
 +++ b/src/cmd/go/internal/work/build.go
-@@ -155,6 +155,8 @@ See also: go install, go get, go clean.
+@@ -167,6 +167,8 @@ See also: go install, go get, go clean.
  
  const concurrentGCBackendCompilationEnabledByDefault = true
  
@@ -54,10 +50,10 @@ index 9305b2d..6560317 100644
  func init() {
  	// break init cycle
  	CmdBuild.Run = runBuild
-@@ -167,6 +169,10 @@ func init() {
+@@ -179,6 +181,10 @@ func init() {
  
- 	AddBuildFlags(CmdBuild)
- 	AddBuildFlags(CmdInstall)
+ 	AddBuildFlags(CmdBuild, DefaultBuildFlags)
+ 	AddBuildFlags(CmdInstall, DefaultBuildFlags)
 +
 +	if x := os.Getenv("GOROOT_OVERRIDE"); x != "" {
 +		goRootPrecious = false
@@ -65,11 +61,9 @@ index 9305b2d..6560317 100644
  }
  
  // Note that flags consulted by other parts of the code
-diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index ccebaf8..59450d7 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -455,6 +455,23 @@ func (b *Builder) build(a *Action) (err error) {
+@@ -464,6 +464,23 @@ func (b *Builder) build(a *Action) (err
  		return errors.New("binary-only packages are no longer supported")
  	}
  
@@ -93,7 +87,7 @@ index ccebaf8..59450d7 100644
  	if err := b.Mkdir(a.Objdir); err != nil {
  		return err
  	}
-@@ -1499,6 +1516,14 @@ func BuildInstallFunc(b *Builder, a *Action) (err error) {
+@@ -1493,6 +1510,14 @@ func BuildInstallFunc(b *Builder, a *Act
  		return nil
  	}
  
@@ -108,6 +102,3 @@ index ccebaf8..59450d7 100644
  	if err := b.Mkdir(a.Objdir); err != nil {
  		return err
  	}
--- 
-2.17.1 (Apple Git-112)
-
diff --git a/meta/recipes-devtools/go/go-1.13/0008-use-GOBUILDMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.14/0008-use-GOBUILDMODE-to-set-buildmode.patch
similarity index 85%
rename from meta/recipes-devtools/go/go-1.13/0008-use-GOBUILDMODE-to-set-buildmode.patch
rename to meta/recipes-devtools/go/go-1.14/0008-use-GOBUILDMODE-to-set-buildmode.patch
index 68e132f30a..b15d9812aa 100644
--- a/meta/recipes-devtools/go/go-1.13/0008-use-GOBUILDMODE-to-set-buildmode.patch
+++ b/meta/recipes-devtools/go/go-1.14/0008-use-GOBUILDMODE-to-set-buildmode.patch
@@ -23,11 +23,9 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  src/cmd/go/internal/work/build.go | 8 +++++++-
  1 file changed, 7 insertions(+), 1 deletion(-)
 
-diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
-index 6560317..5f3a988 100644
 --- a/src/cmd/go/internal/work/build.go
 +++ b/src/cmd/go/internal/work/build.go
-@@ -231,7 +231,13 @@ func AddBuildFlags(cmd *base.Command) {
+@@ -251,7 +251,13 @@ func AddBuildFlags(cmd *base.Command, ma
  
  	cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
  	cmd.Flag.Var(buildCompiler{}, "compiler", "")
@@ -41,7 +39,4 @@ index 6560317..5f3a988 100644
 +
  	cmd.Flag.Var(&load.BuildGcflags, "gcflags", "")
  	cmd.Flag.Var(&load.BuildGccgoflags, "gccgoflags", "")
- 	cmd.Flag.StringVar(&cfg.BuildMod, "mod", "", "")
--- 
-2.17.1 (Apple Git-112)
-
+ 	if mask&OmitModFlag == 0 {
diff --git a/meta/recipes-devtools/go/go-1.13/0009-ld-replace-glibc-dynamic-linker-with-musl.patch b/meta/recipes-devtools/go/go-1.14/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
similarity index 79%
rename from meta/recipes-devtools/go/go-1.13/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
rename to meta/recipes-devtools/go/go-1.14/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
index 4bb1106f09..427cfb0dd2 100644
--- a/meta/recipes-devtools/go/go-1.13/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
+++ b/meta/recipes-devtools/go/go-1.14/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
@@ -25,11 +25,9 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  src/cmd/link/internal/x86/obj.go    | 2 +-
  8 files changed, 8 insertions(+), 8 deletions(-)
 
-diff --git a/src/cmd/link/internal/amd64/obj.go b/src/cmd/link/internal/amd64/obj.go
-index 23741eb..8e74576 100644
 --- a/src/cmd/link/internal/amd64/obj.go
 +++ b/src/cmd/link/internal/amd64/obj.go
-@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {
+@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
  		PEreloc1:         pereloc1,
  		TLSIEtoLE:        tlsIEtoLE,
  
@@ -38,8 +36,6 @@ index 23741eb..8e74576 100644
  		Freebsddynld:   "/libexec/ld-elf.so.1",
  		Openbsddynld:   "/usr/libexec/ld.so",
  		Netbsddynld:    "/libexec/ld.elf_so",
-diff --git a/src/cmd/link/internal/arm/obj.go b/src/cmd/link/internal/arm/obj.go
-index 45a406e..724d3e3 100644
 --- a/src/cmd/link/internal/arm/obj.go
 +++ b/src/cmd/link/internal/arm/obj.go
 @@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -51,8 +47,6 @@ index 45a406e..724d3e3 100644
  		Freebsddynld:   "/usr/libexec/ld-elf.so.1",
  		Openbsddynld:   "/usr/libexec/ld.so",
  		Netbsddynld:    "/libexec/ld.elf_so",
-diff --git a/src/cmd/link/internal/arm64/obj.go b/src/cmd/link/internal/arm64/obj.go
-index 7c66623..d8b1db1 100644
 --- a/src/cmd/link/internal/arm64/obj.go
 +++ b/src/cmd/link/internal/arm64/obj.go
 @@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -62,10 +56,8 @@ index 7c66623..d8b1db1 100644
 -		Linuxdynld: "/lib/ld-linux-aarch64.so.1",
 +		Linuxdynld: "/lib/ld-musl-aarch64.so.1",
  
- 		Freebsddynld:   "XXX",
+ 		Freebsddynld:   "/usr/libexec/ld-elf.so.1",
  		Openbsddynld:   "/usr/libexec/ld.so",
-diff --git a/src/cmd/link/internal/mips/obj.go b/src/cmd/link/internal/mips/obj.go
-index 231e1ff..631dd7a 100644
 --- a/src/cmd/link/internal/mips/obj.go
 +++ b/src/cmd/link/internal/mips/obj.go
 @@ -60,7 +60,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -77,8 +69,6 @@ index 231e1ff..631dd7a 100644
  
  		Freebsddynld:   "XXX",
  		Openbsddynld:   "XXX",
-diff --git a/src/cmd/link/internal/mips64/obj.go b/src/cmd/link/internal/mips64/obj.go
-index 9604208..5ef3ffc 100644
 --- a/src/cmd/link/internal/mips64/obj.go
 +++ b/src/cmd/link/internal/mips64/obj.go
 @@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -90,8 +80,6 @@ index 9604208..5ef3ffc 100644
  		Freebsddynld:   "XXX",
  		Openbsddynld:   "XXX",
  		Netbsddynld:    "XXX",
-diff --git a/src/cmd/link/internal/ppc64/obj.go b/src/cmd/link/internal/ppc64/obj.go
-index 51d1791..b15da85 100644
 --- a/src/cmd/link/internal/ppc64/obj.go
 +++ b/src/cmd/link/internal/ppc64/obj.go
 @@ -63,7 +63,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -103,8 +91,6 @@ index 51d1791..b15da85 100644
  
  		Freebsddynld:   "XXX",
  		Openbsddynld:   "XXX",
-diff --git a/src/cmd/link/internal/s390x/obj.go b/src/cmd/link/internal/s390x/obj.go
-index 3454476..42cc346 100644
 --- a/src/cmd/link/internal/s390x/obj.go
 +++ b/src/cmd/link/internal/s390x/obj.go
 @@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -116,8 +102,6 @@ index 3454476..42cc346 100644
  
  		// not relevant for s390x
  		Freebsddynld:   "XXX",
-diff --git a/src/cmd/link/internal/x86/obj.go b/src/cmd/link/internal/x86/obj.go
-index f1fad20..d2ca10c 100644
 --- a/src/cmd/link/internal/x86/obj.go
 +++ b/src/cmd/link/internal/x86/obj.go
 @@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -129,6 +113,3 @@ index f1fad20..d2ca10c 100644
  		Freebsddynld: "/usr/libexec/ld-elf.so.1",
  		Openbsddynld: "/usr/libexec/ld.so",
  		Netbsddynld:  "/usr/libexec/ld.elf_so",
--- 
-2.17.1 (Apple Git-112)
-
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.13.bb b/meta/recipes-devtools/go/go-cross-canadian_1.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.13.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.14.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.13.bb b/meta/recipes-devtools/go/go-cross_1.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.13.bb
rename to meta/recipes-devtools/go/go-cross_1.14.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.13.bb b/meta/recipes-devtools/go/go-crosssdk_1.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.13.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.14.bb
diff --git a/meta/recipes-devtools/go/go-native_1.13.bb b/meta/recipes-devtools/go/go-native_1.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.13.bb
rename to meta/recipes-devtools/go/go-native_1.14.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.13.bb b/meta/recipes-devtools/go/go-runtime_1.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.13.bb
rename to meta/recipes-devtools/go/go-runtime_1.14.bb
diff --git a/meta/recipes-devtools/go/go_1.13.bb b/meta/recipes-devtools/go/go_1.14.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.13.bb
rename to meta/recipes-devtools/go/go_1.14.bb
-- 
2.25.1


