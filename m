Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FF4C54E7A
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1240.1710522011881733326
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AKAa8V5c;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3G9wX8Z4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018e430e8bcc-50c197e9-bea5-4493-8a55-bf1ecb4dd4df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OaSCfoAzGcSXHdeMQIxUaUN99HfUf/4QHUW/5qKuKGw=;
	b=AKAa8V5cN2BB9im/NtvAzKWmlRBffWrHL9bgAeWJ5QmkWJDMDornqegbp5FiYGTF
	YF8s+9JyjGhH35ZtiDAynMgQaBi5+0FOqow59i1gvmmzjCvUHdyGJE8zo6h5CftB7sq
	pwByYBMCXD1bFPs+WUK9qFFY12hPe52cHx24wjAI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OaSCfoAzGcSXHdeMQIxUaUN99HfUf/4QHUW/5qKuKGw=;
	b=3G9wX8Z4rd8B5yRp7AuyTawRNwPfsnFEPOCzzuMjneMbW0+S59FKnvL5Zt9vWW63
	ZgwSgiwnjvnSjwc5f37pr1zhaEKW+CGgQruhuoZ/N4KP83TbWfSDbgkCHwBj7RYYTB8
	0ZIbPsgMC6uWar9reuh7jj2tO3ycX4/KVnZOQirY=
Content-Type: multipart/mixed; boundary="===============7790507378997100161=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-runtime: upgrading to 1.22.1 FAILED
Message-ID: <0101018e430e8bcc-50c197e9-bea5-4493-8a55-bf1ecb4dd4df-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197167

--===============7790507378997100161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-runtime* to *1.22.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-runtime-upgrade-1.22.0-1.22.1.patch
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
From 045553a4fa74a0bdd6ed627818b0f0684e44c262 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 06:02:34 +0000
Subject: [PATCH] go-runtime: upgrade 1.22.0 -> 1.22.1

---
 .../go/{go-1.22.0.inc => go-1.22.1.inc}             |  2 +-
 .../{go-runtime_1.22.0.bb => go-runtime_1.22.1.bb}  |  0
 ...e-content-based-hash-generation-less-pedan.patch | 11 ++++-------
 ...lter-out-build-specific-paths-from-linker-.patch | 11 ++++-------
 ...ow-GOTOOLDIR-to-be-overridden-in-the-envir.patch | 12 ++++--------
 .../0003-ld-add-soname-to-shareable-objects.patch   |  9 +++------
 ...override-CC-when-building-dist-and-go_boot.patch | 10 +++-------
 ...5-cmd-dist-separate-host-and-target-builds.patch |  9 +++------
 ...006-cmd-go-make-GOROOT-precious-by-default.patch | 13 +++++--------
 ...st-buildgo.go-do-not-hardcode-host-compile.patch | 11 ++++-------
 ...lter-build-paths-on-staticly-linked-arches.patch |  9 +++------
 11 files changed, 34 insertions(+), 63 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.0.inc => go-1.22.1.inc} (89%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.0.bb => go-runtime_1.22.1.bb} (100%)

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
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.0.bb b/meta/recipes-devtools/go/go-runtime_1.22.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.0.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.1.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 564837c7cd..db36f2f726 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -1,7 +1,7 @@
-From 9a6c5040cbcd88b10ceb8ceaebc8d6158c086670 Mon Sep 17 00:00:00 2001
+From c896624aa46760ffcaf2b432f15e4a6a35768115 Mon Sep 17 00:00:00 2001
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
index c5bf28f54a..0d9606cd47 100644
--- a/meta/recipes-devtools/go/go/0001-exec.go-filter-out-build-specific-paths-from-linker-.patch
+++ b/meta/recipes-devtools/go/go/0001-exec.go-filter-out-build-specific-paths-from-linker-.patch
@@ -1,4 +1,4 @@
-From 083b5c74b12a1abeb11dd7f58a1cb1593d0000c0 Mon Sep 17 00:00:00 2001
+From dcd60d2349745e48f9d65d47b9e758231e29f352 Mon Sep 17 00:00:00 2001
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
index 001c94a4e7..f60f3992d2 100644
--- a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
+++ b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
@@ -1,8 +1,7 @@
-From e3f9a8a69d3a340c1a1d0bba566e71f20f635a43 Mon Sep 17 00:00:00 2001
+From dffcebec4da5eec22fc1bd7885d604d2dc0a800b Mon Sep 17 00:00:00 2001
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
index 9cab2969c8..3a3efbc8d2 100644
--- a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
@@ -1,7 +1,7 @@
-From 7dde77b3ce8138314dd2736604b1b110dbcc0ac1 Mon Sep 17 00:00:00 2001
+From e56a1a2b4af43a4ce8563829a924831ba1ff1c89 Mon Sep 17 00:00:00 2001
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
index 8889aef1cf..566de37933 100644
--- a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -1,8 +1,7 @@
-From 9f59e46991074d3e3c4d00f3971e62bfcd707167 Mon Sep 17 00:00:00 2001
+From 0b6e3411562fe236f9f01cd070b6c32382dfab39 Mon Sep 17 00:00:00 2001
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
index 364fce907a..7fa3f82730 100644
--- a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
@@ -1,7 +1,7 @@
-From 6dda78d528e60993a4688cd9d49440a726378ac8 Mon Sep 17 00:00:00 2001
+From cb4c5e79f5a5833d746711fc6e12fc21704b2669 Mon Sep 17 00:00:00 2001
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
index 262f1e96b8..0b2773410e 100644
--- a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
@@ -1,7 +1,7 @@
-From aff5a740d6286c04beb0593fc68b0aea5a95ad39 Mon Sep 17 00:00:00 2001
+From cbb374bcead3e21dbb74c8115f58c42769927063 Mon Sep 17 00:00:00 2001
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
index 0662f66af5..6abf1a1165 100644
--- a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
+++ b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
@@ -1,8 +1,8 @@
-From e0999902687e2e394499f7153db8d62440c4dab0 Mon Sep 17 00:00:00 2001
+From f3744a3ee2bcc546d664c1520c0ac6300a17765e Mon Sep 17 00:00:00 2001
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
index cc45496e9c..4e0f1d3cc0 100644
--- a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
+++ b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
@@ -1,7 +1,7 @@
-From 6c2438f187ca912c54a71b4ac65ab98999a019d2 Mon Sep 17 00:00:00 2001
+From 5e32c6edc03f094b3ebf969032cb2eb6b47ba88c Mon Sep 17 00:00:00 2001
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
2.42.0


--===============7790507378997100161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-cross_1.22.0.bb:2: Could not include required file go-1.22.0.inc
ERROR: Parsing halted due to errors, see error messages above

--===============7790507378997100161==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-runtime-upgrade-1.22.0-1.22.1.patch"

RnJvbSAwNDU1NTNhNGZhNzRhMGJkZDZlZDYyNzgxOGIwZjA2ODRlNDRjMjYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDY6MDI6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
by1ydW50aW1lOiB1cGdyYWRlIDEuMjIuMCAtPiAxLjIyLjEKCi0tLQogLi4uL2dvL3tnby0xLjIy
LjAuaW5jID0+IGdvLTEuMjIuMS5pbmN9ICAgICAgICAgICAgIHwgIDIgKy0KIC4uLi97Z28tcnVu
dGltZV8xLjIyLjAuYmIgPT4gZ28tcnVudGltZV8xLjIyLjEuYmJ9ICB8ICAwCiAuLi5lLWNvbnRl
bnQtYmFzZWQtaGFzaC1nZW5lcmF0aW9uLWxlc3MtcGVkYW4ucGF0Y2ggfCAxMSArKysrLS0tLS0t
LQogLi4ubHRlci1vdXQtYnVpbGQtc3BlY2lmaWMtcGF0aHMtZnJvbS1saW5rZXItLnBhdGNoIHwg
MTEgKysrKy0tLS0tLS0KIC4uLm93LUdPVE9PTERJUi10by1iZS1vdmVycmlkZGVuLWluLXRoZS1l
bnZpci5wYXRjaCB8IDEyICsrKystLS0tLS0tLQogLi4uLzAwMDMtbGQtYWRkLXNvbmFtZS10by1z
aGFyZWFibGUtb2JqZWN0cy5wYXRjaCAgIHwgIDkgKysrLS0tLS0tCiAuLi5vdmVycmlkZS1DQy13
aGVuLWJ1aWxkaW5nLWRpc3QtYW5kLWdvX2Jvb3QucGF0Y2ggfCAxMCArKystLS0tLS0tCiAuLi41
LWNtZC1kaXN0LXNlcGFyYXRlLWhvc3QtYW5kLXRhcmdldC1idWlsZHMucGF0Y2ggfCAgOSArKyst
LS0tLS0KIC4uLjAwNi1jbWQtZ28tbWFrZS1HT1JPT1QtcHJlY2lvdXMtYnktZGVmYXVsdC5wYXRj
aCB8IDEzICsrKysrLS0tLS0tLS0KIC4uLnN0LWJ1aWxkZ28uZ28tZG8tbm90LWhhcmRjb2RlLWhv
c3QtY29tcGlsZS5wYXRjaCB8IDExICsrKystLS0tLS0tCiAuLi5sdGVyLWJ1aWxkLXBhdGhzLW9u
LXN0YXRpY2x5LWxpbmtlZC1hcmNoZXMucGF0Y2ggfCAgOSArKystLS0tLS0KIDExIGZpbGVzIGNo
YW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDYzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9nby97Z28tMS4yMi4wLmluYyA9PiBnby0xLjIyLjEuaW5jfSAoODklKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tcnVudGltZV8xLjIyLjAuYmIgPT4g
Z28tcnVudGltZV8xLjIyLjEuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nby9nby0xLjIyLjAuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEu
MjIuMS5pbmMKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dvL2dvLTEuMjIuMC5pbmMKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9n
by9nby0xLjIyLjEuaW5jCmluZGV4IDViOTQwNTFmYzIuLjQzMzA4NTM0NTAgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjIyLjAuaW5jCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9nby9nby0xLjIyLjEuaW5jCkBAIC0xNSw0ICsxNSw0IEBAIFNSQ19VUkkgKz0g
IlwKICAgICBmaWxlOi8vMDAwOS1nby1GaWx0ZXItYnVpbGQtcGF0aHMtb24tc3RhdGljbHktbGlu
a2VkLWFyY2hlcy5wYXRjaCBcCiAgICAgZmlsZTovLzAwMDEtZXhlYy5nby1maWx0ZXItb3V0LWJ1
aWxkLXNwZWNpZmljLXBhdGhzLWZyb20tbGlua2VyLS5wYXRjaCBcCiAiCi1TUkNfVVJJW21haW4u
c2hhMjU2c3VtXSA9ICI0ZDE5NmMzZDQxYTBkNmMxZGZjNjRkMDRlM2NjMWY2MDhiMGM0MzZiZDg3
YjcwNjBjZTNlMjMyMzRlMWY0ZDVjIgorU1JDX1VSSVttYWluLnNoYTI1NnN1bV0gPSAiNzljOWI5
MWQ3ZjEwOTUxNWEyNWZjM2VjZGFhZDEyNWQ2N2U2YmRiNTRmNmQ0ZDk4NTgwZjQ2Nzk5Y2FlYTMy
MSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1ydW50aW1lXzEuMjIu
MC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1ydW50aW1lXzEuMjIuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dv
LXJ1bnRpbWVfMS4yMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28t
cnVudGltZV8xLjIyLjEuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9n
by8wMDAxLWNtZC1nby1tYWtlLWNvbnRlbnQtYmFzZWQtaGFzaC1nZW5lcmF0aW9uLWxlc3MtcGVk
YW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwMS1jbWQtZ28tbWFrZS1j
b250ZW50LWJhc2VkLWhhc2gtZ2VuZXJhdGlvbi1sZXNzLXBlZGFuLnBhdGNoCmluZGV4IDU2NDgz
N2M3Y2QuLmRiMzZmMmY3MjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9n
by8wMDAxLWNtZC1nby1tYWtlLWNvbnRlbnQtYmFzZWQtaGFzaC1nZW5lcmF0aW9uLWxlc3MtcGVk
YW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDEtY21kLWdvLW1h
a2UtY29udGVudC1iYXNlZC1oYXNoLWdlbmVyYXRpb24tbGVzcy1wZWRhbi5wYXRjaApAQCAtMSw3
ICsxLDcgQEAKLUZyb20gOWE2YzUwNDBjYmNkODhiMTBjZWI4Y2VhZWJjOGQ2MTU4YzA4NjY3MCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzg5NjYyNGFhNDY3NjBmZmNhZjJiNDMyZjE1
ZTRhNmEzNTc2ODExNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxy
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
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDAxLWV4ZWMuZ28tZmlsdGVyLW91dC1idWls
ZC1zcGVjaWZpYy1wYXRocy1mcm9tLWxpbmtlci0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ28vZ28vMDAwMS1leGVjLmdvLWZpbHRlci1vdXQtYnVpbGQtc3BlY2lmaWMtcGF0aHMtZnJv
bS1saW5rZXItLnBhdGNoCmluZGV4IGM1YmYyOGY1NGEuLjBkOTYwNmNkNDcgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDAxLWV4ZWMuZ28tZmlsdGVyLW91dC1idWls
ZC1zcGVjaWZpYy1wYXRocy1mcm9tLWxpbmtlci0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dvL2dvLzAwMDEtZXhlYy5nby1maWx0ZXItb3V0LWJ1aWxkLXNwZWNpZmljLXBhdGhz
LWZyb20tbGlua2VyLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDgzYjVjNzRiMTJhMWFi
ZWIxMWRkN2Y1OGExY2IxNTkzZDAwMDBjMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
ZGNkNjBkMjM0OTc0NWU0OGY5ZDY1ZDQ3YjllNzU4MjMxZTI5ZjM1MiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBUdWUsIDI3IEZlYiAyMDI0IDE4OjA2OjUxICswODAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGV4ZWMuZ286IGZpbHRlciBvdXQgYnVpbGQtc3BlY2lmaWMgcGF0aHMgZnJvbSBsaW5rZXIgZmxh
Z3MKQEAgLTE0LDEwICsxNCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBDaGFuZ3FpbmcgTGkgPGNoYW5n
cWluZy5saUB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvY21kL2dvL2ludGVybmFsL3dvcmsv
ZXhlYy5nbyBiL3NyYy9jbWQvZ28vaW50ZXJuYWwvd29yay9leGVjLmdvCi1pbmRleCBjZGU4Njdi
Li5lM2NlMTdkIDEwMDY0NAoraW5kZXggNTQ0ZGY0Ni4uYzhmMjk3YyAxMDA2NDQKIC0tLSBhL3Ny
Yy9jbWQvZ28vaW50ZXJuYWwvd29yay9leGVjLmdvCiArKysgYi9zcmMvY21kL2dvL2ludGVybmFs
L3dvcmsvZXhlYy5nbwotQEAgLTEzNTgsNiArMTM1OCwyOSBAQCBmdW5jIChiICpCdWlsZGVyKSBs
aW5rQWN0aW9uSUQoYSAqQWN0aW9uKSBjYWNoZS5BY3Rpb25JRCB7CitAQCAtMTQwMSw2ICsxNDAx
LDI5IEBAIGZ1bmMgKGIgKkJ1aWxkZXIpIGxpbmtBY3Rpb25JRChhICpBY3Rpb24pIGNhY2hlLkFj
dGlvbklEIHsKICAJcmV0dXJuIGguU3VtKCkKICB9CiAgCkBAIC00Nyw3ICs0Nyw3IEBAIGluZGV4
IGNkZTg2N2IuLmUzY2UxN2QgMTAwNjQ0CiAgLy8gcHJpbnRMaW5rZXJDb25maWcgcHJpbnRzIHRo
ZSBsaW5rZXIgY29uZmlnIGludG8gdGhlIGhhc2ggaCwKICAvLyBhcyBwYXJ0IG9mIHRoZSBjb21w
dXRhdGlvbiBvZiBhIGxpbmtlci1yZWxhdGVkIGFjdGlvbiBJRC4KICBmdW5jIChiICpCdWlsZGVy
KSBwcmludExpbmtlckNvbmZpZyhoIGlvLldyaXRlciwgcCAqbG9hZC5QYWNrYWdlKSB7Ci1AQCAt
MTM2OCw3ICsxMzkxLDcgQEAgZnVuYyAoYiAqQnVpbGRlcikgcHJpbnRMaW5rZXJDb25maWcoaCBp
by5Xcml0ZXIsIHAgKmxvYWQuUGFja2FnZSkgeworQEAgLTE0MTEsNyArMTQzNCw3IEBAIGZ1bmMg
KGIgKkJ1aWxkZXIpIHByaW50TGlua2VyQ29uZmlnKGggaW8uV3JpdGVyLCBwICpsb2FkLlBhY2th
Z2UpIHsKICAJY2FzZSAiZ2MiOgogIAkJZm10LkZwcmludGYoaCwgImxpbmsgJXMgJXEgJXNcbiIs
IGIudG9vbElEKCJsaW5rIiksIGZvcmNlZExkZmxhZ3MsIGxkQnVpbGRtb2RlKQogIAkJaWYgcCAh
PSBuaWwgewpAQCAtNTYsNiArNTYsMyBAQCBpbmRleCBjZGU4NjdiLi5lM2NlMTdkIDEwMDY0NAog
IAkJfQogIAogIAkJLy8gR09BUk0sIEdPTUlQUywgZXRjLgotLS0gCi0yLjI1LjEKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDItY21kLWdvLUFsbG93LUdPVE9P
TERJUi10by1iZS1vdmVycmlkZGVuLWluLXRoZS1lbnZpci5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nby9nby8wMDAyLWNtZC1nby1BbGxvdy1HT1RPT0xESVItdG8tYmUtb3ZlcnJpZGRl
bi1pbi10aGUtZW52aXIucGF0Y2gKaW5kZXggMDAxYzk0YTRlNy4uZjYwZjM5OTJkMiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDItY21kLWdvLUFsbG93LUdPVE9P
TERJUi10by1iZS1vdmVycmlkZGVuLWluLXRoZS1lbnZpci5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ28vZ28vMDAwMi1jbWQtZ28tQWxsb3ctR09UT09MRElSLXRvLWJlLW92ZXJy
aWRkZW4taW4tdGhlLWVudmlyLnBhdGNoCkBAIC0xLDggKzEsNyBAQAotRnJvbSBlM2Y5YThhNjlk
M2EzNDBjMWExZDBiYmE1NjZlNzFmMjBmNjM1YTQzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBkZmZjZWJlYzRkYTVlZWMyMmZjMWJkNzg4NWQ2MDRkMmRjMGE4MDBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQWxleCBLdWJlIDxhbGV4YW5kZXIuai5rdWJlQGdtYWlsLmNv
bT4KIERhdGU6IFdlZCwgMjMgT2N0IDIwMTkgMjE6MTU6MzcgKzA0MzAKLVN1YmplY3Q6IFtQQVRD
SCAyLzldIGNtZC9nbzogQWxsb3cgR09UT09MRElSIHRvIGJlIG92ZXJyaWRkZW4gaW4gdGhlCi0g
ZW52aXJvbm1lbnQKK1N1YmplY3Q6IFtQQVRDSF0gY21kL2dvOiBBbGxvdyBHT1RPT0xESVIgdG8g
YmUgb3ZlcnJpZGRlbiBpbiB0aGUgZW52aXJvbm1lbnQKIAogdG8gYWxsb3cgZm9yIHNwbGl0IGhv
c3QvdGFyZ2V0IGJ1aWxkIHJvb3RzCiAKQEAgLTIwLDcgKzE5LDcgQEAgU2lnbmVkLW9mZi1ieTog
Sm9zZSBRdWFyZXNtYSA8am9zZS5xdWFyZXNtYUBmb3VuZHJpZXMuaW8+CiAgMiBmaWxlcyBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMv
Y21kL2Rpc3QvYnVpbGQuZ28gYi9zcmMvY21kL2Rpc3QvYnVpbGQuZ28KLWluZGV4IDMyZTU5YjQ0
NmEuLjA2ZWU0ZGU4YTkgMTAwNjQ0CitpbmRleCAzMmU1OWI0Li4wNmVlNGRlIDEwMDY0NAogLS0t
IGEvc3JjL2NtZC9kaXN0L2J1aWxkLmdvCiArKysgYi9zcmMvY21kL2Rpc3QvYnVpbGQuZ28KIEBA
IC0yNTksNyArMjU5LDkgQEAgZnVuYyB4aW5pdCgpIHsKQEAgLTM1LDcgKzM0LDcgQEAgaW5kZXgg
MzJlNTliNDQ2YS4uMDZlZTRkZThhOSAxMDA2NDQKICAJZ292ZXJzaW9uIDo9IGZpbmRnb3ZlcnNp
b24oKQogIAlpc1JlbGVhc2UgPSBzdHJpbmdzLkhhc1ByZWZpeChnb3ZlcnNpb24sICJyZWxlYXNl
LiIpIHx8IHN0cmluZ3MuSGFzUHJlZml4KGdvdmVyc2lvbiwgImdvIikKIGRpZmYgLS1naXQgYS9z
cmMvY21kL2dvL2ludGVybmFsL2NmZy9jZmcuZ28gYi9zcmMvY21kL2dvL2ludGVybmFsL2NmZy9j
ZmcuZ28KLWluZGV4IGE4ZGFhMmRmYzMuLjM5M2FkYTM5YzkgMTAwNjQ0CitpbmRleCBhOGRhYTJk
Li4zOTNhZGEzIDEwMDY0NAogLS0tIGEvc3JjL2NtZC9nby9pbnRlcm5hbC9jZmcvY2ZnLmdvCiAr
KysgYi9zcmMvY21kL2dvL2ludGVybmFsL2NmZy9jZmcuZ28KIEBAIC0yMzAsNyArMjMwLDExIEBA
IGZ1bmMgU2V0R09ST09UKGdvcm9vdCBzdHJpbmcsIGlzVGVzdEdvIGJvb2wpIHsKQEAgLTUxLDYg
KzUwLDMgQEAgaW5kZXggYThkYWEyZGZjMy4uMzkzYWRhMzljOSAxMDA2NDQKICAJCX0KICAJfQog
IH0KLS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9n
by8wMDAzLWxkLWFkZC1zb25hbWUtdG8tc2hhcmVhYmxlLW9iamVjdHMucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwMy1sZC1hZGQtc29uYW1lLXRvLXNoYXJlYWJsZS1vYmpl
Y3RzLnBhdGNoCmluZGV4IDljYWIyOTY5YzguLjNhM2VmYmM4ZDIgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDAzLWxkLWFkZC1zb25hbWUtdG8tc2hhcmVhYmxlLW9i
amVjdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDMtbGQtYWRk
LXNvbmFtZS10by1zaGFyZWFibGUtb2JqZWN0cy5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20g
N2RkZTc3YjNjZTgxMzgzMTRkZDI3MzY2MDRiMWIxMTBkYmNjMGFjMSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gZTU2YTFhMmI0YWY0M2E0Y2U4NTYzODI5YTkyNDgzMWJhMWZmMWM4OSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXggS3ViZSA8YWxleGFuZGVyLmoua3Vi
ZUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDIzIE9jdCAyMDE5IDIxOjE2OjMyICswNDMwCi1TdWJq
ZWN0OiBbUEFUQ0ggMy85XSBsZDogYWRkIHNvbmFtZSB0byBzaGFyZWFibGUgb2JqZWN0cworU3Vi
amVjdDogW1BBVENIXSBsZDogYWRkIHNvbmFtZSB0byBzaGFyZWFibGUgb2JqZWN0cwogCiBzbyB0
aGF0IE9FJ3Mgc2hhcmVkIGxpYnJhcnkgZGVwZW5kZW5jeSBoYW5kbGluZwogY2FuIGZpbmQgdGhl
bS4KQEAgLTE5LDcgKzE5LDcgQEAgU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8am9zZS5x
dWFyZXNtYUBmb3VuZHJpZXMuaW8+CiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQog
CiBkaWZmIC0tZ2l0IGEvc3JjL2NtZC9saW5rL2ludGVybmFsL2xkL2xpYi5nbyBiL3NyYy9jbWQv
bGluay9pbnRlcm5hbC9sZC9saWIuZ28KLWluZGV4IGVhYjc0ZGMzMjguLmFlOWJiYzkwOTMgMTAw
NjQ0CitpbmRleCBlYWI3NGRjLi5hZTliYmM5IDEwMDY0NAogLS0tIGEvc3JjL2NtZC9saW5rL2lu
dGVybmFsL2xkL2xpYi5nbwogKysrIGIvc3JjL2NtZC9saW5rL2ludGVybmFsL2xkL2xpYi5nbwog
QEAgLTE1NzYsNiArMTU3Niw3IEBAIGZ1bmMgKGN0eHQgKkxpbmspIGhvc3RsaW5rKCkgewpAQCAt
NDYsNiArNDYsMyBAQCBpbmRleCBlYWI3NGRjMzI4Li5hZTliYmM5MDkzIDEwMDY0NAogIAkJfQog
IAl9CiAgCi0tLSAKLTIuNDQuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z28vZ28vMDAwNC1tYWtlLmJhc2gtb3ZlcnJpZGUtQ0Mtd2hlbi1idWlsZGluZy1kaXN0LWFuZC1n
b19ib290LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDQtbWFrZS5iYXNo
LW92ZXJyaWRlLUNDLXdoZW4tYnVpbGRpbmctZGlzdC1hbmQtZ29fYm9vdC5wYXRjaAppbmRleCA4
ODg5YWVmMWNmLi41NjZkZTM3OTMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z28vZ28vMDAwNC1tYWtlLmJhc2gtb3ZlcnJpZGUtQ0Mtd2hlbi1idWlsZGluZy1kaXN0LWFuZC1n
b19ib290LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDA0LW1ha2Uu
YmFzaC1vdmVycmlkZS1DQy13aGVuLWJ1aWxkaW5nLWRpc3QtYW5kLWdvX2Jvb3QucGF0Y2gKQEAg
LTEsOCArMSw3IEBACi1Gcm9tIDlmNTllNDY5OTEwNzRkM2UzYzRkMDBmMzk3MWU2MmJmY2Q3MDcx
NjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDBiNmUzNDExNTYyZmUyMzZmOWYwMWNk
MDcwYjZjMzIzODJkZmFiMzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4IEt1
YmUgPGFsZXhhbmRlci5qLmt1YmVAZ21haWwuY29tPgogRGF0ZTogV2VkLCAyMyBPY3QgMjAxOSAy
MToxNzoxNiArMDQzMAotU3ViamVjdDogW1BBVENIIDQvOV0gbWFrZS5iYXNoOiBvdmVycmlkZSBD
QyB3aGVuIGJ1aWxkaW5nIGRpc3QgYW5kCi0gZ29fYm9vdHN0cmFwCitTdWJqZWN0OiBbUEFUQ0hd
IG1ha2UuYmFzaDogb3ZlcnJpZGUgQ0Mgd2hlbiBidWlsZGluZyBkaXN0IGFuZCBnb19ib290c3Ry
YXAKIAogZm9yIGhhbmRsaW5nIE9FIGNyb3NzLWNhbmFkaWFuIGJ1aWxkcy4KIApAQCAtMTksNyAr
MTgsNyBAQCBTaWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJlc21hIDxqb3NlLnF1YXJlc21hQGZvdW5k
cmllcy5pbz4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQogCiBkaWZmIC0tZ2l0IGEvc3JjL21ha2UuYmFzaCBiL3NyYy9tYWtlLmJhc2gKLWluZGV4IDc2
YWQ1MTYyNGEuLjA3NGUxMjlhMjQgMTAwNzU1CitpbmRleCA3NmFkNTE2Li4wNzRlMTI5IDEwMDc1
NQogLS0tIGEvc3JjL21ha2UuYmFzaAogKysrIGIvc3JjL21ha2UuYmFzaAogQEAgLTE5OCw3ICsx
OTgsNyBAQCBpZiBbWyAiJEdPUk9PVF9CT09UU1RSQVAiID09ICIkR09ST09UIiBdXTsgdGhlbgpA
QCAtNDAsNiArMzksMyBAQCBpbmRleCA3NmFkNTE2MjRhLi4wNzRlMTI5YTI0IDEwMDc1NQogIHJt
IC1mIC4vY21kL2Rpc3QvZGlzdAogIAogICMgRE8gTk9UIEFERCBBTlkgTkVXIENPREUgSEVSRS4K
LS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8w
MDA1LWNtZC1kaXN0LXNlcGFyYXRlLWhvc3QtYW5kLXRhcmdldC1idWlsZHMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwNS1jbWQtZGlzdC1zZXBhcmF0ZS1ob3N0LWFuZC10
YXJnZXQtYnVpbGRzLnBhdGNoCmluZGV4IDM2NGZjZTkwN2EuLjdmYTNmODI3MzAgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDA1LWNtZC1kaXN0LXNlcGFyYXRlLWhv
c3QtYW5kLXRhcmdldC1idWlsZHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dv
L2dvLzAwMDUtY21kLWRpc3Qtc2VwYXJhdGUtaG9zdC1hbmQtdGFyZ2V0LWJ1aWxkcy5wYXRjaApA
QCAtMSw3ICsxLDcgQEAKLUZyb20gNmRkYTc4ZDUyOGU2MDk5M2E0Njg4Y2Q5ZDQ5NDQwYTcyNjM3
OGFjOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gY2I0YzVlNzlmNWE1ODMzZDc0Njcx
MWZjNmUxMmZjMjE3MDRiMjY2OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXgg
S3ViZSA8YWxleGFuZGVyLmoua3ViZUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDIzIE9jdCAyMDE5
IDIxOjE4OjEyICswNDMwCi1TdWJqZWN0OiBbUEFUQ0ggNS85XSBjbWQvZGlzdDogc2VwYXJhdGUg
aG9zdCBhbmQgdGFyZ2V0IGJ1aWxkcworU3ViamVjdDogW1BBVENIXSBjbWQvZGlzdDogc2VwYXJh
dGUgaG9zdCBhbmQgdGFyZ2V0IGJ1aWxkcwogCiBDaGFuZ2UgdGhlIGRpc3QgdG9vbCB0byBhbGxv
dyBmb3IgT0Utc3R5bGUgY3Jvc3MtCiBhbmQgY3Jvc3MtY2FuYWRpYW4gYnVpbGRzOgpAQCAtNDUs
NyArNDUsNyBAQCBTaWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJlc21hIDxqb3NlLnF1YXJlc21hQGZv
dW5kcmllcy5pbz4KICAxIGZpbGUgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2NtZC9kaXN0L2J1aWxkLmdvIGIvc3JjL2NtZC9kaXN0
L2J1aWxkLmdvCi1pbmRleCAwNmVlNGRlOGE5Li43NGI3YzcwOThmIDEwMDY0NAoraW5kZXggMDZl
ZTRkZS4uMDE2YjFkZCAxMDA2NDQKIC0tLSBhL3NyYy9jbWQvZGlzdC9idWlsZC5nbwogKysrIGIv
c3JjL2NtZC9kaXN0L2J1aWxkLmdvCiBAQCAtNDYsNiArNDYsNyBAQCB2YXIgKApAQCAtMjE2LDYg
KzIxNiwzIEBAIGluZGV4IDA2ZWU0ZGU4YTkuLjc0YjdjNzA5OGYgMTAwNjQ0CiAgCiAgCWlmIGdv
b3MgPT0gImFuZHJvaWQiIHsKICAJCS8vIE1ha2Ugc3VyZSB0aGUgZXhlYyB3cmFwcGVyIHdpbGwg
c3luYyBhIGZyZXNoICRHT1JPT1QgdG8gdGhlIGRldmljZS4KLS0tIAotMi40NC4wCi0KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDA2LWNtZC1nby1tYWtlLUdPUk9P
VC1wcmVjaW91cy1ieS1kZWZhdWx0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dv
LzAwMDYtY21kLWdvLW1ha2UtR09ST09ULXByZWNpb3VzLWJ5LWRlZmF1bHQucGF0Y2gKaW5kZXgg
MjYyZjFlOTZiOC4uMGIyNzczNDEwZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2dvL2dvLzAwMDYtY21kLWdvLW1ha2UtR09ST09ULXByZWNpb3VzLWJ5LWRlZmF1bHQucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDYtY21kLWdvLW1ha2UtR09ST09U
LXByZWNpb3VzLWJ5LWRlZmF1bHQucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIGFmZjVhNzQw
ZDYyODZjMDRiZWIwNTkzZmM2OGIwYWVhNWE5NWFkMzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGNiYjM3NGJjZWFkM2UyMWRiYjc0YzgxMTVmNThjNDI3Njk5MjcwNjMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4IEt1YmUgPGFsZXhhbmRlci5qLmt1YmVAZ21haWwu
Y29tPgogRGF0ZTogV2VkLCAyMyBPY3QgMjAxOSAyMToxODo1NiArMDQzMAotU3ViamVjdDogW1BB
VENIIDYvOV0gY21kL2dvOiBtYWtlIEdPUk9PVCBwcmVjaW91cyBieSBkZWZhdWx0CitTdWJqZWN0
OiBbUEFUQ0hdIGNtZC9nbzogbWFrZSBHT1JPT1QgcHJlY2lvdXMgYnkgZGVmYXVsdAogCiBUaGUg
Z28gYnVpbGQgdG9vbCBub3JtYWxseSByZWJ1aWxkcyB3aGF0ZXZlciBpdCBkZXRlY3RzIGlzCiBz
dGFsZS4gIFRoaXMgY2FuIGJlIGEgcHJvYmxlbSB3aGVuIEdPUk9PVCBpcyBpbnRlbmRlZCB0bwpA
QCAtMjksNyArMjksNyBAQCBTaWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJlc21hIDxqb3NlLnF1YXJl
c21hQGZvdW5kcmllcy5pbz4KICAzIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKIAog
ZGlmZiAtLWdpdCBhL3NyYy9jbWQvZ28vaW50ZXJuYWwvd29yay9hY3Rpb24uZ28gYi9zcmMvY21k
L2dvL2ludGVybmFsL3dvcmsvYWN0aW9uLmdvCi1pbmRleCBhNTkwNzJlNTkxLi45ZTM1ZWJkZTBj
IDEwMDY0NAoraW5kZXggYTU5MDcyZS4uOWUzNWViZCAxMDA2NDQKIC0tLSBhL3NyYy9jbWQvZ28v
aW50ZXJuYWwvd29yay9hY3Rpb24uZ28KICsrKyBiL3NyYy9jbWQvZ28vaW50ZXJuYWwvd29yay9h
Y3Rpb24uZ28KIEBAIC03NTQsNiArNzU0LDkgQEAgZnVuYyAoYiAqQnVpbGRlcikgYWRkVHJhbnNp
dGl2ZUxpbmtEZXBzKGEsIGExICpBY3Rpb24sIHNobGliIHN0cmluZykgewpAQCAtNDMsNyArNDMs
NyBAQCBpbmRleCBhNTkwNzJlNTkxLi45ZTM1ZWJkZTBjIDEwMDY0NAogIAkJCS8vIFRPRE8ocnNj
KTogVGhlIHVzZSBvZiBNb2RlSW5zdGFsbCBoZXJlIGlzIHN1c3BlY3QsIGJ1dCBpZiB3ZSBvbmx5
IGRvIE1vZGVCdWlsZCwKICAJCQkvLyB3ZSdsbCBlbmQgdXAgYnVpbGRpbmcgYW4gb3ZlcmFsbCBs
aWJyYXJ5IG9yIGV4ZWN1dGFibGUgdGhhdCBkZXBlbmRzIGF0IHJ1bnRpbWUKIGRpZmYgLS1naXQg
YS9zcmMvY21kL2dvL2ludGVybmFsL3dvcmsvYnVpbGQuZ28gYi9zcmMvY21kL2dvL2ludGVybmFs
L3dvcmsvYnVpbGQuZ28KLWluZGV4IDQwOGVkYjUxMTkuLjNkNjAyNTIxMjcgMTAwNjQ0CitpbmRl
eCA0MDhlZGI1Li4zZDYwMjUyIDEwMDY0NAogLS0tIGEvc3JjL2NtZC9nby9pbnRlcm5hbC93b3Jr
L2J1aWxkLmdvCiArKysgYi9zcmMvY21kL2dvL2ludGVybmFsL3dvcmsvYnVpbGQuZ28KIEBAIC0y
MzMsNiArMjMzLDggQEAgU2VlIGFsc286IGdvIGluc3RhbGwsIGdvIGdldCwgZ28gY2xlYW4uCkBA
IC02Nyw3ICs2Nyw3IEBAIGluZGV4IDQwOGVkYjUxMTkuLjNkNjAyNTIxMjcgMTAwNjQ0CiAgCiAg
Ly8gTm90ZSB0aGF0IGZsYWdzIGNvbnN1bHRlZCBieSBvdGhlciBwYXJ0cyBvZiB0aGUgY29kZQog
ZGlmZiAtLWdpdCBhL3NyYy9jbWQvZ28vaW50ZXJuYWwvd29yay9leGVjLmdvIGIvc3JjL2NtZC9n
by9pbnRlcm5hbC93b3JrL2V4ZWMuZ28KLWluZGV4IDk3MjRjZDA3ZDAuLjU0NGRmNDYxYTIgMTAw
NjQ0CitpbmRleCA5NzI0Y2QwLi41NDRkZjQ2IDEwMDY0NAogLS0tIGEvc3JjL2NtZC9nby9pbnRl
cm5hbC93b3JrL2V4ZWMuZ28KICsrKyBiL3NyYy9jbWQvZ28vaW50ZXJuYWwvd29yay9leGVjLmdv
CiBAQCAtNTQ0LDYgKzU0NCwyMyBAQCBmdW5jIChiICpCdWlsZGVyKSBidWlsZChjdHggY29udGV4
dC5Db250ZXh0LCBhICpBY3Rpb24pIChlcnIgZXJyb3IpIHsKQEAgLTEwOSw2ICsxMDksMyBAQCBp
bmRleCA5NzI0Y2QwN2QwLi41NDRkZjQ2MWEyIDEwMDY0NAogIAlpZiBlcnIgOj0gYi5TaGVsbChh
KS5Na2RpcihhLk9iamRpcik7IGVyciAhPSBuaWwgewogIAkJcmV0dXJuIGVycgogIAl9Ci0tLSAK
LTIuNDQuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwOC1z
cmMtY21kLWRpc3QtYnVpbGRnby5nby1kby1ub3QtaGFyZGNvZGUtaG9zdC1jb21waWxlLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLzAwMDgtc3JjLWNtZC1kaXN0LWJ1aWxkZ28u
Z28tZG8tbm90LWhhcmRjb2RlLWhvc3QtY29tcGlsZS5wYXRjaAppbmRleCAwNjYyZjY2YWY1Li42
YWJmMWExMTY1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwOC1z
cmMtY21kLWRpc3QtYnVpbGRnby5nby1kby1ub3QtaGFyZGNvZGUtaG9zdC1jb21waWxlLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby8wMDA4LXNyYy1jbWQtZGlzdC1idWls
ZGdvLmdvLWRvLW5vdC1oYXJkY29kZS1ob3N0LWNvbXBpbGUucGF0Y2gKQEAgLTEsOCArMSw4IEBA
Ci1Gcm9tIGUwOTk5OTAyNjg3ZTJlMzk0NDk5ZjcxNTNkYjhkNjI0NDBjNGRhYjAgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGYzNzQ0YTNlZTJiY2M1NDZkNjY0YzE1MjBjMGFjNjMwMGEx
Nzc2NWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
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
dGljbHktbGlua2VkLWFyY2hlcy5wYXRjaAppbmRleCBjYzQ1NDk2ZTljLi40ZTBmMWQzY2MwIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28vMDAwOS1nby1GaWx0ZXItYnVp
bGQtcGF0aHMtb24tc3RhdGljbHktbGlua2VkLWFyY2hlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ28vZ28vMDAwOS1nby1GaWx0ZXItYnVpbGQtcGF0aHMtb24tc3RhdGljbHkt
bGlua2VkLWFyY2hlcy5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gNmMyNDM4ZjE4N2NhOTEy
YzU0YTcxYjRhYzY1YWI5ODk5OWEwMTlkMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
NWUzMmM2ZWRjMDNmMDk0YjNlYmY5NjkwMzJjYjJlYjZiNDdiYTg4YyBNb24gU2VwIDE3IDAwOjAw
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
Ci0tLSAKLTIuNDQuMAotCi0tIAoyLjQyLjAKCg==

--===============7790507378997100161==--

