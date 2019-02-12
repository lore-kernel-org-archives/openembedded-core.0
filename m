Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0056F7C426
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 02:56:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Feb 2019 18:47:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,361,1544515200"; d="scan'208";a="132849580"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.102])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Feb 2019 18:47:15 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2019 10:47:09 +0800
Message-Id: <20190212024709.18046-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190212024709.18046-1-anuj.mittal@intel.com>
References: <20190212024709.18046-1-anuj.mittal@intel.com>
Subject: [PATCH 3/3] xf86-video-intel: update to latest
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
X-List-Received-Date: Tue, 12 Feb 2019 02:56:37 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 3d435e8b31..bf9009bda0 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -9,7 +9,7 @@ Infrastructure (DRI)."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
-SRCREV = "0932a6b37ba6d5c9e916a1cb6ab89c3205b81a0c"
+SRCREV = "33ee0c3b21ea279e08d0863fcb2e874f0974b00e"
 PV = "2.99.917+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-- 
2.17.1


