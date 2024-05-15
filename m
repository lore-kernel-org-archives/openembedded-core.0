Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B625C25B7C
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:26 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1275.1715794337852088800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=AWh40cu3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=KkvhhAFV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018f7d4fdd81-ef9825dd-defe-473f-b687-479d118b7996-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pWwFvc4h3HP7ffMWNfbfYYYHpGWa/fCOhH4WzuOnKMw=;
	b=AWh40cu3ZC9a0o36Iaa1tj4ZtzOFaagEMZRTcudGeYny8nt2mIc5qZjDr6prNOsw
	YOrspW1GtbhGl59PHFawFZo8Abx7QQJr02lj27s2JBzgJRK5kvZ+NfcJf+64cpXol/0
	Wdw2t5diwXJyp95j4qNwGcLkaamT1uuQoJvTFVtE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pWwFvc4h3HP7ffMWNfbfYYYHpGWa/fCOhH4WzuOnKMw=;
	b=KkvhhAFVVeGFzLIuGSkuZrcUiHXRDax+d/zsYjFLBQdEB5FbKCzCHt7zLNGR8Kuf
	zSY786SuAbzhO4VuJ2l4sTKQdjlWr6cSp7DjzLIngEy+lLZnkXFoMaV1jWLDShCIzI8
	KbPhwf8sjtfJL9s9kl/j9i4W/DE6PKCy9rtDUBJM=
Content-Type: multipart/mixed; boundary="===============2880299594509471164=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.22.3 FAILED
Message-ID: <0101018f7d4fdd81-ef9825dd-defe-473f-b687-479d118b7996-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199320

--===============2880299594509471164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.22.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-upgrade-1.22.2-1.22.3.patch
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
From 4712d9ad8dcb5dfc11b45c6ba578e6e7161c6177 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 08:55:56 +0000
Subject: [PATCH] go: upgrade 1.22.2 -> 1.22.3

---
 .../go/{go-1.22.2.inc => go-1.22.3.inc}             |  2 +-
 ...e-content-based-hash-generation-less-pedan.patch | 11 ++++-------
 ...ow-GOTOOLDIR-to-be-overridden-in-the-envir.patch | 12 ++++--------
 .../0003-ld-add-soname-to-shareable-objects.patch   |  9 +++------
 ...override-CC-when-building-dist-and-go_boot.patch | 10 +++-------
 ...5-cmd-dist-separate-host-and-target-builds.patch |  9 +++------
 ...006-cmd-go-make-GOROOT-precious-by-default.patch | 13 +++++--------
 ...lter-out-build-specific-paths-from-linker-.patch | 11 ++++-------
 ...st-buildgo.go-do-not-hardcode-host-compile.patch | 11 ++++-------
 ...lter-build-paths-on-staticly-linked-arches.patch |  9 +++------
 .../go/{go_1.22.2.bb => go_1.22.3.bb}               |  0
 11 files changed, 34 insertions(+), 63 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.2.inc => go-1.22.3.inc} (89%)
 rename meta/recipes-devtools/go/{go_1.22.2.bb => go_1.22.3.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.2.inc b/meta/recipes-devtools/go/go-1.22.3.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.2.inc
rename to meta/recipes-devtools/go/go-1.22.3.inc
index b399207311..34703bc1fa 100644
--- a/meta/recipes-devtools/go/go-1.22.2.inc
+++ b/meta/recipes-devtools/go/go-1.22.3.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "374ea82b289ec738e968267cac59c7d5ff180f9492250254784b2044e90df5a9"
+SRC_URI[main.sha256sum] = "80648ef34f903193d72a59c0dff019f5f98ae0c9aa13ade0b0ecbff991a76f68"
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 564837c7cd..b0317c1bee 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -1,7 +1,7 @@
-From 9a6c5040cbcd88b10ceb8ceaebc8d6158c086670 Mon Sep 17 00:00:00 2001
+From 0b4666586b8fcdc27c000fbff4d9d8a83bc2a99d Mon Sep 17 00:00:00 2001
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
index 001c94a4e7..91c5ab739d 100644
--- a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
+++ b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
@@ -1,8 +1,7 @@
-From e3f9a8a69d3a340c1a1d0bba566e71f20f635a43 Mon Sep 17 00:00:00 2001
+From a7d47bb1eeb5a82f35ef4d29df5d1a97b759f59b Mon Sep 17 00:00:00 2001
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
index 9cab2969c8..a003851ed0 100644
--- a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
@@ -1,7 +1,7 @@
-From 7dde77b3ce8138314dd2736604b1b110dbcc0ac1 Mon Sep 17 00:00:00 2001
+From 3dde6f9a26a1001d0bb48ce86d68d47eec870ac0 Mon Sep 17 00:00:00 2001
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
index 8889aef1cf..6986b676e1 100644
--- a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -1,8 +1,7 @@
-From 9f59e46991074d3e3c4d00f3971e62bfcd707167 Mon Sep 17 00:00:00 2001
+From d4c95732267829892ff9dc6ce909dd326aa80a0e Mon Sep 17 00:00:00 2001
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
index 364fce907a..2991a1cb6b 100644
--- a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
@@ -1,7 +1,7 @@
-From 6dda78d528e60993a4688cd9d49440a726378ac8 Mon Sep 17 00:00:00 2001
+From 9a307a81da774d40df5d1b750ee3ba244cf46e01 Mon Sep 17 00:00:00 2001
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
index 262f1e96b8..ab0eee73da 100644
--- a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
@@ -1,7 +1,7 @@
-From aff5a740d6286c04beb0593fc68b0aea5a95ad39 Mon Sep 17 00:00:00 2001
+From 6ef041618699b3c6ef7fe7a68e8897bb501685d4 Mon Sep 17 00:00:00 2001
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
index c5bf28f54a..039f82b6da 100644
--- a/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
+++ b/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
@@ -1,4 +1,4 @@
-From 083b5c74b12a1abeb11dd7f58a1cb1593d0000c0 Mon Sep 17 00:00:00 2001
+From 3aba964026c092878dc47ecc6a89f710a5f5f379 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
index 0662f66af5..e2ee56c38c 100644
--- a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
+++ b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
@@ -1,8 +1,8 @@
-From e0999902687e2e394499f7153db8d62440c4dab0 Mon Sep 17 00:00:00 2001
+From b4e3a7f2923ec84fd8ca7de13e722fa2437650c1 Mon Sep 17 00:00:00 2001
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
index cc45496e9c..1da8e501fe 100644
--- a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
+++ b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
@@ -1,7 +1,7 @@
-From 6c2438f187ca912c54a71b4ac65ab98999a019d2 Mon Sep 17 00:00:00 2001
+From 8d685796d44cbe7306f96ae717a17c019d0dcbe7 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/go/go_1.22.2.bb b/meta/recipes-devtools/go/go_1.22.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.2.bb
rename to meta/recipes-devtools/go/go_1.22.3.bb
-- 
2.44.0


--===============2880299594509471164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
Parsing recipes...
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-cross_1.22.2.bb:2: Could not include required file go-1.22.2.inc
ERROR: Parsing halted due to errors, see error messages above

--===============2880299594509471164==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-upgrade-1.22.2-1.22.3.patch"

RnJvbSA0NzEyZDlhZDhkY2I1ZGZjMTFiNDVjNmJhNTc4ZTZlNzE2MWM2MTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDg6NTU6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bzogdXBncmFkZSAxLjIyLjIgLT4gMS4yMi4zCgotLS0KIC4uLi9nby97Z28tMS4yMi4yLmluYyA9
PiBnby0xLjIyLjMuaW5jfSAgICAgICAgICAgICB8ICAyICstCiAuLi5lLWNvbnRlbnQtYmFzZWQt
aGFzaC1nZW5lcmF0aW9uLWxlc3MtcGVkYW4ucGF0Y2ggfCAxMSArKysrLS0tLS0tLQogLi4ub3ct
R09UT09MRElSLXRvLWJlLW92ZXJyaWRkZW4taW4tdGhlLWVudmlyLnBhdGNoIHwgMTIgKysrKy0t
LS0tLS0tCiAuLi4vMDAwMy1sZC1hZGQtc29uYW1lLXRvLXNoYXJlYWJsZS1vYmplY3RzLnBhdGNo
ICAgfCAgOSArKystLS0tLS0KIC4uLm92ZXJyaWRlLUNDLXdoZW4tYnVpbGRpbmctZGlzdC1hbmQt
Z29fYm9vdC5wYXRjaCB8IDEwICsrKy0tLS0tLS0KIC4uLjUtY21kLWRpc3Qtc2VwYXJhdGUtaG9z
dC1hbmQtdGFyZ2V0LWJ1aWxkcy5wYXRjaCB8ICA5ICsrKy0tLS0tLQogLi4uMDA2LWNtZC1nby1t
YWtlLUdPUk9PVC1wcmVjaW91cy1ieS1kZWZhdWx0LnBhdGNoIHwgMTMgKysrKystLS0tLS0tLQog
Li4ubHRlci1vdXQtYnVpbGQtc3BlY2lmaWMtcGF0aHMtZnJvbS1saW5rZXItLnBhdGNoIHwgMTEg
KysrKy0tLS0tLS0KIC4uLnN0LWJ1aWxkZ28uZ28tZG8tbm90LWhhcmRjb2RlLWhvc3QtY29tcGls
ZS5wYXRjaCB8IDExICsrKystLS0tLS0tCiAuLi5sdGVyLWJ1aWxkLXBhdGhzLW9uLXN0YXRpY2x5
LWxpbmtlZC1hcmNoZXMucGF0Y2ggfCAgOSArKystLS0tLS0KIC4uLi9nby97Z29fMS4yMi4yLmJi
ID0+IGdvXzEuMjIuMy5iYn0gICAgICAgICAgICAgICB8ICAwCiAxMSBmaWxlcyBjaGFuZ2VkLCAz
NCBpbnNlcnRpb25zKCspLCA2MyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ28ve2dvLTEuMjIuMi5pbmMgPT4gZ28tMS4yMi4zLmluY30gKDg5JSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28ve2dvXzEuMjIuMi5iYiA9PiBnb18xLjIyLjMuYmJ9ICgx
MDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIyLjIuaW5j
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMjIuMy5pbmMKc2ltaWxhcml0eSBpbmRl
eCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMjIuMi5pbmMK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIyLjMuaW5jCmluZGV4IGIz
OTkyMDczMTEuLjM0NzAzYmMxZmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
by9nby0xLjIyLjIuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIyLjMu
aW5jCkBAIC0xNSw0ICsxNSw0IEBAIFNSQ19VUkkgKz0gIlwKICAgICBmaWxlOi8vMDAwOC1zcmMt
Y21kLWRpc3QtYnVpbGRnby5nby1kby1ub3QtaGFyZGNvZGUtaG9zdC1jb21waWxlLnBhdGNoIFwK
ICAgICBmaWxlOi8vMDAwOS1nby1GaWx0ZXItYnVpbGQtcGF0aHMtb24tc3RhdGljbHktbGlua2Vk
LWFyY2hlcy5wYXRjaCBcCiAiCi1TUkNfVVJJW21haW4uc2hhMjU2c3VtXSA9ICIzNzRlYTgyYjI4
OWVjNzM4ZTk2ODI2N2NhYzU5YzdkNWZmMTgwZjk0OTIyNTAyNTQ3ODRiMjA0NGU5MGRmNWE5Igor
U1JDX1VSSVttYWluLnNoYTI1NnN1bV0gPSAiODA2NDhlZjM0ZjkwMzE5M2Q3MmE1OWMwZGZmMDE5
ZjVmOThhZTBjOWFhMTNhZGUwYjBlY2JmZjk5MWE3NmY2OCIKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9nby9nby8wMDAxLWNtZC1nby1tYWtlLWNvbnRlbnQtYmFzZWQtaGFzaC1n
ZW5lcmF0aW9uLWxlc3MtcGVkYW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28v
MDAwMS1jbWQtZ28tbWFrZS1jb250ZW50LWJhc2VkLWhhc2gtZ2VuZXJhdGlvbi1sZXNzLXBlZGFu
LnBhdGNoCmluZGV4IDU2NDgzN2M3Y2QuLmIwMzE3YzFiZWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9nby9nby8wMDAxLWNtZC1nby1tYWtlLWNvbnRlbnQtYmFzZWQtaGFzaC1n
ZW5lcmF0aW9uLWxlc3MtcGVkYW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dv
L2dvLzAwMDEtY21kLWdvLW1ha2UtY29udGVudC1iYXNlZC1oYXNoLWdlbmVyYXRpb24tbGVzcy1w
ZWRhbi5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gOWE2YzUwNDBjYmNkODhiMTBjZWI4Y2Vh
ZWJjOGQ2MTU4YzA4NjY3MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMGI0NjY2NTg2
YjhmY2RjMjdjMDAwZmJmZjRkOWQ4YTgzYmMyYTk5ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
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
NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDAyLWNtZC1n
by1BbGxvdy1HT1RPT0xESVItdG8tYmUtb3ZlcnJpZGRlbi1pbi10aGUtZW52aXIucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwMi1jbWQtZ28tQWxsb3ctR09UT09MRElSLXRv
LWJlLW92ZXJyaWRkZW4taW4tdGhlLWVudmlyLnBhdGNoCmluZGV4IDAwMWM5NGE0ZTcuLjkxYzVh
YjczOWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDAyLWNtZC1n
by1BbGxvdy1HT1RPT0xESVItdG8tYmUtb3ZlcnJpZGRlbi1pbi10aGUtZW52aXIucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDItY21kLWdvLUFsbG93LUdPVE9PTERJ
Ui10by1iZS1vdmVycmlkZGVuLWluLXRoZS1lbnZpci5wYXRjaApAQCAtMSw4ICsxLDcgQEAKLUZy
b20gZTNmOWE4YTY5ZDNhMzQwYzFhMWQwYmJhNTY2ZTcxZjIwZjYzNWE0MyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gYTdkNDdiYjFlZWI1YTgyZjM1ZWY0ZDI5ZGY1ZDFhOTdiNzU5ZjU5
YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXggS3ViZSA8YWxleGFuZGVyLmou
a3ViZUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDIzIE9jdCAyMDE5IDIxOjE1OjM3ICswNDMwCi1T
dWJqZWN0OiBbUEFUQ0ggMi85XSBjbWQvZ286IEFsbG93IEdPVE9PTERJUiB0byBiZSBvdmVycmlk
ZGVuIGluIHRoZQotIGVudmlyb25tZW50CitTdWJqZWN0OiBbUEFUQ0hdIGNtZC9nbzogQWxsb3cg
R09UT09MRElSIHRvIGJlIG92ZXJyaWRkZW4gaW4gdGhlIGVudmlyb25tZW50CiAKIHRvIGFsbG93
IGZvciBzcGxpdCBob3N0L3RhcmdldCBidWlsZCByb290cwogCkBAIC0yMCw3ICsxOSw3IEBAIFNp
Z25lZC1vZmYtYnk6IEpvc2UgUXVhcmVzbWEgPGpvc2UucXVhcmVzbWFAZm91bmRyaWVzLmlvPgog
IDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZm
IC0tZ2l0IGEvc3JjL2NtZC9kaXN0L2J1aWxkLmdvIGIvc3JjL2NtZC9kaXN0L2J1aWxkLmdvCi1p
bmRleCAzMmU1OWI0NDZhLi4wNmVlNGRlOGE5IDEwMDY0NAoraW5kZXggMzJlNTliNC4uMDZlZTRk
ZSAxMDA2NDQKIC0tLSBhL3NyYy9jbWQvZGlzdC9idWlsZC5nbwogKysrIGIvc3JjL2NtZC9kaXN0
L2J1aWxkLmdvCiBAQCAtMjU5LDcgKzI1OSw5IEBAIGZ1bmMgeGluaXQoKSB7CkBAIC0zNSw3ICsz
NCw3IEBAIGluZGV4IDMyZTU5YjQ0NmEuLjA2ZWU0ZGU4YTkgMTAwNjQ0CiAgCWdvdmVyc2lvbiA6
PSBmaW5kZ292ZXJzaW9uKCkKICAJaXNSZWxlYXNlID0gc3RyaW5ncy5IYXNQcmVmaXgoZ292ZXJz
aW9uLCAicmVsZWFzZS4iKSB8fCBzdHJpbmdzLkhhc1ByZWZpeChnb3ZlcnNpb24sICJnbyIpCiBk
aWZmIC0tZ2l0IGEvc3JjL2NtZC9nby9pbnRlcm5hbC9jZmcvY2ZnLmdvIGIvc3JjL2NtZC9nby9p
bnRlcm5hbC9jZmcvY2ZnLmdvCi1pbmRleCBhOGRhYTJkZmMzLi4zOTNhZGEzOWM5IDEwMDY0NAor
aW5kZXggYThkYWEyZC4uMzkzYWRhMyAxMDA2NDQKIC0tLSBhL3NyYy9jbWQvZ28vaW50ZXJuYWwv
Y2ZnL2NmZy5nbwogKysrIGIvc3JjL2NtZC9nby9pbnRlcm5hbC9jZmcvY2ZnLmdvCiBAQCAtMjMw
LDcgKzIzMCwxMSBAQCBmdW5jIFNldEdPUk9PVChnb3Jvb3Qgc3RyaW5nLCBpc1Rlc3RHbyBib29s
KSB7CkBAIC01MSw2ICs1MCwzIEBAIGluZGV4IGE4ZGFhMmRmYzMuLjM5M2FkYTM5YzkgMTAwNjQ0
CiAgCQl9CiAgCX0KICB9Ci0tLSAKLTIuNDQuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ28vZ28vMDAwMy1sZC1hZGQtc29uYW1lLXRvLXNoYXJlYWJsZS1vYmplY3RzLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDMtbGQtYWRkLXNvbmFtZS10by1z
aGFyZWFibGUtb2JqZWN0cy5wYXRjaAppbmRleCA5Y2FiMjk2OWM4Li5hMDAzODUxZWQwIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwMy1sZC1hZGQtc29uYW1lLXRv
LXNoYXJlYWJsZS1vYmplY3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9n
by8wMDAzLWxkLWFkZC1zb25hbWUtdG8tc2hhcmVhYmxlLW9iamVjdHMucGF0Y2gKQEAgLTEsNyAr
MSw3IEBACi1Gcm9tIDdkZGU3N2IzY2U4MTM4MzE0ZGQyNzM2NjA0YjFiMTEwZGJjYzBhYzEgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDNkZGU2ZjlhMjZhMTAwMWQwYmI0OGNlODZkNjhk
NDdlZWM4NzBhYzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4IEt1YmUgPGFs
ZXhhbmRlci5qLmt1YmVAZ21haWwuY29tPgogRGF0ZTogV2VkLCAyMyBPY3QgMjAxOSAyMToxNjoz
MiArMDQzMAotU3ViamVjdDogW1BBVENIIDMvOV0gbGQ6IGFkZCBzb25hbWUgdG8gc2hhcmVhYmxl
IG9iamVjdHMKK1N1YmplY3Q6IFtQQVRDSF0gbGQ6IGFkZCBzb25hbWUgdG8gc2hhcmVhYmxlIG9i
amVjdHMKIAogc28gdGhhdCBPRSdzIHNoYXJlZCBsaWJyYXJ5IGRlcGVuZGVuY3kgaGFuZGxpbmcK
IGNhbiBmaW5kIHRoZW0uCkBAIC0xOSw3ICsxOSw3IEBAIFNpZ25lZC1vZmYtYnk6IEpvc2UgUXVh
cmVzbWEgPGpvc2UucXVhcmVzbWFAZm91bmRyaWVzLmlvPgogIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL3NyYy9jbWQvbGluay9pbnRlcm5hbC9sZC9saWIu
Z28gYi9zcmMvY21kL2xpbmsvaW50ZXJuYWwvbGQvbGliLmdvCi1pbmRleCBlYWI3NGRjMzI4Li5h
ZTliYmM5MDkzIDEwMDY0NAoraW5kZXggZWFiNzRkYy4uYWU5YmJjOSAxMDA2NDQKIC0tLSBhL3Ny
Yy9jbWQvbGluay9pbnRlcm5hbC9sZC9saWIuZ28KICsrKyBiL3NyYy9jbWQvbGluay9pbnRlcm5h
bC9sZC9saWIuZ28KIEBAIC0xNTc2LDYgKzE1NzYsNyBAQCBmdW5jIChjdHh0ICpMaW5rKSBob3N0
bGluaygpIHsKQEAgLTQ2LDYgKzQ2LDMgQEAgaW5kZXggZWFiNzRkYzMyOC4uYWU5YmJjOTA5MyAx
MDA2NDQKICAJCX0KICAJfQogIAotLS0gCi0yLjQ0LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dvL2dvLzAwMDQtbWFrZS5iYXNoLW92ZXJyaWRlLUNDLXdoZW4tYnVpbGRp
bmctZGlzdC1hbmQtZ29fYm9vdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8w
MDA0LW1ha2UuYmFzaC1vdmVycmlkZS1DQy13aGVuLWJ1aWxkaW5nLWRpc3QtYW5kLWdvX2Jvb3Qu
cGF0Y2gKaW5kZXggODg4OWFlZjFjZi4uNjk4NmI2NzZlMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dvL2dvLzAwMDQtbWFrZS5iYXNoLW92ZXJyaWRlLUNDLXdoZW4tYnVpbGRp
bmctZGlzdC1hbmQtZ29fYm9vdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28v
Z28vMDAwNC1tYWtlLmJhc2gtb3ZlcnJpZGUtQ0Mtd2hlbi1idWlsZGluZy1kaXN0LWFuZC1nb19i
b290LnBhdGNoCkBAIC0xLDggKzEsNyBAQAotRnJvbSA5ZjU5ZTQ2OTkxMDc0ZDNlM2M0ZDAwZjM5
NzFlNjJiZmNkNzA3MTY3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkNGM5NTczMjI2
NzgyOTg5MmZmOWRjNmNlOTA5ZGQzMjZhYTgwYTBlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogQWxleCBLdWJlIDxhbGV4YW5kZXIuai5rdWJlQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwg
MjMgT2N0IDIwMTkgMjE6MTc6MTYgKzA0MzAKLVN1YmplY3Q6IFtQQVRDSCA0LzldIG1ha2UuYmFz
aDogb3ZlcnJpZGUgQ0Mgd2hlbiBidWlsZGluZyBkaXN0IGFuZAotIGdvX2Jvb3RzdHJhcAorU3Vi
amVjdDogW1BBVENIXSBtYWtlLmJhc2g6IG92ZXJyaWRlIENDIHdoZW4gYnVpbGRpbmcgZGlzdCBh
bmQgZ29fYm9vdHN0cmFwCiAKIGZvciBoYW5kbGluZyBPRSBjcm9zcy1jYW5hZGlhbiBidWlsZHMu
CiAKQEAgLTE5LDcgKzE4LDcgQEAgU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8am9zZS5x
dWFyZXNtYUBmb3VuZHJpZXMuaW8+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9tYWtlLmJhc2ggYi9zcmMvbWFrZS5i
YXNoCi1pbmRleCA3NmFkNTE2MjRhLi4wNzRlMTI5YTI0IDEwMDc1NQoraW5kZXggNzZhZDUxNi4u
MDc0ZTEyOSAxMDA3NTUKIC0tLSBhL3NyYy9tYWtlLmJhc2gKICsrKyBiL3NyYy9tYWtlLmJhc2gK
IEBAIC0xOTgsNyArMTk4LDcgQEAgaWYgW1sgIiRHT1JPT1RfQk9PVFNUUkFQIiA9PSAiJEdPUk9P
VCIgXV07IHRoZW4KQEAgLTQwLDYgKzM5LDMgQEAgaW5kZXggNzZhZDUxNjI0YS4uMDc0ZTEyOWEy
NCAxMDA3NTUKICBybSAtZiAuL2NtZC9kaXN0L2Rpc3QKICAKICAjIERPIE5PVCBBREQgQU5ZIE5F
VyBDT0RFIEhFUkUuCi0tLSAKLTIuNDQuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ28vZ28vMDAwNS1jbWQtZGlzdC1zZXBhcmF0ZS1ob3N0LWFuZC10YXJnZXQtYnVpbGRz
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDUtY21kLWRpc3Qtc2VwYXJh
dGUtaG9zdC1hbmQtdGFyZ2V0LWJ1aWxkcy5wYXRjaAppbmRleCAzNjRmY2U5MDdhLi4yOTkxYTFj
YjZiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwNS1jbWQtZGlz
dC1zZXBhcmF0ZS1ob3N0LWFuZC10YXJnZXQtYnVpbGRzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9nby9nby8wMDA1LWNtZC1kaXN0LXNlcGFyYXRlLWhvc3QtYW5kLXRhcmdldC1i
dWlsZHMucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDZkZGE3OGQ1MjhlNjA5OTNhNDY4OGNk
OWQ0OTQ0MGE3MjYzNzhhYzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDlhMzA3YTgx
ZGE3NzRkNDBkZjVkMWI3NTBlZTNiYTI0NGNmNDZlMDEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBBbGV4IEt1YmUgPGFsZXhhbmRlci5qLmt1YmVAZ21haWwuY29tPgogRGF0ZTogV2Vk
LCAyMyBPY3QgMjAxOSAyMToxODoxMiArMDQzMAotU3ViamVjdDogW1BBVENIIDUvOV0gY21kL2Rp
c3Q6IHNlcGFyYXRlIGhvc3QgYW5kIHRhcmdldCBidWlsZHMKK1N1YmplY3Q6IFtQQVRDSF0gY21k
L2Rpc3Q6IHNlcGFyYXRlIGhvc3QgYW5kIHRhcmdldCBidWlsZHMKIAogQ2hhbmdlIHRoZSBkaXN0
IHRvb2wgdG8gYWxsb3cgZm9yIE9FLXN0eWxlIGNyb3NzLQogYW5kIGNyb3NzLWNhbmFkaWFuIGJ1
aWxkczoKQEAgLTQ1LDcgKzQ1LDcgQEAgU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8am9z
ZS5xdWFyZXNtYUBmb3VuZHJpZXMuaW8+CiAgMSBmaWxlIGNoYW5nZWQsIDc1IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9jbWQvZGlzdC9idWlsZC5nbyBi
L3NyYy9jbWQvZGlzdC9idWlsZC5nbwotaW5kZXggMDZlZTRkZThhOS4uNzRiN2M3MDk4ZiAxMDA2
NDQKK2luZGV4IDA2ZWU0ZGUuLjAxNmIxZGQgMTAwNjQ0CiAtLS0gYS9zcmMvY21kL2Rpc3QvYnVp
bGQuZ28KICsrKyBiL3NyYy9jbWQvZGlzdC9idWlsZC5nbwogQEAgLTQ2LDYgKzQ2LDcgQEAgdmFy
ICgKQEAgLTIxNiw2ICsyMTYsMyBAQCBpbmRleCAwNmVlNGRlOGE5Li43NGI3YzcwOThmIDEwMDY0
NAogIAogIAlpZiBnb29zID09ICJhbmRyb2lkIiB7CiAgCQkvLyBNYWtlIHN1cmUgdGhlIGV4ZWMg
d3JhcHBlciB3aWxsIHN5bmMgYSBmcmVzaCAkR09ST09UIHRvIHRoZSBkZXZpY2UuCi0tLSAKLTIu
NDQuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwNi1jbWQt
Z28tbWFrZS1HT1JPT1QtcHJlY2lvdXMtYnktZGVmYXVsdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nby9nby8wMDA2LWNtZC1nby1tYWtlLUdPUk9PVC1wcmVjaW91cy1ieS1kZWZhdWx0
LnBhdGNoCmluZGV4IDI2MmYxZTk2YjguLmFiMGVlZTczZGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9nby9nby8wMDA2LWNtZC1nby1tYWtlLUdPUk9PVC1wcmVjaW91cy1ieS1k
ZWZhdWx0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDA2LWNtZC1n
by1tYWtlLUdPUk9PVC1wcmVjaW91cy1ieS1kZWZhdWx0LnBhdGNoCkBAIC0xLDcgKzEsNyBAQAot
RnJvbSBhZmY1YTc0MGQ2Mjg2YzA0YmViMDU5M2ZjNjhiMGFlYTVhOTVhZDM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA2ZWYwNDE2MTg2OTliM2M2ZWY3ZmU3YTY4ZTg4OTdiYjUwMTY4
NWQ0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleCBLdWJlIDxhbGV4YW5kZXIu
ai5rdWJlQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMjMgT2N0IDIwMTkgMjE6MTg6NTYgKzA0MzAK
LVN1YmplY3Q6IFtQQVRDSCA2LzldIGNtZC9nbzogbWFrZSBHT1JPT1QgcHJlY2lvdXMgYnkgZGVm
YXVsdAorU3ViamVjdDogW1BBVENIXSBjbWQvZ286IG1ha2UgR09ST09UIHByZWNpb3VzIGJ5IGRl
ZmF1bHQKIAogVGhlIGdvIGJ1aWxkIHRvb2wgbm9ybWFsbHkgcmVidWlsZHMgd2hhdGV2ZXIgaXQg
ZGV0ZWN0cyBpcwogc3RhbGUuICBUaGlzIGNhbiBiZSBhIHByb2JsZW0gd2hlbiBHT1JPT1QgaXMg
aW50ZW5kZWQgdG8KQEAgLTI5LDcgKzI5LDcgQEAgU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNt
YSA8am9zZS5xdWFyZXNtYUBmb3VuZHJpZXMuaW8+CiAgMyBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNl
cnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9zcmMvY21kL2dvL2ludGVybmFsL3dvcmsvYWN0aW9u
LmdvIGIvc3JjL2NtZC9nby9pbnRlcm5hbC93b3JrL2FjdGlvbi5nbwotaW5kZXggYTU5MDcyZTU5
MS4uOWUzNWViZGUwYyAxMDA2NDQKK2luZGV4IGE1OTA3MmUuLjllMzVlYmQgMTAwNjQ0CiAtLS0g
YS9zcmMvY21kL2dvL2ludGVybmFsL3dvcmsvYWN0aW9uLmdvCiArKysgYi9zcmMvY21kL2dvL2lu
dGVybmFsL3dvcmsvYWN0aW9uLmdvCiBAQCAtNzU0LDYgKzc1NCw5IEBAIGZ1bmMgKGIgKkJ1aWxk
ZXIpIGFkZFRyYW5zaXRpdmVMaW5rRGVwcyhhLCBhMSAqQWN0aW9uLCBzaGxpYiBzdHJpbmcpIHsK
QEAgLTQzLDcgKzQzLDcgQEAgaW5kZXggYTU5MDcyZTU5MS4uOWUzNWViZGUwYyAxMDA2NDQKICAJ
CQkvLyBUT0RPKHJzYyk6IFRoZSB1c2Ugb2YgTW9kZUluc3RhbGwgaGVyZSBpcyBzdXNwZWN0LCBi
dXQgaWYgd2Ugb25seSBkbyBNb2RlQnVpbGQsCiAgCQkJLy8gd2UnbGwgZW5kIHVwIGJ1aWxkaW5n
IGFuIG92ZXJhbGwgbGlicmFyeSBvciBleGVjdXRhYmxlIHRoYXQgZGVwZW5kcyBhdCBydW50aW1l
CiBkaWZmIC0tZ2l0IGEvc3JjL2NtZC9nby9pbnRlcm5hbC93b3JrL2J1aWxkLmdvIGIvc3JjL2Nt
ZC9nby9pbnRlcm5hbC93b3JrL2J1aWxkLmdvCi1pbmRleCA0MDhlZGI1MTE5Li4zZDYwMjUyMTI3
IDEwMDY0NAoraW5kZXggNDA4ZWRiNS4uM2Q2MDI1MiAxMDA2NDQKIC0tLSBhL3NyYy9jbWQvZ28v
aW50ZXJuYWwvd29yay9idWlsZC5nbwogKysrIGIvc3JjL2NtZC9nby9pbnRlcm5hbC93b3JrL2J1
aWxkLmdvCiBAQCAtMjMzLDYgKzIzMyw4IEBAIFNlZSBhbHNvOiBnbyBpbnN0YWxsLCBnbyBnZXQs
IGdvIGNsZWFuLgpAQCAtNjcsNyArNjcsNyBAQCBpbmRleCA0MDhlZGI1MTE5Li4zZDYwMjUyMTI3
IDEwMDY0NAogIAogIC8vIE5vdGUgdGhhdCBmbGFncyBjb25zdWx0ZWQgYnkgb3RoZXIgcGFydHMg
b2YgdGhlIGNvZGUKIGRpZmYgLS1naXQgYS9zcmMvY21kL2dvL2ludGVybmFsL3dvcmsvZXhlYy5n
byBiL3NyYy9jbWQvZ28vaW50ZXJuYWwvd29yay9leGVjLmdvCi1pbmRleCA5NzI0Y2QwN2QwLi41
NDRkZjQ2MWEyIDEwMDY0NAoraW5kZXggOTcyNGNkMC4uNTQ0ZGY0NiAxMDA2NDQKIC0tLSBhL3Ny
Yy9jbWQvZ28vaW50ZXJuYWwvd29yay9leGVjLmdvCiArKysgYi9zcmMvY21kL2dvL2ludGVybmFs
L3dvcmsvZXhlYy5nbwogQEAgLTU0NCw2ICs1NDQsMjMgQEAgZnVuYyAoYiAqQnVpbGRlcikgYnVp
bGQoY3R4IGNvbnRleHQuQ29udGV4dCwgYSAqQWN0aW9uKSAoZXJyIGVycm9yKSB7CkBAIC0xMDks
NiArMTA5LDMgQEAgaW5kZXggOTcyNGNkMDdkMC4uNTQ0ZGY0NjFhMiAxMDA2NDQKICAJaWYgZXJy
IDo9IGIuU2hlbGwoYSkuTWtkaXIoYS5PYmpkaXIpOyBlcnIgIT0gbmlsIHsKICAJCXJldHVybiBl
cnIKICAJfQotLS0gCi0yLjQ0LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2dvL2dvLzAwMDctZXhlYy5nby1maWx0ZXItb3V0LWJ1aWxkLXNwZWNpZmljLXBhdGhzLWZyb20t
bGlua2VyLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDA3LWV4ZWMuZ28t
ZmlsdGVyLW91dC1idWlsZC1zcGVjaWZpYy1wYXRocy1mcm9tLWxpbmtlci0ucGF0Y2gKaW5kZXgg
YzViZjI4ZjU0YS4uMDM5ZjgyYjZkYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2dvL2dvLzAwMDctZXhlYy5nby1maWx0ZXItb3V0LWJ1aWxkLXNwZWNpZmljLXBhdGhzLWZyb20t
bGlua2VyLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwNy1leGVj
LmdvLWZpbHRlci1vdXQtYnVpbGQtc3BlY2lmaWMtcGF0aHMtZnJvbS1saW5rZXItLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSAwODNiNWM3NGIxMmExYWJlYjExZGQ3ZjU4YTFjYjE1OTNkMDAw
MGMwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzYWJhOTY0MDI2YzA5Mjg3OGRjNDdl
Y2M2YTg5ZjcxMGE1ZjVmMzc5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hhbmdx
aW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMjcgRmViIDIw
MjQgMTg6MDY6NTEgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gZXhlYy5nbzogZmlsdGVyIG91dCBi
dWlsZC1zcGVjaWZpYyBwYXRocyBmcm9tIGxpbmtlciBmbGFncwpAQCAtMTQsMTAgKzE0LDEwIEBA
IFNpZ25lZC1vZmYtYnk6IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+
CiAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlm
ZiAtLWdpdCBhL3NyYy9jbWQvZ28vaW50ZXJuYWwvd29yay9leGVjLmdvIGIvc3JjL2NtZC9nby9p
bnRlcm5hbC93b3JrL2V4ZWMuZ28KLWluZGV4IGNkZTg2N2IuLmUzY2UxN2QgMTAwNjQ0CitpbmRl
eCA1NDRkZjQ2Li5jOGYyOTdjIDEwMDY0NAogLS0tIGEvc3JjL2NtZC9nby9pbnRlcm5hbC93b3Jr
L2V4ZWMuZ28KICsrKyBiL3NyYy9jbWQvZ28vaW50ZXJuYWwvd29yay9leGVjLmdvCi1AQCAtMTM1
OCw2ICsxMzU4LDI5IEBAIGZ1bmMgKGIgKkJ1aWxkZXIpIGxpbmtBY3Rpb25JRChhICpBY3Rpb24p
IGNhY2hlLkFjdGlvbklEIHsKK0BAIC0xNDAxLDYgKzE0MDEsMjkgQEAgZnVuYyAoYiAqQnVpbGRl
cikgbGlua0FjdGlvbklEKGEgKkFjdGlvbikgY2FjaGUuQWN0aW9uSUQgewogIAlyZXR1cm4gaC5T
dW0oKQogIH0KICAKQEAgLTQ3LDcgKzQ3LDcgQEAgaW5kZXggY2RlODY3Yi4uZTNjZTE3ZCAxMDA2
NDQKICAvLyBwcmludExpbmtlckNvbmZpZyBwcmludHMgdGhlIGxpbmtlciBjb25maWcgaW50byB0
aGUgaGFzaCBoLAogIC8vIGFzIHBhcnQgb2YgdGhlIGNvbXB1dGF0aW9uIG9mIGEgbGlua2VyLXJl
bGF0ZWQgYWN0aW9uIElELgogIGZ1bmMgKGIgKkJ1aWxkZXIpIHByaW50TGlua2VyQ29uZmlnKGgg
aW8uV3JpdGVyLCBwICpsb2FkLlBhY2thZ2UpIHsKLUBAIC0xMzY4LDcgKzEzOTEsNyBAQCBmdW5j
IChiICpCdWlsZGVyKSBwcmludExpbmtlckNvbmZpZyhoIGlvLldyaXRlciwgcCAqbG9hZC5QYWNr
YWdlKSB7CitAQCAtMTQxMSw3ICsxNDM0LDcgQEAgZnVuYyAoYiAqQnVpbGRlcikgcHJpbnRMaW5r
ZXJDb25maWcoaCBpby5Xcml0ZXIsIHAgKmxvYWQuUGFja2FnZSkgewogIAljYXNlICJnYyI6CiAg
CQlmbXQuRnByaW50ZihoLCAibGluayAlcyAlcSAlc1xuIiwgYi50b29sSUQoImxpbmsiKSwgZm9y
Y2VkTGRmbGFncywgbGRCdWlsZG1vZGUpCiAgCQlpZiBwICE9IG5pbCB7CkBAIC01Niw2ICs1Niwz
IEBAIGluZGV4IGNkZTg2N2IuLmUzY2UxN2QgMTAwNjQ0CiAgCQl9CiAgCiAgCQkvLyBHT0FSTSwg
R09NSVBTLCBldGMuCi0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ28vZ28vMDAwOC1zcmMtY21kLWRpc3QtYnVpbGRnby5nby1kby1ub3QtaGFyZGNvZGUt
aG9zdC1jb21waWxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDgtc3Jj
LWNtZC1kaXN0LWJ1aWxkZ28uZ28tZG8tbm90LWhhcmRjb2RlLWhvc3QtY29tcGlsZS5wYXRjaApp
bmRleCAwNjYyZjY2YWY1Li5lMmVlNTZjMzhjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ28vZ28vMDAwOC1zcmMtY21kLWRpc3QtYnVpbGRnby5nby1kby1ub3QtaGFyZGNvZGUt
aG9zdC1jb21waWxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDA4
LXNyYy1jbWQtZGlzdC1idWlsZGdvLmdvLWRvLW5vdC1oYXJkY29kZS1ob3N0LWNvbXBpbGUucGF0
Y2gKQEAgLTEsOCArMSw4IEBACi1Gcm9tIGUwOTk5OTAyNjg3ZTJlMzk0NDk5ZjcxNTNkYjhkNjI0
NDBjNGRhYjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGI0ZTNhN2YyOTIzZWM4NGZk
OGNhN2RlMTNlNzIyZmEyNDM3NjUwYzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBB
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
ZTljLi4xZGE4ZTUwMWZlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28v
MDAwOS1nby1GaWx0ZXItYnVpbGQtcGF0aHMtb24tc3RhdGljbHktbGlua2VkLWFyY2hlcy5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwOS1nby1GaWx0ZXItYnVpbGQt
cGF0aHMtb24tc3RhdGljbHktbGlua2VkLWFyY2hlcy5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZy
b20gNmMyNDM4ZjE4N2NhOTEyYzU0YTcxYjRhYzY1YWI5ODk5OWEwMTlkMiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gOGQ2ODU3OTZkNDRjYmU3MzA2Zjk2YWU3MTdhMTdjMDE5ZDBkY2Jl
NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJk
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
ZXMtZGV2dG9vbHMvZ28vZ29fMS4yMi4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dv
XzEuMjIuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2dvL2dvXzEuMjIuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2dvL2dvXzEuMjIuMy5iYgotLSAKMi40NC4wCgo=

--===============2880299594509471164==--

