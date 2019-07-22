Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C53EE7EF52
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 00:23:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jul 2019 17:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,292,1559545200"; d="scan'208";a="169105915"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.220])
	by fmsmga008.fm.intel.com with ESMTP; 21 Jul 2019 17:23:19 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2019 08:22:57 +0800
Message-Id: <20190722002257.12494-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722002257.12494-1-anuj.mittal@intel.com>
References: <20190722002257.12494-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] piglit: fix SRC_URI
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
X-List-Received-Date: Mon, 22 Jul 2019 00:23:19 -0000
Content-Transfer-Encoding: 8bit

Fixes build for older versions of git (like on CentOS 7) which don't
follow redirects properly if the .git suffix is missing and cause
errors:

| error: RPC failed; result=22, HTTP code = 404
| fatal: The remote end hung up unexpectedly

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 5304f358fa..0b6519e3f8 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "OpenGL driver testing framework"
 LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
-SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit;protocol=https \
+SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
            "
-- 
2.20.1


