Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8422C600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 05:48:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Feb 2019 21:49:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,367,1544515200"; d="scan'208";a="144143779"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.114])
	by fmsmga004.fm.intel.com with ESMTP; 13 Feb 2019 21:48:59 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2019 13:48:54 +0800
Message-Id: <20190214054857.18876-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/4] x264: update to latest on stable branch
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
X-List-Received-Date: Thu, 14 Feb 2019 05:48:59 -0000

For changes, see:

https://github.com/mirror/x264/compare/e9a5903edf8ca59ef20e6f4894c196f135af735e...0a84d986e7020f8344f00752e3600b9769cc1e85

Remove the perlnative dependency that doesn't seem to be needed and
remove the unnecessary copying of autotool scripts.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 842ea2547c..0d9d01d8a4 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -14,13 +14,13 @@ SRC_URI = "git://github.com/mirror/x264;branch=stable \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "e9a5903edf8ca59ef20e6f4894c196f135af735e"
+SRCREV = "0a84d986e7020f8344f00752e3600b9769cc1e85"
 
-PV = "r2854+git${SRCPV}"
+PV = "r2917+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit lib_package pkgconfig perlnative
+inherit lib_package pkgconfig
 
 X264_DISABLE_ASM = ""
 X264_DISABLE_ASM_x86 = "--disable-asm"
@@ -44,8 +44,6 @@ EXTRA_OECONF = '--prefix=${prefix} \
                '
 
 do_configure() {
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
     ./configure ${EXTRA_OECONF}
 }
 
-- 
2.17.1


