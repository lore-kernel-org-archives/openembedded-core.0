Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1527A71BAA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 11:29:16 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 23 Oct 2016 04:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,388,1473145200"; d="scan'208";a="22604777"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 23 Oct 2016 04:29:18 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 62FD36A4080
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 04:28:44 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2016 14:29:48 +0300
Message-Id: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 01/10] mc: Upgrade 4.8.17 -> 4.8.18
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
X-List-Received-Date: Sun, 23 Oct 2016 11:29:17 -0000

New release contains bug fixes and refactoring of widget subsystem

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/mc/{mc_4.8.17.bb => mc_4.8.18.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.17.bb => mc_4.8.18.bb} (93%)

diff --git a/meta/recipes-extended/mc/mc_4.8.17.bb b/meta/recipes-extended/mc/mc_4.8.18.bb
similarity index 93%
rename from meta/recipes-extended/mc/mc_4.8.17.bb
rename to meta/recipes-extended/mc/mc_4.8.18.bb
index a5c4ece..78abb27 100644
--- a/meta/recipes-extended/mc/mc_4.8.17.bb
+++ b/meta/recipes-extended/mc/mc_4.8.18.bb
@@ -8,8 +8,8 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            "
-SRC_URI[md5sum] = "6e9c07066e40af06b263a13fad17a07f"
-SRC_URI[sha256sum] = "66d0cb37baaed8ef930f8ad25a634adad4f264eb61820893920ac87b9dfb783b"
+SRC_URI[md5sum] = "cc56f0c9abd63c4caa3636bba3a08bfb"
+SRC_URI[sha256sum] = "5b591e10dcbea95233434da40cdad4663d360229adf89826576c319667c103cb"
 
 inherit autotools gettext pkgconfig
 
-- 
2.4.0


