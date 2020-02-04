Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 46D6E6120A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 05:54:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Feb 2020 21:47:16 -0800
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="219629179"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.21.206])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Feb 2020 21:47:15 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2020 13:47:04 +0800
Message-Id: <20200204054707.913173-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 1/4] x264: upgrade to latest revision
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
X-List-Received-Date: Tue, 04 Feb 2020 05:54:22 -0000
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
2.24.1


