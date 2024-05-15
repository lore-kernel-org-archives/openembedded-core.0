Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60FCC3271D
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:25 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.1276.1715794337868586364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bsGkpukJ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=l9WjZHDF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018f7d4fdd2a-379c9d48-6d81-4bc0-82a1-29eab67956ab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q4TEwAqvs8Bx/gm7DjubVRGwJ6p6RRm7Siv8Kiaaptc=;
	b=bsGkpukJ2qR7QpD8hBX9naiLEbW1e28PECOA8pStJjxEZ5nCVPXOsN3IM9TotyxN
	wIDgzjpM0lHSzqIcC+RMXf4ZMsYNF8sV+r/LUcC0hD0Yw9bSlN+0UIoMc4rmpea9ZwL
	ergLfJnFLiTMCFufzNT7anMcvCcyPEC3aCYHcSMo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q4TEwAqvs8Bx/gm7DjubVRGwJ6p6RRm7Siv8Kiaaptc=;
	b=l9WjZHDFCohxeHjv1TFJi+qzcSvPGv8yVRgKehExoLxrdD0eaLpzRcX5FlCvrYjq
	HzlQbcGJc14bZHkmkzoA4v5vxyOIWRQUXjPB22w/NgX8fh86V2/jA0MESdFjczUf0Zr
	RHXeMfcaEyA7TDm2MC2MA7XsXJEUSStWBPN4daY0=
Content-Type: multipart/mixed; boundary="===============2040942956209320859=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-runtime: upgrading to 1.22.3 FAILED
Message-ID: <0101018f7d4fdd2a-379c9d48-6d81-4bc0-82a1-29eab67956ab-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199323

--===============2040942956209320859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-runtime* to *1.22.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-runtime-upgrade-1.22.2-1.22.3.patch
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
From 86cf3133dc6cbc07a4b888b6a1a56d442121fa23 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 08:52:20 +0000
Subject: [PATCH] go-runtime: upgrade 1.22.2 -> 1.22.3

---
 .../go/{go-1.22.2.inc => go-1.22.3.inc}             |  2 +-
 .../{go-runtime_1.22.2.bb => go-runtime_1.22.3.bb}  |  0
 ...e-content-based-hash-generation-less-pedan.patch | 11 ++++-------
 ...ow-GOTOOLDIR-to-be-overridden-in-the-envir.patch | 12 ++++--------
 .../0003-ld-add-soname-to-shareable-objects.patch   |  9 +++------
 ...override-CC-when-building-dist-and-go_boot.patch | 10 +++-------
 ...5-cmd-dist-separate-host-and-target-builds.patch |  9 +++------
 ...006-cmd-go-make-GOROOT-precious-by-default.patch | 13 +++++--------
 ...lter-out-build-specific-paths-from-linker-.patch | 11 ++++-------
 ...st-buildgo.go-do-not-hardcode-host-compile.patch | 11 ++++-------
 ...lter-build-paths-on-staticly-linked-arches.patch |  9 +++------
 11 files changed, 34 insertions(+), 63 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.2.inc => go-1.22.3.inc} (89%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.2.bb => go-runtime_1.22.3.bb} (100%)

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
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.2.bb b/meta/recipes-devtools/go/go-runtime_1.22.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.2.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.3.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 564837c7cd..cdb7c74373 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -1,7 +1,7 @@
-From 9a6c5040cbcd88b10ceb8ceaebc8d6158c086670 Mon Sep 17 00:00:00 2001
+From e93385d87bcad8aa444fb8feddb62ed811e108ea Mon Sep 17 00:00:00 2001
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
index 001c94a4e7..76dcc6aaaa 100644
--- a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
+++ b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
@@ -1,8 +1,7 @@
-From e3f9a8a69d3a340c1a1d0bba566e71f20f635a43 Mon Sep 17 00:00:00 2001
+From 619665506ac1ffbd59d3a87c63225c651fa98846 Mon Sep 17 00:00:00 2001
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
index 9cab2969c8..1e0c389b1d 100644
--- a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
@@ -1,7 +1,7 @@
-From 7dde77b3ce8138314dd2736604b1b110dbcc0ac1 Mon Sep 17 00:00:00 2001
+From 8d8a3a7d8d1bae51beadf7a37ca272e850442b73 Mon Sep 17 00:00:00 2001
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
index 8889aef1cf..619dcc5409 100644
--- a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -1,8 +1,7 @@
-From 9f59e46991074d3e3c4d00f3971e62bfcd707167 Mon Sep 17 00:00:00 2001
+From 86c1a0045a8c344b687091509faf257c7fdec45a Mon Sep 17 00:00:00 2001
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
index 364fce907a..f2015ca52a 100644
--- a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
@@ -1,7 +1,7 @@
-From 6dda78d528e60993a4688cd9d49440a726378ac8 Mon Sep 17 00:00:00 2001
+From 74e98186ce21e27362c0464feddeca7af7d048ae Mon Sep 17 00:00:00 2001
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
index 262f1e96b8..5dd441ae3f 100644
--- a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
@@ -1,7 +1,7 @@
-From aff5a740d6286c04beb0593fc68b0aea5a95ad39 Mon Sep 17 00:00:00 2001
+From c2a884e0fceb24ce74dd8afd2495140b4f366de9 Mon Sep 17 00:00:00 2001
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
index c5bf28f54a..2d1ae763b6 100644
--- a/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
+++ b/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
@@ -1,4 +1,4 @@
-From 083b5c74b12a1abeb11dd7f58a1cb1593d0000c0 Mon Sep 17 00:00:00 2001
+From e171f38805ff714f283e1397c214738619a3e670 Mon Sep 17 00:00:00 2001
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
index 0662f66af5..982a8dc328 100644
--- a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
+++ b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
@@ -1,8 +1,8 @@
-From e0999902687e2e394499f7153db8d62440c4dab0 Mon Sep 17 00:00:00 2001
+From 772a46e427d590efdbe0b5de335d97eaf770dda8 Mon Sep 17 00:00:00 2001
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
index cc45496e9c..2e5e57480f 100644
--- a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
+++ b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
@@ -1,7 +1,7 @@
-From 6c2438f187ca912c54a71b4ac65ab98999a019d2 Mon Sep 17 00:00:00 2001
+From 6a43ce351c297a1cda2c69e786cf46fa947dd7c4 Mon Sep 17 00:00:00 2001
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
-- 
2.44.0


--===============2040942956209320859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-cross_1.22.2.bb:2: Could not include required file go-1.22.2.inc
ERROR: Parsing halted due to errors, see error messages above

--===============2040942956209320859==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-runtime-upgrade-1.22.2-1.22.3.patch"

RnJvbSA4NmNmMzEzM2RjNmNiYzA3YTRiODg4YjZhMWE1NmQ0NDIxMjFmYTIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDg6NTI6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
by1ydW50aW1lOiB1cGdyYWRlIDEuMjIuMiAtPiAxLjIyLjMKCi0tLQogLi4uL2dvL3tnby0xLjIy
LjIuaW5jID0+IGdvLTEuMjIuMy5pbmN9ICAgICAgICAgICAgIHwgIDIgKy0KIC4uLi97Z28tcnVu
dGltZV8xLjIyLjIuYmIgPT4gZ28tcnVudGltZV8xLjIyLjMuYmJ9ICB8ICAwCiAuLi5lLWNvbnRl
bnQtYmFzZWQtaGFzaC1nZW5lcmF0aW9uLWxlc3MtcGVkYW4ucGF0Y2ggfCAxMSArKysrLS0tLS0t
LQogLi4ub3ctR09UT09MRElSLXRvLWJlLW92ZXJyaWRkZW4taW4tdGhlLWVudmlyLnBhdGNoIHwg
MTIgKysrKy0tLS0tLS0tCiAuLi4vMDAwMy1sZC1hZGQtc29uYW1lLXRvLXNoYXJlYWJsZS1vYmpl
Y3RzLnBhdGNoICAgfCAgOSArKystLS0tLS0KIC4uLm92ZXJyaWRlLUNDLXdoZW4tYnVpbGRpbmct
ZGlzdC1hbmQtZ29fYm9vdC5wYXRjaCB8IDEwICsrKy0tLS0tLS0KIC4uLjUtY21kLWRpc3Qtc2Vw
YXJhdGUtaG9zdC1hbmQtdGFyZ2V0LWJ1aWxkcy5wYXRjaCB8ICA5ICsrKy0tLS0tLQogLi4uMDA2
LWNtZC1nby1tYWtlLUdPUk9PVC1wcmVjaW91cy1ieS1kZWZhdWx0LnBhdGNoIHwgMTMgKysrKyst
LS0tLS0tLQogLi4ubHRlci1vdXQtYnVpbGQtc3BlY2lmaWMtcGF0aHMtZnJvbS1saW5rZXItLnBh
dGNoIHwgMTEgKysrKy0tLS0tLS0KIC4uLnN0LWJ1aWxkZ28uZ28tZG8tbm90LWhhcmRjb2RlLWhv
c3QtY29tcGlsZS5wYXRjaCB8IDExICsrKystLS0tLS0tCiAuLi5sdGVyLWJ1aWxkLXBhdGhzLW9u
LXN0YXRpY2x5LWxpbmtlZC1hcmNoZXMucGF0Y2ggfCAgOSArKystLS0tLS0KIDExIGZpbGVzIGNo
YW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDYzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9nby97Z28tMS4yMi4yLmluYyA9PiBnby0xLjIyLjMuaW5jfSAoODklKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tcnVudGltZV8xLjIyLjIuYmIgPT4g
Z28tcnVudGltZV8xLjIyLjMuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nby9nby0xLjIyLjIuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEu
MjIuMy5pbmMKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dvL2dvLTEuMjIuMi5pbmMKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9n
by9nby0xLjIyLjMuaW5jCmluZGV4IGIzOTkyMDczMTEuLjM0NzAzYmMxZmEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIyLjIuaW5jCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9nby9nby0xLjIyLjMuaW5jCkBAIC0xNSw0ICsxNSw0IEBAIFNSQ19VUkkgKz0g
IlwKICAgICBmaWxlOi8vMDAwOC1zcmMtY21kLWRpc3QtYnVpbGRnby5nby1kby1ub3QtaGFyZGNv
ZGUtaG9zdC1jb21waWxlLnBhdGNoIFwKICAgICBmaWxlOi8vMDAwOS1nby1GaWx0ZXItYnVpbGQt
cGF0aHMtb24tc3RhdGljbHktbGlua2VkLWFyY2hlcy5wYXRjaCBcCiAiCi1TUkNfVVJJW21haW4u
c2hhMjU2c3VtXSA9ICIzNzRlYTgyYjI4OWVjNzM4ZTk2ODI2N2NhYzU5YzdkNWZmMTgwZjk0OTIy
NTAyNTQ3ODRiMjA0NGU5MGRmNWE5IgorU1JDX1VSSVttYWluLnNoYTI1NnN1bV0gPSAiODA2NDhl
ZjM0ZjkwMzE5M2Q3MmE1OWMwZGZmMDE5ZjVmOThhZTBjOWFhMTNhZGUwYjBlY2JmZjk5MWE3NmY2
OCIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1ydW50aW1lXzEuMjIu
Mi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1ydW50aW1lXzEuMjIuMy5iYgpzaW1p
bGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dv
LXJ1bnRpbWVfMS4yMi4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28t
cnVudGltZV8xLjIyLjMuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9n
by8wMDAxLWNtZC1nby1tYWtlLWNvbnRlbnQtYmFzZWQtaGFzaC1nZW5lcmF0aW9uLWxlc3MtcGVk
YW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwMS1jbWQtZ28tbWFrZS1j
b250ZW50LWJhc2VkLWhhc2gtZ2VuZXJhdGlvbi1sZXNzLXBlZGFuLnBhdGNoCmluZGV4IDU2NDgz
N2M3Y2QuLmNkYjdjNzQzNzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9n
by8wMDAxLWNtZC1nby1tYWtlLWNvbnRlbnQtYmFzZWQtaGFzaC1nZW5lcmF0aW9uLWxlc3MtcGVk
YW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDEtY21kLWdvLW1h
a2UtY29udGVudC1iYXNlZC1oYXNoLWdlbmVyYXRpb24tbGVzcy1wZWRhbi5wYXRjaApAQCAtMSw3
ICsxLDcgQEAKLUZyb20gOWE2YzUwNDBjYmNkODhiMTBjZWI4Y2VhZWJjOGQ2MTU4YzA4NjY3MCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTkzMzg1ZDg3YmNhZDhhYTQ0NGZiOGZlZGRi
NjJlZDgxMWUxMDhlYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDI4IE1hciAyMDIyIDEwOjU5OjAzIC0wNzAw
Ci1TdWJqZWN0OiBbUEFUQ0ggMS85XSBjbWQvZ286IG1ha2UgY29udGVudC1iYXNlZCBoYXNoIGdl
bmVyYXRpb24gbGVzcyBwZWRhbnRpYworU3ViamVjdDogW1BBVENIXSBjbWQvZ286IG1ha2UgY29u
dGVudC1iYXNlZCBoYXNoIGdlbmVyYXRpb24gbGVzcyBwZWRhbnRpYwogCiBHbyAxLjEwJ3MgYnVp
bGQgdG9vbCBub3cgdXNlcyBjb250ZW50LWJhc2VkIGhhc2hlcyB0bwogZGV0ZXJtaW5lIHdoZW4g
c29tZXRoaW5nIHNob3VsZCBiZSBidWlsdCBvciByZS1idWlsdC4KQEAgLTMyLDcgKzMyLDcgQEAg
U2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8am9zZS5xdWFyZXNtYUBmb3VuZHJpZXMuaW8+
CiAgMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKIAog
ZGlmZiAtLWdpdCBhL3NyYy9jbWQvZ28vaW50ZXJuYWwvZW52Y21kL2Vudi5nbyBiL3NyYy9jbWQv
Z28vaW50ZXJuYWwvZW52Y21kL2Vudi5nbwotaW5kZXggYzdjMmU4M2UwZi4uNGE5MGQ5ZGE1YyAx
MDA2NDQKK2luZGV4IGM3YzJlODMuLjRhOTBkOWQgMTAwNjQ0CiAtLS0gYS9zcmMvY21kL2dvL2lu
dGVybmFsL2VudmNtZC9lbnYuZ28KICsrKyBiL3NyYy9jbWQvZ28vaW50ZXJuYWwvZW52Y21kL2Vu
di5nbwogQEAgLTE4OSw3ICsxODksNyBAQCBmdW5jIEV4dHJhRW52VmFyc0Nvc3RseSgpIFtdY2Zn
LkVudlZhciB7CkBAIC00NSw3ICs0NSw3IEBAIGluZGV4IGM3YzJlODNlMGYuLjRhOTBkOWRhNWMg
MTAwNjQ0CiAgCQkvLyBTaG91bGQgbm90IGhhcHBlbiAtIGIuQ0ZsYWdzIHdhcyBnaXZlbiBhbiBl
bXB0eSBwYWNrYWdlLgogIAkJZm10LkZwcmludGYob3MuU3RkZXJyLCAiZ286IGludmFsaWQgY2Zs
YWdzOiAldlxuIiwgZXJyKQogZGlmZiAtLWdpdCBhL3NyYy9jbWQvZ28vaW50ZXJuYWwvd29yay9l
eGVjLmdvIGIvc3JjL2NtZC9nby9pbnRlcm5hbC93b3JrL2V4ZWMuZ28KLWluZGV4IGUwNTQ3MWIw
NmMuLjk3MjRjZDA3ZDAgMTAwNjQ0CitpbmRleCBlMDU0NzFiLi45NzI0Y2QwIDEwMDY0NAogLS0t
IGEvc3JjL2NtZC9nby9pbnRlcm5hbC93b3JrL2V4ZWMuZ28KICsrKyBiL3NyYy9jbWQvZ28vaW50
ZXJuYWwvd29yay9leGVjLmdvCiBAQCAtMjMyLDYgKzIzMiw4IEBAIGZ1bmMgKGIgKkJ1aWxkZXIp
IERvKGN0eCBjb250ZXh0LkNvbnRleHQsIHJvb3QgKkFjdGlvbikgewpAQCAtMTYzLDYgKzE2Mywz
IEBAIGluZGV4IGUwNTQ3MWIwNmMuLjk3MjRjZDA3ZDAgMTAwNjQ0CiAgCWlmIGVyciAhPSBuaWwg
ewogIAkJcmV0dXJuICIiLCAiIiwgZXJyCiAgCX0KLS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDAyLWNtZC1nby1BbGxvdy1HT1RPT0xESVIt
dG8tYmUtb3ZlcnJpZGRlbi1pbi10aGUtZW52aXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ28vZ28vMDAwMi1jbWQtZ28tQWxsb3ctR09UT09MRElSLXRvLWJlLW92ZXJyaWRkZW4taW4t
dGhlLWVudmlyLnBhdGNoCmluZGV4IDAwMWM5NGE0ZTcuLjc2ZGNjNmFhYWEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDAyLWNtZC1nby1BbGxvdy1HT1RPT0xESVIt
dG8tYmUtb3ZlcnJpZGRlbi1pbi10aGUtZW52aXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dvL2dvLzAwMDItY21kLWdvLUFsbG93LUdPVE9PTERJUi10by1iZS1vdmVycmlkZGVu
LWluLXRoZS1lbnZpci5wYXRjaApAQCAtMSw4ICsxLDcgQEAKLUZyb20gZTNmOWE4YTY5ZDNhMzQw
YzFhMWQwYmJhNTY2ZTcxZjIwZjYzNWE0MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
NjE5NjY1NTA2YWMxZmZiZDU5ZDNhODdjNjMyMjVjNjUxZmE5ODg0NiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEFsZXggS3ViZSA8YWxleGFuZGVyLmoua3ViZUBnbWFpbC5jb20+CiBE
YXRlOiBXZWQsIDIzIE9jdCAyMDE5IDIxOjE1OjM3ICswNDMwCi1TdWJqZWN0OiBbUEFUQ0ggMi85
XSBjbWQvZ286IEFsbG93IEdPVE9PTERJUiB0byBiZSBvdmVycmlkZGVuIGluIHRoZQotIGVudmly
b25tZW50CitTdWJqZWN0OiBbUEFUQ0hdIGNtZC9nbzogQWxsb3cgR09UT09MRElSIHRvIGJlIG92
ZXJyaWRkZW4gaW4gdGhlIGVudmlyb25tZW50CiAKIHRvIGFsbG93IGZvciBzcGxpdCBob3N0L3Rh
cmdldCBidWlsZCByb290cwogCkBAIC0yMCw3ICsxOSw3IEBAIFNpZ25lZC1vZmYtYnk6IEpvc2Ug
UXVhcmVzbWEgPGpvc2UucXVhcmVzbWFAZm91bmRyaWVzLmlvPgogIDIgZmlsZXMgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2NtZC9k
aXN0L2J1aWxkLmdvIGIvc3JjL2NtZC9kaXN0L2J1aWxkLmdvCi1pbmRleCAzMmU1OWI0NDZhLi4w
NmVlNGRlOGE5IDEwMDY0NAoraW5kZXggMzJlNTliNC4uMDZlZTRkZSAxMDA2NDQKIC0tLSBhL3Ny
Yy9jbWQvZGlzdC9idWlsZC5nbwogKysrIGIvc3JjL2NtZC9kaXN0L2J1aWxkLmdvCiBAQCAtMjU5
LDcgKzI1OSw5IEBAIGZ1bmMgeGluaXQoKSB7CkBAIC0zNSw3ICszNCw3IEBAIGluZGV4IDMyZTU5
YjQ0NmEuLjA2ZWU0ZGU4YTkgMTAwNjQ0CiAgCWdvdmVyc2lvbiA6PSBmaW5kZ292ZXJzaW9uKCkK
ICAJaXNSZWxlYXNlID0gc3RyaW5ncy5IYXNQcmVmaXgoZ292ZXJzaW9uLCAicmVsZWFzZS4iKSB8
fCBzdHJpbmdzLkhhc1ByZWZpeChnb3ZlcnNpb24sICJnbyIpCiBkaWZmIC0tZ2l0IGEvc3JjL2Nt
ZC9nby9pbnRlcm5hbC9jZmcvY2ZnLmdvIGIvc3JjL2NtZC9nby9pbnRlcm5hbC9jZmcvY2ZnLmdv
Ci1pbmRleCBhOGRhYTJkZmMzLi4zOTNhZGEzOWM5IDEwMDY0NAoraW5kZXggYThkYWEyZC4uMzkz
YWRhMyAxMDA2NDQKIC0tLSBhL3NyYy9jbWQvZ28vaW50ZXJuYWwvY2ZnL2NmZy5nbwogKysrIGIv
c3JjL2NtZC9nby9pbnRlcm5hbC9jZmcvY2ZnLmdvCiBAQCAtMjMwLDcgKzIzMCwxMSBAQCBmdW5j
IFNldEdPUk9PVChnb3Jvb3Qgc3RyaW5nLCBpc1Rlc3RHbyBib29sKSB7CkBAIC01MSw2ICs1MCwz
IEBAIGluZGV4IGE4ZGFhMmRmYzMuLjM5M2FkYTM5YzkgMTAwNjQ0CiAgCQl9CiAgCX0KICB9Ci0t
LSAKLTIuNDQuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAw
My1sZC1hZGQtc29uYW1lLXRvLXNoYXJlYWJsZS1vYmplY3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2dvL2dvLzAwMDMtbGQtYWRkLXNvbmFtZS10by1zaGFyZWFibGUtb2JqZWN0cy5w
YXRjaAppbmRleCA5Y2FiMjk2OWM4Li4xZTBjMzg5YjFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ28vZ28vMDAwMy1sZC1hZGQtc29uYW1lLXRvLXNoYXJlYWJsZS1vYmplY3Rz
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDAzLWxkLWFkZC1zb25h
bWUtdG8tc2hhcmVhYmxlLW9iamVjdHMucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDdkZGU3
N2IzY2U4MTM4MzE0ZGQyNzM2NjA0YjFiMTEwZGJjYzBhYzEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDhkOGEzYTdkOGQxYmFlNTFiZWFkZjdhMzdjYTI3MmU4NTA0NDJiNzMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4IEt1YmUgPGFsZXhhbmRlci5qLmt1YmVAZ21h
aWwuY29tPgogRGF0ZTogV2VkLCAyMyBPY3QgMjAxOSAyMToxNjozMiArMDQzMAotU3ViamVjdDog
W1BBVENIIDMvOV0gbGQ6IGFkZCBzb25hbWUgdG8gc2hhcmVhYmxlIG9iamVjdHMKK1N1YmplY3Q6
IFtQQVRDSF0gbGQ6IGFkZCBzb25hbWUgdG8gc2hhcmVhYmxlIG9iamVjdHMKIAogc28gdGhhdCBP
RSdzIHNoYXJlZCBsaWJyYXJ5IGRlcGVuZGVuY3kgaGFuZGxpbmcKIGNhbiBmaW5kIHRoZW0uCkBA
IC0xOSw3ICsxOSw3IEBAIFNpZ25lZC1vZmYtYnk6IEpvc2UgUXVhcmVzbWEgPGpvc2UucXVhcmVz
bWFAZm91bmRyaWVzLmlvPgogIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKIAogZGlm
ZiAtLWdpdCBhL3NyYy9jbWQvbGluay9pbnRlcm5hbC9sZC9saWIuZ28gYi9zcmMvY21kL2xpbmsv
aW50ZXJuYWwvbGQvbGliLmdvCi1pbmRleCBlYWI3NGRjMzI4Li5hZTliYmM5MDkzIDEwMDY0NAor
aW5kZXggZWFiNzRkYy4uYWU5YmJjOSAxMDA2NDQKIC0tLSBhL3NyYy9jbWQvbGluay9pbnRlcm5h
bC9sZC9saWIuZ28KICsrKyBiL3NyYy9jbWQvbGluay9pbnRlcm5hbC9sZC9saWIuZ28KIEBAIC0x
NTc2LDYgKzE1NzYsNyBAQCBmdW5jIChjdHh0ICpMaW5rKSBob3N0bGluaygpIHsKQEAgLTQ2LDYg
KzQ2LDMgQEAgaW5kZXggZWFiNzRkYzMyOC4uYWU5YmJjOTA5MyAxMDA2NDQKICAJCX0KICAJfQog
IAotLS0gCi0yLjQ0LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dv
LzAwMDQtbWFrZS5iYXNoLW92ZXJyaWRlLUNDLXdoZW4tYnVpbGRpbmctZGlzdC1hbmQtZ29fYm9v
dC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDA0LW1ha2UuYmFzaC1vdmVy
cmlkZS1DQy13aGVuLWJ1aWxkaW5nLWRpc3QtYW5kLWdvX2Jvb3QucGF0Y2gKaW5kZXggODg4OWFl
ZjFjZi4uNjE5ZGNjNTQwOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dv
LzAwMDQtbWFrZS5iYXNoLW92ZXJyaWRlLUNDLXdoZW4tYnVpbGRpbmctZGlzdC1hbmQtZ29fYm9v
dC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwNC1tYWtlLmJhc2gt
b3ZlcnJpZGUtQ0Mtd2hlbi1idWlsZGluZy1kaXN0LWFuZC1nb19ib290LnBhdGNoCkBAIC0xLDgg
KzEsNyBAQAotRnJvbSA5ZjU5ZTQ2OTkxMDc0ZDNlM2M0ZDAwZjM5NzFlNjJiZmNkNzA3MTY3IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4NmMxYTAwNDVhOGMzNDRiNjg3MDkxNTA5ZmFm
MjU3YzdmZGVjNDVhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleCBLdWJlIDxh
bGV4YW5kZXIuai5rdWJlQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMjMgT2N0IDIwMTkgMjE6MTc6
MTYgKzA0MzAKLVN1YmplY3Q6IFtQQVRDSCA0LzldIG1ha2UuYmFzaDogb3ZlcnJpZGUgQ0Mgd2hl
biBidWlsZGluZyBkaXN0IGFuZAotIGdvX2Jvb3RzdHJhcAorU3ViamVjdDogW1BBVENIXSBtYWtl
LmJhc2g6IG92ZXJyaWRlIENDIHdoZW4gYnVpbGRpbmcgZGlzdCBhbmQgZ29fYm9vdHN0cmFwCiAK
IGZvciBoYW5kbGluZyBPRSBjcm9zcy1jYW5hZGlhbiBidWlsZHMuCiAKQEAgLTE5LDcgKzE4LDcg
QEAgU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8am9zZS5xdWFyZXNtYUBmb3VuZHJpZXMu
aW8+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAog
ZGlmZiAtLWdpdCBhL3NyYy9tYWtlLmJhc2ggYi9zcmMvbWFrZS5iYXNoCi1pbmRleCA3NmFkNTE2
MjRhLi4wNzRlMTI5YTI0IDEwMDc1NQoraW5kZXggNzZhZDUxNi4uMDc0ZTEyOSAxMDA3NTUKIC0t
LSBhL3NyYy9tYWtlLmJhc2gKICsrKyBiL3NyYy9tYWtlLmJhc2gKIEBAIC0xOTgsNyArMTk4LDcg
QEAgaWYgW1sgIiRHT1JPT1RfQk9PVFNUUkFQIiA9PSAiJEdPUk9PVCIgXV07IHRoZW4KQEAgLTQw
LDYgKzM5LDMgQEAgaW5kZXggNzZhZDUxNjI0YS4uMDc0ZTEyOWEyNCAxMDA3NTUKICBybSAtZiAu
L2NtZC9kaXN0L2Rpc3QKICAKICAjIERPIE5PVCBBREQgQU5ZIE5FVyBDT0RFIEhFUkUuCi0tLSAK
LTIuNDQuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwNS1j
bWQtZGlzdC1zZXBhcmF0ZS1ob3N0LWFuZC10YXJnZXQtYnVpbGRzLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dvL2dvLzAwMDUtY21kLWRpc3Qtc2VwYXJhdGUtaG9zdC1hbmQtdGFyZ2V0
LWJ1aWxkcy5wYXRjaAppbmRleCAzNjRmY2U5MDdhLi5mMjAxNWNhNTJhIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwNS1jbWQtZGlzdC1zZXBhcmF0ZS1ob3N0LWFu
ZC10YXJnZXQtYnVpbGRzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8w
MDA1LWNtZC1kaXN0LXNlcGFyYXRlLWhvc3QtYW5kLXRhcmdldC1idWlsZHMucGF0Y2gKQEAgLTEs
NyArMSw3IEBACi1Gcm9tIDZkZGE3OGQ1MjhlNjA5OTNhNDY4OGNkOWQ0OTQ0MGE3MjYzNzhhYzgg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDc0ZTk4MTg2Y2UyMWUyNzM2MmMwNDY0ZmVk
ZGVjYTdhZjdkMDQ4YWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4IEt1YmUg
PGFsZXhhbmRlci5qLmt1YmVAZ21haWwuY29tPgogRGF0ZTogV2VkLCAyMyBPY3QgMjAxOSAyMTox
ODoxMiArMDQzMAotU3ViamVjdDogW1BBVENIIDUvOV0gY21kL2Rpc3Q6IHNlcGFyYXRlIGhvc3Qg
YW5kIHRhcmdldCBidWlsZHMKK1N1YmplY3Q6IFtQQVRDSF0gY21kL2Rpc3Q6IHNlcGFyYXRlIGhv
c3QgYW5kIHRhcmdldCBidWlsZHMKIAogQ2hhbmdlIHRoZSBkaXN0IHRvb2wgdG8gYWxsb3cgZm9y
IE9FLXN0eWxlIGNyb3NzLQogYW5kIGNyb3NzLWNhbmFkaWFuIGJ1aWxkczoKQEAgLTQ1LDcgKzQ1
LDcgQEAgU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8am9zZS5xdWFyZXNtYUBmb3VuZHJp
ZXMuaW8+CiAgMSBmaWxlIGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
IAogZGlmZiAtLWdpdCBhL3NyYy9jbWQvZGlzdC9idWlsZC5nbyBiL3NyYy9jbWQvZGlzdC9idWls
ZC5nbwotaW5kZXggMDZlZTRkZThhOS4uNzRiN2M3MDk4ZiAxMDA2NDQKK2luZGV4IDA2ZWU0ZGUu
LjAxNmIxZGQgMTAwNjQ0CiAtLS0gYS9zcmMvY21kL2Rpc3QvYnVpbGQuZ28KICsrKyBiL3NyYy9j
bWQvZGlzdC9idWlsZC5nbwogQEAgLTQ2LDYgKzQ2LDcgQEAgdmFyICgKQEAgLTIxNiw2ICsyMTYs
MyBAQCBpbmRleCAwNmVlNGRlOGE5Li43NGI3YzcwOThmIDEwMDY0NAogIAogIAlpZiBnb29zID09
ICJhbmRyb2lkIiB7CiAgCQkvLyBNYWtlIHN1cmUgdGhlIGV4ZWMgd3JhcHBlciB3aWxsIHN5bmMg
YSBmcmVzaCAkR09ST09UIHRvIHRoZSBkZXZpY2UuCi0tLSAKLTIuNDQuMAotCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwNi1jbWQtZ28tbWFrZS1HT1JPT1QtcHJl
Y2lvdXMtYnktZGVmYXVsdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDA2
LWNtZC1nby1tYWtlLUdPUk9PVC1wcmVjaW91cy1ieS1kZWZhdWx0LnBhdGNoCmluZGV4IDI2MmYx
ZTk2YjguLjVkZDQ0MWFlM2YgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9n
by8wMDA2LWNtZC1nby1tYWtlLUdPUk9PVC1wcmVjaW91cy1ieS1kZWZhdWx0LnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDA2LWNtZC1nby1tYWtlLUdPUk9PVC1wcmVj
aW91cy1ieS1kZWZhdWx0LnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBhZmY1YTc0MGQ2Mjg2
YzA0YmViMDU5M2ZjNjhiMGFlYTVhOTVhZDM5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBjMmE4ODRlMGZjZWIyNGNlNzRkZDhhZmQyNDk1MTQwYjRmMzY2ZGU5IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleCBLdWJlIDxhbGV4YW5kZXIuai5rdWJlQGdtYWlsLmNvbT4K
IERhdGU6IFdlZCwgMjMgT2N0IDIwMTkgMjE6MTg6NTYgKzA0MzAKLVN1YmplY3Q6IFtQQVRDSCA2
LzldIGNtZC9nbzogbWFrZSBHT1JPT1QgcHJlY2lvdXMgYnkgZGVmYXVsdAorU3ViamVjdDogW1BB
VENIXSBjbWQvZ286IG1ha2UgR09ST09UIHByZWNpb3VzIGJ5IGRlZmF1bHQKIAogVGhlIGdvIGJ1
aWxkIHRvb2wgbm9ybWFsbHkgcmVidWlsZHMgd2hhdGV2ZXIgaXQgZGV0ZWN0cyBpcwogc3RhbGUu
ICBUaGlzIGNhbiBiZSBhIHByb2JsZW0gd2hlbiBHT1JPT1QgaXMgaW50ZW5kZWQgdG8KQEAgLTI5
LDcgKzI5LDcgQEAgU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8am9zZS5xdWFyZXNtYUBm
b3VuZHJpZXMuaW8+CiAgMyBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCiAKIGRpZmYg
LS1naXQgYS9zcmMvY21kL2dvL2ludGVybmFsL3dvcmsvYWN0aW9uLmdvIGIvc3JjL2NtZC9nby9p
bnRlcm5hbC93b3JrL2FjdGlvbi5nbwotaW5kZXggYTU5MDcyZTU5MS4uOWUzNWViZGUwYyAxMDA2
NDQKK2luZGV4IGE1OTA3MmUuLjllMzVlYmQgMTAwNjQ0CiAtLS0gYS9zcmMvY21kL2dvL2ludGVy
bmFsL3dvcmsvYWN0aW9uLmdvCiArKysgYi9zcmMvY21kL2dvL2ludGVybmFsL3dvcmsvYWN0aW9u
LmdvCiBAQCAtNzU0LDYgKzc1NCw5IEBAIGZ1bmMgKGIgKkJ1aWxkZXIpIGFkZFRyYW5zaXRpdmVM
aW5rRGVwcyhhLCBhMSAqQWN0aW9uLCBzaGxpYiBzdHJpbmcpIHsKQEAgLTQzLDcgKzQzLDcgQEAg
aW5kZXggYTU5MDcyZTU5MS4uOWUzNWViZGUwYyAxMDA2NDQKICAJCQkvLyBUT0RPKHJzYyk6IFRo
ZSB1c2Ugb2YgTW9kZUluc3RhbGwgaGVyZSBpcyBzdXNwZWN0LCBidXQgaWYgd2Ugb25seSBkbyBN
b2RlQnVpbGQsCiAgCQkJLy8gd2UnbGwgZW5kIHVwIGJ1aWxkaW5nIGFuIG92ZXJhbGwgbGlicmFy
eSBvciBleGVjdXRhYmxlIHRoYXQgZGVwZW5kcyBhdCBydW50aW1lCiBkaWZmIC0tZ2l0IGEvc3Jj
L2NtZC9nby9pbnRlcm5hbC93b3JrL2J1aWxkLmdvIGIvc3JjL2NtZC9nby9pbnRlcm5hbC93b3Jr
L2J1aWxkLmdvCi1pbmRleCA0MDhlZGI1MTE5Li4zZDYwMjUyMTI3IDEwMDY0NAoraW5kZXggNDA4
ZWRiNS4uM2Q2MDI1MiAxMDA2NDQKIC0tLSBhL3NyYy9jbWQvZ28vaW50ZXJuYWwvd29yay9idWls
ZC5nbwogKysrIGIvc3JjL2NtZC9nby9pbnRlcm5hbC93b3JrL2J1aWxkLmdvCiBAQCAtMjMzLDYg
KzIzMyw4IEBAIFNlZSBhbHNvOiBnbyBpbnN0YWxsLCBnbyBnZXQsIGdvIGNsZWFuLgpAQCAtNjcs
NyArNjcsNyBAQCBpbmRleCA0MDhlZGI1MTE5Li4zZDYwMjUyMTI3IDEwMDY0NAogIAogIC8vIE5v
dGUgdGhhdCBmbGFncyBjb25zdWx0ZWQgYnkgb3RoZXIgcGFydHMgb2YgdGhlIGNvZGUKIGRpZmYg
LS1naXQgYS9zcmMvY21kL2dvL2ludGVybmFsL3dvcmsvZXhlYy5nbyBiL3NyYy9jbWQvZ28vaW50
ZXJuYWwvd29yay9leGVjLmdvCi1pbmRleCA5NzI0Y2QwN2QwLi41NDRkZjQ2MWEyIDEwMDY0NAor
aW5kZXggOTcyNGNkMC4uNTQ0ZGY0NiAxMDA2NDQKIC0tLSBhL3NyYy9jbWQvZ28vaW50ZXJuYWwv
d29yay9leGVjLmdvCiArKysgYi9zcmMvY21kL2dvL2ludGVybmFsL3dvcmsvZXhlYy5nbwogQEAg
LTU0NCw2ICs1NDQsMjMgQEAgZnVuYyAoYiAqQnVpbGRlcikgYnVpbGQoY3R4IGNvbnRleHQuQ29u
dGV4dCwgYSAqQWN0aW9uKSAoZXJyIGVycm9yKSB7CkBAIC0xMDksNiArMTA5LDMgQEAgaW5kZXgg
OTcyNGNkMDdkMC4uNTQ0ZGY0NjFhMiAxMDA2NDQKICAJaWYgZXJyIDo9IGIuU2hlbGwoYSkuTWtk
aXIoYS5PYmpkaXIpOyBlcnIgIT0gbmlsIHsKICAJCXJldHVybiBlcnIKICAJfQotLS0gCi0yLjQ0
LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDctZXhlYy5n
by1maWx0ZXItb3V0LWJ1aWxkLXNwZWNpZmljLXBhdGhzLWZyb20tbGlua2VyLS5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDA3LWV4ZWMuZ28tZmlsdGVyLW91dC1idWlsZC1z
cGVjaWZpYy1wYXRocy1mcm9tLWxpbmtlci0ucGF0Y2gKaW5kZXggYzViZjI4ZjU0YS4uMmQxYWU3
NjNiNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDctZXhlYy5n
by1maWx0ZXItb3V0LWJ1aWxkLXNwZWNpZmljLXBhdGhzLWZyb20tbGlua2VyLS5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwNy1leGVjLmdvLWZpbHRlci1vdXQtYnVp
bGQtc3BlY2lmaWMtcGF0aHMtZnJvbS1saW5rZXItLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSAwODNiNWM3NGIxMmExYWJlYjExZGQ3ZjU4YTFjYjE1OTNkMDAwMGMwIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBlMTcxZjM4ODA1ZmY3MTRmMjgzZTEzOTdjMjE0NzM4NjE5YTNlNjcw
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3Fpbmcu
bGlAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMjcgRmViIDIwMjQgMTg6MDY6NTEgKzA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gZXhlYy5nbzogZmlsdGVyIG91dCBidWlsZC1zcGVjaWZpYyBwYXRo
cyBmcm9tIGxpbmtlciBmbGFncwpAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IENo
YW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQs
IDI0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9jbWQv
Z28vaW50ZXJuYWwvd29yay9leGVjLmdvIGIvc3JjL2NtZC9nby9pbnRlcm5hbC93b3JrL2V4ZWMu
Z28KLWluZGV4IGNkZTg2N2IuLmUzY2UxN2QgMTAwNjQ0CitpbmRleCA1NDRkZjQ2Li5jOGYyOTdj
IDEwMDY0NAogLS0tIGEvc3JjL2NtZC9nby9pbnRlcm5hbC93b3JrL2V4ZWMuZ28KICsrKyBiL3Ny
Yy9jbWQvZ28vaW50ZXJuYWwvd29yay9leGVjLmdvCi1AQCAtMTM1OCw2ICsxMzU4LDI5IEBAIGZ1
bmMgKGIgKkJ1aWxkZXIpIGxpbmtBY3Rpb25JRChhICpBY3Rpb24pIGNhY2hlLkFjdGlvbklEIHsK
K0BAIC0xNDAxLDYgKzE0MDEsMjkgQEAgZnVuYyAoYiAqQnVpbGRlcikgbGlua0FjdGlvbklEKGEg
KkFjdGlvbikgY2FjaGUuQWN0aW9uSUQgewogIAlyZXR1cm4gaC5TdW0oKQogIH0KICAKQEAgLTQ3
LDcgKzQ3LDcgQEAgaW5kZXggY2RlODY3Yi4uZTNjZTE3ZCAxMDA2NDQKICAvLyBwcmludExpbmtl
ckNvbmZpZyBwcmludHMgdGhlIGxpbmtlciBjb25maWcgaW50byB0aGUgaGFzaCBoLAogIC8vIGFz
IHBhcnQgb2YgdGhlIGNvbXB1dGF0aW9uIG9mIGEgbGlua2VyLXJlbGF0ZWQgYWN0aW9uIElELgog
IGZ1bmMgKGIgKkJ1aWxkZXIpIHByaW50TGlua2VyQ29uZmlnKGggaW8uV3JpdGVyLCBwICpsb2Fk
LlBhY2thZ2UpIHsKLUBAIC0xMzY4LDcgKzEzOTEsNyBAQCBmdW5jIChiICpCdWlsZGVyKSBwcmlu
dExpbmtlckNvbmZpZyhoIGlvLldyaXRlciwgcCAqbG9hZC5QYWNrYWdlKSB7CitAQCAtMTQxMSw3
ICsxNDM0LDcgQEAgZnVuYyAoYiAqQnVpbGRlcikgcHJpbnRMaW5rZXJDb25maWcoaCBpby5Xcml0
ZXIsIHAgKmxvYWQuUGFja2FnZSkgewogIAljYXNlICJnYyI6CiAgCQlmbXQuRnByaW50ZihoLCAi
bGluayAlcyAlcSAlc1xuIiwgYi50b29sSUQoImxpbmsiKSwgZm9yY2VkTGRmbGFncywgbGRCdWls
ZG1vZGUpCiAgCQlpZiBwICE9IG5pbCB7CkBAIC01Niw2ICs1NiwzIEBAIGluZGV4IGNkZTg2N2Iu
LmUzY2UxN2QgMTAwNjQ0CiAgCQl9CiAgCiAgCQkvLyBHT0FSTSwgR09NSVBTLCBldGMuCi0tLSAK
LTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwOC1z
cmMtY21kLWRpc3QtYnVpbGRnby5nby1kby1ub3QtaGFyZGNvZGUtaG9zdC1jb21waWxlLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDgtc3JjLWNtZC1kaXN0LWJ1aWxkZ28u
Z28tZG8tbm90LWhhcmRjb2RlLWhvc3QtY29tcGlsZS5wYXRjaAppbmRleCAwNjYyZjY2YWY1Li45
ODJhOGRjMzI4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwOC1z
cmMtY21kLWRpc3QtYnVpbGRnby5nby1kby1ub3QtaGFyZGNvZGUtaG9zdC1jb21waWxlLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDA4LXNyYy1jbWQtZGlzdC1idWls
ZGdvLmdvLWRvLW5vdC1oYXJkY29kZS1ob3N0LWNvbXBpbGUucGF0Y2gKQEAgLTEsOCArMSw4IEBA
Ci1Gcm9tIGUwOTk5OTAyNjg3ZTJlMzk0NDk5ZjcxNTNkYjhkNjI0NDBjNGRhYjAgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDc3MmE0NmU0MjdkNTkwZWZkYmUwYjVkZTMzNWQ5N2VhZjc3
MGRkYTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMTAgTm92IDIwMjAgMTY6MzM6Mjcg
KzAwMDAKLVN1YmplY3Q6IFtQQVRDSCA4LzldIHNyYy9jbWQvZGlzdC9idWlsZGdvLmdvOiBkbyBu
b3QgaGFyZGNvZGUgaG9zdCBjb21waWxlcnMKLSBpbnRvIHRhcmdldCBiaW5hcmllcworU3ViamVj
dDogW1BBVENIXSBzcmMvY21kL2Rpc3QvYnVpbGRnby5nbzogZG8gbm90IGhhcmRjb2RlIGhvc3Qg
Y29tcGlsZXJzIGludG8KKyB0YXJnZXQgYmluYXJpZXMKIAogVGhlc2UgY29tZSBmcm9tICRDQy8k
Q1hYIG9uIHRoZSBidWlsZCBob3N0IGFuZCBhcmUgbm90IHVzZWZ1bCBvbiB0YXJnZXRzOwogYWRk
aXRpb25hbGx5IGFzIHRoZXkgY29udGFpbiBob3N0IHNwZWNpZmljIHBhdGhzLCB0aGlzIGhlbHBz
IHJlcHJvZHVjaWJpbGl0eS4KQEAgLTE2LDcgKzE2LDcgQEAgU2lnbmVkLW9mZi1ieTogSm9zZSBR
dWFyZXNtYSA8am9zZS5xdWFyZXNtYUBmb3VuZHJpZXMuaW8+CiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9jbWQvZGlz
dC9idWlsZGdvLmdvIGIvc3JjL2NtZC9kaXN0L2J1aWxkZ28uZ28KLWluZGV4IDg4NGU5ZDcyOWEu
LjJmNTJlZGFjZmUgMTAwNjQ0CitpbmRleCA4ODRlOWQ3Li4yZjUyZWRhIDEwMDY0NAogLS0tIGEv
c3JjL2NtZC9kaXN0L2J1aWxkZ28uZ28KICsrKyBiL3NyYy9jbWQvZGlzdC9idWlsZGdvLmdvCiBA
QCAtNTEsOCArNTEsOCBAQCBmdW5jIG1remRlZmF1bHRjYyhkaXIsIGZpbGUgc3RyaW5nKSB7CkBA
IC00MSw2ICs0MSwzIEBAIGluZGV4IDg4NGU5ZDcyOWEuLjJmNTJlZGFjZmUgMTAwNjQ0CiAgCXdy
aXRlZmlsZShidWYuU3RyaW5nKCksIGZpbGUsIHdyaXRlU2tpcFNhbWUpCiAgfQogIAotLS0gCi0y
LjQ0LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDktZ28t
RmlsdGVyLWJ1aWxkLXBhdGhzLW9uLXN0YXRpY2x5LWxpbmtlZC1hcmNoZXMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwOS1nby1GaWx0ZXItYnVpbGQtcGF0aHMtb24tc3Rh
dGljbHktbGlua2VkLWFyY2hlcy5wYXRjaAppbmRleCBjYzQ1NDk2ZTljLi4yZTVlNTc0ODBmIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwOS1nby1GaWx0ZXItYnVp
bGQtcGF0aHMtb24tc3RhdGljbHktbGlua2VkLWFyY2hlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ28vZ28vMDAwOS1nby1GaWx0ZXItYnVpbGQtcGF0aHMtb24tc3RhdGljbHkt
bGlua2VkLWFyY2hlcy5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gNmMyNDM4ZjE4N2NhOTEy
YzU0YTcxYjRhYzY1YWI5ODk5OWEwMTlkMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
NmE0M2NlMzUxYzI5N2ExY2RhMmM2OWU3ODZjZjQ2ZmE5NDdkZDdjNCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPgogRGF0ZTogU2F0LCAyIEp1bCAyMDIyIDIzOjA4OjEzICswMTAwCi1TdWJqZWN0
OiBbUEFUQ0ggOS85XSBnbzogRmlsdGVyIGJ1aWxkIHBhdGhzIG9uIHN0YXRpY2x5IGxpbmtlZCBh
cmNoZXMKK1N1YmplY3Q6IFtQQVRDSF0gZ286IEZpbHRlciBidWlsZCBwYXRocyBvbiBzdGF0aWNs
eSBsaW5rZWQgYXJjaGVzCiAKIEZpbHRlciBvdXQgYnVpbGQgdGltZSBwYXRocyBmcm9tIGxkZmxh
Z3MgYW5kIG90aGVyIGZsYWdzIHZhcmlhYmxlcyB3aGVuIHRoZXkncmUKIGVtYmVkZGVkIGluIHRo
ZSBnbyBiaW5hcnkgc28gdGhhdCBidWlsZHMgYXJlIHJlcHJvZHVjaWJsZSByZWdhcmRsZXNzIG9m
IGJ1aWxkCkBAIC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IEpvc2UgUXVhcmVzbWEgPGpv
c2UucXVhcmVzbWFAZm91bmRyaWVzLmlvPgogIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2NtZC9nby9pbnRlcm5hbC9s
b2FkL3BrZy5nbyBiL3NyYy9jbWQvZ28vaW50ZXJuYWwvbG9hZC9wa2cuZ28KLWluZGV4IDE1NDk4
MDBhZmIuLmY0MWZiMmM0ZWYgMTAwNjQ0CitpbmRleCAxNTQ5ODAwLi5mNDFmYjJjIDEwMDY0NAog
LS0tIGEvc3JjL2NtZC9nby9pbnRlcm5hbC9sb2FkL3BrZy5nbwogKysrIGIvc3JjL2NtZC9nby9p
bnRlcm5hbC9sb2FkL3BrZy5nbwogQEAgLTIyNzcsNiArMjI3NywxNyBAQCBmdW5jIGFwcGVuZEJ1
aWxkU2V0dGluZyhpbmZvICpkZWJ1Zy5CdWlsZEluZm8sIGtleSwgdmFsdWUgc3RyaW5nKSB7CkBA
IC01Niw2ICs1NiwzIEBAIGluZGV4IDE1NDk4MDBhZmIuLmY0MWZiMmM0ZWYgMTAwNjQ0CiAgCQl9
CiAgCX0KICAJYXBwZW5kU2V0dGluZygiR09BUkNIIiwgY2ZnLkJ1aWxkQ29udGV4dC5HT0FSQ0gp
Ci0tLSAKLTIuNDQuMAotCi0tIAoyLjQ0LjAKCg==

--===============2040942956209320859==--

