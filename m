Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 08E6B79C54
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 01:31:59 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id bh10-v6so1733839plb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 18:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5qCb9m5W2f6/Q3pmJlBi5XzZZ0MwDhpTldYZ8c6PpEU=;
	b=D6ONdDwJ7PH6cLydKx0lOtnDr6NnrEptOi5CkSDZr2W/j9Dl8kfIXjqom7WRd1D30P
	4SxZAG5s/IFzyjzmEJ8peubNywUzS0I8aDhu6J0DN4LDAf++t6oiKdCRXIHMyuaPeDmP
	ZEEOey4+uD0FKIs52SzhCK/k3dUfwegOGVEwqSSgNNBKLmGHw2VXSOo3rnM3Jqe7gJ8R
	UIlZV3wcV16p0Tf3K3gYncPzlhu7gcuYIMNKAHUcCtYj12rzpoWbj66oMrUPnaZ61EU0
	Kfmoc0TC7AKnhzc0mx10fYbiQgsfOc6cmGBHdYY/o/bIZvcKnj1PnxXKnlqvhneU0vWD
	vnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5qCb9m5W2f6/Q3pmJlBi5XzZZ0MwDhpTldYZ8c6PpEU=;
	b=NToziTyqutHbPnQDbQfCa/oKjtjdNWz7weQAtYaLs6rums/pgfuE5sFkM6KbHEcSfi
	3eBd2j2OQ0+/XcpvlbCkKHmz1o3/sOM8j9Trk/UWA+VXLwU+C45E/L0qSkHuZA/T8O8P
	H0nH9L0BTYpeGgAR6WRvHp0t9ya4BqewfYo8RNkLIqtAUkBn9BzQqWZTOWip0wE6Tvq5
	FkjwMsCbvnppPM0jnz2Nt1bIPKGggq36LxeqStAiMiiAVoFPXGam2InH/ZIzDNgnMOoy
	XUWZMi5kLUh5VfhA7IhUkmyhbJxur3Nsm/nwZ0GPyY9S6xZnBDUKlo38O11a+tO8YKXO
	xkDA==
X-Gm-Message-State: ABuFfoiLCQ1nFcFRcbQW+v8MlqPpgXlOLqloHRblxjVVPpopGeqHh5uB
	UtFqhTSBNKp/b90URedkXFG4r2giq64=
X-Google-Smtp-Source: ACcGV62qTSLKRrM/8qr33KTHne+R3//+ZlQ/WWinSS67sgBOwfPH4tSQA3m3+9cZGiZGiL2qamy4Jw==
X-Received: by 2002:a17:902:ea:: with SMTP id
	a97-v6mr31980759pla.164.1539912719728; 
	Thu, 18 Oct 2018 18:31:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b111])
	by smtp.gmail.com with ESMTPSA id
	k70-v6sm26863026pfc.76.2018.10.18.18.31.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Oct 2018 18:31:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2018 18:31:47 -0700
Message-Id: <20181019013148.30745-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH 1/2] go: Upgrade to 1.11.1
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
X-List-Received-Date: Fri, 19 Oct 2018 01:32:00 -0000
Content-Transfer-Encoding: 8bit

Drop 1.10 recipes in favor of 1.11
we have had reports of 1.10 not being quite
functional wth OE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-to-be-overridden-in-the-environment.patch | 64 ------------------
 ...-arm64-fix-branch-too-far-with-TBZ-l.patch | 58 ----------------
 .../go/{go-1.10.inc => go-1.11.inc}           |  9 ++-
 ...ow-CC-and-CXX-to-have-multiple-words.patch | 12 ++--
 ...ent-based-hash-generation-less-pedan.patch | 46 ++++++-------
 ...-to-be-overridden-in-the-environment.patch | 48 +++++++++++++
 ...4-ld-add-soname-to-shareable-objects.patch | 16 ++---
 ...de-CC-when-building-dist-and-go_boot.patch | 15 ++---
 ...dist-separate-host-and-target-builds.patch | 67 ++++++++++---------
 ...d-go-make-GOROOT-precious-by-default.patch | 50 +++++++-------
 ...place-glibc-dynamic-linker-with-musl.patch | 24 +++----
 ...dian_1.10.bb => go-cross-canadian_1.11.bb} |  0
 .../go/{go-cross_1.10.bb => go-cross_1.11.bb} |  0
 ...o-crosssdk_1.10.bb => go-crosssdk_1.11.bb} |  0
 .../{go-native_1.10.bb => go-native_1.11.bb}  |  0
 ...{go-runtime_1.10.bb => go-runtime_1.11.bb} |  0
 .../go/{go_1.10.bb => go_1.11.bb}             |  0
 17 files changed, 163 insertions(+), 246 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.10/0008-cmd-internal-obj-arm64-fix-branch-too-far-with-TBZ-l.patch
 rename meta/recipes-devtools/go/{go-1.10.inc => go-1.11.inc} (74%)
 rename meta/recipes-devtools/go/{go-1.10 => go-1.11}/0001-allow-CC-and-CXX-to-have-multiple-words.patch (79%)
 rename meta/recipes-devtools/go/{go-1.10 => go-1.11}/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch (85%)
 create mode 100644 meta/recipes-devtools/go/go-1.11/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
 rename meta/recipes-devtools/go/{go-1.10 => go-1.11}/0004-ld-add-soname-to-shareable-objects.patch (79%)
 rename meta/recipes-devtools/go/{go-1.10 => go-1.11}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch (80%)
 rename meta/recipes-devtools/go/{go-1.10 => go-1.11}/0006-cmd-dist-separate-host-and-target-builds.patch (88%)
 rename meta/recipes-devtools/go/{go-1.10 => go-1.11}/0007-cmd-go-make-GOROOT-precious-by-default.patch (64%)
 rename meta/recipes-devtools/go/{go-1.10 => go-1.11}/0009-ld-replace-glibc-dynamic-linker-with-musl.patch (91%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.10.bb => go-cross-canadian_1.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.10.bb => go-cross_1.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.10.bb => go-crosssdk_1.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.10.bb => go-native_1.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.10.bb => go-runtime_1.11.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.10.bb => go_1.11.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
deleted file mode 100644
index 818fe66700..0000000000
--- a/meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From acd179b49f1fc8d6f7f69e569fb4a56039c725a1 Mon Sep 17 00:00:00 2001
-From: Matt Madison <matt@madison.systems>
-Date: Sat, 17 Feb 2018 05:24:20 -0800
-Subject: [PATCH 3/9] allow GOTOOLDIR to be overridden in the environment
-
-to allow for split host/target build roots
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Matt Madison <matt@madison.systems>
----
- src/cmd/dist/build.go          | 4 +++-
- src/cmd/go/internal/cfg/cfg.go | 6 +++++-
- src/go/build/build.go          | 2 +-
- 3 files changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index 49ed80033e..afc615b5c2 100644
---- a/src/cmd/dist/build.go
-+++ b/src/cmd/dist/build.go
-@@ -220,7 +220,9 @@ func xinit() {
- 	workdir = xworkdir()
- 	xatexit(rmworkdir)
- 
--	tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
-+	if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
-+		tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
-+	}
- }
- 
- // compilerEnv returns a map from "goos/goarch" to the
-diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
-index 1de4f0dc79..4f6010d660 100644
---- a/src/cmd/go/internal/cfg/cfg.go
-+++ b/src/cmd/go/internal/cfg/cfg.go
-@@ -96,7 +96,11 @@ func init() {
- 	// as the tool directory does not move based on environment variables.
- 	// This matches the initialization of ToolDir in go/build,
- 	// except for using GOROOT rather than runtime.GOROOT().
--	build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
-+	if s := os.Getenv("GOTOOLDIR"); s != "" {
-+		build.ToolDir = filepath.Clean(s)
-+	} else {
-+		build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
-+	}
- }
- 
- func findGOROOT() string {
-diff --git a/src/go/build/build.go b/src/go/build/build.go
-index 68fb423983..81b1b32270 100644
---- a/src/go/build/build.go
-+++ b/src/go/build/build.go
-@@ -1594,7 +1594,7 @@ func init() {
- }
- 
- // ToolDir is the directory containing build tools.
--var ToolDir = filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
-+var ToolDir = envOr("GOTOOLDIR", filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH))
- 
- // IsLocalImport reports whether the import path is
- // a local import path, like ".", "..", "./foo", or "../foo".
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/go/go-1.10/0008-cmd-internal-obj-arm64-fix-branch-too-far-with-TBZ-l.patch b/meta/recipes-devtools/go/go-1.10/0008-cmd-internal-obj-arm64-fix-branch-too-far-with-TBZ-l.patch
deleted file mode 100644
index 1e754178d5..0000000000
--- a/meta/recipes-devtools/go/go-1.10/0008-cmd-internal-obj-arm64-fix-branch-too-far-with-TBZ-l.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 41b90ed7af10a071ccfeede6a429e0d80518436d Mon Sep 17 00:00:00 2001
-From: Cherry Zhang <cherryyz@google.com>
-Date: Sat, 17 Feb 2018 10:31:39 -0500
-Subject: [PATCH 8/9] cmd/internal/obj/arm64: fix branch-too-far with TBZ like
- instructions
-
-The compiler now emits TBZ like instructions, but the assembler's
-too-far-branch patch code didn't include that case. Add it.
-
-Fixes #23889.
-
-Change-Id: Ib75f9250c660b9fb652835fbc83263a5d5073dc5
----
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport
-
- src/cmd/internal/obj/arm64/asm7.go     | 11 +++++++++--
- src/cmd/internal/obj/arm64/asm_test.go |  1 +
- 2 files changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/src/cmd/internal/obj/arm64/asm7.go b/src/cmd/internal/obj/arm64/asm7.go
-index ca81238c93..b1ee552489 100644
---- a/src/cmd/internal/obj/arm64/asm7.go
-+++ b/src/cmd/internal/obj/arm64/asm7.go
-@@ -696,9 +696,16 @@ func span7(ctxt *obj.Link, cursym *obj.LSym, newprog obj.ProgAlloc) {
- 			o = c.oplook(p)
- 
- 			/* very large branches */
--			if (o.type_ == 7 || o.type_ == 39) && p.Pcond != nil { // 7: BEQ and like, 39: CBZ and like
-+			if (o.type_ == 7 || o.type_ == 39 || o.type_ == 40) && p.Pcond != nil { // 7: BEQ and like, 39: CBZ and like, 40: TBZ and like
- 				otxt := p.Pcond.Pc - pc
--				if otxt <= -(1<<18)+10 || otxt >= (1<<18)-10 {
-+				var toofar bool
-+				switch o.type_ {
-+				case 7, 39: // branch instruction encodes 19 bits
-+					toofar = otxt <= -(1<<20)+10 || otxt >= (1<<20)-10
-+				case 40: // branch instruction encodes 14 bits
-+					toofar = otxt <= -(1<<15)+10 || otxt >= (1<<15)-10
-+				}
-+				if toofar {
- 					q := c.newprog()
- 					q.Link = p.Link
- 					p.Link = q
-diff --git a/src/cmd/internal/obj/arm64/asm_test.go b/src/cmd/internal/obj/arm64/asm_test.go
-index 369c48f510..3e0c9c13a6 100644
---- a/src/cmd/internal/obj/arm64/asm_test.go
-+++ b/src/cmd/internal/obj/arm64/asm_test.go
-@@ -52,6 +52,7 @@ func TestLarge(t *testing.T) {
- // gen generates a very large program, with a very far conditional branch.
- func gen(buf *bytes.Buffer) {
- 	fmt.Fprintln(buf, "TEXT f(SB),0,$0-0")
-+	fmt.Fprintln(buf, "TBZ $5, R0, label")
- 	fmt.Fprintln(buf, "CBZ R0, label")
- 	fmt.Fprintln(buf, "BEQ label")
- 	for i := 0; i < 1<<19; i++ {
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/go/go-1.10.inc b/meta/recipes-devtools/go/go-1.11.inc
similarity index 74%
rename from meta/recipes-devtools/go/go-1.10.inc
rename to meta/recipes-devtools/go/go-1.11.inc
index 1df0fc5b6a..c02e4683b3 100644
--- a/meta/recipes-devtools/go/go-1.10.inc
+++ b/meta/recipes-devtools/go/go-1.11.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
-GO_BASEVERSION = "1.10"
-GO_MINOR = ".3"
+GO_BASEVERSION = "1.11"
+GO_MINOR = ".1"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -15,10 +15,9 @@ SRC_URI += "\
     file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
-    file://0008-cmd-internal-obj-arm64-fix-branch-too-far-with-TBZ-l.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "d15dfb264105c5e84fbe33f4a4aa5021"
-SRC_URI[main.sha256sum] = "567b1cc66c9704d1c019c50bef946272e911ec6baf244310f87f4e678be155f2"
+SRC_URI[main.md5sum] = "eb9e9792247143705a7aacea9398cde0"
+SRC_URI[main.sha256sum] = "558f8c169ae215e25b81421596e8de7572bd3ba824b79add22fba6e284db1117"
diff --git a/meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.11/0001-allow-CC-and-CXX-to-have-multiple-words.patch
similarity index 79%
rename from meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch
rename to meta/recipes-devtools/go/go-1.11/0001-allow-CC-and-CXX-to-have-multiple-words.patch
index 3bb33b0146..4442858c83 100644
--- a/meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch
+++ b/meta/recipes-devtools/go/go-1.11/0001-allow-CC-and-CXX-to-have-multiple-words.patch
@@ -1,20 +1,21 @@
-From 7a7de46129fa6859fb6311096eb9f54c53c7fe2f Mon Sep 17 00:00:00 2001
+From 7cc519aa5f84cf8fc7ac8c10fc69aa8040330ea0 Mon Sep 17 00:00:00 2001
 From: Matt Madison <matt@madison.systems>
 Date: Mon, 19 Feb 2018 08:49:33 -0800
-Subject: [PATCH 1/9] allow CC and CXX to have multiple words
+Subject: [PATCH] allow CC and CXX to have multiple words
 
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Matt Madison <matt@madison.systems>
+
 ---
  src/cmd/go/internal/envcmd/env.go | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index 603f7b5060..f891123f9c 100644
+index afadbad..cedbfbf 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
-@@ -82,11 +82,11 @@ func MkEnv() []cfg.EnvVar {
+@@ -85,11 +85,11 @@ func MkEnv() []cfg.EnvVar {
  
  	cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
  	if env := strings.Fields(os.Getenv("CC")); len(env) > 0 {
@@ -28,6 +29,3 @@ index 603f7b5060..f891123f9c 100644
  	}
  	env = append(env, cfg.EnvVar{Name: "CC", Value: cc})
  	env = append(env, cfg.EnvVar{Name: "CXX", Value: cxx})
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.11/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
similarity index 85%
rename from meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
rename to meta/recipes-devtools/go/go-1.11/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 74f37a99ef..66b8561874 100644
--- a/meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go-1.11/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -1,7 +1,7 @@
-From 8b2feaee81d7a16adc59e61d06c1e7314d3a5408 Mon Sep 17 00:00:00 2001
+From 47db69e20ed66fb62b01affd83d829654b829893 Mon Sep 17 00:00:00 2001
 From: Matt Madison <matt@madison.systems>
 Date: Mon, 19 Feb 2018 08:50:59 -0800
-Subject: [PATCH 2/9] cmd/go: make content-based hash generation less pedantic
+Subject: [PATCH] cmd/go: make content-based hash generation less pedantic
 
 Go 1.10's build tool now uses content-based hashes to
 determine when something should be built or re-built.
@@ -41,17 +41,18 @@ by setting the CGO_PEDANTIC environment variable.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Matt Madison <matt@madison.systems>
+
 ---
  src/cmd/go/internal/envcmd/env.go |  2 +-
- src/cmd/go/internal/work/exec.go  | 63 ++++++++++++++++++++++++++++-----------
+ src/cmd/go/internal/work/exec.go  | 63 ++++++++++++++++++++++---------
  2 files changed, 46 insertions(+), 19 deletions(-)
 
 diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index f891123f9c..ebacfbfdbc 100644
+index cedbfbf..5763a0d 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
-@@ -113,7 +113,7 @@ func findEnv(env []cfg.EnvVar, name string) string {
- func ExtraEnvVars() []cfg.EnvVar {
+@@ -128,7 +128,7 @@ func ExtraEnvVars() []cfg.EnvVar {
+ func ExtraEnvVarsCostly() []cfg.EnvVar {
  	var b work.Builder
  	b.Init()
 -	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{})
@@ -60,10 +61,10 @@ index f891123f9c..ebacfbfdbc 100644
  		// Should not happen - b.CFlags was given an empty package.
  		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index c4c1500eb2..b0f6b45647 100644
+index 12e1527..e41bfac 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -173,6 +173,8 @@ func (b *Builder) Do(root *Action) {
+@@ -174,6 +174,8 @@ func (b *Builder) Do(root *Action) {
  	wg.Wait()
  }
  
@@ -72,7 +73,7 @@ index c4c1500eb2..b0f6b45647 100644
  // buildActionID computes the action ID for a build action.
  func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	p := a.Package
-@@ -189,7 +191,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -190,7 +192,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	// but it does not hide the exact value of $GOPATH.
  	// Include the full dir in that case.
  	// Assume b.WorkDir is being trimmed properly.
@@ -81,14 +82,14 @@ index c4c1500eb2..b0f6b45647 100644
  		fmt.Fprintf(h, "dir %s\n", p.Dir)
  	}
  	fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
-@@ -197,13 +199,13 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
- 	fmt.Fprintf(h, "omitdebug %v standard %v local %v prefix %q\n", p.Internal.OmitDebug, p.Standard, p.Internal.Local, p.Internal.LocalPrefix)
+@@ -201,13 +203,13 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 	}
  	if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
  		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
--		cppflags, cflags, cxxflags, fflags, _, _ := b.CFlags(p)
--		fmt.Fprintf(h, "CC=%q %q %q\n", b.ccExe(), cppflags, cflags)
-+		cppflags, cflags, cxxflags, fflags, _, _ := b.CFlags(p, true)
-+		fmt.Fprintf(h, "CC=%q %q %q\n", b.ccExe(true), cppflags, cflags)
+-		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p)
+-		fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(), cppflags, cflags, ldflags)
++		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
++		fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(true), cppflags, cflags, ldflags)
  		if len(p.CXXFiles)+len(p.SwigFiles) > 0 {
 -			fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(), cxxflags)
 +			fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(true), cxxflags)
@@ -99,7 +100,7 @@ index c4c1500eb2..b0f6b45647 100644
  		}
  		// TODO(rsc): Should we include the SWIG version or Fortran/GCC/G++/Objective-C compiler versions?
  	}
-@@ -1731,33 +1733,33 @@ var (
+@@ -2096,33 +2098,33 @@ var (
  // gccCmd returns a gcc command line prefix
  // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
  func (b *Builder) GccCmd(incdir, workdir string) []string {
@@ -142,7 +143,7 @@ index c4c1500eb2..b0f6b45647 100644
  }
  
  // compilerExe returns the compiler to use given an
-@@ -1766,11 +1768,14 @@ func (b *Builder) fcExe() []string {
+@@ -2131,11 +2133,14 @@ func (b *Builder) fcExe() []string {
  // of the compiler but can have additional arguments if they
  // were present in the environment value.
  // For example if CC="gcc -DGOPHER" then the result is ["gcc", "-DGOPHER"].
@@ -158,7 +159,7 @@ index c4c1500eb2..b0f6b45647 100644
  	return compiler
  }
  
-@@ -1920,8 +1925,23 @@ func envList(key, def string) []string {
+@@ -2285,8 +2290,23 @@ func envList(key, def string) []string {
  	return strings.Fields(v)
  }
  
@@ -183,7 +184,7 @@ index c4c1500eb2..b0f6b45647 100644
  	defaults := "-g -O2"
  
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
-@@ -1939,6 +1959,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+@@ -2304,6 +2324,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
  	if ldflags, err = buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
  		return
  	}
@@ -197,7 +198,7 @@ index c4c1500eb2..b0f6b45647 100644
  
  	return
  }
-@@ -1954,7 +1981,7 @@ var cgoRe = regexp.MustCompile(`[/\\:]`)
+@@ -2319,7 +2346,7 @@ var cgoRe = regexp.MustCompile(`[/\\:]`)
  
  func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
  	p := a.Package
@@ -206,7 +207,7 @@ index c4c1500eb2..b0f6b45647 100644
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -2306,7 +2333,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
+@@ -2679,7 +2706,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
  
  // Run SWIG on one SWIG input file.
  func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
@@ -215,6 +216,3 @@ index c4c1500eb2..b0f6b45647 100644
  	if err != nil {
  		return "", "", err
  	}
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/go/go-1.11/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.11/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
new file mode 100644
index 0000000000..b6ca40edee
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.11/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
@@ -0,0 +1,48 @@
+From 5c32c38bf19b24f0aadd78012d17ff5caa82151e Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Sat, 17 Feb 2018 05:24:20 -0800
+Subject: [PATCH] allow GOTOOLDIR to be overridden in the environment
+
+to allow for split host/target build roots
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+
+---
+ src/cmd/dist/build.go          | 4 +++-
+ src/cmd/go/internal/cfg/cfg.go | 7 +++++--
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+Index: go/src/cmd/dist/build.go
+===================================================================
+--- go.orig/src/cmd/dist/build.go
++++ go/src/cmd/dist/build.go
+@@ -228,7 +228,9 @@ func xinit() {
+ 	workdir = xworkdir()
+ 	xatexit(rmworkdir)
+ 
+-	tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
++	if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
++		tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
++	}
+ }
+ 
+ // compilerEnv returns a map from "goos/goarch" to the
+Index: go/src/cmd/go/internal/cfg/cfg.go
+===================================================================
+--- go.orig/src/cmd/go/internal/cfg/cfg.go
++++ go/src/cmd/go/internal/cfg/cfg.go
+@@ -116,7 +116,11 @@ func init() {
+ 		// variables. This matches the initialization of ToolDir in
+ 		// go/build, except for using GOROOT rather than
+ 		// runtime.GOROOT.
+-		build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
++		if s := os.Getenv("GOTOOLDIR"); s != "" {
++			build.ToolDir = filepath.Clean(s)
++		} else {
++			build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
++		}
+ 	}
+ }
+ 
diff --git a/meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.11/0004-ld-add-soname-to-shareable-objects.patch
similarity index 79%
rename from meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch
rename to meta/recipes-devtools/go/go-1.11/0004-ld-add-soname-to-shareable-objects.patch
index c23ca94290..004a33a023 100644
--- a/meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go-1.11/0004-ld-add-soname-to-shareable-objects.patch
@@ -1,7 +1,7 @@
-From 85252f0bd8743223eb778edbe9fb31dff17a23d8 Mon Sep 17 00:00:00 2001
+From 55eb8c95a89f32aec16b7764e78e8cf75169dc81 Mon Sep 17 00:00:00 2001
 From: Matt Madison <matt@madison.systems>
 Date: Sat, 17 Feb 2018 06:26:10 -0800
-Subject: [PATCH 4/9] ld: add soname to shareable objects
+Subject: [PATCH] ld: add soname to shareable objects
 
 so that OE's shared library dependency handling
 can find them.
@@ -9,15 +9,16 @@ can find them.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Matt Madison <matt@madison.systems>
+
 ---
  src/cmd/link/internal/ld/lib.go | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
-index 6dcaf64122..11cbb8a8bb 100644
+index 220aab3..703925f 100644
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1134,6 +1134,7 @@ func (ctxt *Link) hostlink() {
+@@ -1135,6 +1135,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -25,7 +26,7 @@ index 6dcaf64122..11cbb8a8bb 100644
  			if ctxt.HeadType != objabi.Hwindows {
  				// Pass -z nodelete to mark the shared library as
  				// non-closeable: a dlclose will do nothing.
-@@ -1145,6 +1146,8 @@ func (ctxt *Link) hostlink() {
+@@ -1146,6 +1147,8 @@ func (ctxt *Link) hostlink() {
  			argv = append(argv, "-Wl,-z,relro")
  		}
  		argv = append(argv, "-shared")
@@ -34,7 +35,7 @@ index 6dcaf64122..11cbb8a8bb 100644
  	case BuildModePlugin:
  		if ctxt.HeadType == objabi.Hdarwin {
  			argv = append(argv, "-dynamiclib")
-@@ -1153,6 +1156,7 @@ func (ctxt *Link) hostlink() {
+@@ -1154,6 +1157,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -42,6 +43,3 @@ index 6dcaf64122..11cbb8a8bb 100644
  		}
  	}
  
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.11/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
similarity index 80%
rename from meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
rename to meta/recipes-devtools/go/go-1.11/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
index 67a93939f5..ace8de9eae 100644
--- a/meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ b/meta/recipes-devtools/go/go-1.11/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -1,23 +1,23 @@
-From 16124d84648f4dfdfa4738c5660b5400b30bf9da Mon Sep 17 00:00:00 2001
+From 1bf15aa8fb773604b2524cfdab493fa4d8fa9285 Mon Sep 17 00:00:00 2001
 From: Matt Madison <matt@madison.systems>
 Date: Sat, 17 Feb 2018 06:32:45 -0800
-Subject: [PATCH 5/9] make.bash: override CC when building dist and
- go_bootstrap
+Subject: [PATCH] make.bash: override CC when building dist and go_bootstrap
 
 for handling OE cross-canadian builds.
 
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Matt Madison <matt@madison.systems>
+
 ---
  src/make.bash | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/make.bash b/src/make.bash
-index 93a5c43d11..3a63682bc4 100755
+index 78882d9..25943d0 100755
 --- a/src/make.bash
 +++ b/src/make.bash
-@@ -162,7 +162,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
+@@ -163,7 +163,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
  	exit 1
  fi
  rm -f cmd/dist/dist
@@ -26,7 +26,7 @@ index 93a5c43d11..3a63682bc4 100755
  
  # -e doesn't propagate out of eval, so check success by hand.
  eval $(./cmd/dist/dist env -p || echo FAIL=true)
-@@ -193,7 +193,7 @@ fi
+@@ -194,7 +194,7 @@ fi
  # Run dist bootstrap to complete make.bash.
  # Bootstrap installs a proper cmd/dist, built with the new toolchain.
  # Throw ours, built with Go 1.4, away after bootstrap.
@@ -35,6 +35,3 @@ index 93a5c43d11..3a63682bc4 100755
  rm -f ./cmd/dist/dist
  
  # DO NOT ADD ANY NEW CODE HERE.
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.11/0006-cmd-dist-separate-host-and-target-builds.patch
similarity index 88%
rename from meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch
rename to meta/recipes-devtools/go/go-1.11/0006-cmd-dist-separate-host-and-target-builds.patch
index 9fe6996284..0c0d5da80a 100644
--- a/meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go-1.11/0006-cmd-dist-separate-host-and-target-builds.patch
@@ -1,7 +1,7 @@
-From 2f07af34697c61decdcfa5b11434451fbcf37704 Mon Sep 17 00:00:00 2001
+From fe0fcaf43ef3aab81541dad2a71b46254dc4cf6a Mon Sep 17 00:00:00 2001
 From: Matt Madison <matt@madison.systems>
 Date: Sat, 17 Feb 2018 10:03:48 -0800
-Subject: [PATCH 6/9] cmd/dist: separate host and target builds
+Subject: [PATCH] cmd/dist: separate host and target builds
 
 Change the dist tool to allow for OE-style cross-
 and cross-canadian builds:
@@ -32,15 +32,16 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Matt Madison <matt@madison.systems>
 
 more dist cleanup
+
 ---
- src/cmd/dist/build.go | 149 +++++++++++++++++++++++++++++++++++++-------------
- 1 file changed, 111 insertions(+), 38 deletions(-)
+ src/cmd/dist/build.go | 153 ++++++++++++++++++++++++++++++------------
+ 1 file changed, 111 insertions(+), 42 deletions(-)
 
-diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index afc615b5c2..36262665b2 100644
---- a/src/cmd/dist/build.go
-+++ b/src/cmd/dist/build.go
-@@ -38,6 +38,7 @@ var (
+Index: go/src/cmd/dist/build.go
+===================================================================
+--- go.orig/src/cmd/dist/build.go
++++ go/src/cmd/dist/build.go
+@@ -39,6 +39,7 @@ var (
  	goldflags        string
  	workdir          string
  	tooldir          string
@@ -48,7 +49,7 @@ index afc615b5c2..36262665b2 100644
  	oldgoos          string
  	oldgoarch        string
  	exe              string
-@@ -49,6 +50,7 @@ var (
+@@ -50,6 +51,7 @@ var (
  
  	rebuildall   bool
  	defaultclang bool
@@ -56,7 +57,7 @@ index afc615b5c2..36262665b2 100644
  
  	vflag int // verbosity
  )
-@@ -223,6 +225,8 @@ func xinit() {
+@@ -231,6 +233,8 @@ func xinit() {
  	if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
  		tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
  	}
@@ -65,7 +66,7 @@ index afc615b5c2..36262665b2 100644
  }
  
  // compilerEnv returns a map from "goos/goarch" to the
-@@ -252,7 +256,6 @@ func compilerEnv(envName, def string) map[string]string {
+@@ -260,7 +264,6 @@ func compilerEnv(envName, def string) ma
  		if gohostos != goos || gohostarch != goarch {
  			m[gohostos+"/"+gohostarch] = m[""]
  		}
@@ -73,7 +74,7 @@ index afc615b5c2..36262665b2 100644
  	}
  
  	for _, goos := range okgoos {
-@@ -479,8 +482,10 @@ func setup() {
+@@ -487,8 +490,10 @@ func setup() {
  	// We keep it in pkg/, just like the object directory above.
  	if rebuildall {
  		xremoveall(tooldir)
@@ -84,7 +85,7 @@ index afc615b5c2..36262665b2 100644
  
  	// Remove tool binaries from before the tool/gohostos_gohostarch
  	xremoveall(pathf("%s/bin/tool", goroot))
-@@ -1130,11 +1135,29 @@ func cmdbootstrap() {
+@@ -1155,11 +1160,29 @@ func cmdbootstrap() {
  
  	var noBanner bool
  	var debug bool
@@ -115,7 +116,7 @@ index afc615b5c2..36262665b2 100644
  
  	if debug {
  		// cmd/buildid is used in debug mode.
-@@ -1182,8 +1205,13 @@ func cmdbootstrap() {
+@@ -1207,8 +1230,13 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  
@@ -131,7 +132,7 @@ index afc615b5c2..36262665b2 100644
  	goBootstrap := pathf("%s/go_bootstrap", tooldir)
  	cmdGo := pathf("%s/go", gobin)
  	if debug {
-@@ -1212,7 +1240,11 @@ func cmdbootstrap() {
+@@ -1237,7 +1265,11 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  	xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
@@ -144,7 +145,7 @@ index afc615b5c2..36262665b2 100644
  	goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
  	if debug {
  		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
-@@ -1249,45 +1281,82 @@ func cmdbootstrap() {
+@@ -1274,50 +1306,84 @@ func cmdbootstrap() {
  	}
  	checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
  
@@ -196,6 +197,7 @@ index afc615b5c2..36262665b2 100644
 -		timelog("build", "host toolchain")
 -		if vflag > 0 {
 -			xprintf("\n")
++
 +		if goos == oldgoos && goarch == oldgoarch {
 +			// Common case - not setting up for cross-compilation.
 +			timelog("build", "toolchain")
@@ -231,16 +233,11 @@ index afc615b5c2..36262665b2 100644
  		goInstall(goBootstrap, "std", "cmd")
  		checkNotStale(goBootstrap, "std", "cmd")
  		checkNotStale(cmdGo, "std", "cmd")
--
+ 
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
@@ -248,18 +245,29 @@ index afc615b5c2..36262665b2 100644
 -		os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
 -		xprintf("Building packages and commands for target, %s/%s.\n", goos, goarch)
 -	}
--	goInstall(goBootstrap, "std", "cmd")
--	checkNotStale(goBootstrap, "std", "cmd")
--	checkNotStale(cmdGo, "std", "cmd")
+-	targets := []string{"std", "cmd"}
+-	if goos == "js" && goarch == "wasm" {
+-		// Skip the cmd tools for js/wasm. They're not usable.
+-		targets = targets[:1]
+-	}
+-	goInstall(goBootstrap, targets...)
+-	checkNotStale(goBootstrap, targets...)
+-	checkNotStale(cmdGo, targets...)
 -	if debug {
 -		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
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
-@@ -1305,7 +1374,11 @@ func cmdbootstrap() {
+@@ -1335,7 +1401,11 @@ func cmdbootstrap() {
  	}
  
  	// Remove go_bootstrap now that we're done.
@@ -272,6 +280,3 @@ index afc615b5c2..36262665b2 100644
  
  	// Print trailing banner unless instructed otherwise.
  	if !noBanner {
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.11/0007-cmd-go-make-GOROOT-precious-by-default.patch
similarity index 64%
rename from meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch
rename to meta/recipes-devtools/go/go-1.11/0007-cmd-go-make-GOROOT-precious-by-default.patch
index 72427627bc..f317e48a33 100644
--- a/meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go-1.11/0007-cmd-go-make-GOROOT-precious-by-default.patch
@@ -1,7 +1,7 @@
-From f98aa287941417226a6e4f78759f8a5e19732cde Mon Sep 17 00:00:00 2001
+From 7cc60b3887be2d5674b9f5d422d022976cf205e5 Mon Sep 17 00:00:00 2001
 From: Matt Madison <matt@madison.systems>
 Date: Fri, 2 Mar 2018 06:00:20 -0800
-Subject: [PATCH 7/9] cmd/go: make GOROOT precious by default
+Subject: [PATCH] cmd/go: make GOROOT precious by default
 
 The go build tool normally rebuilds whatever it detects is
 stale.  This can be a problem when GOROOT is intended to
@@ -17,17 +17,18 @@ environment variable.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Matt Madison <matt@madison.systems>
+
 ---
  src/cmd/go/internal/work/action.go |  3 +++
  src/cmd/go/internal/work/build.go  |  5 +++++
  src/cmd/go/internal/work/exec.go   | 25 +++++++++++++++++++++++++
  3 files changed, 33 insertions(+)
 
-diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go/internal/work/action.go
-index 9f1f8f8a50..a382880474 100644
---- a/src/cmd/go/internal/work/action.go
-+++ b/src/cmd/go/internal/work/action.go
-@@ -563,6 +563,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action, shlib string) {
+Index: go/src/cmd/go/internal/work/action.go
+===================================================================
+--- go.orig/src/cmd/go/internal/work/action.go
++++ go/src/cmd/go/internal/work/action.go
+@@ -600,6 +600,9 @@ func (b *Builder) addTransitiveLinkDeps(
  			if p1 == nil || p1.Shlib == "" || haveShlib[filepath.Base(p1.Shlib)] {
  				continue
  			}
@@ -37,11 +38,11 @@ index 9f1f8f8a50..a382880474 100644
  			haveShlib[filepath.Base(p1.Shlib)] = true
  			// TODO(rsc): The use of ModeInstall here is suspect, but if we only do ModeBuild,
  			// we'll end up building an overall library or executable that depends at runtime
-diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
-index 57b7b00879..e2ba95420e 100644
---- a/src/cmd/go/internal/work/build.go
-+++ b/src/cmd/go/internal/work/build.go
-@@ -143,6 +143,7 @@ See also: go install, go get, go clean.
+Index: go/src/cmd/go/internal/work/build.go
+===================================================================
+--- go.orig/src/cmd/go/internal/work/build.go
++++ go/src/cmd/go/internal/work/build.go
+@@ -147,6 +147,7 @@ See also: go install, go get, go clean.
  }
  
  const concurrentGCBackendCompilationEnabledByDefault = true
@@ -49,7 +50,7 @@ index 57b7b00879..e2ba95420e 100644
  
  func init() {
  	// break init cycle
-@@ -156,6 +157,10 @@ func init() {
+@@ -160,6 +161,10 @@ func init() {
  
  	AddBuildFlags(CmdBuild)
  	AddBuildFlags(CmdInstall)
@@ -60,12 +61,12 @@ index 57b7b00879..e2ba95420e 100644
  }
  
  // Note that flags consulted by other parts of the code
-diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index b0f6b45647..c8f266a8ad 100644
---- a/src/cmd/go/internal/work/exec.go
-+++ b/src/cmd/go/internal/work/exec.go
-@@ -371,6 +371,23 @@ func (b *Builder) build(a *Action) (err error) {
- 		return fmt.Errorf("missing or invalid binary-only package")
+Index: go/src/cmd/go/internal/work/exec.go
+===================================================================
+--- go.orig/src/cmd/go/internal/work/exec.go
++++ go/src/cmd/go/internal/work/exec.go
+@@ -440,6 +440,23 @@ func (b *Builder) build(a *Action) (err
+ 		return fmt.Errorf("module requires Go %s", p.Module.GoVersion)
  	}
  
 +	if goRootPrecious && (a.Package.Standard || a.Package.Goroot) {
@@ -78,9 +79,9 @@ index b0f6b45647..c8f266a8ad 100644
 +			a.Package.StaleReason = "GOROOT-resident package"
 +			return nil
 +		}
-+		if b.ComputeStaleOnly {
-+			a.Package.Stale = true
-+			a.Package.StaleReason = "missing or invalid GOROOT-resident package"
++		a.Package.Stale = true
++		a.Package.StaleReason = "missing or invalid GOROOT-resident package"
++		if b.IsCmdList {
 +			return nil
 +		}
 +	}
@@ -88,7 +89,7 @@ index b0f6b45647..c8f266a8ad 100644
  	if err := b.Mkdir(a.Objdir); err != nil {
  		return err
  	}
-@@ -1097,6 +1114,14 @@ func BuildInstallFunc(b *Builder, a *Action) (err error) {
+@@ -1435,6 +1452,14 @@ func BuildInstallFunc(b *Builder, a *Act
  		return nil
  	}
  
@@ -103,6 +104,3 @@ index b0f6b45647..c8f266a8ad 100644
  	if err := b.Mkdir(a.Objdir); err != nil {
  		return err
  	}
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/go/go-1.10/0009-ld-replace-glibc-dynamic-linker-with-musl.patch b/meta/recipes-devtools/go/go-1.11/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
similarity index 91%
rename from meta/recipes-devtools/go/go-1.10/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
rename to meta/recipes-devtools/go/go-1.11/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
index 06b00b3cc2..fd67375c7f 100644
--- a/meta/recipes-devtools/go/go-1.10/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
+++ b/meta/recipes-devtools/go/go-1.11/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
@@ -1,7 +1,7 @@
-From f575d85c4bd9b2903223d6c0dcc38a12775d582f Mon Sep 17 00:00:00 2001
+From 35ea4be34e94912b00837e0f7c7385f2e98fe769 Mon Sep 17 00:00:00 2001
 From: Matt Madison <matt@madison.systems>
 Date: Sun, 18 Feb 2018 08:24:05 -0800
-Subject: [PATCH 9/9] ld: replace glibc dynamic linker with musl
+Subject: [PATCH] ld: replace glibc dynamic linker with musl
 
 Rework of patch by Khem Raj <raj.khem@gmail.com>
 for go 1.10.  Should be applied conditionally on
@@ -10,6 +10,7 @@ musl being the system C library.
 Upstream-Status: Inappropriate [Real fix should be portable across libcs]
 
 Signed-off-by: Matt Madison <matt@madison.systems>
+
 ---
  src/cmd/link/internal/amd64/obj.go  | 2 +-
  src/cmd/link/internal/arm/obj.go    | 2 +-
@@ -22,7 +23,7 @@ Signed-off-by: Matt Madison <matt@madison.systems>
  8 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/src/cmd/link/internal/amd64/obj.go b/src/cmd/link/internal/amd64/obj.go
-index 87e809166a..f522a63034 100644
+index 87e8091..f522a63 100644
 --- a/src/cmd/link/internal/amd64/obj.go
 +++ b/src/cmd/link/internal/amd64/obj.go
 @@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -35,7 +36,7 @@ index 87e809166a..f522a63034 100644
  		Openbsddynld:   "/usr/libexec/ld.so",
  		Netbsddynld:    "/libexec/ld.elf_so",
 diff --git a/src/cmd/link/internal/arm/obj.go b/src/cmd/link/internal/arm/obj.go
-index da16f92345..fd14940ede 100644
+index 788be68..1d2b90e 100644
 --- a/src/cmd/link/internal/arm/obj.go
 +++ b/src/cmd/link/internal/arm/obj.go
 @@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -48,7 +49,7 @@ index da16f92345..fd14940ede 100644
  		Openbsddynld:   "/usr/libexec/ld.so",
  		Netbsddynld:    "/libexec/ld.elf_so",
 diff --git a/src/cmd/link/internal/arm64/obj.go b/src/cmd/link/internal/arm64/obj.go
-index 6b386ad737..99863712cc 100644
+index 405d22d..b115659 100644
 --- a/src/cmd/link/internal/arm64/obj.go
 +++ b/src/cmd/link/internal/arm64/obj.go
 @@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -61,7 +62,7 @@ index 6b386ad737..99863712cc 100644
  		Freebsddynld:   "XXX",
  		Openbsddynld:   "XXX",
 diff --git a/src/cmd/link/internal/mips/obj.go b/src/cmd/link/internal/mips/obj.go
-index c5d3451c39..fd85e6368d 100644
+index c5d3451..fd85e63 100644
 --- a/src/cmd/link/internal/mips/obj.go
 +++ b/src/cmd/link/internal/mips/obj.go
 @@ -60,7 +60,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -74,7 +75,7 @@ index c5d3451c39..fd85e6368d 100644
  		Freebsddynld:   "XXX",
  		Openbsddynld:   "XXX",
 diff --git a/src/cmd/link/internal/mips64/obj.go b/src/cmd/link/internal/mips64/obj.go
-index 83974e5b56..097224f6da 100644
+index 83974e5..097224f 100644
 --- a/src/cmd/link/internal/mips64/obj.go
 +++ b/src/cmd/link/internal/mips64/obj.go
 @@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -87,7 +88,7 @@ index 83974e5b56..097224f6da 100644
  		Openbsddynld:   "XXX",
  		Netbsddynld:    "XXX",
 diff --git a/src/cmd/link/internal/ppc64/obj.go b/src/cmd/link/internal/ppc64/obj.go
-index 273d9b42cb..a503abe8ea 100644
+index 273d9b4..a503abe 100644
 --- a/src/cmd/link/internal/ppc64/obj.go
 +++ b/src/cmd/link/internal/ppc64/obj.go
 @@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -100,7 +101,7 @@ index 273d9b42cb..a503abe8ea 100644
  		Freebsddynld:   "XXX",
  		Openbsddynld:   "XXX",
 diff --git a/src/cmd/link/internal/s390x/obj.go b/src/cmd/link/internal/s390x/obj.go
-index 9ac7eb8217..3825ff7abe 100644
+index 9ac7eb8..3825ff7 100644
 --- a/src/cmd/link/internal/s390x/obj.go
 +++ b/src/cmd/link/internal/s390x/obj.go
 @@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -113,7 +114,7 @@ index 9ac7eb8217..3825ff7abe 100644
  		// not relevant for s390x
  		Freebsddynld:   "XXX",
 diff --git a/src/cmd/link/internal/x86/obj.go b/src/cmd/link/internal/x86/obj.go
-index 6a744dc04e..d81f392549 100644
+index 6a744dc..d81f392 100644
 --- a/src/cmd/link/internal/x86/obj.go
 +++ b/src/cmd/link/internal/x86/obj.go
 @@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {
@@ -125,6 +126,3 @@ index 6a744dc04e..d81f392549 100644
  		Freebsddynld: "/usr/libexec/ld-elf.so.1",
  		Openbsddynld: "/usr/libexec/ld.so",
  		Netbsddynld:  "/usr/libexec/ld.elf_so",
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.10.bb b/meta/recipes-devtools/go/go-cross-canadian_1.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.10.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.11.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.10.bb b/meta/recipes-devtools/go/go-cross_1.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.10.bb
rename to meta/recipes-devtools/go/go-cross_1.11.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.10.bb b/meta/recipes-devtools/go/go-crosssdk_1.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.10.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.11.bb
diff --git a/meta/recipes-devtools/go/go-native_1.10.bb b/meta/recipes-devtools/go/go-native_1.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.10.bb
rename to meta/recipes-devtools/go/go-native_1.11.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.10.bb b/meta/recipes-devtools/go/go-runtime_1.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.10.bb
rename to meta/recipes-devtools/go/go-runtime_1.11.bb
diff --git a/meta/recipes-devtools/go/go_1.10.bb b/meta/recipes-devtools/go/go_1.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.10.bb
rename to meta/recipes-devtools/go/go_1.11.bb
-- 
2.19.1


