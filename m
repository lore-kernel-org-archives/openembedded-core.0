Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 79B6C6011F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 14:07:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 25 Nov 2015 06:06:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,342,1444719600"; d="scan'208";a="846857708"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2015 06:06:28 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 3EA906A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 06:05:20 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Nov 2015 16:07:32 +0200
Message-Id: <1448460452-3673-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] ncurses: update SRC_URI
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
X-List-Received-Date: Wed, 25 Nov 2015 14:07:58 -0000

ncurses source tarball from "current" directory in
ftp://invisible-island.net gets updated/deleted during the release cycle.

We can't depend on that FTP server to fetch source as the maintainer
doesn't guarantee the presence of all patched versions in the server.
ftp://invisible-island.net/ncurses/5.9/README

Fetch sources from debian git server as it is comparatively reliable.

[YOCTO #8713]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc    | 2 +-
 meta/recipes-core/ncurses/ncurses_5.9.bb | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index ffd80ee..8bfe133 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -13,7 +13,7 @@ BINCONFIG = "${bindir}/ncurses-config"
 inherit autotools binconfig-disabled multilib_header pkgconfig
 
 # Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
-SRC_URI = "ftp://invisible-island.net/${BPN}/current/${BP}-${REVISION}.tgz"
+SRC_URI = "git://anonscm.debian.org/collab-maint/ncurses.git"
 
 EXTRA_AUTORECONF = "-I m4"
 CONFIG_SITE =+ "${WORKDIR}/config.cache"
diff --git a/meta/recipes-core/ncurses/ncurses_5.9.bb b/meta/recipes-core/ncurses/ncurses_5.9.bb
index 54d27a9..22c6230 100644
--- a/meta/recipes-core/ncurses/ncurses_5.9.bb
+++ b/meta/recipes-core/ncurses/ncurses_5.9.bb
@@ -7,6 +7,6 @@ PR = "${INC_PR}.1"
 SRC_URI += "file://tic-hang.patch \
             file://config.cache \
 "
-S = "${WORKDIR}/${BP}-${REVISION}"
-SRC_URI[md5sum] = "cee991d09e69e60ebedef424804c52d4"
-SRC_URI[sha256sum] = "5b64f40e4dce73e3aa83d15bd9257c6eff8790ec41150f0938bd87c0eb75828f"
+# commit id corresponds to the above listed REVISION
+SRCREV = "6286e14dac28811dbfd325b8d4c23f0d4e37eaf0"
+S = "${WORKDIR}/git"
-- 
2.4.0


