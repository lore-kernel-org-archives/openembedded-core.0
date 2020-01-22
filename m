Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id DAF8391457
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:21:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2020 22:21:10 -0800
X-IronPort-AV: E=Sophos;i="5.70,348,1574150400"; d="scan'208";a="220207861"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.19])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2020 22:21:09 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 14:21:04 +0800
Message-Id: <20200122062104.21783-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [PATCH] x264: upgrade to latest revision
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
X-List-Received-Date: Wed, 22 Jan 2020 06:21:10 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../x264/x264/Fix-X32-build-by-disabling-asm.patch | 14 ++++++--------
 meta/recipes-multimedia/x264/x264_git.bb           |  4 ++--
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-multimedia/x264/x264/Fix-X32-build-by-disabling-asm.patch b/meta/recipes-multimedia/x264/x264/Fix-X32-build-by-disabling-asm.patch
index 087a448eec..cb771fb0bf 100644
--- a/meta/recipes-multimedia/x264/x264/Fix-X32-build-by-disabling-asm.patch
+++ b/meta/recipes-multimedia/x264/x264/Fix-X32-build-by-disabling-asm.patch
@@ -1,4 +1,4 @@
-From 66b120079fb21ed38cab0900c63360b0a7853eaa Mon Sep 17 00:00:00 2001
+From 7bc25f4d1aaa5186d2eff3e2326c7245fcd7e7f3 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Tue, 13 Dec 2016 14:22:32 -0700
 Subject: [PATCH] Fix X32 build by disabling asm
@@ -12,15 +12,16 @@ doesn't successfully build at this time, and my assembly is very rusty.
 
 Upstream-Status: Pending
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
 ---
  configure | 14 ++++++++++++--
  1 file changed, 12 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 3109ec4..844aeae 100755
+index 51b128d..6ea9469 100755
 --- a/configure
 +++ b/configure
-@@ -703,7 +703,13 @@ case $host_cpu in
+@@ -754,7 +754,13 @@ case $host_cpu in
          AS_EXT=".asm"
          ASFLAGS="$ASFLAGS -DARCH_X86_64=1 -I\$(SRCPATH)/common/x86/"
          stack_alignment=16
@@ -33,9 +34,9 @@ index 3109ec4..844aeae 100755
 +            fi
 +        fi
          if [ "$SYS" = MACOSX ]; then
-             ASFLAGS="$ASFLAGS -f macho64 -DPIC -DPREFIX"
+             ASFLAGS="$ASFLAGS -f macho64 -DPREFIX"
              if cc_check '' "-arch x86_64"; then
-@@ -722,7 +728,11 @@ case $host_cpu in
+@@ -773,7 +779,11 @@ case $host_cpu in
                  RCFLAGS="--target=pe-x86-64 $RCFLAGS"
              fi
          else
@@ -48,6 +49,3 @@ index 3109ec4..844aeae 100755
          fi
          ;;
      powerpc*)
--- 
-2.8.0
-
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index f22930a0ee..39429a8809 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -14,9 +14,9 @@ SRC_URI = "git://github.com/mirror/x264;branch=stable \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "72db437770fd1ce3961f624dd57a8e75ff65ae0b"
+SRCREV = "1771b556ee45207f8711744ccbd5d42a3949b14c"
 
-PV = "r2917+git${SRCPV}"
+PV = "r2991+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.21.1


