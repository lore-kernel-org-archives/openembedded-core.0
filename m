Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 60894601F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 16:58:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2018 09:58:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,465,1515484800"; d="scan'208";a="37855905"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2018 09:58:28 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2018 18:51:56 +0200
Message-Id: <20180313165156.1172-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH] btrfs-tools: add RECIPE_NO_UPDATE_REASON
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
X-List-Received-Date: Tue, 13 Mar 2018 16:58:30 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb
index 263fc657550..426f8902401 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch \
            "
 
+RECIPE_NO_UPDATE_REASON = "Waiting for resolution of https://github.com/kdave/btrfs-progs/issues/109"
 inherit autotools-brokensep pkgconfig manpages
 
 PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
-- 
2.16.1


