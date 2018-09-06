Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 8E3547952D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 08:27:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Sep 2018 01:27:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,337,1531810800"; d="scan'208";a="261179771"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2018 01:27:42 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 11:27:42 +0300
Message-Id: <20180906082742.36210-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.7
Subject: [PATCH] cantarell-fonts: fix SRC_URI
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
X-List-Received-Date: Thu, 06 Sep 2018 08:27:42 -0000

Fixes build for older git versions (e.g. in Centos 7) which are not able
to redirect if the .git suffix is missing. Build got broken by
25bac865def42650c0c0323322158ba338e8b753

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
index 9d8fb28281..455892ef86 100644
--- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
+++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=df91e3ffcab8cfb972a66bf11255188d"
 PV = "0.0.24"
 
 SRCREV = "07b6ea2cbbebfc360aa4668612a376be5e214eaa"
-SRC_URI = "git://gitlab.gnome.org/GNOME/cantarell-fonts;protocol=https;branch=master"
+SRC_URI = "git://gitlab.gnome.org/GNOME/cantarell-fonts.git;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!0\.13)(?!0\.10\.1)\d+\.\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.13.7


