Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7B94A6C491
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 20:01:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2019 12:01:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,369,1544515200"; d="scan'208";a="319099830"
Received: from sgowda-mobl.amr.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.255.150.227])
	by fmsmga006.fm.intel.com with ESMTP; 14 Feb 2019 12:01:28 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2019 04:01:25 +0800
Message-Id: <20190214200125.13475-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAJTo0LYLQRxrByBagTYWfEA2jES-+GfZrfjFCvEDq+ONLmOgDg@mail.gmail.com>
References: <CAJTo0LYLQRxrByBagTYWfEA2jES-+GfZrfjFCvEDq+ONLmOgDg@mail.gmail.com>
Subject: [PATCH v2] x264: update to latest on stable branch
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
X-List-Received-Date: Thu, 14 Feb 2019 20:01:28 -0000

For changes, see:

https://github.com/mirror/x264/compare/e9a5903edf8ca59ef20e6f4894c196f135af735e...0a84d986e7020f8344f00752e3600b9769cc1e85

Remove the perlnative dependency that doesn't seem to be needed.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 842ea2547c..34c7dc4f78 100644
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
-- 
2.17.1


