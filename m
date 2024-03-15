Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C749C54E7C
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1239.1710522011678765484
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K5d649Yj;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=xs+VlOEl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018e430e8caf-ef0afefa-47eb-4307-b821-5a5eed54086a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2k6dOvDRMoabC/XgBnC+71+Vi5Wip+khKEWhuEu4mIM=;
	b=K5d649YjMhJnxsoBXicB1v3JdBE0uELP/NeImJR0Qh4CUlRSbuBwbXaJFm9z6hei
	pt3v4bh6xDelI1mD9EVaXlVTMoPiUry+7dIxQfm5GEa8GgwUHgPSaLBO7fiRborXuMv
	rdD3eC0qhiVAHuqSOWj38R9Q8Hca5ygUOWucJeSc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2k6dOvDRMoabC/XgBnC+71+Vi5Wip+khKEWhuEu4mIM=;
	b=xs+VlOElg/cYph5jg3f+NDc3DhYMnL+5XlvReDZPWUyLvS8yqf2iUHTtWtz+pvJM
	O7UB30ff1rUM/5H/6ONnN1Ez98bIoWA4SqWIYYhIjvlHbNoi3DCSOn3a20E+7jCQVVd
	REQLBu1uozWdduvjHjBFdYT/Zzxi7N3Ln2ZUzOwg=
Content-Type: multipart/mixed; boundary="===============5484201311059088924=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.22.1 FAILED
Message-ID: <0101018e430e8caf-ef0afefa-47eb-4307-b821-5a5eed54086a-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197164

--===============5484201311059088924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.22.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-upgrade-1.22.0-1.22.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 1027ead911d29b37eba864658f5e35cd817ac010 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 06:05:49 +0000
Subject: [PATCH] go: upgrade 1.22.0 -> 1.22.1

---
 .../go/{go-1.22.0.inc => go-1.22.1.inc}             |  2 +-
 ...e-content-based-hash-generation-less-pedan.patch | 11 ++++-------
 ...lter-out-build-specific-paths-from-linker-.patch | 11 ++++-------
 ...ow-GOTOOLDIR-to-be-overridden-in-the-envir.patch | 12 ++++--------
 .../0003-ld-add-soname-to-shareable-objects.patch   |  9 +++------
 ...override-CC-when-building-dist-and-go_boot.patch | 10 +++-------
 ...5-cmd-dist-separate-host-and-target-builds.patch |  9 +++------
 ...006-cmd-go-make-GOROOT-precious-by-default.patch | 13 +++++--------
 ...st-buildgo.go-do-not-hardcode-host-compile.patch | 11 ++++-------
 ...lter-build-paths-on-staticly-linked-arches.patch |  9 +++------
 .../go/{go_1.22.0.bb => go_1.22.1.bb}               |  0
 11 files changed, 34 insertions(+), 63 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.0.inc => go-1.22.1.inc} (89%)
 rename meta/recipes-devtools/go/{go_1.22.0.bb => go_1.22.1.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.0.inc b/meta/recipes-devtools/go/go-1.22.1.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.0.inc
rename to meta/recipes-devtools/go/go-1.22.1.inc
index 5b94051fc2..4330853450 100644
--- a/meta/recipes-devtools/go/go-1.22.0.inc
+++ b/meta/recipes-devtools/go/go-1.22.1.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0001-exec.go-filter-out-build-specific-paths-from-linker-.patch \
 "
-SRC_URI[main.sha256sum] = "4d196c3d41a0d6c1dfc64d04e3cc1f608b0c436bd87b7060ce3e23234e1f4d5c"
+SRC_URI[main.sha256sum] = "79c9b91d7f109515a25fc3ecdaad125d67e6bdb54f6d4d98580f46799caea321"
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 564837c7cd..16667c3e7a 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -1,7 +1,7 @@
-From 9a6c5040cbcd88b10ceb8ceaebc8d6158c086670 Mon Sep 17 00:00:00 2001
+From 7d722624ed24a3da8bb6f3b032e8ebaa6ec256e6 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/go/go/0001-exec.go-filter-out-build-specific-paths-from-linker-.patch b/meta/recipes-devtools/go/go/0001-exec.go-filter-out-build-specific-paths-from-linker-.patch
index c5bf28f54a..74a2daa6a2 100644
--- a/meta/recipes-devtools/go/go/0001-exec.go-filter-out-build-specific-paths-from-linker-.patch
+++ b/meta/recipes-devtools/go/go/0001-exec.go-filter-out-build-specific-paths-from-linker-.patch
@@ -1,4 +1,4 @@
-From 083b5c74b12a1abeb11dd7f58a1cb1593d0000c0 Mon Sep 17 00:00:00 2001
+From a415e3da717bc2d953dfe66dcea153963164b5ca Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 27 Feb 2024 18:06:51 +0800
 Subject: [PATCH] exec.go: filter out build-specific paths from linker flags
@@ -14,10 +14,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
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
  
@@ -47,7 +47,7 @@ index cde867b..e3ce17d 100644
  // printLinkerConfig prints the linker config into the hash h,
  // as part of the computation of a linker-related action ID.
  func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
-@@ -1368,7 +1391,7 @@ func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
+@@ -1411,7 +1434,7 @@ func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
  	case "gc":
  		fmt.Fprintf(h, "link %s %q %s\n", b.toolID("link"), forcedLdflags, ldBuildmode)
  		if p != nil {
@@ -56,6 +56,3 @@ index cde867b..e3ce17d 100644
  		}
  
  		// GOARM, GOMIPS, etc.
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
index 001c94a4e7..7a70b674da 100644
--- a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
+++ b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
@@ -1,8 +1,7 @@
-From e3f9a8a69d3a340c1a1d0bba566e71f20f635a43 Mon Sep 17 00:00:00 2001
+From f73be32ed008672e67761542536e5c15add28dde Mon Sep 17 00:00:00 2001
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
index 9cab2969c8..f9e1a578a4 100644
--- a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
@@ -1,7 +1,7 @@
-From 7dde77b3ce8138314dd2736604b1b110dbcc0ac1 Mon Sep 17 00:00:00 2001
+From f8f5fbc4c531f970753953ef2783376f4899b243 Mon Sep 17 00:00:00 2001
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
index 8889aef1cf..f43b9087b3 100644
--- a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -1,8 +1,7 @@
-From 9f59e46991074d3e3c4d00f3971e62bfcd707167 Mon Sep 17 00:00:00 2001
+From e74a19e2370254672e1b448bd054005acd28331d Mon Sep 17 00:00:00 2001
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
index 364fce907a..63e1ca55f8 100644
--- a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
@@ -1,7 +1,7 @@
-From 6dda78d528e60993a4688cd9d49440a726378ac8 Mon Sep 17 00:00:00 2001
+From d02cf6d83240008861d3d8dc1255382c3d65b61f Mon Sep 17 00:00:00 2001
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
index 262f1e96b8..aecbb9b3c1 100644
--- a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
@@ -1,7 +1,7 @@
-From aff5a740d6286c04beb0593fc68b0aea5a95ad39 Mon Sep 17 00:00:00 2001
+From f2dfe90ac5fada4a0f4023c89aa217df183afd10 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
index 0662f66af5..9003f99fb4 100644
--- a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
+++ b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
@@ -1,8 +1,8 @@
-From e0999902687e2e394499f7153db8d62440c4dab0 Mon Sep 17 00:00:00 2001
+From 9d420664c09e1a111d3acaaf568f7c5b0d9e85bf Mon Sep 17 00:00:00 2001
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
index cc45496e9c..898d484522 100644
--- a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
+++ b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
@@ -1,7 +1,7 @@
-From 6c2438f187ca912c54a71b4ac65ab98999a019d2 Mon Sep 17 00:00:00 2001
+From c171389f45285043203869b66e64388df6e28aca Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/go/go_1.22.0.bb b/meta/recipes-devtools/go/go_1.22.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.0.bb
rename to meta/recipes-devtools/go/go_1.22.1.bb
-- 
2.42.0


--===============5484201311059088924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.22.0.bb:1: Could not include required file go-1.22.0.inc
ERROR: Parsing halted due to errors, see error messages above

--===============5484201311059088924==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-upgrade-1.22.0-1.22.1.patch"

RnJvbSAxMDI3ZWFkOTExZDI5YjM3ZWJhODY0NjU4ZjVlMzVjZDgxN2FjMDEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDY6MDU6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bzogdXBncmFkZSAxLjIyLjAgLT4gMS4yMi4xCgotLS0KIC4uLi9nby97Z28tMS4yMi4wLmluYyA9
PiBnby0xLjIyLjEuaW5jfSAgICAgICAgICAgICB8ICAyICstCiAuLi5lLWNvbnRlbnQtYmFzZWQt
aGFzaC1nZW5lcmF0aW9uLWxlc3MtcGVkYW4ucGF0Y2ggfCAxMSArKysrLS0tLS0tLQogLi4ubHRl
ci1vdXQtYnVpbGQtc3BlY2lmaWMtcGF0aHMtZnJvbS1saW5rZXItLnBhdGNoIHwgMTEgKysrKy0t
LS0tLS0KIC4uLm93LUdPVE9PTERJUi10by1iZS1vdmVycmlkZGVuLWluLXRoZS1lbnZpci5wYXRj
aCB8IDEyICsrKystLS0tLS0tLQogLi4uLzAwMDMtbGQtYWRkLXNvbmFtZS10by1zaGFyZWFibGUt
b2JqZWN0cy5wYXRjaCAgIHwgIDkgKysrLS0tLS0tCiAuLi5vdmVycmlkZS1DQy13aGVuLWJ1aWxk
aW5nLWRpc3QtYW5kLWdvX2Jvb3QucGF0Y2ggfCAxMCArKystLS0tLS0tCiAuLi41LWNtZC1kaXN0
LXNlcGFyYXRlLWhvc3QtYW5kLXRhcmdldC1idWlsZHMucGF0Y2ggfCAgOSArKystLS0tLS0KIC4u
LjAwNi1jbWQtZ28tbWFrZS1HT1JPT1QtcHJlY2lvdXMtYnktZGVmYXVsdC5wYXRjaCB8IDEzICsr
KysrLS0tLS0tLS0KIC4uLnN0LWJ1aWxkZ28uZ28tZG8tbm90LWhhcmRjb2RlLWhvc3QtY29tcGls
ZS5wYXRjaCB8IDExICsrKystLS0tLS0tCiAuLi5sdGVyLWJ1aWxkLXBhdGhzLW9uLXN0YXRpY2x5
LWxpbmtlZC1hcmNoZXMucGF0Y2ggfCAgOSArKystLS0tLS0KIC4uLi9nby97Z29fMS4yMi4wLmJi
ID0+IGdvXzEuMjIuMS5iYn0gICAgICAgICAgICAgICB8ICAwCiAxMSBmaWxlcyBjaGFuZ2VkLCAz
NCBpbnNlcnRpb25zKCspLCA2MyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ28ve2dvLTEuMjIuMC5pbmMgPT4gZ28tMS4yMi4xLmluY30gKDg5JSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28ve2dvXzEuMjIuMC5iYiA9PiBnb18xLjIyLjEuYmJ9ICgx
MDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIyLjAuaW5j
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMjIuMS5pbmMKc2ltaWxhcml0eSBpbmRl
eCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMjIuMC5pbmMK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIyLjEuaW5jCmluZGV4IDVi
OTQwNTFmYzIuLjQzMzA4NTM0NTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
by9nby0xLjIyLjAuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIyLjEu
aW5jCkBAIC0xNSw0ICsxNSw0IEBAIFNSQ19VUkkgKz0gIlwKICAgICBmaWxlOi8vMDAwOS1nby1G
aWx0ZXItYnVpbGQtcGF0aHMtb24tc3RhdGljbHktbGlua2VkLWFyY2hlcy5wYXRjaCBcCiAgICAg
ZmlsZTovLzAwMDEtZXhlYy5nby1maWx0ZXItb3V0LWJ1aWxkLXNwZWNpZmljLXBhdGhzLWZyb20t
bGlua2VyLS5wYXRjaCBcCiAiCi1TUkNfVVJJW21haW4uc2hhMjU2c3VtXSA9ICI0ZDE5NmMzZDQx
YTBkNmMxZGZjNjRkMDRlM2NjMWY2MDhiMGM0MzZiZDg3YjcwNjBjZTNlMjMyMzRlMWY0ZDVjIgor
U1JDX1VSSVttYWluLnNoYTI1NnN1bV0gPSAiNzljOWI5MWQ3ZjEwOTUxNWEyNWZjM2VjZGFhZDEy
NWQ2N2U2YmRiNTRmNmQ0ZDk4NTgwZjQ2Nzk5Y2FlYTMyMSIKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9nby9nby8wMDAxLWNtZC1nby1tYWtlLWNvbnRlbnQtYmFzZWQtaGFzaC1n
ZW5lcmF0aW9uLWxlc3MtcGVkYW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28v
MDAwMS1jbWQtZ28tbWFrZS1jb250ZW50LWJhc2VkLWhhc2gtZ2VuZXJhdGlvbi1sZXNzLXBlZGFu
LnBhdGNoCmluZGV4IDU2NDgzN2M3Y2QuLjE2NjY3YzNlN2EgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9nby9nby8wMDAxLWNtZC1nby1tYWtlLWNvbnRlbnQtYmFzZWQtaGFzaC1n
ZW5lcmF0aW9uLWxlc3MtcGVkYW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dv
L2dvLzAwMDEtY21kLWdvLW1ha2UtY29udGVudC1iYXNlZC1oYXNoLWdlbmVyYXRpb24tbGVzcy1w
ZWRhbi5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gOWE2YzUwNDBjYmNkODhiMTBjZWI4Y2Vh
ZWJjOGQ2MTU4YzA4NjY3MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2Q3MjI2MjRl
ZDI0YTNkYThiYjZmM2IwMzJlOGViYWE2ZWMyNTZlNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDI4IE1hciAy
MDIyIDEwOjU5OjAzIC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0ggMS85XSBjbWQvZ286IG1ha2UgY29u
dGVudC1iYXNlZCBoYXNoIGdlbmVyYXRpb24gbGVzcyBwZWRhbnRpYworU3ViamVjdDogW1BBVENI
XSBjbWQvZ286IG1ha2UgY29udGVudC1iYXNlZCBoYXNoIGdlbmVyYXRpb24gbGVzcyBwZWRhbnRp
YwogCiBHbyAxLjEwJ3MgYnVpbGQgdG9vbCBub3cgdXNlcyBjb250ZW50LWJhc2VkIGhhc2hlcyB0
bwogZGV0ZXJtaW5lIHdoZW4gc29tZXRoaW5nIHNob3VsZCBiZSBidWlsdCBvciByZS1idWlsdC4K
QEAgLTMyLDcgKzMyLDcgQEAgU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8am9zZS5xdWFy
ZXNtYUBmb3VuZHJpZXMuaW8+CiAgMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAx
MCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9jbWQvZ28vaW50ZXJuYWwvZW52Y21k
L2Vudi5nbyBiL3NyYy9jbWQvZ28vaW50ZXJuYWwvZW52Y21kL2Vudi5nbwotaW5kZXggYzdjMmU4
M2UwZi4uNGE5MGQ5ZGE1YyAxMDA2NDQKK2luZGV4IGM3YzJlODMuLjRhOTBkOWQgMTAwNjQ0CiAt
LS0gYS9zcmMvY21kL2dvL2ludGVybmFsL2VudmNtZC9lbnYuZ28KICsrKyBiL3NyYy9jbWQvZ28v
aW50ZXJuYWwvZW52Y21kL2Vudi5nbwogQEAgLTE4OSw3ICsxODksNyBAQCBmdW5jIEV4dHJhRW52
VmFyc0Nvc3RseSgpIFtdY2ZnLkVudlZhciB7CkBAIC00NSw3ICs0NSw3IEBAIGluZGV4IGM3YzJl
ODNlMGYuLjRhOTBkOWRhNWMgMTAwNjQ0CiAgCQkvLyBTaG91bGQgbm90IGhhcHBlbiAtIGIuQ0Zs
YWdzIHdhcyBnaXZlbiBhbiBlbXB0eSBwYWNrYWdlLgogIAkJZm10LkZwcmludGYob3MuU3RkZXJy
LCAiZ286IGludmFsaWQgY2ZsYWdzOiAldlxuIiwgZXJyKQogZGlmZiAtLWdpdCBhL3NyYy9jbWQv
Z28vaW50ZXJuYWwvd29yay9leGVjLmdvIGIvc3JjL2NtZC9nby9pbnRlcm5hbC93b3JrL2V4ZWMu
Z28KLWluZGV4IGUwNTQ3MWIwNmMuLjk3MjRjZDA3ZDAgMTAwNjQ0CitpbmRleCBlMDU0NzFiLi45
NzI0Y2QwIDEwMDY0NAogLS0tIGEvc3JjL2NtZC9nby9pbnRlcm5hbC93b3JrL2V4ZWMuZ28KICsr
KyBiL3NyYy9jbWQvZ28vaW50ZXJuYWwvd29yay9leGVjLmdvCiBAQCAtMjMyLDYgKzIzMiw4IEBA
IGZ1bmMgKGIgKkJ1aWxkZXIpIERvKGN0eCBjb250ZXh0LkNvbnRleHQsIHJvb3QgKkFjdGlvbikg
ewpAQCAtMTYzLDYgKzE2MywzIEBAIGluZGV4IGUwNTQ3MWIwNmMuLjk3MjRjZDA3ZDAgMTAwNjQ0
CiAgCWlmIGVyciAhPSBuaWwgewogIAkJcmV0dXJuICIiLCAiIiwgZXJyCiAgCX0KLS0tIAotMi40
NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDAxLWV4ZWMu
Z28tZmlsdGVyLW91dC1idWlsZC1zcGVjaWZpYy1wYXRocy1mcm9tLWxpbmtlci0ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwMS1leGVjLmdvLWZpbHRlci1vdXQtYnVpbGQt
c3BlY2lmaWMtcGF0aHMtZnJvbS1saW5rZXItLnBhdGNoCmluZGV4IGM1YmYyOGY1NGEuLjc0YTJk
YWE2YTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDAxLWV4ZWMu
Z28tZmlsdGVyLW91dC1idWlsZC1zcGVjaWZpYy1wYXRocy1mcm9tLWxpbmtlci0ucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDEtZXhlYy5nby1maWx0ZXItb3V0LWJ1
aWxkLXNwZWNpZmljLXBhdGhzLWZyb20tbGlua2VyLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMDgzYjVjNzRiMTJhMWFiZWIxMWRkN2Y1OGExY2IxNTkzZDAwMDBjMCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gYTQxNWUzZGE3MTdiYzJkOTUzZGZlNjZkY2VhMTUzOTYzMTY0YjVj
YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5n
LmxpQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDI3IEZlYiAyMDI0IDE4OjA2OjUxICswODAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGV4ZWMuZ286IGZpbHRlciBvdXQgYnVpbGQtc3BlY2lmaWMgcGF0
aHMgZnJvbSBsaW5rZXIgZmxhZ3MKQEAgLTE0LDEwICsxNCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBD
aGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2Vk
LCAyNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvY21k
L2dvL2ludGVybmFsL3dvcmsvZXhlYy5nbyBiL3NyYy9jbWQvZ28vaW50ZXJuYWwvd29yay9leGVj
LmdvCi1pbmRleCBjZGU4NjdiLi5lM2NlMTdkIDEwMDY0NAoraW5kZXggNTQ0ZGY0Ni4uYzhmMjk3
YyAxMDA2NDQKIC0tLSBhL3NyYy9jbWQvZ28vaW50ZXJuYWwvd29yay9leGVjLmdvCiArKysgYi9z
cmMvY21kL2dvL2ludGVybmFsL3dvcmsvZXhlYy5nbwotQEAgLTEzNTgsNiArMTM1OCwyOSBAQCBm
dW5jIChiICpCdWlsZGVyKSBsaW5rQWN0aW9uSUQoYSAqQWN0aW9uKSBjYWNoZS5BY3Rpb25JRCB7
CitAQCAtMTQwMSw2ICsxNDAxLDI5IEBAIGZ1bmMgKGIgKkJ1aWxkZXIpIGxpbmtBY3Rpb25JRChh
ICpBY3Rpb24pIGNhY2hlLkFjdGlvbklEIHsKICAJcmV0dXJuIGguU3VtKCkKICB9CiAgCkBAIC00
Nyw3ICs0Nyw3IEBAIGluZGV4IGNkZTg2N2IuLmUzY2UxN2QgMTAwNjQ0CiAgLy8gcHJpbnRMaW5r
ZXJDb25maWcgcHJpbnRzIHRoZSBsaW5rZXIgY29uZmlnIGludG8gdGhlIGhhc2ggaCwKICAvLyBh
cyBwYXJ0IG9mIHRoZSBjb21wdXRhdGlvbiBvZiBhIGxpbmtlci1yZWxhdGVkIGFjdGlvbiBJRC4K
ICBmdW5jIChiICpCdWlsZGVyKSBwcmludExpbmtlckNvbmZpZyhoIGlvLldyaXRlciwgcCAqbG9h
ZC5QYWNrYWdlKSB7Ci1AQCAtMTM2OCw3ICsxMzkxLDcgQEAgZnVuYyAoYiAqQnVpbGRlcikgcHJp
bnRMaW5rZXJDb25maWcoaCBpby5Xcml0ZXIsIHAgKmxvYWQuUGFja2FnZSkgeworQEAgLTE0MTEs
NyArMTQzNCw3IEBAIGZ1bmMgKGIgKkJ1aWxkZXIpIHByaW50TGlua2VyQ29uZmlnKGggaW8uV3Jp
dGVyLCBwICpsb2FkLlBhY2thZ2UpIHsKICAJY2FzZSAiZ2MiOgogIAkJZm10LkZwcmludGYoaCwg
ImxpbmsgJXMgJXEgJXNcbiIsIGIudG9vbElEKCJsaW5rIiksIGZvcmNlZExkZmxhZ3MsIGxkQnVp
bGRtb2RlKQogIAkJaWYgcCAhPSBuaWwgewpAQCAtNTYsNiArNTYsMyBAQCBpbmRleCBjZGU4Njdi
Li5lM2NlMTdkIDEwMDY0NAogIAkJfQogIAogIAkJLy8gR09BUk0sIEdPTUlQUywgZXRjLgotLS0g
Ci0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDIt
Y21kLWdvLUFsbG93LUdPVE9PTERJUi10by1iZS1vdmVycmlkZGVuLWluLXRoZS1lbnZpci5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDAyLWNtZC1nby1BbGxvdy1HT1RPT0xE
SVItdG8tYmUtb3ZlcnJpZGRlbi1pbi10aGUtZW52aXIucGF0Y2gKaW5kZXggMDAxYzk0YTRlNy4u
N2E3MGI2NzRkYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDIt
Y21kLWdvLUFsbG93LUdPVE9PTERJUi10by1iZS1vdmVycmlkZGVuLWluLXRoZS1lbnZpci5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwMi1jbWQtZ28tQWxsb3ctR09U
T09MRElSLXRvLWJlLW92ZXJyaWRkZW4taW4tdGhlLWVudmlyLnBhdGNoCkBAIC0xLDggKzEsNyBA
QAotRnJvbSBlM2Y5YThhNjlkM2EzNDBjMWExZDBiYmE1NjZlNzFmMjBmNjM1YTQzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmNzNiZTMyZWQwMDg2NzJlNjc3NjE1NDI1MzZlNWMxNWFk
ZDI4ZGRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleCBLdWJlIDxhbGV4YW5k
ZXIuai5rdWJlQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMjMgT2N0IDIwMTkgMjE6MTU6MzcgKzA0
MzAKLVN1YmplY3Q6IFtQQVRDSCAyLzldIGNtZC9nbzogQWxsb3cgR09UT09MRElSIHRvIGJlIG92
ZXJyaWRkZW4gaW4gdGhlCi0gZW52aXJvbm1lbnQKK1N1YmplY3Q6IFtQQVRDSF0gY21kL2dvOiBB
bGxvdyBHT1RPT0xESVIgdG8gYmUgb3ZlcnJpZGRlbiBpbiB0aGUgZW52aXJvbm1lbnQKIAogdG8g
YWxsb3cgZm9yIHNwbGl0IGhvc3QvdGFyZ2V0IGJ1aWxkIHJvb3RzCiAKQEAgLTIwLDcgKzE5LDcg
QEAgU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8am9zZS5xdWFyZXNtYUBmb3VuZHJpZXMu
aW8+CiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAK
IGRpZmYgLS1naXQgYS9zcmMvY21kL2Rpc3QvYnVpbGQuZ28gYi9zcmMvY21kL2Rpc3QvYnVpbGQu
Z28KLWluZGV4IDMyZTU5YjQ0NmEuLjA2ZWU0ZGU4YTkgMTAwNjQ0CitpbmRleCAzMmU1OWI0Li4w
NmVlNGRlIDEwMDY0NAogLS0tIGEvc3JjL2NtZC9kaXN0L2J1aWxkLmdvCiArKysgYi9zcmMvY21k
L2Rpc3QvYnVpbGQuZ28KIEBAIC0yNTksNyArMjU5LDkgQEAgZnVuYyB4aW5pdCgpIHsKQEAgLTM1
LDcgKzM0LDcgQEAgaW5kZXggMzJlNTliNDQ2YS4uMDZlZTRkZThhOSAxMDA2NDQKICAJZ292ZXJz
aW9uIDo9IGZpbmRnb3ZlcnNpb24oKQogIAlpc1JlbGVhc2UgPSBzdHJpbmdzLkhhc1ByZWZpeChn
b3ZlcnNpb24sICJyZWxlYXNlLiIpIHx8IHN0cmluZ3MuSGFzUHJlZml4KGdvdmVyc2lvbiwgImdv
IikKIGRpZmYgLS1naXQgYS9zcmMvY21kL2dvL2ludGVybmFsL2NmZy9jZmcuZ28gYi9zcmMvY21k
L2dvL2ludGVybmFsL2NmZy9jZmcuZ28KLWluZGV4IGE4ZGFhMmRmYzMuLjM5M2FkYTM5YzkgMTAw
NjQ0CitpbmRleCBhOGRhYTJkLi4zOTNhZGEzIDEwMDY0NAogLS0tIGEvc3JjL2NtZC9nby9pbnRl
cm5hbC9jZmcvY2ZnLmdvCiArKysgYi9zcmMvY21kL2dvL2ludGVybmFsL2NmZy9jZmcuZ28KIEBA
IC0yMzAsNyArMjMwLDExIEBAIGZ1bmMgU2V0R09ST09UKGdvcm9vdCBzdHJpbmcsIGlzVGVzdEdv
IGJvb2wpIHsKQEAgLTUxLDYgKzUwLDMgQEAgaW5kZXggYThkYWEyZGZjMy4uMzkzYWRhMzljOSAx
MDA2NDQKICAJCX0KICAJfQogIH0KLS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9nby9nby8wMDAzLWxkLWFkZC1zb25hbWUtdG8tc2hhcmVhYmxlLW9iamVj
dHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwMy1sZC1hZGQtc29uYW1l
LXRvLXNoYXJlYWJsZS1vYmplY3RzLnBhdGNoCmluZGV4IDljYWIyOTY5YzguLmY5ZTFhNTc4YTQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDAzLWxkLWFkZC1zb25h
bWUtdG8tc2hhcmVhYmxlLW9iamVjdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2dvL2dvLzAwMDMtbGQtYWRkLXNvbmFtZS10by1zaGFyZWFibGUtb2JqZWN0cy5wYXRjaApAQCAt
MSw3ICsxLDcgQEAKLUZyb20gN2RkZTc3YjNjZTgxMzgzMTRkZDI3MzY2MDRiMWIxMTBkYmNjMGFj
MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjhmNWZiYzRjNTMxZjk3MDc1Mzk1M2Vm
Mjc4MzM3NmY0ODk5YjI0MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXggS3Vi
ZSA8YWxleGFuZGVyLmoua3ViZUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDIzIE9jdCAyMDE5IDIx
OjE2OjMyICswNDMwCi1TdWJqZWN0OiBbUEFUQ0ggMy85XSBsZDogYWRkIHNvbmFtZSB0byBzaGFy
ZWFibGUgb2JqZWN0cworU3ViamVjdDogW1BBVENIXSBsZDogYWRkIHNvbmFtZSB0byBzaGFyZWFi
bGUgb2JqZWN0cwogCiBzbyB0aGF0IE9FJ3Mgc2hhcmVkIGxpYnJhcnkgZGVwZW5kZW5jeSBoYW5k
bGluZwogY2FuIGZpbmQgdGhlbS4KQEAgLTE5LDcgKzE5LDcgQEAgU2lnbmVkLW9mZi1ieTogSm9z
ZSBRdWFyZXNtYSA8am9zZS5xdWFyZXNtYUBmb3VuZHJpZXMuaW8+CiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2NtZC9saW5rL2ludGVybmFsL2xk
L2xpYi5nbyBiL3NyYy9jbWQvbGluay9pbnRlcm5hbC9sZC9saWIuZ28KLWluZGV4IGVhYjc0ZGMz
MjguLmFlOWJiYzkwOTMgMTAwNjQ0CitpbmRleCBlYWI3NGRjLi5hZTliYmM5IDEwMDY0NAogLS0t
IGEvc3JjL2NtZC9saW5rL2ludGVybmFsL2xkL2xpYi5nbwogKysrIGIvc3JjL2NtZC9saW5rL2lu
dGVybmFsL2xkL2xpYi5nbwogQEAgLTE1NzYsNiArMTU3Niw3IEBAIGZ1bmMgKGN0eHQgKkxpbmsp
IGhvc3RsaW5rKCkgewpAQCAtNDYsNiArNDYsMyBAQCBpbmRleCBlYWI3NGRjMzI4Li5hZTliYmM5
MDkzIDEwMDY0NAogIAkJfQogIAl9CiAgCi0tLSAKLTIuNDQuMAotCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwNC1tYWtlLmJhc2gtb3ZlcnJpZGUtQ0Mtd2hlbi1i
dWlsZGluZy1kaXN0LWFuZC1nb19ib290LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dv
L2dvLzAwMDQtbWFrZS5iYXNoLW92ZXJyaWRlLUNDLXdoZW4tYnVpbGRpbmctZGlzdC1hbmQtZ29f
Ym9vdC5wYXRjaAppbmRleCA4ODg5YWVmMWNmLi5mNDNiOTA4N2IzIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwNC1tYWtlLmJhc2gtb3ZlcnJpZGUtQ0Mtd2hlbi1i
dWlsZGluZy1kaXN0LWFuZC1nb19ib290LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9nby9nby8wMDA0LW1ha2UuYmFzaC1vdmVycmlkZS1DQy13aGVuLWJ1aWxkaW5nLWRpc3QtYW5k
LWdvX2Jvb3QucGF0Y2gKQEAgLTEsOCArMSw3IEBACi1Gcm9tIDlmNTllNDY5OTEwNzRkM2UzYzRk
MDBmMzk3MWU2MmJmY2Q3MDcxNjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU3NGEx
OWUyMzcwMjU0NjcyZTFiNDQ4YmQwNTQwMDVhY2QyODMzMWQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBBbGV4IEt1YmUgPGFsZXhhbmRlci5qLmt1YmVAZ21haWwuY29tPgogRGF0ZTog
V2VkLCAyMyBPY3QgMjAxOSAyMToxNzoxNiArMDQzMAotU3ViamVjdDogW1BBVENIIDQvOV0gbWFr
ZS5iYXNoOiBvdmVycmlkZSBDQyB3aGVuIGJ1aWxkaW5nIGRpc3QgYW5kCi0gZ29fYm9vdHN0cmFw
CitTdWJqZWN0OiBbUEFUQ0hdIG1ha2UuYmFzaDogb3ZlcnJpZGUgQ0Mgd2hlbiBidWlsZGluZyBk
aXN0IGFuZCBnb19ib290c3RyYXAKIAogZm9yIGhhbmRsaW5nIE9FIGNyb3NzLWNhbmFkaWFuIGJ1
aWxkcy4KIApAQCAtMTksNyArMTgsNyBAQCBTaWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJlc21hIDxq
b3NlLnF1YXJlc21hQGZvdW5kcmllcy5pbz4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL21ha2UuYmFzaCBiL3NyYy9t
YWtlLmJhc2gKLWluZGV4IDc2YWQ1MTYyNGEuLjA3NGUxMjlhMjQgMTAwNzU1CitpbmRleCA3NmFk
NTE2Li4wNzRlMTI5IDEwMDc1NQogLS0tIGEvc3JjL21ha2UuYmFzaAogKysrIGIvc3JjL21ha2Uu
YmFzaAogQEAgLTE5OCw3ICsxOTgsNyBAQCBpZiBbWyAiJEdPUk9PVF9CT09UU1RSQVAiID09ICIk
R09ST09UIiBdXTsgdGhlbgpAQCAtNDAsNiArMzksMyBAQCBpbmRleCA3NmFkNTE2MjRhLi4wNzRl
MTI5YTI0IDEwMDc1NQogIHJtIC1mIC4vY21kL2Rpc3QvZGlzdAogIAogICMgRE8gTk9UIEFERCBB
TlkgTkVXIENPREUgSEVSRS4KLS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9nby9nby8wMDA1LWNtZC1kaXN0LXNlcGFyYXRlLWhvc3QtYW5kLXRhcmdldC1i
dWlsZHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwNS1jbWQtZGlzdC1z
ZXBhcmF0ZS1ob3N0LWFuZC10YXJnZXQtYnVpbGRzLnBhdGNoCmluZGV4IDM2NGZjZTkwN2EuLjYz
ZTFjYTU1ZjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDA1LWNt
ZC1kaXN0LXNlcGFyYXRlLWhvc3QtYW5kLXRhcmdldC1idWlsZHMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDUtY21kLWRpc3Qtc2VwYXJhdGUtaG9zdC1hbmQtdGFy
Z2V0LWJ1aWxkcy5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gNmRkYTc4ZDUyOGU2MDk5M2E0
Njg4Y2Q5ZDQ5NDQwYTcyNjM3OGFjOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDAy
Y2Y2ZDgzMjQwMDA4ODYxZDNkOGRjMTI1NTM4MmMzZDY1YjYxZiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEFsZXggS3ViZSA8YWxleGFuZGVyLmoua3ViZUBnbWFpbC5jb20+CiBEYXRl
OiBXZWQsIDIzIE9jdCAyMDE5IDIxOjE4OjEyICswNDMwCi1TdWJqZWN0OiBbUEFUQ0ggNS85XSBj
bWQvZGlzdDogc2VwYXJhdGUgaG9zdCBhbmQgdGFyZ2V0IGJ1aWxkcworU3ViamVjdDogW1BBVENI
XSBjbWQvZGlzdDogc2VwYXJhdGUgaG9zdCBhbmQgdGFyZ2V0IGJ1aWxkcwogCiBDaGFuZ2UgdGhl
IGRpc3QgdG9vbCB0byBhbGxvdyBmb3IgT0Utc3R5bGUgY3Jvc3MtCiBhbmQgY3Jvc3MtY2FuYWRp
YW4gYnVpbGRzOgpAQCAtNDUsNyArNDUsNyBAQCBTaWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJlc21h
IDxqb3NlLnF1YXJlc21hQGZvdW5kcmllcy5pbz4KICAxIGZpbGUgY2hhbmdlZCwgNzUgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2NtZC9kaXN0L2J1aWxk
LmdvIGIvc3JjL2NtZC9kaXN0L2J1aWxkLmdvCi1pbmRleCAwNmVlNGRlOGE5Li43NGI3YzcwOThm
IDEwMDY0NAoraW5kZXggMDZlZTRkZS4uMDE2YjFkZCAxMDA2NDQKIC0tLSBhL3NyYy9jbWQvZGlz
dC9idWlsZC5nbwogKysrIGIvc3JjL2NtZC9kaXN0L2J1aWxkLmdvCiBAQCAtNDYsNiArNDYsNyBA
QCB2YXIgKApAQCAtMjE2LDYgKzIxNiwzIEBAIGluZGV4IDA2ZWU0ZGU4YTkuLjc0YjdjNzA5OGYg
MTAwNjQ0CiAgCiAgCWlmIGdvb3MgPT0gImFuZHJvaWQiIHsKICAJCS8vIE1ha2Ugc3VyZSB0aGUg
ZXhlYyB3cmFwcGVyIHdpbGwgc3luYyBhIGZyZXNoICRHT1JPT1QgdG8gdGhlIGRldmljZS4KLS0t
IAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDA2
LWNtZC1nby1tYWtlLUdPUk9PVC1wcmVjaW91cy1ieS1kZWZhdWx0LnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dvL2dvLzAwMDYtY21kLWdvLW1ha2UtR09ST09ULXByZWNpb3VzLWJ5LWRl
ZmF1bHQucGF0Y2gKaW5kZXggMjYyZjFlOTZiOC4uYWVjYmI5YjNjMSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDYtY21kLWdvLW1ha2UtR09ST09ULXByZWNpb3Vz
LWJ5LWRlZmF1bHQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDYt
Y21kLWdvLW1ha2UtR09ST09ULXByZWNpb3VzLWJ5LWRlZmF1bHQucGF0Y2gKQEAgLTEsNyArMSw3
IEBACi1Gcm9tIGFmZjVhNzQwZDYyODZjMDRiZWIwNTkzZmM2OGIwYWVhNWE5NWFkMzkgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGYyZGZlOTBhYzVmYWRhNGEwZjQwMjNjODlhYTIxN2Rm
MTgzYWZkMTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4IEt1YmUgPGFsZXhh
bmRlci5qLmt1YmVAZ21haWwuY29tPgogRGF0ZTogV2VkLCAyMyBPY3QgMjAxOSAyMToxODo1NiAr
MDQzMAotU3ViamVjdDogW1BBVENIIDYvOV0gY21kL2dvOiBtYWtlIEdPUk9PVCBwcmVjaW91cyBi
eSBkZWZhdWx0CitTdWJqZWN0OiBbUEFUQ0hdIGNtZC9nbzogbWFrZSBHT1JPT1QgcHJlY2lvdXMg
YnkgZGVmYXVsdAogCiBUaGUgZ28gYnVpbGQgdG9vbCBub3JtYWxseSByZWJ1aWxkcyB3aGF0ZXZl
ciBpdCBkZXRlY3RzIGlzCiBzdGFsZS4gIFRoaXMgY2FuIGJlIGEgcHJvYmxlbSB3aGVuIEdPUk9P
VCBpcyBpbnRlbmRlZCB0bwpAQCAtMjksNyArMjksNyBAQCBTaWduZWQtb2ZmLWJ5OiBKb3NlIFF1
YXJlc21hIDxqb3NlLnF1YXJlc21hQGZvdW5kcmllcy5pbz4KICAzIGZpbGVzIGNoYW5nZWQsIDM0
IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL3NyYy9jbWQvZ28vaW50ZXJuYWwvd29yay9h
Y3Rpb24uZ28gYi9zcmMvY21kL2dvL2ludGVybmFsL3dvcmsvYWN0aW9uLmdvCi1pbmRleCBhNTkw
NzJlNTkxLi45ZTM1ZWJkZTBjIDEwMDY0NAoraW5kZXggYTU5MDcyZS4uOWUzNWViZCAxMDA2NDQK
IC0tLSBhL3NyYy9jbWQvZ28vaW50ZXJuYWwvd29yay9hY3Rpb24uZ28KICsrKyBiL3NyYy9jbWQv
Z28vaW50ZXJuYWwvd29yay9hY3Rpb24uZ28KIEBAIC03NTQsNiArNzU0LDkgQEAgZnVuYyAoYiAq
QnVpbGRlcikgYWRkVHJhbnNpdGl2ZUxpbmtEZXBzKGEsIGExICpBY3Rpb24sIHNobGliIHN0cmlu
ZykgewpAQCAtNDMsNyArNDMsNyBAQCBpbmRleCBhNTkwNzJlNTkxLi45ZTM1ZWJkZTBjIDEwMDY0
NAogIAkJCS8vIFRPRE8ocnNjKTogVGhlIHVzZSBvZiBNb2RlSW5zdGFsbCBoZXJlIGlzIHN1c3Bl
Y3QsIGJ1dCBpZiB3ZSBvbmx5IGRvIE1vZGVCdWlsZCwKICAJCQkvLyB3ZSdsbCBlbmQgdXAgYnVp
bGRpbmcgYW4gb3ZlcmFsbCBsaWJyYXJ5IG9yIGV4ZWN1dGFibGUgdGhhdCBkZXBlbmRzIGF0IHJ1
bnRpbWUKIGRpZmYgLS1naXQgYS9zcmMvY21kL2dvL2ludGVybmFsL3dvcmsvYnVpbGQuZ28gYi9z
cmMvY21kL2dvL2ludGVybmFsL3dvcmsvYnVpbGQuZ28KLWluZGV4IDQwOGVkYjUxMTkuLjNkNjAy
NTIxMjcgMTAwNjQ0CitpbmRleCA0MDhlZGI1Li4zZDYwMjUyIDEwMDY0NAogLS0tIGEvc3JjL2Nt
ZC9nby9pbnRlcm5hbC93b3JrL2J1aWxkLmdvCiArKysgYi9zcmMvY21kL2dvL2ludGVybmFsL3dv
cmsvYnVpbGQuZ28KIEBAIC0yMzMsNiArMjMzLDggQEAgU2VlIGFsc286IGdvIGluc3RhbGwsIGdv
IGdldCwgZ28gY2xlYW4uCkBAIC02Nyw3ICs2Nyw3IEBAIGluZGV4IDQwOGVkYjUxMTkuLjNkNjAy
NTIxMjcgMTAwNjQ0CiAgCiAgLy8gTm90ZSB0aGF0IGZsYWdzIGNvbnN1bHRlZCBieSBvdGhlciBw
YXJ0cyBvZiB0aGUgY29kZQogZGlmZiAtLWdpdCBhL3NyYy9jbWQvZ28vaW50ZXJuYWwvd29yay9l
eGVjLmdvIGIvc3JjL2NtZC9nby9pbnRlcm5hbC93b3JrL2V4ZWMuZ28KLWluZGV4IDk3MjRjZDA3
ZDAuLjU0NGRmNDYxYTIgMTAwNjQ0CitpbmRleCA5NzI0Y2QwLi41NDRkZjQ2IDEwMDY0NAogLS0t
IGEvc3JjL2NtZC9nby9pbnRlcm5hbC93b3JrL2V4ZWMuZ28KICsrKyBiL3NyYy9jbWQvZ28vaW50
ZXJuYWwvd29yay9leGVjLmdvCiBAQCAtNTQ0LDYgKzU0NCwyMyBAQCBmdW5jIChiICpCdWlsZGVy
KSBidWlsZChjdHggY29udGV4dC5Db250ZXh0LCBhICpBY3Rpb24pIChlcnIgZXJyb3IpIHsKQEAg
LTEwOSw2ICsxMDksMyBAQCBpbmRleCA5NzI0Y2QwN2QwLi41NDRkZjQ2MWEyIDEwMDY0NAogIAlp
ZiBlcnIgOj0gYi5TaGVsbChhKS5Na2RpcihhLk9iamRpcik7IGVyciAhPSBuaWwgewogIAkJcmV0
dXJuIGVycgogIAl9Ci0tLSAKLTIuNDQuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ28vZ28vMDAwOC1zcmMtY21kLWRpc3QtYnVpbGRnby5nby1kby1ub3QtaGFyZGNvZGUt
aG9zdC1jb21waWxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDgtc3Jj
LWNtZC1kaXN0LWJ1aWxkZ28uZ28tZG8tbm90LWhhcmRjb2RlLWhvc3QtY29tcGlsZS5wYXRjaApp
bmRleCAwNjYyZjY2YWY1Li45MDAzZjk5ZmI0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ28vZ28vMDAwOC1zcmMtY21kLWRpc3QtYnVpbGRnby5nby1kby1ub3QtaGFyZGNvZGUt
aG9zdC1jb21waWxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDA4
LXNyYy1jbWQtZGlzdC1idWlsZGdvLmdvLWRvLW5vdC1oYXJkY29kZS1ob3N0LWNvbXBpbGUucGF0
Y2gKQEAgLTEsOCArMSw4IEBACi1Gcm9tIGUwOTk5OTAyNjg3ZTJlMzk0NDk5ZjcxNTNkYjhkNjI0
NDBjNGRhYjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDlkNDIwNjY0YzA5ZTFhMTEx
ZDNhY2FhZjU2OGY3YzViMGQ5ZTg1YmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMTAg
Tm92IDIwMjAgMTY6MzM6MjcgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSCA4LzldIHNyYy9jbWQvZGlz
dC9idWlsZGdvLmdvOiBkbyBub3QgaGFyZGNvZGUgaG9zdCBjb21waWxlcnMKLSBpbnRvIHRhcmdl
dCBiaW5hcmllcworU3ViamVjdDogW1BBVENIXSBzcmMvY21kL2Rpc3QvYnVpbGRnby5nbzogZG8g
bm90IGhhcmRjb2RlIGhvc3QgY29tcGlsZXJzIGludG8KKyB0YXJnZXQgYmluYXJpZXMKIAogVGhl
c2UgY29tZSBmcm9tICRDQy8kQ1hYIG9uIHRoZSBidWlsZCBob3N0IGFuZCBhcmUgbm90IHVzZWZ1
bCBvbiB0YXJnZXRzOwogYWRkaXRpb25hbGx5IGFzIHRoZXkgY29udGFpbiBob3N0IHNwZWNpZmlj
IHBhdGhzLCB0aGlzIGhlbHBzIHJlcHJvZHVjaWJpbGl0eS4KQEAgLTE2LDcgKzE2LDcgQEAgU2ln
bmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8am9zZS5xdWFyZXNtYUBmb3VuZHJpZXMuaW8+CiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL3NyYy9jbWQvZGlzdC9idWlsZGdvLmdvIGIvc3JjL2NtZC9kaXN0L2J1aWxkZ28uZ28K
LWluZGV4IDg4NGU5ZDcyOWEuLjJmNTJlZGFjZmUgMTAwNjQ0CitpbmRleCA4ODRlOWQ3Li4yZjUy
ZWRhIDEwMDY0NAogLS0tIGEvc3JjL2NtZC9kaXN0L2J1aWxkZ28uZ28KICsrKyBiL3NyYy9jbWQv
ZGlzdC9idWlsZGdvLmdvCiBAQCAtNTEsOCArNTEsOCBAQCBmdW5jIG1remRlZmF1bHRjYyhkaXIs
IGZpbGUgc3RyaW5nKSB7CkBAIC00MSw2ICs0MSwzIEBAIGluZGV4IDg4NGU5ZDcyOWEuLjJmNTJl
ZGFjZmUgMTAwNjQ0CiAgCXdyaXRlZmlsZShidWYuU3RyaW5nKCksIGZpbGUsIHdyaXRlU2tpcFNh
bWUpCiAgfQogIAotLS0gCi0yLjQ0LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2dvL2dvLzAwMDktZ28tRmlsdGVyLWJ1aWxkLXBhdGhzLW9uLXN0YXRpY2x5LWxpbmtlZC1h
cmNoZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwOS1nby1GaWx0ZXIt
YnVpbGQtcGF0aHMtb24tc3RhdGljbHktbGlua2VkLWFyY2hlcy5wYXRjaAppbmRleCBjYzQ1NDk2
ZTljLi44OThkNDg0NTIyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28v
MDAwOS1nby1GaWx0ZXItYnVpbGQtcGF0aHMtb24tc3RhdGljbHktbGlua2VkLWFyY2hlcy5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwOS1nby1GaWx0ZXItYnVpbGQt
cGF0aHMtb24tc3RhdGljbHktbGlua2VkLWFyY2hlcy5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZy
b20gNmMyNDM4ZjE4N2NhOTEyYzU0YTcxYjRhYzY1YWI5ODk5OWEwMTlkMiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gYzE3MTM4OWY0NTI4NTA0MzIwMzg2OWI2NmU2NDM4OGRmNmUyOGFj
YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogU2F0LCAyIEp1bCAyMDIyIDIzOjA4
OjEzICswMTAwCi1TdWJqZWN0OiBbUEFUQ0ggOS85XSBnbzogRmlsdGVyIGJ1aWxkIHBhdGhzIG9u
IHN0YXRpY2x5IGxpbmtlZCBhcmNoZXMKK1N1YmplY3Q6IFtQQVRDSF0gZ286IEZpbHRlciBidWls
ZCBwYXRocyBvbiBzdGF0aWNseSBsaW5rZWQgYXJjaGVzCiAKIEZpbHRlciBvdXQgYnVpbGQgdGlt
ZSBwYXRocyBmcm9tIGxkZmxhZ3MgYW5kIG90aGVyIGZsYWdzIHZhcmlhYmxlcyB3aGVuIHRoZXkn
cmUKIGVtYmVkZGVkIGluIHRoZSBnbyBiaW5hcnkgc28gdGhhdCBidWlsZHMgYXJlIHJlcHJvZHVj
aWJsZSByZWdhcmRsZXNzIG9mIGJ1aWxkCkBAIC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6
IEpvc2UgUXVhcmVzbWEgPGpvc2UucXVhcmVzbWFAZm91bmRyaWVzLmlvPgogIDEgZmlsZSBjaGFu
Z2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc3Jj
L2NtZC9nby9pbnRlcm5hbC9sb2FkL3BrZy5nbyBiL3NyYy9jbWQvZ28vaW50ZXJuYWwvbG9hZC9w
a2cuZ28KLWluZGV4IDE1NDk4MDBhZmIuLmY0MWZiMmM0ZWYgMTAwNjQ0CitpbmRleCAxNTQ5ODAw
Li5mNDFmYjJjIDEwMDY0NAogLS0tIGEvc3JjL2NtZC9nby9pbnRlcm5hbC9sb2FkL3BrZy5nbwog
KysrIGIvc3JjL2NtZC9nby9pbnRlcm5hbC9sb2FkL3BrZy5nbwogQEAgLTIyNzcsNiArMjI3Nywx
NyBAQCBmdW5jIGFwcGVuZEJ1aWxkU2V0dGluZyhpbmZvICpkZWJ1Zy5CdWlsZEluZm8sIGtleSwg
dmFsdWUgc3RyaW5nKSB7CkBAIC01Niw2ICs1NiwzIEBAIGluZGV4IDE1NDk4MDBhZmIuLmY0MWZi
MmM0ZWYgMTAwNjQ0CiAgCQl9CiAgCX0KICAJYXBwZW5kU2V0dGluZygiR09BUkNIIiwgY2ZnLkJ1
aWxkQ29udGV4dC5HT0FSQ0gpCi0tLSAKLTIuNDQuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ28vZ29fMS4yMi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dv
XzEuMjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2dvL2dvXzEuMjIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2dvL2dvXzEuMjIuMS5iYgotLSAKMi40Mi4wCgo=

--===============5484201311059088924==--

