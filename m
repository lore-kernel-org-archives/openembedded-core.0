Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D3E0771CB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 09:55:16 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2017 01:55:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,160,1484035200"; d="scan'208";a="58409278"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 14 Feb 2017 01:55:16 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 53A1D6A4080;
	Tue, 14 Feb 2017 01:54:14 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2017 11:55:01 +0200
Message-Id: <538d026adbb82c679e47f8863e9615c281007f2d.1487065337.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487065337.git.jussi.kukkonen@intel.com>
References: <cover.1487065337.git.jussi.kukkonen@intel.com>
Subject: [PATCH 04/11] presentproto: Upgrade 1.0 -> 1.1
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
X-List-Received-Date: Tue, 14 Feb 2017 09:55:17 -0000

Small release with mostly build system fixes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-proto/presentproto_git.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-proto/presentproto_git.bb b/meta/recipes-graphics/xorg-proto/presentproto_git.bb
index dbb6f32..e6d32f9 100644
--- a/meta/recipes-graphics/xorg-proto/presentproto_git.bb
+++ b/meta/recipes-graphics/xorg-proto/presentproto_git.bb
@@ -9,16 +9,14 @@ DESCRIPTION = "The Present extension provides a way for applications to update t
 
 LICENSE = "GPLv2"
 
-SRCREV = "24f3a56e541b0a9e6c6ee76081f441221a120ef9"
-PV = "1.0+git${SRCPV}"
+SRCREV = "bfdc7e052302c79c5803ad95a73c9b63b350c40c"
+PV = "1.1+git${SRCPV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=47e508ca280fde97906eacb77892c3ac"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/presentproto"
 S = "${WORKDIR}/git"
 
-PR = "r1"
-
 inherit autotools
 
 BBCLASSEXTEND = "native"
-- 
2.1.4


