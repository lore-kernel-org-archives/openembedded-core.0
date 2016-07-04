Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3DACF6011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 13:02:34 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 04 Jul 2016 06:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,574,1459839600"; d="scan'208";a="729451870"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Jul 2016 06:02:13 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 70BF76A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 06:02:07 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2016 16:02:01 +0300
Message-Id: <1467637324-16642-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1467637324-16642-1-git-send-email-maxin.john@intel.com>
References: <1467637324-16642-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 1/4] libsolv: upgrade to 0.6.22
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
X-List-Received-Date: Mon, 04 Jul 2016 13:02:35 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/libsolv/libsolv_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_git.bb b/meta/recipes-extended/libsolv/libsolv_git.bb
index b41347d..fcd4b55 100644
--- a/meta/recipes-extended/libsolv/libsolv_git.bb
+++ b/meta/recipes-extended/libsolv/libsolv_git.bb
@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
 DEPENDS = "expat zlib"
 
-PV = "0.6.21"
+PV = "0.6.22"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
           "
 SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch"
 
-SRCREV = "bdb5c63245923ed95cf04086b65b2e5a5b5d7b04"
+SRCREV = "58655da7eccc0ba8e768f9df6482bb08b90f4da8"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


